<?php
session_start();
include '../../includes/auth.php';
check_roles(['Asesor']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil ID Asesor dari sesi login
$asesor_id = $_SESSION['user_id'];

// Ambil data mapping dari tabel mapping_standard
$mapping_data = $conn->query("SELECT id, kode_mapping FROM mapping_standard ORDER BY kode_mapping ASC");

// Cek apakah mode Edit
$edit_mode = false;
$pertanyaan = null;

if (isset($_GET['id'])) {
    $edit_mode = true;
    $id = $conn->real_escape_string($_GET['id']);

    // Ambil data pertanyaan untuk mode edit
    $query = "SELECT * FROM asesmen_pertanyaan WHERE id = $id AND asesor_id = $asesor_id";
    $result = $conn->query($query);

    if ($result && $result->num_rows > 0) {
        $pertanyaan = $result->fetch_assoc();
    } else {
        echo "<div class='alert alert-danger'>Pertanyaan tidak ditemukan atau Anda tidak memiliki akses.</div>";
        include '../../includes/footer.php';
        exit;
    }
}

// Proses penyimpanan data (tambah atau edit)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kode_mapping = isset($_POST['kode_mapping']) ? $conn->real_escape_string($_POST['kode_mapping']) : '';
    $pertanyaan_text = isset($_POST['pertanyaan']) ? $conn->real_escape_string($_POST['pertanyaan']) : '';
    $asesmen_periode = isset($_POST['asesmen_periode']) ? (int)$_POST['asesmen_periode'] : 0;

    // Validasi input
    if (empty($kode_mapping) || empty($pertanyaan_text) || empty($asesmen_periode)) {
        $error = "Kode Mapping, Periode Asesmen, dan Pertanyaan tidak boleh kosong.";
    } else {
        if ($edit_mode) {
            // Mode Edit
            $update_query = "
                UPDATE asesmen_pertanyaan 
                SET kode_mapping = '$kode_mapping', pertanyaan = '$pertanyaan_text', asesmen_periode = $asesmen_periode 
                WHERE id = $id AND asesor_id = $asesor_id
            ";

            if ($conn->query($update_query)) {
                $success = "Pertanyaan berhasil diperbarui.";
                header("Location: buat_asesmen.php");
                exit;
            } else {
                $error = "Gagal memperbarui pertanyaan: " . $conn->error;
            }
        } else {
            // Mode Tambah
            $insert_query = "
                INSERT INTO asesmen_pertanyaan (kode_mapping, asesmen_periode, pertanyaan, asesor_id) 
                VALUES ('$kode_mapping', $asesmen_periode, '$pertanyaan_text', $asesor_id)
            ";

            if ($conn->query($insert_query)) {
                $success = "Pertanyaan asesmen berhasil disimpan.";
            } else {
                $error = "Terjadi kesalahan saat menyimpan pertanyaan: " . $conn->error;
            }
        }
    }
}

// Ambil daftar pertanyaan milik asesor
$questions = $conn->query("
    SELECT q.*, u.username AS asesor_username 
    FROM asesmen_pertanyaan q
    JOIN users u ON q.asesor_id = u.id
    WHERE q.asesor_id = $asesor_id
    ORDER BY q.asesmen_periode DESC, q.kode_mapping ASC
");
?>

<h3 class="text-center"><?php echo $edit_mode ? 'Edit Pertanyaan Asesmen' : 'Buat Pertanyaan Asesmen'; ?></h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<!-- Form Tambah/Edit Pertanyaan -->
<form method="POST" action="">
    <div class="row mb-3">
        <div class="col-md-6">
            <label for="kode_mapping" class="form-label">Kode Mapping</label>
            <select name="kode_mapping" id="kode_mapping" class="form-select" required>
                <option value="" disabled selected>Pilih Kode Mapping</option>
                <?php if ($mapping_data && $mapping_data->num_rows > 0): ?>
                    <?php while ($row = $mapping_data->fetch_assoc()): ?>
                        <option value="<?php echo htmlspecialchars($row['kode_mapping']); ?>" 
                            <?php echo $pertanyaan && $pertanyaan['kode_mapping'] === $row['kode_mapping'] ? 'selected' : ''; ?>>
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
            <input type="number" name="asesmen_periode" id="asesmen_periode" class="form-control" placeholder="Contoh: 2025" 
                value="<?php echo $pertanyaan ? htmlspecialchars($pertanyaan['asesmen_periode']) : ''; ?>" required>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-12">
            <label for="pertanyaan" class="form-label">Pertanyaan</label>
            <textarea name="pertanyaan" id="pertanyaan" class="form-control" rows="4" placeholder="Masukkan pertanyaan asesmen" required><?php echo $pertanyaan ? htmlspecialchars($pertanyaan['pertanyaan']) : ''; ?></textarea>
        </div>
    </div>
    <button type="submit" class="btn btn-primary"><?php echo $edit_mode ? 'Update Pertanyaan' : 'Simpan Pertanyaan'; ?></button>
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
            <th>Asesor</th>
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
                    <td><?php echo htmlspecialchars($row['asesor_username']); ?></td>
                    <td>
                        <a href="buat_asesmen.php?id=<?php echo $row['id']; ?>" class="btn btn-warning btn-sm">Edit</a>
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

<?php include '../../includes/footer.php'; ?>
