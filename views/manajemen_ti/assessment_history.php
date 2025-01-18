<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

$user_id = $_SESSION['user_id'];
$query = "SELECT * FROM audit_history WHERE user_id = '$user_id'";
$result = $conn->query($query);
?>

<h3 class="text-center">Riwayat Asesmen</h3>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Deskripsi Asesmen</th>
            <th>Hasil</th>
            <th>Tanggal Asesmen</th>
        </tr>
    </thead>
    <tbody>
        <?php
        if ($result->num_rows > 0):
            $no = 1;
            while ($row = $result->fetch_assoc()):
        ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $row['description']; ?></td>
                <td><?php echo $row['result']; ?></td>
                <td><?php echo $row['created_at']; ?></td>
            </tr>
        <?php endwhile; else: ?>
            <tr>
                <td colspan="4" class="text-center">Belum ada data.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
