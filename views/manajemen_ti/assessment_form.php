<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';
check_roles(['Manajemen TI']); // Hanya Manajemen TI yang diizinkan

// Ambil ITIL Service Lifecycle secara dinamis
$lifecycle_query = $conn->query("
    SELECT DISTINCT 
        SUBSTRING_INDEX(SUBSTRING_INDEX(kode_mapping, '_', 2), '_', -1) AS itil_service_lifecycle 
    FROM assessment_questions
    WHERE kode_mapping IS NOT NULL
    ORDER BY itil_service_lifecycle ASC
");
$lifecycle_stages = [];
if ($lifecycle_query && $lifecycle_query->num_rows > 0) {
    while ($row = $lifecycle_query->fetch_assoc()) {
        $lifecycle_stages[] = $row['itil_service_lifecycle'];
    }
}

// Ambil kondisi dari jenis kriteria
$criteria_query = $conn->query("SELECT kondisi, skor FROM criteria ORDER BY skor ASC");
$criteria = [];
if ($criteria_query && $criteria_query->num_rows > 0) {
    while ($row = $criteria_query->fetch_assoc()) {
        $criteria[$row['kondisi']] = $row['skor'];
    }
}

// Logika Penyimpanan
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $status = isset($_POST['submit_assessment']) ? 'submitted' : 'draft';
    $source = $conn->real_escape_string($_GET['source']);

    foreach ($_POST['answers'] as $question_id => $data) {
        $question_id = (int)$question_id;
        $jawaban = $conn->real_escape_string($data['kondisi']);
        $skor = isset($criteria[$jawaban]) ? $criteria[$jawaban] : 0;
        $bukti = $_FILES['answers']['name'][$question_id]['bukti'];

        // Simpan file bukti
        if (!empty($bukti)) {
            $target_dir = "../../uploads/";
            $target_file = $target_dir . basename($_FILES['answers']['name'][$question_id]['bukti']);
            move_uploaded_file($_FILES['answers']['tmp_name'][$question_id]['bukti'], $target_file);
        }

        // Simpan atau perbarui data
        $query = "INSERT INTO assessment_answers (user_id, question_id, jawaban, skor, bukti, status, source) 
                  VALUES ({$_SESSION['user_id']}, $question_id, '$jawaban', $skor, '$bukti', '$status', '$source')
                  ON DUPLICATE KEY UPDATE jawaban = '$jawaban', skor = $skor, bukti = '$bukti', status = '$status', source = '$source'";

        $conn->query($query);
    }

    if ($status === 'submitted') {
        $success = "Self-assessment berhasil dikirim."; 
    } else {
        $success = "Self-assessment berhasil disimpan sebagai draft.";
    }
}


// Mengambil Data Sebelumnya Jika Status Draft
$previous_answers_query = $conn->query("
    SELECT question_id, jawaban, bukti 
    FROM assessment_answers 
    WHERE user_id = {$_SESSION['user_id']} AND status = 'draft'
");
$previous_answers = [];
if ($previous_answers_query && $previous_answers_query->num_rows > 0) {
    while ($row = $previous_answers_query->fetch_assoc()) {
        $previous_answers[$row['question_id']] = $row;
    }
}

// Query untuk Menampilkan Riwayat
$history_query = $conn->query("
    SELECT DISTINCT source, MAX(created_at) AS created_at, status 
    FROM assessment_answers 
    WHERE user_id = {$_SESSION['user_id']}
    GROUP BY source
    ORDER BY created_at DESC
");
$history = [];
if ($history_query && $history_query->num_rows > 0) {
    while ($row = $history_query->fetch_assoc()) {
        $history[] = $row;
    }
}

if (isset($_GET['delete_source'])) {
    $delete_source = $conn->real_escape_string($_GET['delete_source']);
    $query = "DELETE FROM assessment_answers WHERE user_id = {$_SESSION['user_id']} AND source = '$delete_source'";
    
    if ($conn->query($query) && $conn->affected_rows > 0) {
        $success = "Riwayat pengisian berhasil dihapus.";
    } else {
        $error = "Riwayat pengisian tidak ditemukan atau gagal dihapus.";
    }
}



?>

<h3 class="text-center">Self-Assessment</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>

<!-- Tabel Riwayat Assessment -->
<h5 class="mt-5">Riwayat Pengisian Self-Assessment</h5>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Tanggal</th>
            <th>Asal Assessment</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if (!empty($history)): ?>
            <?php foreach ($history as $row): ?>
                <tr>
                    <td><?php echo htmlspecialchars(date('d-m-Y H:i:s', strtotime($row['created_at']))); ?></td>
                    <td><?php echo htmlspecialchars($row['source']); ?></td>
                    <td>
                        <span class="badge bg-<?php echo $row['status'] === 'submitted' ? 'success' : 'warning'; ?>">
                            <?php echo ucfirst($row['status']); ?>
                        </span>
                    </td>
                    <td>
                        <?php if ($row['status'] === 'draft'): ?>
                            <a href="assessment_form.php?source=<?php echo urlencode($row['source']); ?>" class="btn btn-sm btn-primary">Lanjutkan</a>
                        <?php else: ?>
                            <button class="btn btn-sm btn-secondary" disabled>Sudah Terkirim</button>
                        <?php endif; ?>
                        <a href="?delete_source=<?php echo urlencode($row['source']); ?>" class="btn btn-sm btn-danger" onclick="return confirm('Yakin ingin menghapus riwayat ini?')">Hapus</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="4" class="text-center">Belum ada riwayat pengisian.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>



<!-- Form Pilih Asal Assessment -->
<form method="GET" action="">
    <div class="mb-3">
        <label for="source" class="form-label">Pilih Asal Assessment</label>
        <select name="source" id="source" class="form-select" required>
            <option value="" disabled selected>Pilih Sumber Assessment</option>
            <option value="Tim Penilai" <?php echo (isset($_GET['source']) && $_GET['source'] === 'Tim Penilai') ? 'selected' : ''; ?>>Tim Penilai</option>
            <option value="Auditor Internal" <?php echo (isset($_GET['source']) && $_GET['source'] === 'Auditor Internal') ? 'selected' : ''; ?>>Auditor Internal</option>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Mulai</button>
</form>



<!-- Tahapan Assessment -->
<?php if (isset($_GET['source'])): ?>
    <h4 class="mt-4">Asal Assessment: <?php echo htmlspecialchars($_GET['source']); ?></h4>
    <form method="POST" action="" enctype="multipart/form-data">
        <?php foreach ($lifecycle_stages as $index => $stage): ?>
            <h5 class="mt-4"><?php echo htmlspecialchars($stage); ?></h5>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nomor Audit</th>
                        <th>Pertanyaan Audit</th>
                        <th>Skor dari Maturity</th>
                        <th>Bukti (Upload PDF)</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $questions_query = $conn->query("
                        SELECT id, kode_mapping, pertanyaan 
                        FROM assessment_questions 
                        WHERE SUBSTRING_INDEX(SUBSTRING_INDEX(kode_mapping, '_', 2), '_', -1) = '$stage'
                    ");
                    ?>
                    <?php if ($questions_query && $questions_query->num_rows > 0): ?>
                        <?php while ($row = $questions_query->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                                <td><?php echo htmlspecialchars($row['pertanyaan']); ?></td>
                                <td>
                                    <select name="answers[<?php echo $row['id']; ?>][kondisi]" class="form-select">
                                        <option value="" disabled <?php echo !isset($previous_answers[$row['id']]) ? 'selected' : ''; ?>>Pilih Kondisi</option>
                                        <?php foreach ($criteria as $kondisi => $skor): ?>
                                            <option value="<?php echo htmlspecialchars($kondisi); ?>" <?php echo (isset($previous_answers[$row['id']]) && $previous_answers[$row['id']]['jawaban'] === $kondisi) ? 'selected' : ''; ?>>
                                                <?php echo htmlspecialchars($kondisi); ?> (Skor: <?php echo $skor; ?>)
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </td>
                                <td>
                                    <input type="file" name="answers[<?php echo $row['id']; ?>][bukti]" accept=".pdf" class="form-control">
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="4" class="text-center">Tidak ada pertanyaan untuk tahap ini.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        <?php endforeach; ?>

        <!-- Tombol Simpan Sementara dan Submit -->
        <button type="submit" name="save_draft" class="btn btn-secondary mt-3">Simpan Sementara</button>
        <button type="submit" name="submit_assessment" class="btn btn-primary mt-3">Submit</button>
    </form>
<?php endif; ?>
