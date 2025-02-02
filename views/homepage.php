<?php
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit;
}

// Periksa role menggunakan isset()
$role = isset($_SESSION['role']) ? $_SESSION['role'] : null;

// Definisikan BASE_URL jika belum ada
if (!defined('BASE_URL')) {
    define('BASE_URL', '/tugasakhir');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Sistem Asesmen</a>
            <div class="d-flex">
                <span class="text-white me-3">Hi, <?php echo htmlspecialchars($_SESSION['user']); ?></span>
                <a href="logout.php" class="btn btn-danger btn-sm">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h1 class="text-center">Homepage</h1>
        <p class="text-center">Selamat datang, <?php echo htmlspecialchars($_SESSION['user']); ?>!</p>

        <div class="text-center mt-4">
            <?php if ($role === 'Admin'): ?>
                <a href="<?php echo BASE_URL; ?>/views/admin/manage_users.php" class="btn btn-primary mb-2">Manajemen Pengguna</a>
                <a href="<?php echo BASE_URL; ?>/views/admin/manage_pertanyaan.php" class="btn btn-primary mb-2">Manajemen Pertanyaan</a>
                <a href="<?php echo BASE_URL; ?>/views/admin/manage_framework.php" class="btn btn-primary mb-2">Manajemen Framework</a>
                <a href="<?php echo BASE_URL; ?>/views/admin/manage_kriteria.php" class="btn btn-primary mb-2">Manajemen Kriteria</a>
                <a href="<?php echo BASE_URL; ?>/views/admin/log_aktivitas.php" class="btn btn-primary mb-2">Log Aktivitas</a>
            <?php elseif ($role === 'Asesi'): ?>
                <a href="<?php echo BASE_URL; ?>/views/asesi/formulir_asesmen.php" class="btn btn-primary mb-2">Isi Self-Assessment</a>
                <a href="<?php echo BASE_URL; ?>/views/asesi/lihat_skor.php" class="btn btn-primary mb-2">Lihat Skor</a>
                <a href="<?php echo BASE_URL; ?>/views/asesi/riwayat_asesmen.php" class="btn btn-primary mb-2">Riwayat Asesmen</a>
            <?php elseif ($role === 'Asesor'): ?>
                <a href="<?php echo BASE_URL; ?>/views/asesor/manage_asesi.php" class="btn btn-primary mb-2">Manajemen Asesi</a>
                <a href="<?php echo BASE_URL; ?>/views/asesor/verif_asesmen.php" class="btn btn-primary mb-2">Verifikasi Self-Assessment</a>
                <a href="<?php echo BASE_URL; ?>/views/asesor/rangking.php" class="btn btn-primary mb-2">Lihat Ranking</a>
                <a href="<?php echo BASE_URL; ?>/views/asesor/buat_asesmen.php" class="btn btn-primary mb-2">Buat Asesmen</a>
            <?php else: ?>
                <p class="text-center text-danger">Role tidak dikenali.</p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
