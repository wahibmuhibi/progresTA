<?php
session_start();
include '../../includes/auth.php';
check_role('Admin');
include '../../includes/db.php';
include '../../includes/header.php';

$query = "SELECT a.id, u.username, a.aktivitas, a.timestamp 
          FROM log_aktivitas a 
          JOIN users u ON a.user_id = u.id 
          ORDER BY a.timestamp DESC";
$result = $conn->query($query);
?>

<h3 class="text-center">Log Aktivitas Pengguna</h3>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Username</th>
            <th>Aktivitas</th>
            <th>Waktu</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($result->num_rows > 0): 
            $no = 1;
            while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $row['username']; ?></td>
                <td><?php echo $row['aktivitas']; ?></td>
                <td><?php echo $row['timestamp']; ?></td>
            </tr>
        <?php endwhile; else: ?>
            <tr>
                <td colspan="4" class="text-center">Belum ada log aktivitas.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
