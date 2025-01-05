<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $role = $_POST['role'];
    $query = "UPDATE users SET role = '$role' WHERE username = '$username'";
    if ($conn->query($query)) {
        $success = "Role pengguna berhasil diperbarui.";
    } else {
        $error = "Terjadi kesalahan: " . $conn->error;
    }
}

$query = "SELECT * FROM users";
$result = $conn->query($query);
?>

<h3 class="text-center">Manajemen Pengguna</h3>
<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>Username</th>
            <th>Role</th>
            <th>Company</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo $row['username']; ?></td>
                <td><?php echo $row['role']; ?></td>
                <td><?php echo $row['company']; ?></td>
                <td>
                    <form method="POST" action="" class="d-inline">
                        <input type="hidden" name="username" value="<?php echo $row['username']; ?>">
                        <select name="role" class="form-select">
                            <option value="Admin" <?php echo $row['role'] === 'Admin' ? 'selected' : ''; ?>>Admin</option>
                            <option value="Manajemen TI" <?php echo $row['role'] === 'Manajemen TI' ? 'selected' : ''; ?>>Manajemen TI</option>
                            <option value="IT Auditor" <?php echo $row['role'] === 'IT Auditor' ? 'selected' : ''; ?>>IT Auditor</option>
                            <option value="Tim Penilai" <?php echo $row['role'] === 'Tim Penilai' ? 'selected' : ''; ?>>Tim Penilai</option>
                        </select>
                        <button type="submit" class="btn btn-sm btn-primary mt-1">Update</button>
                    </form>
                </td>
            </tr>
        <?php endwhile; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
