<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Tangkap kode asesmen dan score session ID dari URL
$asesmen_kode = isset($_GET['asesmen_kode']) ? $conn->real_escape_string($_GET['asesmen_kode']) : null;
$score_session_id = isset($_GET['score_session_id']) ? (int)$_GET['score_session_id'] : null;

// Ambil daftar Asesmen yang tersedia untuk verifikasi
$available_assessments = $conn->query("
    SELECT DISTINCT asesmen_kode, score_session_id, created_at 
    FROM asesmen_hasil 
    WHERE verification_code IS NULL
    ORDER BY created_at DESC
");

if (!$available_assessments || $available_assessments->num_rows === 0) {
    echo "<div class='alert alert-warning'>Tidak ada Asesmen yang tersedia untuk diverifikasi.</div>";
    include '../../includes/footer.php';
    exit;
}

// Ambil data hasil Asesmen jika parameter URL ada
$results_query = null;
if ($asesmen_kode && $score_session_id) {
    $results_query = $conn->query("
        SELECT DISTINCT aspek, AVG(skor_rata_rata) AS skor_rata_rata
        FROM asesmen_hasil
        WHERE asesmen_kode = '$asesmen_kode' AND score_session_id = $score_session_id
        GROUP BY aspek
    ");
}

// Ambil data detail dari asesmen_jawaban
$details_query = null;
if ($asesmen_kode && $score_session_id) {
    $details_query = $conn->query("
        SELECT q.kode_mapping, q.pertanyaan, a.jawaban, a.skor 
        FROM asesmen_jawaban a
        JOIN asesmen_pertanyaan q ON a.question_id = q.id
        WHERE a.asesmen_kode = '$asesmen_kode' AND a.score_session_id = $score_session_id
    ");
}
?>

<h3 class="text-center">Daftar Asesmen Tersedia untuk Verifikasi</h3>

<!-- Tabel Daftar Kode Asesmen dan Score Session ID -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Kode Asesmen</th>
            <th>Score Session ID</th>
            <th>Tanggal Dibuat</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php while ($row = $available_assessments->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['asesmen_kode']); ?></td>
                <td><?php echo htmlspecialchars($row['score_session_id']); ?></td>
                <td><?php echo htmlspecialchars($row['created_at']); ?></td>
                <td>
                    <a href="verify_assessment.php?asesmen_kode=<?php echo urlencode($row['asesmen_kode']); ?>&score_session_id=<?php echo urlencode($row['score_session_id']); ?>" 
                       class="btn btn-primary btn-sm">
                        Verifikasi
                    </a>
                </td>
            </tr>
        <?php endwhile; ?>
    </tbody>
</table>

<?php if ($asesmen_kode && $score_session_id): ?>
    <h3 class="text-center mt-5">Detail Asesmen untuk Verifikasi</h3>

    <!-- Tabel Rata-Rata Hasil Asesmen -->
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
                        <td><?php echo htmlspecialchars($row['aspek']); ?></td>
                        <td><?php echo htmlspecialchars(round($row['skor_rata_rata'], 2)); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php else: ?>
        <div class="alert alert-warning">Tidak ada hasil rata-rata untuk kode asesmen dan sesi skor ini.</div>
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
                <input type="hidden" name="asesmen_kode" value="<?php echo htmlspecialchars($asesmen_kode); ?>">
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
                UPDATE asesmen_hasil
                SET verification_code = '$verification_code', verified_at = '$verified_at'
                WHERE asesmen_kode = '$asesmen_kode' AND score_session_id = $score_session_id
            ";
            if ($conn->query($update_query)) {
                echo "<div class='alert alert-success mt-4'>Asesmen berhasil diverifikasi. Kode Verifikasi: $verification_code</div>";
            } else {
                echo "<div class='alert alert-danger mt-4'>Gagal memverifikasi Asesmen. Kesalahan: " . $conn->error . "</div>";
            }
        }
        ?>
    <?php endif; ?>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
