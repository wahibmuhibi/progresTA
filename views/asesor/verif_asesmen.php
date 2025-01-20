<?php
session_start();
include '../../includes/auth.php';
check_roles(['Asesor']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil ID Asesor dari sesi login
$asesor_id = $_SESSION['user_id'];

// Tangkap kode asesmen dan score session ID dari URL
$asesmen_kode = isset($_GET['asesmen_kode']) ? $conn->real_escape_string($_GET['asesmen_kode']) : null;
$score_session_id = isset($_GET['score_session_id']) ? (int)$_GET['score_session_id'] : null;

// Ambil daftar assessment yang tersedia untuk verifikasi berdasarkan asesor_id
$available_assessments = $conn->query("
    SELECT DISTINCT a.asesmen_kode, a.score_session_id, a.created_at
    FROM asesmen_jawaban a
    JOIN asesi b ON a.asesmen_kode = b.asesmen_kode
    WHERE b.asesor_id = $asesor_id
    ORDER BY a.created_at DESC
");

if (!$available_assessments || $available_assessments->num_rows === 0) {
    echo "<div class='alert alert-warning'>Tidak ada assessment yang tersedia untuk diverifikasi.</div>";
    include '../../includes/footer.php';
    exit;
}

// Ambil data hasil assessment jika parameter URL ada
$results_query = null;
if ($asesmen_kode && $score_session_id) {
    $results_query = $conn->query("
        SELECT DISTINCT q.kode_mapping, q.pertanyaan, a.jawaban, a.skor 
        FROM asesmen_jawaban a
        JOIN asesmen_pertanyaan q ON a.question_id = q.id
        JOIN asesi b ON a.asesmen_kode = b.asesmen_kode
        WHERE a.asesmen_kode = '$asesmen_kode' AND a.score_session_id = $score_session_id AND b.asesor_id = $asesor_id
    ");
}

// Proses verifikasi dengan rekomendasi
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['verify'])) {
    $rekomendasi = isset($_POST['rekomendasi']) ? $conn->real_escape_string($_POST['rekomendasi']) : null;
    $verification_code = strtoupper(uniqid('VERIFY-'));
    $verified_at = date('Y-m-d H:i:s');

    $update_query = "
        UPDATE asesmen_hasil
        SET verification_code = '$verification_code', verified_at = '$verified_at', rekomendasi = '$rekomendasi'
        WHERE asesmen_kode = '$asesmen_kode' AND score_session_id = $score_session_id
    ";

    if ($conn->query($update_query)) {
        echo "<div class='alert alert-success mt-4'>Assessment berhasil diverifikasi. Kode Verifikasi: $verification_code</div>";
    } else {
        echo "<div class='alert alert-danger mt-4'>Gagal memverifikasi assessment. Kesalahan: " . $conn->error . "</div>";
    }
}
?>

<h3 class="text-center">Daftar Assessment Tersedia untuk Verifikasi</h3>

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
                    <a href="verif_asesmen.php?asesmen_kode=<?php echo urlencode($row['asesmen_kode']); ?>&score_session_id=<?php echo urlencode($row['score_session_id']); ?>" 
                       class="btn btn-primary btn-sm">
                        Verifikasi
                    </a>
                </td>
            </tr>
        <?php endwhile; ?>
    </tbody>
</table>

<?php if ($asesmen_kode && $score_session_id): ?>
    <h3 class="text-center mt-5">Detail Assessment untuk Verifikasi</h3>

    <?php if ($results_query && $results_query->num_rows > 0): ?>
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
                <?php while ($row = $results_query->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                        <td><?php echo htmlspecialchars($row['pertanyaan']); ?></td>
                        <td><?php echo htmlspecialchars($row['jawaban']); ?></td>
                        <td><?php echo htmlspecialchars($row['skor']); ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <!-- Form Rekomendasi dan Tombol Verifikasi -->
        <div class="text-center mt-4">
            <form method="POST" action="">
                <div class="mb-3">
                    <label for="rekomendasi" class="form-label">Rekomendasi</label>
                    <textarea name="rekomendasi" id="rekomendasi" class="form-control" rows="4" placeholder="Masukkan rekomendasi untuk asesmen ini" required></textarea>
                </div>
                <input type="hidden" name="asesmen_kode" value="<?php echo htmlspecialchars($asesmen_kode); ?>">
                <input type="hidden" name="score_session_id" value="<?php echo htmlspecialchars($score_session_id); ?>">
                <button type="submit" name="verify" class="btn btn-success">Verifikasi</button>
            </form>
        </div>
    <?php else: ?>
        <div class="alert alert-warning">Tidak ada data detail untuk verifikasi asesmen ini.</div>
    <?php endif; ?>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
