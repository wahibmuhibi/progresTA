<?php
session_start();
include '../../includes/auth.php';
check_roles(['Asesi']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil ID Asesi dari sesi login
$user_id = $_SESSION['user_id'];

// Ambil riwayat asesmen berdasarkan user_id
$history_query = $conn->query("
    SELECT DISTINCT h.asesmen_kode, h.score_session_id, h.verified_at, h.verification_code, h.rekomendasi, u.username AS asesor_name
    FROM asesmen_hasil h
    JOIN asesmen_jawaban j ON h.asesmen_kode = j.asesmen_kode
    JOIN asesi a ON j.asesmen_kode = a.asesmen_kode
    JOIN users u ON a.asesor_id = u.id
    WHERE a.user_id = $user_id
    ORDER BY h.verified_at DESC
");

?>

<h3 class="text-center">Riwayat Self-Assessment</h3>

<?php if ($history_query && $history_query->num_rows > 0): ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Kode Asesmen</th>
                <th>Score Session ID</th>
                <th>Asesor</th>
                <th>Kode Verifikasi</th>
                <th>Rekomendasi</th>
                <th>Tanggal Verifikasi</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $history_query->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['asesmen_kode']); ?></td>
                    <td><?php echo htmlspecialchars($row['score_session_id']); ?></td>
                    <td><?php echo htmlspecialchars($row['asesor_name']); ?></td>
                    <td><?php echo htmlspecialchars($row['verification_code']); ?></td>
                    <td><?php echo htmlspecialchars($row['rekomendasi']); ?></td>
                    <td><?php echo htmlspecialchars($row['verified_at']); ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
<?php else: ?>
    <div class="alert alert-warning text-center">Belum ada riwayat asesmen yang diverifikasi.</div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
