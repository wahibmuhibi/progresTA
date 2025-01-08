<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';
check_roles(['Tim Penilai']); // Hanya Tim Penilai yang diizinkan

$id = isset($_GET['id']) ? $conn->real_escape_string($_GET['id']) : '';
$self_assessment = $conn->query("SELECT sa.*, u.username, u.company 
    FROM self_assessment sa 
    JOIN users u ON sa.user_id = u.id 
    WHERE sa.id = '$id'");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kode_mapping = $conn->real_escape_string($_POST['kode_mapping']);
    $skor = (int)$_POST['skor'];
    $komentar = $conn->real_escape_string($_POST['komentar']);

    $query = "INSERT INTO maturity_scores (kode_mapping, skor, komentar, user_id) 
              VALUES ('$kode_mapping', $skor, '$komentar', {$_SESSION['user_id']})";

    if ($conn->query($query)) {
        $success = "Skor berhasil disimpan.";
    } else {
        $error = "Terjadi kesalahan saat menyimpan skor: " . $conn->error;
    }
}
?>

<h3 class="text-center">Beri Skor Maturity</h3>
<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<form method="POST" action="">
    <div class="mb-3">
        <label for="kode_mapping" class="form-label">Kode Mapping</label>
        <input type="text" name="kode_mapping" id="kode_mapping" class="form-control" value="<?php echo htmlspecialchars($self_assessment['kode_mapping']); ?>" readonly>
    </div>
    <div class="mb-3">
        <label for="skor" class="form-label">Skor</label>
        <select name="skor" id="skor" class="form-select" required>
            <option value="" disabled selected>Pilih Skor</option>
            <option value="0">Belum Terfikirkan</option>
            <option value="1">Belum Ada, masih diinisiasikan</option>
            <option value="2">Sudah Ada, tanpa dokumentasi</option>
            <option value="3">Sudah Ada, dan terdokumentasikan</option>
            <option value="4">Sudah Ada, terdokumentasi dan termonitoring</option>
            <option value="5">Sudah Ada, dan sudah Optimal</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="komentar" class="form-label">Komentar</label>
        <textarea name="komentar" id="komentar" class="form-control" rows="4"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Simpan Skor</button>
</form>
