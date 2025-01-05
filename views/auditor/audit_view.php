<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

$query = "SELECT * FROM audit_history";
$result = $conn->query($query);
?>

<h3 class="text-center">Riwayat Audit</h3>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Deskripsi</th>
            <th>Hasil</th>
            <th>Auditor</th>
        </tr>
    </thead>
    <tbody>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo $row['id']; ?></td>
                <td><?php echo $row['description']; ?></td>
                <td><?php echo $row['result']; ?></td>
                <td><?php echo $row['auditor_id']; ?></td>
            </tr>
        <?php endwhile; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
