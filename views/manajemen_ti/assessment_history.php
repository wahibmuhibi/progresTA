<?php
session_start();
include '../../includes/auth.php';
check_roles(['Manajemen TI']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil daftar assessment yang telah diverifikasi untuk user
$user_id = $_SESSION['user_id'];

$query = "
    SELECT DISTINCT r.kode_audit, r.verification_code, r.verified_at, AVG(r.average_score) AS overall_score
    FROM assessment_results r
    JOIN asesi a ON r.kode_audit = a.kode_audit
    WHERE r.verification_code IS NOT NULL AND a.user_id = $user_id
    GROUP BY r.kode_audit, r.verification_code, r.verified_at
    ORDER BY r.verified_at DESC
";

$assessment_history = $conn->query($query);

?>

<h3 class="text-center">Riwayat Assessment</h3>

<?php if ($assessment_history && $assessment_history->num_rows > 0): ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No</th>
                <th>Kode Audit</th>
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
                    <td><?php echo htmlspecialchars($row['kode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['verification_code']); ?></td>
                    <td><?php echo htmlspecialchars(round($row['overall_score'], 2)); ?></td>
                    <td><?php echo htmlspecialchars($row['verified_at']); ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
<?php else: ?>
    <div class="alert alert-warning text-center">Belum ada riwayat assessment yang diverifikasi.</div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
