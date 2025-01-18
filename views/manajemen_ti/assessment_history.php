<?php
session_start();
include '../../includes/auth.php';
check_roles(['Manajemen TI']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil daftar Asesmen yang telah diverifikasi untuk user
$user_id = $_SESSION['user_id'];

$query = "
    SELECT DISTINCT r.asesmen_kode, r.verification_code, r.verified_at, AVG(r.average_score) AS overall_score
    FROM assessment_results r
    JOIN asesi a ON r.asesmen_kode = a.asesmen_kode
    WHERE r.verification_code IS NOT NULL AND a.user_id = $user_id
    GROUP BY r.asesmen_kode, r.verification_code, r.verified_at
    ORDER BY r.verified_at DESC
";

$assessment_history = $conn->query($query);

?>

<h3 class="text-center">Riwayat Asesmen</h3>

<?php if ($assessment_history && $assessment_history->num_rows > 0): ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No</th>
                <th>Kode Asesmen</th>
                <th>Kode Verifikasi</th>
                <th>Rata-Rata Skor</th>
                <th>Tanggal Verifikasi</th>
            </tr>
        </thead>
        <tbody>
            <?php $rank = 1; ?>
            <?php while ($row = $assessment_history->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $rank++; ?></td>
                    <td><?php echo htmlspecialchars($row['asesmen_kode']); ?></td>
                    <td><?php echo htmlspecialchars($row['verification_code']); ?></td>
                    <td><?php echo htmlspecialchars(round($row['overall_score'], 2)); ?></td>
                    <td><?php echo htmlspecialchars($row['verified_at']); ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
<?php else: ?>
    <div class="alert alert-warning text-center">Belum ada riwayat Asesmen yang diverifikasi.</div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
