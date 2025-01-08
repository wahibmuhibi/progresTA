<?php
session_start();
include '../../includes/auth.php';
check_roles(['IT Auditor']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil data mapping
$mapping_data = $conn->query("SELECT id, kode_mapping FROM mapping_standard ORDER BY kode_mapping ASC");

// Proses penyimpanan assessment
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kode_mapping = isset($_POST['kode_mapping']) ? $conn->real_escape_string($_POST['kode_mapping']) : '';
    $pertanyaan = isset($_POST['pertanyaan']) ? $conn->real_escape_string($_POST['pertanyaan']) : '';
    $periode_audit = isset($_POST['periode_audit']) ? (int)$_POST['periode_audit'] : 0;

    if (empty($kode_mapping) || empty($pertanyaan) || empty($periode_audit)) {
        $error = "Kode Mapping, Periode Audit, dan Pertanyaan tidak boleh kosong.";
    } else {
        $query = "INSERT INTO internal_audit_question (kode_mapping, periode_audit, pertanyaan) 
                  VALUES ('$kode_mapping', $periode_audit, '$pertanyaan')";

        if ($conn->query($query)) {
            $success = "Pertanyaan internal audit berhasil disimpan.";
        } else {
            $error = "Terjadi kesalahan saat menyimpan pertanyaan: " . $conn->error;
        }
    }
}

// Ambil daftar pertanyaan
$questions = $conn->query("SELECT * FROM internal_audit_question ORDER BY periode_audit DESC, kode_mapping ASC");
