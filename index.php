<?php
session_start();

// Periksa apakah pengguna sudah login
if (isset($_SESSION['user'])) {
    header("Location: views/dashboard.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assessment System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.php">Assessment System</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="container text-center mt-5">
        <h1>Welcome to Assessment System</h1>
        <p class="lead">This system helps manage assessments and audits for IT maturity based on COBIT, ITIL, and ISO 27000 frameworks.</p>
        <a href="views/login.php" class="btn btn-primary btn-lg mt-3">Login</a>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>&copy; 2025 Assessment System. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
