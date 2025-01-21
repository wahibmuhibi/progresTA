<?php
session_start();

// Periksa apakah pengguna sudah login
if (isset($_SESSION['user'])) {
    header("Location: views/homepage.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplikasi Asesmen</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.php">Aplikasi Asesmen</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="container text-center mt-5">
        <h1>Selamat Datang di Aplikasi Asesmen</h1>
        <p class="lead">Sistem ini membantu mengelola penilaian untuk kematangan TI berdasarkan kerangka kerja COBIT, ITIL, dan ISO 27000.</p>
        <a href="views/login.php" class="btn btn-primary btn-lg mt-3">Masuk</a>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>&copy; 2025 Aplikasi Asesmen. Semua hak cipta dilindungi.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
