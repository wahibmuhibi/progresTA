<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assessment System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="../views/dashboard.php">Assessment System</a>
        <?php if (isset($_SESSION['user'])): ?>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <?php if ($_SESSION['role'] === 'Admin'): ?>
                        <li class="nav-item"><a class="nav-link" href="../admin/manage_users.php">Manajemen Pengguna</a></li>
                        <li class="nav-item"><a class="nav-link" href="../admin/manage_questions.php">Manajemen Pertanyaan</a></li>
                        <li class="nav-item"><a class="nav-link" href="../admin/activity_logs.php">Log Aktivitas</a></li>
                    <?php elseif ($_SESSION['role'] === 'Manajemen TI'): ?>
                        <li class="nav-item"><a class="nav-link" href="../manajemen_ti/assessment_form.php">Self-Assessment</a></li>
                        <li class="nav-item"><a class="nav-link" href="../manajemen_ti/score_view.php">Skor</a></li>
                        <li class="nav-item"><a class="nav-link" href="../manajemen_ti/audit_history.php">Riwayat Audit</a></li>
                    <?php elseif ($_SESSION['role'] === 'IT Auditor'): ?>
                        <li class="nav-item"><a class="nav-link" href="../auditor/audit_view.php">Lihat Audit</a></li>
                        <li class="nav-item"><a class="nav-link" href="../auditor/recommendations.php">Rekomendasi</a></li>
                    <?php elseif ($_SESSION['role'] === 'Tim Penilai'): ?>
                        <li class="nav-item"><a class="nav-link" href="../tim_penilai/subjects.php">Subjek Penilaian</a></li>
                        <li class="nav-item"><a class="nav-link" href="../tim_penilai/verify_assessment.php">Verifikasi</a></li>
                        <li class="nav-item"><a class="nav-link" href="../tim_penilai/rankings.php">Ranking</a></li>
                    <?php endif; ?>
                    <li class="nav-item"><a class="nav-link text-danger" href="../views/logout.php">Logout</a></li>
                </ul>
            </div>
        <?php endif; ?>
    </div>
</nav>
<div class="container mt-4">
