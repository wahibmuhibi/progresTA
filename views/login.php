<?php
include '../includes/db.php';
include '../includes/functions.php';
session_start();
// Pastikan pengguna sudah logout sebelum masuk ke login
if (isset($_SESSION['user'])) {
    header("Location: homepage.php");
    exit;
}

$error = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $conn->real_escape_string($_POST['username']);
    $password = $_POST['password'];

    // Validasi input kosong
    if (empty($username) || empty($password)) {
        $error = "Username dan password harus diisi.";
    } else {
        // Query database
        $query = "SELECT * FROM users WHERE username = '$username' AND password = MD5('$password')";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            $_SESSION['user'] = $user['username'];
            $_SESSION['role'] = $user['role'];
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['company'] = $user['company'];

            // Log aktivitas login
            if (function_exists('log_activity')) {
                log_activity($user['id'], 'Login ke sistem', $conn);
            }

            // Redirect ke homepage
            header("Location: homepage.php");
            exit;
        } else {
            $error = "Login gagal. Username atau password salah.";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Login</h1>
        <?php if (!empty($error)): ?>
            <div class="alert alert-danger text-center"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>
        <form method="POST" action="">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" name="username" id="username" class="form-control" placeholder="Masukkan username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Masukkan password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <p class="text-center mt-3">
            <a href="forgot_password.php" class="text-decoration-none">Lupa password?</a>
        </p>
        <p class="text-center mt-2">
            Belum punya akun? <a href="register.php" class="text-decoration-none">Daftar sekarang</a>
        </p>
    </div>
</body>
</html>
