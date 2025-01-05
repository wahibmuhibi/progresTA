<?php
session_start();
include '../includes/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];
    $company = $_POST['company'];

    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $error = "Username sudah digunakan.";
    } else {
        $hashedPassword = md5($password);
        $insertQuery = "INSERT INTO users (username, password, role, company) 
                        VALUES ('$username', '$hashedPassword', '$role', '$company')";
        if ($conn->query($insertQuery)) {
            $success = "Registrasi berhasil. Silakan login.";
        } else {
            $error = "Terjadi kesalahan: " . $conn->error;
        }
    }
}
?>

<?php include '../includes/header.php'; ?>
<div class="row justify-content-center">
    <div class="col-md-6">
        <h3 class="text-center">Register</h3>
        <?php if (isset($error)): ?>
            <div class="alert alert-danger"><?php echo $error; ?></div>
        <?php endif; ?>
        <?php if (isset($success)): ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php endif; ?>
        <form method="POST" action="">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <select name="role" class="form-select" required>
                    <option value="" disabled selected>Pilih Role</option>
                    <option value="Manajemen TI">Manajemen TI</option>
                    <option value="IT Auditor">IT Auditor</option>
                    <option value="Admin">Admin</option>
                    <option value="Tim Penilai">Tim Penilai</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="company" class="form-label">Perusahaan</label>
                <input type="text" name="company" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
        <p class="mt-3 text-center">Sudah punya akun? <a href="login.php">Login</a></p>
    </div>
</div>
<?php include '../includes/footer.php'; ?>
