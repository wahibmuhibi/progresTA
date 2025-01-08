<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil data mapping dari tabel mapping_standard
$mapping_data = $conn->query("SELECT id, kode_mapping FROM mapping_standard ORDER BY kode_mapping ASC");

// Proses penyimpanan assessment
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kode_mapping = isset($_POST['kode_mapping']) ? $conn->real_escape_string($_POST['kode_mapping']) : '';
    $pertanyaan = isset($_POST['pertanyaan']) ? $conn->real_escape_string($_POST['pertanyaan']) : '';
    $periode_audit = isset($_POST['periode_audit']) ? (int)$_POST['periode_audit'] : 0;

    if (empty($kode_mapping) || empty($pertanyaan) || empty($periode_audit)) {
        $error = "Kode Mapping, Periode Audit, dan Pertanyaan tidak boleh kosong.";
    } else {
        $query = "INSERT INTO eksternal_audit_question (kode_mapping, periode_audit, pertanyaan) 
                  VALUES ('$kode_mapping', $periode_audit, '$pertanyaan')";

        if ($conn->query($query)) {
            $success = "Pertanyaan eksternal audit berhasil disimpan.";
        } else {
            $error = "Terjadi kesalahan saat menyimpan pertanyaan: " . $conn->error;
        }
    }
}

// Hapus pertanyaan berdasarkan ID
if (isset($_GET['delete_id'])) {
    $delete_id = $conn->real_escape_string($_GET['delete_id']);
    $query = "DELETE FROM eksternal_audit_question WHERE id = '$delete_id'";

    if ($conn->query($query)) {
        $success = "Pertanyaan eksternal audit berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus pertanyaan: " . $conn->error;
    }
}

// Ambil daftar pertanyaan
$questions = $conn->query("SELECT * FROM eksternal_audit_question ORDER BY periode_audit DESC, kode_mapping ASC");


// Ambil data lengkap berdasarkan kode mapping
$mapping_details = [];
if (isset($_POST['kode_mapping'])) {
    $kode_mapping = $conn->real_escape_string($_POST['kode_mapping']);
    $detail_query = "SELECT * FROM mapping_standard WHERE kode_mapping = '$kode_mapping'";
    $detail_result = $conn->query($detail_query);
    if ($detail_result && $detail_result->num_rows > 0) {
        $mapping_details = $detail_result->fetch_assoc();
    }
}

// Hapus pertanyaan berdasarkan ID
if (isset($_GET['delete_id'])) {
    $delete_id = $conn->real_escape_string($_GET['delete_id']);
    $query = "DELETE FROM eksternal_audit_question WHERE id = '$delete_id'";

    if ($conn->query($query)) {
        $success = "Pertanyaan assessment berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus pertanyaan: " . $conn->error;
    }
}
?>

<h3 class="text-center">Buat Pertanyaan Assessment</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

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
            <label for="periode_audit" class="form-label">Periode Audit</label>
            <input type="number" name="periode_audit" id="periode_audit" class="form-control" placeholder="Contoh: 2025" min="2000" max="2099" required>
        </div>
    </div>

    <?php if (!empty($mapping_details)): ?>
        <div class="row mb-3">
            <div class="col-md-12">
                <p class="bg-light p-3 border rounded">
                    <strong>Pertanyaan Audit nomor <?php echo htmlspecialchars($mapping_details['nomor_audit']); ?>:</strong> 
                    mengacu pada <strong><?php echo htmlspecialchars($mapping_details['itil_version']); ?></strong> 
                    (<strong><?php echo htmlspecialchars($mapping_details['itil_service_lifecycle']); ?></strong>), 
                    <strong><?php echo htmlspecialchars($mapping_details['iso_version']); ?></strong> 
                    (<strong><?php echo htmlspecialchars($mapping_details['iso_annex']); ?></strong> 
                    <?php echo htmlspecialchars($mapping_details['iso_control']); ?>), 
                    dan <strong><?php echo htmlspecialchars($mapping_details['cobit_version']); ?></strong> 
                    (<strong><?php echo htmlspecialchars($mapping_details['cobit_process_id']); ?></strong> 
                    <?php echo htmlspecialchars($mapping_details['cobit_process_name']); ?>).
                </p>
            </div>
        </div>
    <?php endif; ?>

    <div class="row mb-3">
        <div class="col-md-12">
            <label for="pertanyaan" class="form-label">Pertanyaan</label>
            <textarea name="pertanyaan" id="pertanyaan" class="form-control" rows="4" placeholder="Masukkan pertanyaan assessment" required></textarea>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Simpan Pertanyaan</button>
</form>

<h4 class="mt-5">Daftar Pertanyaan Assessment</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Kode Mapping</th>
            <th>Periode Audit</th>
            <th>Pertanyaan</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $questions = $conn->query("SELECT * FROM eksternal_audit_question ORDER BY periode_audit DESC, kode_mapping ASC");
        if ($questions && $questions->num_rows > 0): ?>
            <?php $no = 1; while ($row = $questions->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $no++; ?></td>
                    <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                    <td><?php echo htmlspecialchars($row['periode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['pertanyaan']); ?></td>
                    <td>
                        <a href="?delete_id=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus pertanyaan ini?')">Hapus</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="5" class="text-center">Belum ada pertanyaan assessment.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>
