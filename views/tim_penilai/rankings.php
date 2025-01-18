<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil data ranking berdasarkan rata-rata skor yang telah diverifikasi
$rankings_query = $conn->query("
    SELECT r.kode_audit, r.verification_code, u.username AS asesi_name, AVG(r.average_score) AS overall_average, r.verified_at
    FROM assessment_results r
    JOIN auditee a ON r.kode_audit = a.kode_audit
    JOIN users u ON a.user_id = u.id
    WHERE r.verification_code IS NOT NULL
    GROUP BY r.kode_audit
    ORDER BY overall_average DESC
");

?>

<h3 class="text-center">Ranking Asesi</h3>

<?php if ($rankings_query && $rankings_query->num_rows > 0): ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Rank</th>
                <th>Nama Asesi</th>
                <th>Kode Audit</th>
                <th>Kode Verifikasi</th>
                <th>Rata-Rata Skor</th>
                <th>Tanggal Verifikasi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $rank = 1;
            while ($row = $rankings_query->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $rank++; ?></td>
                    <td><?php echo htmlspecialchars($row['asesi_name']); ?></td>
                    <td><?php echo htmlspecialchars($row['kode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['verification_code']); ?></td>
                    <td><?php echo htmlspecialchars(round($row['overall_average'], 2)); ?></td>
                    <td><?php echo htmlspecialchars($row['verified_at']); ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
<?php else: ?>
    <div class="alert alert-warning">Belum ada data yang diverifikasi.</div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
