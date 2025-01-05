<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user'])) {
    header("Location: ../views/login.php");
    exit;
}

// Periksa role
if (!isset($_SESSION['role'])) {
    die('Role tidak dikenali.');
}
?>
