<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

$user_id = $_SESSION['user_id'];
$query = "SELECT * FROM self_assessments WHERE user_id = '$user_id' AND status = 'Verified'";
$result = $conn->query($query);
?>

<h3 class="text-center">Skor Self-Assessment</h3>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Assessment</th>
            <th>Score</th>
            <th>Verified At</th>
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
                <td><?php echo $row['assessment']; ?></td>
                <td><?php echo $row['score']; ?></td>
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
