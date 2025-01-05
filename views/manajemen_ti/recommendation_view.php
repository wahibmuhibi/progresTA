<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

$user_id = $_SESSION['user_id'];
$query = "SELECT r.recommendation, u.username AS auditor, r.created_at 
          FROM recommendations r 
          JOIN users u ON r.auditor_id = u.id 
          WHERE r.user_id = '$user_id'";
$result = $conn->query($query);
?>

<h3 class="text-center">Rekomendasi Perbaikan</h3>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Rekomendasi</th>
            <th>Auditor</th>
            <th>Tanggal</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($result->num_rows > 0): 
            $no = 1;
            while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $row['recommendation']; ?></td>
                <td><?php echo $row['auditor']; ?></td>
                <td><?php echo $row['created_at']; ?></td>
            </tr>
        <?php endwhile; else: ?>
            <tr>
                <td colspan="4" class="text-center">Belum ada rekomendasi.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
