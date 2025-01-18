<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Tangkap kode audit dan score session ID dari URL
$kode_audit = isset($_GET['kode_audit']) ? $conn->real_escape_string($_GET['kode_audit']) : null;
$score_session_id = isset($_GET['score_session_id']) ? (int)$_GET['score_session_id'] : null;

// Ambil daftar assessment yang tersedia untuk verifikasi
$available_assessments = $conn->query("
    SELECT DISTINCT kode_audit, score_session_id, created_at 
    FROM assessment_results 
    WHERE verification_code IS NULL
    ORDER BY created_at DESC
");

if (!$available_assessments || $available_assessments->num_rows === 0) {
    echo "<div class='alert alert-warning'>Tidak ada assessment yang tersedia untuk diverifikasi.</div>";
    include '../../includes/footer.php';
    exit;
}

// Ambil data hasil assessment jika parameter URL ada
$results_query = null;
if ($kode_audit && $score_session_id) {
    $results_query = $conn->query("
        SELECT DISTINCT category, AVG(average_score) AS average_score
        FROM assessment_results
        WHERE kode_audit = '$kode_audit' AND score_session_id = $score_session_id
        GROUP BY category
    ");
}

// Ambil data detail dari assessment_answers
$details_query = null;
if ($kode_audit && $score_session_id) {
    $details_query = $conn->query("
        SELECT q.kode_mapping, q.pertanyaan, a.jawaban, a.skor 
        FROM assessment_answers a
        JOIN eksternal_audit_question q ON a.question_id = q.id
        WHERE a.kode_audit = '$kode_audit' AND a.score_session_id = $score_session_id
    ");
}
?>

<h3 class="text-center">Daftar Assessment Tersedia untuk Verifikasi</h3>

<!-- Tabel Daftar Kode Audit dan Score Session ID -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Kode Audit</th>
            <th>Score Session ID</th>
            <th>Tanggal Dibuat</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php while ($row = $available_assessments->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['kode_audit']); ?></td>
                <td><?php echo htmlspecialchars($row['score_session_id']); ?></td>
                <td><?php echo htmlspecialchars($row['created_at']); ?></td>
                <td>
                    <a href="verify_assessment.php?kode_audit=<?php echo urlencode($row['kode_audit']); ?>&score_session_id=<?php echo urlencode($row['score_session_id']); ?>" 
                       class="btn btn-primary btn-sm">
                        Verifikasi
                    </a>
                </td>
            </tr>
        <?php endwhile; ?>
    </tbody>
</table>

<?php if ($kode_audit && $score_session_id): ?>
    <h3 class="text-center mt-5">Detail Assessment untuk Verifikasi</h3>

    <!-- Tabel Rata-Rata Hasil Assessment -->
    <?php if ($results_query && $results_query->num_rows > 0): ?>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Kategori</th>
                    <th>Rata-Rata Skor</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $results_query->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['category']); ?></td>
                        <td><?php echo htmlspecialchars(round($row['average_score'], 2)); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php else: ?>
        <div class="alert alert-warning">Tidak ada hasil rata-rata untuk kode audit dan sesi skor ini.</div>
    <?php endif; ?>

    <!-- Tabel Detail Jawaban -->
    <?php if ($details_query && $details_query->num_rows > 0): ?>
        <h3 class="text-center mt-5">Detail Jawaban Self-Assessment</h3>
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
                <?php while ($row = $details_query->fetch_assoc()): ?>
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
            $verification_code = strtoupper(uniqid('VERIFY-'));
            $verified_at = date('Y-m-d H:i:s');

            $update_query = "
                UPDATE assessment_results
                SET verification_code = '$verification_code', verified_at = '$verified_at'
                WHERE kode_audit = '$kode_audit' AND score_session_id = $score_session_id
            ";
            if ($conn->query($update_query)) {
                echo "<div class='alert alert-success mt-4'>Assessment berhasil diverifikasi. Kode Verifikasi: $verification_code</div>";
            } else {
                echo "<div class='alert alert-danger mt-4'>Gagal memverifikasi assessment. Kesalahan: " . $conn->error . "</div>";
            }
        }
        ?>
    <?php endif; ?>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
