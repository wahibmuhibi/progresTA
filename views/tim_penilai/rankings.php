<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

$query = "SELECT u.username, u.company, AVG(sa.score) AS average_score 
          FROM users u 
          JOIN self_assessments sa ON u.id = sa.user_id 
          WHERE u.role = 'Manajemen TI' AND sa.status = 'Verified' 
          GROUP BY u.id 
          ORDER BY average_score DESC";
$result = $conn->query($query);
?>

<h3 class="text-center">Ranking Organisasi</h3>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Rangking</th>
            <th>Organisasi</th>
            <th>Rata-rata Skor</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($result->num_rows > 0): 
            $rank = 1;
            while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo $rank++; ?></td>
                <td><?php echo $row['company']; ?></td>
                <td><?php echo round($row['average_score'], 2); ?></td>
            </tr>
        <?php endwhile; else: ?>
            <tr>
                <td colspan="3" class="text-center">Belum ada data untuk ditampilkan.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
