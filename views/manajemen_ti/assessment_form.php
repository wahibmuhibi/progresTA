<?php
session_start();
include '../../includes/auth.php';
check_roles(['Manajemen TI']);
include '../../includes/db.php';
include '../../includes/header.php';

// Inisialisasi variabel
$questions_query = null;

// Ambil data kriteria dari tabel Manajemen Kriteria
$criteria_query = $conn->query("SELECT kondisi, skor FROM criteria ORDER BY skor ASC");
$criteria = [];
if ($criteria_query && $criteria_query->num_rows > 0) {
    while ($row = $criteria_query->fetch_assoc()) {
        $criteria[$row['kondisi']] = $row['skor'];
    }
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

    // Tandai formulir sebagai dibaca
    $conn->query("UPDATE auditee SET is_read = TRUE WHERE kode_audit = '$kode_audit'");
}
?>

<h3 class="text-center">Formulir Masuk</h3>

<!-- Tabel Formulir Masuk -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Periode Audit</th>
            <th>Sumber</th>
            <th>Kode Audit</th>
            <th>Jumlah Pertanyaan</th>
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
                        <a href="assessment_form.php?kode_audit=<?php echo urlencode($row['kode_audit']); ?>" class="btn btn-sm btn-primary">Mulai Mengisi</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="5" class="text-center">Tidak ada formulir masuk.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<!-- Tabel Pertanyaan Berdasarkan Kode Audit -->
<h4 class="mt-5">Pertanyaan Self-Assessment</h4>
<form method="POST" action="submit_assessment.php" enctype="multipart/form-data">
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
            <?php if ($questions_query && $questions_query->num_rows > 0): ?>
                <?php while ($row = $questions_query->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                        <td><?php echo htmlspecialchars($row['pertanyaan']); ?></td>
                        <td>
                            <select name="answers[<?php echo $row['id']; ?>][jawaban]" class="form-select" required>
                                <option value="" disabled selected>Pilih Jawaban</option>
                                <?php foreach ($criteria as $kondisi => $skor): ?>
                                    <option value="<?php echo htmlspecialchars($kondisi); ?>">
                                        <?php echo htmlspecialchars($kondisi); ?> (Skor: <?php echo $skor; ?>)
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                        <td>
                            <input type="file" name="answers[<?php echo $row['id']; ?>][bukti]" class="form-control" accept=".pdf">
                        </td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="4" class="text-center">Tidak ada pertanyaan untuk kode audit ini.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
    <button type="submit" name="submit_assessment" class="btn btn-primary mt-3">Simpan Jawaban</button>
</form>

<!-- Tabel Riwayat Self-Assessment -->
<h4 class="mt-5">Riwayat Pengisian Self-Assessment</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Periode Audit</th>
            <th>Sumber</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $history_query = $conn->query("
            SELECT DISTINCT a.periode_audit, COALESCE(q.source, 'Tim Penilai') AS source, MAX(aa.created_at) AS created_at, a.form_status 
            FROM assessment_answers aa
            JOIN auditee a ON aa.user_id = a.user_id
            JOIN eksternal_audit_question q ON aa.question_id = q.id
            WHERE aa.user_id = {$_SESSION['user_id']}
            GROUP BY a.periode_audit, q.source
            ORDER BY created_at DESC
        ");

        if ($history_query && $history_query->num_rows > 0): ?>
            <?php while ($row = $history_query->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['periode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['source']); ?></td>
                    <td>
                        <span class="badge bg-<?php echo $row['form_status'] === 'submitted' ? 'success' : 'warning'; ?>">
                            <?php echo ucfirst(str_replace('_', ' ', $row['form_status'])); ?>
                        </span>
                    </td>
                    <td>
                        <?php if ($row['form_status'] === 'draft'): ?>
                            <a href="self_assessment_form.php?periode_audit=<?php echo $row['periode_audit']; ?>&source=<?php echo urlencode($row['source']); ?>" class="btn btn-sm btn-primary">Lanjutkan</a>
                        <?php else: ?>
                            <button class="btn btn-sm btn-secondary" disabled>Sudah Terkirim</button>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="4" class="text-center">Belum ada riwayat pengisian.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>
