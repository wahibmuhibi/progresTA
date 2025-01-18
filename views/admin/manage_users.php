<?php
session_start();
include '../../includes/auth.php';
check_role('Admin');
include '../../includes/db.php';
include '../../includes/header.php';

// Proses pembaruan data pengguna
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_user'])) {
    $username = $conn->real_escape_string($_POST['username']);
    $role = $conn->real_escape_string($_POST['role']);
    $institusi = $conn->real_escape_string($_POST['institusi']);

    $query = "UPDATE users SET role = '$role', institusi = '$institusi' WHERE username = '$username'";
    if ($conn->query($query)) {
        $success = "Data pengguna berhasil diperbarui.";
    } else {
        $error = "Terjadi kesalahan saat memperbarui data: " . $conn->error;
    }
}

// Proses penghapusan pengguna
if (isset($_GET['delete_username'])) {
    $delete_username = $conn->real_escape_string($_GET['delete_username']);
    $query = "DELETE FROM users WHERE username = '$delete_username'";

    if ($conn->query($query)) {
        $success = "Pengguna berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus pengguna: " . $conn->error;
    }
}

// Ambil data pengguna
$query = "SELECT * FROM users";
$result = $conn->query($query);

// Ambil data pengguna untuk di-edit
$edit_user = [];
if (isset($_GET['edit_username'])) {
    $edit_username = $conn->real_escape_string($_GET['edit_username']);
    $edit_query = "SELECT * FROM users WHERE username = '$edit_username'";
    $edit_result = $conn->query($edit_query);
    if ($edit_result && $edit_result->num_rows > 0) {
        $edit_user = $edit_result->fetch_assoc();
    }
}
?>

<h3 class="text-center">Manajemen Pengguna</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<!-- Form Edit Pengguna -->
<?php if (!empty($edit_user)): ?>
    <h4 class="mt-4">Edit Pengguna</h4>
    <form method="POST" action="">
        <input type="hidden" name="username" value="<?php echo htmlspecialchars($edit_user['username']); ?>">
        <div class="row mb-3">
            <div class="col-md-4">
                <label for="role" class="form-label">Role</label>
                <select name="role" id="role" class="form-select" required>
                    <option value="Admin" <?php echo $edit_user['role'] === 'Admin' ? 'selected' : ''; ?>>Admin</option>
                    <option value="Manajemen TI" <?php echo $edit_user['role'] === 'Manajemen TI' ? 'selected' : ''; ?>>Manajemen TI</option>
                    <option value="IT Auditor" <?php echo $edit_user['role'] === 'IT Auditor' ? 'selected' : ''; ?>>IT Auditor</option>
                    <option value="Tim Penilai" <?php echo $edit_user['role'] === 'Tim Penilai' ? 'selected' : ''; ?>>Tim Penilai</option>
                </select>
            </div>
            <div class="col-md-4">
                <label for="institusi" class="form-label">institusi</label>
                <input type="text" name="institusi" id="institusi" class="form-control" value="<?php echo htmlspecialchars($edit_user['institusi']); ?>" required>
            </div>
        </div>
        <button type="submit" name="update_user" class="btn btn-success">Simpan Perubahan</button>
        <a href="manage_users.php" class="btn btn-secondary">Batal</a>
    </form>
<?php endif; ?>

<!-- Tabel Daftar Pengguna -->
<h4 class="mt-5">Daftar Pengguna</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Username</th>
            <th>Role</th>
            <th>Institusi</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['username']); ?></td>
                <td><?php echo htmlspecialchars($row['role']); ?></td>
                <td><?php echo htmlspecialchars($row['institusi']); ?></td>
                <td>
                    <a href="?edit_username=<?php echo $row['username']; ?>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="?delete_username=<?php echo $row['username']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus pengguna ini?')">Hapus</a>
                </td>
            </tr>
        <?php endwhile; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
