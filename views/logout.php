<?php
session_start();
include '../includes/functions.php';
include '../includes/db.php'; // Pastikan koneksi database tersedia untuk fungsi log_activity

// Log aktivitas sebelum menghancurkan sesi
if (isset($_SESSION['user_id'])) {
    log_activity($_SESSION['user_id'], 'Logout dari sistem', $conn);
}

// Hapus semua data sesi
session_unset();
session_destroy();

// Redirect ke halaman login
header("Location: login.php");
exit;
?>
