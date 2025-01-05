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

// Tambahkan validasi untuk file lain sesuai kebutuhan
?>
