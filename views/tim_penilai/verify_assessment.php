<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $assessment_id = $_POST['assessment_id'];
    $score = $_POST['score'];

    $query = "UPDATE self_assessments SET score = '$score', status = 'Verified' WHERE id = '$assessment_id'";
    if ($conn->query($query)) {
        $success = "Assessment berhasil diverifikasi.";
    } else {
        $error = "Terjadi kesalahan: " . $conn->error;
    }
}

$query = "SELECT sa.id, sa.assessment, u.username, sa.status 
          FROM self_assessments sa 
          JOIN users u ON sa.user_id = u.id 
          WHERE sa.status = 'Pending'";
$result = $conn->query($query);
?>

<h3 class="text-center">Verifikasi Self-Assessment</h3>
<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Assessment</th>
            <th>Username</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($result->num_rows > 0): 
            $no = 1;
            while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $row['assessment']; ?></td>
                <td><?php echo $row['username']; ?></td>
                <td><?php echo $row['status']; ?></td>
                <td>
                    <form method="POST" action="">
                        <input type="hidden" name="assessment_id" value="<?php echo $row['id']; ?>">
                        <input type="number" name="score" class="form-control mb-2" placeholder="Masukkan Skor" required>
                        <button type="submit" class="btn btn-success btn-sm">Verifikasi</button>
                    </form>
                </td>
            </tr>
        <?php endwhile; else: ?>
            <tr>
                <td colspan="5" class="text-center">Belum ada assessment yang perlu diverifikasi.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
