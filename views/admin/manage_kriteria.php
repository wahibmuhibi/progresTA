<?php
session_start();
include '../../includes/auth.php';
check_role('Admin');
include '../../includes/db.php';
include '../../includes/header.php';

// Tambah data baru
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_maturity'])) {
    $jenis = $conn->real_escape_string($_POST['jenis']);
    $kondisi = $conn->real_escape_string($_POST['kondisi']);
    $skor = (int)$_POST['skor'];

    if (empty($jenis) || empty($kondisi)) {
        $error = "Jenis dan Kondisi tidak boleh kosong.";
    } else {
        $query = "INSERT INTO maturity (jenis, kondisi, skor) VALUES ('$jenis', '$kondisi', $skor)";

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
    $query = "DELETE FROM maturity WHERE id = '$delete_id'";

    if ($conn->query($query)) {
        $success = "Data berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus data: " . $conn->error;
    }
}


// Tambah pasangan Kode Mapping dengan Jenis Maturity
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['map_maturity'])) {
    $kode_mapping = $conn->real_escape_string($_POST['kode_mapping']);
    $jenis_kriteria = $conn->real_escape_string($_POST['jenis_kriteria']);

    // Periksa apakah pasangan sudah ada
    $check_query = "SELECT * FROM mapping_maturity WHERE kode_mapping = '$kode_mapping' AND jenis_kriteria = '$jenis_kriteria'";
    $check_result = $conn->query($check_query);

    if ($check_result->num_rows > 0) {
        $error = "Kode Mapping '$kode_mapping' sudah dipasangkan dengan Maturity '$jenis_kriteria'.";
    } else {
        // Simpan pasangan baru jika belum ada
        $query = "INSERT INTO mapping_maturity (kode_mapping, jenis_kriteria) VALUES ('$kode_mapping', '$jenis_kriteria')";

        if ($conn->query($query)) {
            $success = "Kode Mapping berhasil dipasangkan dengan Jenis Maturity.";
        } else {
            $error = "Terjadi kesalahan saat menyimpan data: " . $conn->error;
        }
    }
}


// Hapus data berdasarkan ID
if (isset($_GET['delete_mapping_id'])) {
    $delete_id = $conn->real_escape_string($_GET['delete_mapping_id']);
    $query = "DELETE FROM mapping_maturity WHERE id = '$delete_id'";

    if ($conn->query($query)) {
        $success = "Mapping berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus data: " . $conn->error;
    }
}


// Ambil data dari tabel
$maturity_data = $conn->query("SELECT * FROM maturity ORDER BY skor ASC");
$mapping_data = $conn->query("SELECT kode_mapping FROM mapping_standard ORDER BY kode_mapping ASC");
$mapped_data = $conn->query("SELECT mc.*, ms.kode_mapping, c.jenis 
                             FROM mapping_maturity mc 
                             JOIN mapping_standard ms ON mc.kode_mapping = ms.kode_mapping 
                             JOIN maturity c ON mc.jenis_kriteria = c.jenis 
                             ORDER BY mc.created_at DESC");

// Ambil data dari database
$mapped_data_result = $conn->query("SELECT DISTINCT mc.id, mc.kode_mapping, c.jenis AS jenis_kriteria 
                                    FROM mapping_maturity mc 
                                    JOIN mapping_standard ms ON mc.kode_mapping = ms.kode_mapping 
                                    JOIN maturity c ON mc.jenis_kriteria = c.jenis 
                                    ORDER BY mc.created_at DESC");

// Simpan hasil query dalam array
$mapped_data = $mapped_data_result ? $mapped_data_result->fetch_all(MYSQLI_ASSOC) : [];

?>

<h3 class="text-center">Manajemen Maturity</h3>

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
            <input type="text" name="jenis" id="jenis" class="form-control" placeholder="Contoh: Maturity Cobit" required>
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
    <button type="submit" name="add_maturity" class="btn btn-primary">Tambah Data</button>
</form>

<!-- Tabel Daftar Data -->
<h4 class="mt-5">Daftar Maturity</h4>
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
        <?php if ($maturity_data && $maturity_data->num_rows > 0): ?>
            <?php while ($row = $maturity_data->fetch_assoc()): ?>
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

<!-- Form Pasang Kode Mapping dengan Jenis Maturity -->
<form method="POST" action="">
    <h4 class="mt-4">Pasangkan Kode Mapping dengan Jenis Maturity</h4>
    <div class="row mb-3">
        <div class="col-md-6">
            <label for="kode_mapping" class="form-label">Kode Mapping</label>
            <select name="kode_mapping" id="kode_mapping" class="form-select" required>
                <option value="" disabled selected>Pilih Kode Mapping</option>
                <?php while ($row = $mapping_data->fetch_assoc()): ?>
                    <option value="<?php echo htmlspecialchars($row['kode_mapping']); ?>">
                        <?php echo htmlspecialchars($row['kode_mapping']); ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-6">
            <label for="jenis_kriteria" class="form-label">Jenis Maturity</label>
            <?php 
                // Ambil ulang data maturity untuk dropdown
                $maturity_data_dropdown = $conn->query("SELECT DISTINCT jenis FROM maturity ORDER BY jenis ASC");
            ?>
            <select name="jenis_kriteria" id="jenis_kriteria" class="form-select" required>
                <option value="" disabled selected>Pilih Jenis Maturity</option>
                <?php while ($row = $maturity_data_dropdown->fetch_assoc()): ?>
                    <option value="<?php echo htmlspecialchars($row['jenis']); ?>">
                        <?php echo htmlspecialchars($row['jenis']); ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
    </div>
    <button type="submit" name="map_maturity" class="btn btn-primary">Pasangkan</button>
</form>


<!-- Tabel Daftar Mapping ke Maturity -->
<h4 class="mt-5">Daftar Mapping ke Maturity</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Kode Mapping</th>
            <th>Jenis Maturity</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if (!empty($mapped_data)): ?>
            <?php 
            // Gunakan array unik untuk menghilangkan duplikasi
            $unique_data = array_unique($mapped_data, SORT_REGULAR);
            foreach ($unique_data as $row): 
            ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                    <td><?php echo htmlspecialchars($row['jenis_kriteria']); ?></td>
                    <td>
                        <a href="?delete_mapping_id=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="3" class="text-center">Belum ada data yang terhubung.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>
