<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil data mapping dari tabel mapping_standard
$mapping_data = $conn->query("SELECT id, kode_mapping FROM mapping_standard ORDER BY kode_mapping ASC");

// Proses penyimpanan asesmen
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kode_mapping = isset($_POST['kode_mapping']) ? $conn->real_escape_string($_POST['kode_mapping']) : '';
    $pertanyaan = isset($_POST['pertanyaan']) ? $conn->real_escape_string($_POST['pertanyaan']) : '';
    $asesmen_periode = isset($_POST['asesmen_periode']) ? (int)$_POST['asesmen_periode'] : 0;
    $source = $_SESSION['user']; // Menggunakan username dari sesi sebagai pembuat

    // Validasi input
    if (empty($kode_mapping) || empty($pertanyaan) || empty($asesmen_periode)) {
        $error = "Kode Mapping, Periode Asesmen, dan Pertanyaan tidak boleh kosong.";
    } else {
        // Pastikan ID AUTO_INCREMENT benar
        $max_id_query = $conn->query("SELECT MAX(id) AS max_id FROM asesmen_pertanyaan");
        $max_id = $max_id_query->fetch_assoc()['max_id'];
        $next_id = $max_id ? $max_id + 1 : 1;

        $conn->query("ALTER TABLE asesmen_pertanyaan AUTO_INCREMENT = $next_id");

        // Simpan pertanyaan baru
        $query = "
            INSERT INTO asesmen_pertanyaan (kode_mapping, asesmen_periode, pertanyaan, source) 
            VALUES ('$kode_mapping', $asesmen_periode, '$pertanyaan', '$source')
        ";

        if ($conn->query($query)) {
            $success = "Pertanyaan asesmen berhasil disimpan.";
        } else {
            $error = "Terjadi kesalahan saat menyimpan pertanyaan: " . $conn->error;
        }
    }
}

// Hapus pertanyaan berdasarkan ID
if (isset($_GET['delete_id'])) {
    $delete_id = $conn->real_escape_string($_GET['delete_id']);
    $query = "DELETE FROM asesmen_pertanyaan WHERE id = '$delete_id'";

    if ($conn->query($query)) {
        $success = "Pertanyaan asesmen berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus pertanyaan: " . $conn->error;
    }
}

// Ambil daftar pertanyaan
$questions = $conn->query("SELECT * FROM asesmen_pertanyaan ORDER BY asesmen_periode DESC, kode_mapping ASC");

?>

<h3 class="text-center">Buat Pertanyaan Asesmen</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<!-- Form Tambah Pertanyaan -->
<form method="POST" action="">
    <div class="row mb-3">
        <div class="col-md-6">
            <label for="kode_mapping" class="form-label">Kode Mapping</label>
            <select name="kode_mapping" id="kode_mapping" class="form-select" onchange="this.form.submit()" required>
                <option value="" disabled selected>Pilih Kode Mapping</option>
                <?php if ($mapping_data && $mapping_data->num_rows > 0): ?>
                    <?php while ($row = $mapping_data->fetch_assoc()): ?>
                        <option value="<?php echo htmlspecialchars($row['kode_mapping']); ?>" <?php echo isset($_POST['kode_mapping']) && $_POST['kode_mapping'] === $row['kode_mapping'] ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($row['kode_mapping']); ?>
                        </option>
                    <?php endwhile; ?>
                <?php else: ?>
                    <option value="" disabled>Tidak ada data mapping.</option>
                <?php endif; ?>
            </select>
        </div>
        <div class="col-md-6">
            <label for="asesmen_periode" class="form-label">Periode Asesmen</label>
            <input type="number" name="asesmen_periode" id="asesmen_periode" class="form-control" placeholder="Contoh: 2025" min="2000" max="2099" required>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-12">
            <label for="pertanyaan" class="form-label">Pertanyaan</label>
            <textarea name="pertanyaan" id="pertanyaan" class="form-control" rows="4" placeholder="Masukkan pertanyaan asesmen" required></textarea>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Simpan Pertanyaan</button>
</form>

<!-- Tabel Daftar Pertanyaan -->
<h4 class="mt-5">Daftar Pertanyaan Asesmen</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Kode Mapping</th>
            <th>Periode Asesmen</th>
            <th>Pertanyaan</th>
            <th>Source</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($questions && $questions->num_rows > 0): ?>
            <?php $no = 1; while ($row = $questions->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $no++; ?></td>
                    <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                    <td><?php echo htmlspecialchars($row['asesmen_periode']); ?></td>
                    <td><?php echo htmlspecialchars($row['pertanyaan']); ?></td>
                    <td><?php echo htmlspecialchars($row['source']); ?></td>
                    <td>
                        <a href="?delete_id=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus pertanyaan ini?')">Hapus</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="6" class="text-center">Belum ada pertanyaan asesmen.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>
