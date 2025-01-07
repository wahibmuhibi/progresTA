<?php
// Mulai sesi hanya jika belum dimulai
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Periksa apakah pengguna sudah login
if (!isset($_SESSION['user'])) {
    header("Location: ../views/login.php");
    exit;
}

// Periksa role pengguna
$current_file = basename($_SERVER['PHP_SELF']); // Nama file yang diakses
if (!isset($_SESSION['role'])) {
    die('Role tidak dikenali.');
}

// Restriksi akses untuk file tertentu berdasarkan role
if ($_SESSION['role'] !== 'Admin' && $current_file === 'manage_users.php') {
    die('Unauthorized Access');
}

function check_role($required_role) {
    if (!isset($_SESSION['role']) || $_SESSION['role'] !== $required_role) {
        header("Location: /tugasakhir/views/403.php"); // Redirect ke halaman akses ditolak
        exit;
    }
}

function check_roles($allowed_roles) {
    if (!isset($_SESSION['role']) || !in_array($_SESSION['role'], $allowed_roles)) {
        header("Location: /tugasakhir/views/403.php"); // Redirect ke halaman akses ditolak
        exit;
    }
}
?>
