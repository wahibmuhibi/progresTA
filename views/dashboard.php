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
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Assessment System</a>
            <div class="d-flex">
                <span class="text-white me-3">Hi, <?php echo htmlspecialchars($_SESSION['user']); ?></span>
                <a href="logout.php" class="btn btn-danger btn-sm">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h1 class="text-center">Dashboard</h1>
        <p class="text-center">Selamat datang, <?php echo htmlspecialchars($_SESSION['user']); ?>!</p>

        <div class="text-center mt-4">
            <?php if ($role === 'Admin'): ?>
                <a href="<?php echo BASE_URL; ?>/views/admin/manage_users.php" class="btn btn-primary mb-2">Manajemen Pengguna</a>
                <a href="<?php echo BASE_URL; ?>/views/admin/manage_questions.php" class="btn btn-primary mb-2">Manajemen Pertanyaan</a>
                <a href="<?php echo BASE_URL; ?>/views/admin/manage_standard.php" class="btn btn-primary mb-2">Manajemen Standard</a>
                <a href="<?php echo BASE_URL; ?>/views/admin/activity_logs.php" class="btn btn-primary mb-2">Log Aktivitas</a>
            <?php elseif ($role === 'Manajemen TI'): ?>
                <a href="<?php echo BASE_URL; ?>/views/manajemen_ti/assessment_form.php" class="btn btn-primary mb-2">Isi Self-Assessment</a>
                <a href="<?php echo BASE_URL; ?>/views/manajemen_ti/score_view.php" class="btn btn-primary mb-2">Lihat Skor</a>
                <a href="<?php echo BASE_URL; ?>/views/manajemen_ti/audit_history.php" class="btn btn-primary mb-2">Riwayat Audit</a>
            <?php elseif ($role === 'IT Auditor'): ?>
                <a href="<?php echo BASE_URL; ?>/views/auditor/audit_view.php" class="btn btn-primary mb-2">Lihat Audit</a>
                <a href="<?php echo BASE_URL; ?>/views/auditor/recommendations.php" class="btn btn-primary mb-2">Rekomendasi Perbaikan</a>
            <?php elseif ($role === 'Tim Penilai'): ?>
                <a href="<?php echo BASE_URL; ?>/views/tim_penilai/subjects.php" class="btn btn-primary mb-2">Lihat Subjek Penilaian</a>
                <a href="<?php echo BASE_URL; ?>/views/tim_penilai/verify_assessment.php" class="btn btn-primary mb-2">Verifikasi Self-Assessment</a>
                <a href="<?php echo BASE_URL; ?>/views/tim_penilai/rankings.php" class="btn btn-primary mb-2">Lihat Ranking</a>
            <?php else: ?>
                <p class="text-center text-danger">Role tidak dikenali.</p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
