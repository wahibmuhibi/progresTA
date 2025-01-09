<?php
session_start();
include '../../includes/auth.php';
check_roles(['Manajemen TI']);
include '../../includes/db.php';
include '../../includes/header.php';


// Mapping Status
function mapFormStatusToLabel($status, $role)
{
    $status_map = [
        'Manajemen TI' => [
            0 => 'Belum Diterima',
            1 => 'Diterima',
            2 => 'Draf',
            3 => 'Terkirim'
        ],
        'Tim Penilai' => [
            0 => 'Belum Dikirim',
            1 => 'Dikirim',
            2 => 'Dibaca',
            3 => 'Self-Assessment Diterima'
        ]
    ];
    if (isset($status_map[$role]) && isset($status_map[$role][$status])) {
        return $status_map[$role][$status];
    }
    return 'Tidak Diketahui';
}

// Inisialisasi variabel
$questions_query = null;

// Ambil data ITIL Service Lifecycle secara dinamis
$lifecycle_query = $conn->query("
    SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(kode_mapping, '_', 2), '_', -1) AS itil_service_lifecycle 
    FROM eksternal_audit_question
    WHERE kode_mapping IS NOT NULL
    ORDER BY itil_service_lifecycle ASC
");
$lifecycle_stages = [];
if ($lifecycle_query && $lifecycle_query->num_rows > 0) {
    while ($row = $lifecycle_query->fetch_assoc()) {
        $lifecycle_stages[] = $row['itil_service_lifecycle'];
    }
}

// Ambil pertanyaan berdasarkan ITIL Service Lifecycle
foreach ($lifecycle_stages as $stage) {
    $questions_query = $conn->query("
        SELECT DISTINCT q.id, q.kode_mapping, q.pertanyaan 
        FROM eksternal_audit_question q
        JOIN auditee a ON a.periode_audit = q.periode_audit
        WHERE SUBSTRING_INDEX(SUBSTRING_INDEX(q.kode_mapping, '_', 2), '_', -1) = '$stage' 
        AND a.user_id = {$_SESSION['user_id']}
    ");
    $questions_by_lifecycle[$stage] = $questions_query ? $questions_query->fetch_all(MYSQLI_ASSOC) : [];
}

// Ambil data kriteria dari tabel Manajemen Kriteria
$criteria_query = $conn->query("SELECT kondisi, skor FROM criteria ORDER BY skor ASC");
$criteria = [];
if ($criteria_query && $criteria_query->num_rows > 0) {
    while ($row = $criteria_query->fetch_assoc()) {
        $criteria[$row['kondisi']] = $row['skor'];
    }
}

// Proses penyimpanan jawaban
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $status = isset($_POST['submit_assessment']) ? 3 : 2; // 3: Terkirim, 2: Draf
    $kode_audit = $conn->real_escape_string($_GET['kode_audit']);

    foreach ($_POST['answers'] as $question_id => $data) {
        $jawaban = $conn->real_escape_string($data['jawaban']);
        $bukti = isset($_FILES['answers']['name'][$question_id]['bukti']) ? $_FILES['answers']['name'][$question_id]['bukti'] : '';

        // Simpan file bukti
        $bukti_path = '';
        if (!empty($bukti)) {
            $target_dir = "../../uploads/";
            $bukti_path = $target_dir . basename($bukti);
            move_uploaded_file($_FILES['answers']['tmp_name'][$question_id]['bukti'], $bukti_path);
        }

        // Simpan atau perbarui jawaban
        $query = "
            INSERT INTO assessment_answers (user_id, question_id, kode_audit, jawaban, bukti, status, periode_audit)
            VALUES ({$_SESSION['user_id']}, $question_id, '$kode_audit', '$jawaban', '$bukti_path', $status, '$periode_audit')
            ON DUPLICATE KEY UPDATE jawaban = '$jawaban', bukti = '$bukti_path', status = $status
        ";
        $conn->query($query);
    }

    // Update status formulir di tabel auditee
    $conn->query("UPDATE auditee SET form_status = $status WHERE kode_audit = '$kode_audit' AND user_id = {$_SESSION['user_id']}");
}

// Ambil daftar formulir masuk
$incoming_forms_query = $conn->query("
    SELECT a.kode_audit, a.periode_audit, a.form_status, COALESCE(q.source, 'Tim Penilai') AS source, COUNT(q.id) AS total_questions
    FROM auditee a
    JOIN eksternal_audit_question q ON a.periode_audit = q.periode_audit
    WHERE a.user_id = {$_SESSION['user_id']}
    GROUP BY a.kode_audit, a.periode_audit, q.source
    ORDER BY a.periode_audit DESC
");

// Ambil pertanyaan berdasarkan kode audit
if (isset($_GET['kode_audit'])) {
    $kode_audit = $conn->real_escape_string($_GET['kode_audit']);
    $questions_query = $conn->query("
        SELECT q.id, q.kode_mapping, q.pertanyaan 
        FROM eksternal_audit_question q
        JOIN auditee a ON a.periode_audit = q.periode_audit
        WHERE a.kode_audit = '$kode_audit' AND a.user_id = {$_SESSION['user_id']}
    ");
}
?>
<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<h3 class="text-center">Formulir Self-Assessment</h3>

<!-- Tabel Formulir Masuk dan Riwayat -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Periode Audit</th>
            <th>Sumber</th>
            <th>Kode Audit</th>
            <th>Jumlah Pertanyaan</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($incoming_forms_query && $incoming_forms_query->num_rows > 0): ?>
            <?php while ($row = $incoming_forms_query->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['periode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['source']); ?></td>
                    <td><?php echo htmlspecialchars($row['kode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['total_questions']); ?></td>
                    <td>
                        <?php 
                        $status_label = mapFormStatusToLabel($row['form_status'], 'Manajemen TI');
                        $badge_class = $row['form_status'] == 3 ? 'success' :
                                    ($row['form_status'] == 2 ? 'warning' : 
                                    ($row['form_status'] == 1 ? 'primary' : 'secondary'));
                        ?>
                        <span class="badge bg-<?php echo $badge_class; ?>">
                            <?php echo htmlspecialchars($status_label); ?>
                        </span>
                    </td>
                    <td>
                        <?php if ((int)$row['form_status'] === 3): ?>
                            <button class="btn btn-sm btn-secondary" disabled>Sudah Terkirim</button>
                        <?php else: ?>
                            <a href="assessment_form.php?kode_audit=<?php echo urlencode($row['kode_audit']); ?>" class="btn btn-sm btn-primary">
                                <?php echo (int)$row['form_status'] === 2 ? 'Lanjutkan' : 'Mulai Mengisi'; ?>
                            </a>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="6" class="text-center">Tidak ada formulir masuk atau riwayat pengisian.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>


<!-- Form Self-Assessment -->
<form method="POST" action="assessment_form.php?kode_audit=<?php echo isset($_GET['kode_audit']) ? htmlspecialchars($_GET['kode_audit']) : ''; ?>" enctype="multipart/form-data">
    <?php foreach ($lifecycle_stages as $stage): ?>
        <h4 class="mt-4"><?php echo htmlspecialchars($stage); ?></h4>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Nomor Audit</th>
                    <th>Pertanyaan Audit</th>
                    <th>Jawaban</th>
                    <th>Bukti</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($questions_by_lifecycle[$stage])): ?>
                    <?php foreach ($questions_by_lifecycle[$stage] as $question): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($question['kode_mapping']); ?></td>
                            <td><?php echo htmlspecialchars($question['pertanyaan']); ?></td>
                            <td>
                                <select name="answers[<?php echo $question['id']; ?>][jawaban]" class="form-select" required>
                                    <option value="" disabled selected>Pilih Jawaban</option>
                                    <?php foreach ($criteria as $kondisi => $skor): ?>
                                        <option value="<?php echo htmlspecialchars($kondisi); ?>">
                                            <?php echo htmlspecialchars($kondisi); ?> (Skor: <?php echo $skor; ?>)
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </td>
                            <td>
                                <input type="file" name="answers[<?php echo $question['id']; ?>][bukti]" class="form-control" accept=".pdf">
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="4" class="text-center">Tidak ada pertanyaan untuk tahap ini.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    <?php endforeach; ?>
    <button type="submit" name="save_draft" class="btn btn-secondary mt-3">Simpan Sebagai Draf</button>
    <button type="submit" name="submit_assessment" class="btn btn-primary mt-3">Kirim</button>
</form>
