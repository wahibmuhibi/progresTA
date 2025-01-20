<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Asesmen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="/tugasakhir/views/dashboard.php">Sistem Asesmen</a>
        <?php if (isset($_SESSION['user'])): ?>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <?php if ($_SESSION['role'] === 'Admin'): ?>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/admin/manage_users.php">Manajemen Pengguna</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/admin/manage_pertanyaan.php">Manajemen Pertanyaan</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/admin/manage_framework.php">Manajemen Framework</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/admin/manage_kriteria.php">Manajemen Kriteria</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/admin/log_aktivitas.php">Log Aktivitas</a></li>
                    <?php elseif ($_SESSION['role'] === 'Manajemen TI'): ?>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/manajemen_ti/formulir_asesmen.php">Self-Assessment</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/manajemen_ti/lihat_skor.php">Skor</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/manajemen_ti/riwayat_asesmen.php">Riwayat Asesmen</a></li>
                    <?php elseif ($_SESSION['role'] === 'Tim Penilai'): ?>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/tim_penilai/subjects.php">Subjek Penilaian</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/tim_penilai/verify_assessment.php">Verifikasi</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/tim_penilai/rankings.php">Ranking</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tugasakhir/views/tim_penilai/create_assessment.php">Buat Asesmen</a></li>
                    <?php endif; ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-fill"></i> <?php echo htmlspecialchars($_SESSION['user']); ?>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="/tugasakhir/views/profile.php">Profil</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="/tugasakhir/views/logout.php">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        <?php endif; ?>
    </div>
</nav>
<div class="container mt-4">
