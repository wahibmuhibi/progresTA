<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

// Tambah data baru
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_criteria'])) {
    $jenis = $conn->real_escape_string($_POST['jenis']);
    $kondisi = $conn->real_escape_string($_POST['kondisi']);
    $skor = (int)$_POST['skor'];

    if (empty($jenis) || empty($kondisi)) {
        $error = "Jenis dan Kondisi tidak boleh kosong.";
    } else {
        $query = "INSERT INTO criteria (jenis, kondisi, skor) VALUES ('$jenis', '$kondisi', $skor)";

        if ($conn->query($query)) {
            $success = "Data berhasil ditambahkan.";
        } else {
            $error = "Terjadi kesalahan: " . $conn->error;
        }
    }
}

// Hapus data berdasarkan ID
if (isset($_GET['delete_id'])) {
    $delete_id = $conn->real_escape_string($_GET['delete_id']);
    $query = "DELETE FROM criteria WHERE id = '$delete_id'";

    if ($conn->query($query)) {
        $success = "Data berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus data: " . $conn->error;
    }
}

// Ambil data dari tabel
$criteria_data = $conn->query("SELECT * FROM criteria ORDER BY skor ASC");
?>

<h3 class="text-center">Manajemen Kriteria</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<!-- Form Tambah Data -->
<form method="POST" action="">
    <h4 class="mt-4">Tambah Data Baru</h4>
    <div class="row mb-3">
        <div class="col-md-4">
            <label for="jenis" class="form-label">Jenis</label>
            <input type="text" name="jenis" id="jenis" class="form-control" placeholder="Contoh: Skala Likert" required>
        </div>
        <div class="col-md-4">
            <label for="kondisi" class="form-label">Kondisi</label>
            <input type="text" name="kondisi" id="kondisi" class="form-control" placeholder="Contoh: Belum Terfikirkan" required>
        </div>
        <div class="col-md-4">
            <label for="skor" class="form-label">Skor</label>
            <input type="number" name="skor" id="skor" class="form-control" placeholder="Contoh: 0" required>
        </div>
    </div>
    <button type="submit" name="add_criteria" class="btn btn-primary">Tambah Data</button>
</form>

<!-- Tabel Daftar Data -->
<h4 class="mt-5">Daftar Kriteria</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Jenis</th>
            <th>Kondisi</th>
            <th>Skor</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($criteria_data && $criteria_data->num_rows > 0): ?>
            <?php while ($row = $criteria_data->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['jenis']); ?></td>
                    <td><?php echo htmlspecialchars($row['kondisi']); ?></td>
                    <td><?php echo htmlspecialchars($row['skor']); ?></td>
                    <td>
                        <a href="?delete_id=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="4" class="text-center">Belum ada data.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

