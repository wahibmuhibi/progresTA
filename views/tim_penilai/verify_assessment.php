<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Tangkap kode audit dan score session ID dari URL
$kode_audit = isset($_GET['kode_audit']) ? $conn->real_escape_string($_GET['kode_audit']) : null;
$score_session_id = isset($_GET['score_session_id']) ? (int)$_GET['score_session_id'] : null;

if (!$kode_audit || !$score_session_id) {
    echo "<div class='alert alert-danger'>Kode audit atau ID sesi skor tidak ditemukan.</div>";
    include '../../includes/footer.php';
    exit;
}

// Ambil data skor berdasarkan kode audit dan score session ID
$query = "
    SELECT q.kode_mapping, q.pertanyaan, a.jawaban, a.skor 
    FROM assessment_answers a
    JOIN eksternal_audit_question q ON a.question_id = q.id
    WHERE a.kode_audit = '$kode_audit' AND a.score_session_id = $score_session_id
";
$result = $conn->query($query);

// Menampilkan Hasil
$kode_audit = isset($_GET['kode_audit']) ? $conn->real_escape_string($_GET['kode_audit']) : null;
$score_session_id = isset($_GET['score_session_id']) ? (int) $_GET['score_session_id'] : null;

if ($kode_audit && $score_session_id) {
    $results_query = $conn->query("
        SELECT * 
        FROM assessment_results
        WHERE kode_audit = '$kode_audit' AND score_session_id = $score_session_id
    ");

    if ($results_query && $results_query->num_rows > 0): ?>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Kategori</th>
                    <th>Rata-Rata Skor</th>
                    <th>Tingkat Kesiapan Keamanan</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $results_query->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['category']); ?></td>
                        <td><?php echo htmlspecialchars($row['average_score']); ?></td>
                        <td><?php echo htmlspecialchars($row['overall_score']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php else: ?>
        <div class="alert alert-warning">Tidak ada data ditemukan.</div>
    <?php endif;
}
?>

<h3 class="text-center">Verifikasi Assessment</h3>

<?php if ($result && $result->num_rows > 0): ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Kode Mapping</th>
                <th>Pertanyaan</th>
                <th>Jawaban</th>
                <th>Skor</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                    <td><?php echo htmlspecialchars($row['pertanyaan']); ?></td>
                    <td><?php echo htmlspecialchars($row['jawaban']); ?></td>
                    <td><?php echo htmlspecialchars($row['skor']); ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <!-- Tombol Verifikasi -->
    <div class="text-center mt-4">
        <form method="POST" action="">
            <input type="hidden" name="kode_audit" value="<?php echo htmlspecialchars($kode_audit); ?>">
            <input type="hidden" name="score_session_id" value="<?php echo htmlspecialchars($score_session_id); ?>">
            <button type="submit" name="verify" class="btn btn-success">Verifikasi</button>
        </form>
    </div>

    <?php
    // Proses verifikasi
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['verify'])) {
        $update_query = "
            UPDATE assessment_answers
            SET status = 'verified'
            WHERE kode_audit = '$kode_audit' AND score_session_id = $score_session_id
        ";
        if ($conn->query($update_query)) {
            echo "<div class='alert alert-success mt-4'>Assessment berhasil diverifikasi.</div>";
        } else {
            echo "<div class='alert alert-danger mt-4'>Gagal memverifikasi assessment. Kesalahan: " . $conn->error . "</div>";
        }
    }
    ?>
<?php else: ?>
    <div class="alert alert-warning">Data tidak ditemukan untuk kode audit dan ID sesi skor ini.</div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
