<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

// Debugging koneksi database
if ($conn->connect_error) {
    die("Koneksi database gagal: " . $conn->connect_error);
}

// Ambil data versi ITIL, ISO, dan COBIT
$itil_versions = $conn->query("SELECT DISTINCT version FROM itil");
$iso_versions = $conn->query("SELECT DISTINCT version FROM iso");
$cobit_versions = $conn->query("SELECT DISTINCT version FROM cobit");

// Ambil pilihan pengguna
$selected_itil_version = isset($_POST['itil_version']) ? $_POST['itil_version'] : null;
$selected_iso_version = isset($_POST['iso_version']) ? $_POST['iso_version'] : null;
$selected_cobit_version = isset($_POST['cobit_version']) ? $_POST['cobit_version'] : null;

// Ambil data dinamis berdasarkan versi yang dipilih
$itil_data = $selected_itil_version ? $conn->query("SELECT service_lifecycle FROM itil WHERE version = '$selected_itil_version'") : null;
$iso_data = $selected_iso_version ? $conn->query("SELECT annex, control FROM iso WHERE version = '$selected_iso_version'") : null;
$cobit_data = $selected_cobit_version ? $conn->query("SELECT process_id, process_name FROM cobit WHERE version = '$selected_cobit_version'") : null;

// Simpan data dinamis ke array untuk digunakan di JavaScript
$iso_controls = [];
if ($iso_data && $iso_data->num_rows > 0) {
    while ($row = $iso_data->fetch_assoc()) {
        $iso_controls[$row['annex']] = $row['control'];
    }
}

$cobit_process_names = [];
if ($cobit_data && $cobit_data->num_rows > 0) {
    while ($row = $cobit_data->fetch_assoc()) {
        $cobit_process_names[$row['process_id']] = $row['process_name'];
    }
}

// Simpan Mapping
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['save_mapping'])) {
    $itil_version = $_POST['itil_version'];
    $itil_service_lifecycle = $_POST['itil_service_lifecycle'];
    $iso_version = $_POST['iso_version'];
    $iso_annex = $_POST['iso_annex'];
    $iso_control = $_POST['iso_control'];
    $cobit_version = $_POST['cobit_version'];
    $cobit_process_id = $_POST['cobit_process_id'];
    $cobit_process_name = $_POST['cobit_process_name'];
    $mapping_version = $_POST['mapping_version'];

    $query = "INSERT INTO mapping_standard (mapping_version, itil_version, itil_service_lifecycle, iso_version, iso_annex, iso_control, cobit_version, cobit_process_id, cobit_process_name)
              VALUES ('$mapping_version', '$itil_version', '$itil_service_lifecycle', '$iso_version', '$iso_annex', '$iso_control', '$cobit_version', '$cobit_process_id', '$cobit_process_name')";

    if ($conn->query($query)) {
        $success = "Mapping berhasil disimpan.";
    } else {
        $error = "Terjadi kesalahan: " . $conn->error;
    }
}

// Hapus Mapping
if (isset($_GET['delete_mapping_id'])) {
    $id = $_GET['delete_mapping_id'];
    $query = "DELETE FROM mapping_standard WHERE id = '$id'";

    if ($conn->query($query)) {
        $success = "Mapping berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus data: " . $conn->error;
    }
}

?>

<h3 class="text-center">Manajemen Pertanyaan</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<h4>Mapping Standard</h4>
<form method="POST" action="">
    <div class="row mb-3">
        <!-- Versi ITIL -->
        <div class="col-md-4">
            <label for="itil_version" class="form-label">Versi ITIL</label>
            <select name="itil_version" id="itil_version" class="form-select" onchange="this.form.submit()" required>
                <option value="" disabled selected>Pilih VersiITIL</option>
                <?php while ($row = $itil_versions->fetch_assoc()): ?>
                    <option value="<?php echo htmlspecialchars($row['version']); ?>" <?php echo $selected_itil_version === $row['version'] ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($row['version']); ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-4">
            <label for="itil_service_lifecycle" class="form-label">ITIL Service Lifecycle</label>
            <select name="itil_service_lifecycle" id="itil_service_lifecycle" class="form-select" required>
                <option value="" disabled selected>Pilih ITIL Service Lifecycle</option>
                <?php if ($itil_data && $itil_data->num_rows > 0): ?>
                    <?php while ($row = $itil_data->fetch_assoc()): ?>
                        <option value="<?php echo htmlspecialchars($row['service_lifecycle']); ?>">
                            <?php echo htmlspecialchars($row['service_lifecycle']); ?>
                        </option>
                    <?php endwhile; ?>
                <?php endif; ?>
            </select>
        </div>
    </div>
    <div class="row mb-3">
        <!-- Versi ISO -->
        <div class="col-md-4">
            <label for="iso_version" class="form-label">Versi ISO</label>
            <select name="iso_version" id="iso_version" class="form-select" onchange="this.form.submit()" required>
                <option value="" disabled selected>Pilih Versi ISO</option>
                <?php while ($row = $iso_versions->fetch_assoc()): ?>
                    <option value="<?php echo htmlspecialchars($row['version']); ?>" <?php echo $selected_iso_version === $row['version'] ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($row['version']); ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-4">
            <label for="iso_annex" class="form-label">ISO Annex</label>
            <select name="iso_annex" id="iso_annex" class="form-select" required>
                <option value="" disabled selected>Pilih ISO Annex</option>
                <?php if ($iso_data && $iso_data->num_rows > 0): ?>
                    <?php foreach ($iso_controls as $annex => $control): ?>
                        <option value="<?php echo htmlspecialchars($annex); ?>">
                            <?php echo htmlspecialchars($annex); ?>
                        </option>
                    <?php endforeach; ?>
                <?php endif; ?>
            </select>
        </div>
        <div class="col-md-4">
            <label for="iso_control" class="form-label">ISO Control</label>
            <input type="text" name="iso_control" id="iso_control" class="form-control" placeholder="ISO Control" readonly required>
        </div>
    </div>
    <div class="row mb-3">
        <!-- Versi COBIT -->
        <div class="col-md-4">
            <label for="cobit_version" class="form-label">Versi COBIT</label>
            <select name="cobit_version" id="cobit_version" class="form-select" onchange="this.form.submit()" required>
                <option value="" disabled selected>Pilih Versi COBIT</option>
                <?php while ($row = $cobit_versions->fetch_assoc()): ?>
                    <option value="<?php echo htmlspecialchars($row['version']); ?>" <?php echo $selected_cobit_version === $row['version'] ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($row['version']); ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-4">
            <label for="cobit_process_id" class="form-label">COBIT Process ID</label>
            <select name="cobit_process_id" id="cobit_process_id" class="form-select" required>
                <option value="" disabled selected>Pilih Process ID COBIT</option>
                <?php if ($cobit_data && $cobit_data->num_rows > 0): ?>
                    <?php foreach ($cobit_process_names as $process_id => $process_name): ?>
                        <option value="<?php echo htmlspecialchars($process_id); ?>">
                            <?php echo htmlspecialchars($process_id); ?>
                        </option>
                    <?php endforeach; ?>
                <?php endif; ?>
            </select>
        </div>
        <div class="col-md-4">
            <label for="cobit_process_name" class="form-label">COBIT Process Name</label>
            <input type="text" name="cobit_process_name" id="cobit_process_name" class="form-control" placeholder="COBIT Process Name" readonly required>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-12">
            <label for="mapping_version" class="form-label">Versi Mapping</label>
            <input type="text" name="mapping_version" id="mapping_version" class="form-control" placeholder="Contoh: v1.0" required>
        </div>
    </div>
    <button type="submit" name="save_mapping" class="btn btn-primary">Simpan Mapping</button>
</form>

<script>
    // Update ISO Control berdasarkan Annex
    document.getElementById('iso_annex').addEventListener('change', function () {
        const annex = this.value;
        const isoControls = <?php echo json_encode($iso_controls); ?>;
        document.getElementById('iso_control').value = isoControls[annex] || '';
    });

    // Update COBIT Process Name berdasarkan Process ID
    document.getElementById('cobit_process_id').addEventListener('change', function () {
        const processId = this.value;
        const cobitProcessNames = <?php echo json_encode($cobit_process_names); ?>;
        document.getElementById('cobit_process_name').value = cobitProcessNames[processId] || '';
    });
</script>

<h4 class="mt-5">Daftar Mapping</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Versi Mapping</th>
            <th>Versi ITIL</th>
            <th>ITIL Service Lifecycle</th>
            <th>Versi ISO</th>
            <th>ISO Annex</th>
            <th>ISO Control</th>
            <th>Versi COBIT</th>
            <th>COBIT Process ID</th>
            <th>COBIT Process Name</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $mapping_data = $conn->query("SELECT * FROM mapping_standard ORDER BY created_at DESC");
        if ($mapping_data && $mapping_data->num_rows > 0): ?>
            <?php while ($row = $mapping_data->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['mapping_version']); ?></td>
                    <td><?php echo htmlspecialchars($row['itil_version']); ?></td>
                    <td><?php echo htmlspecialchars($row['itil_service_lifecycle']); ?></td>
                    <td><?php echo htmlspecialchars($row['iso_version']); ?></td>
                    <td><?php echo htmlspecialchars($row['iso_annex']); ?></td>
                    <td><?php echo htmlspecialchars($row['iso_control']); ?></td>
                    <td><?php echo htmlspecialchars($row['cobit_version']); ?></td>
                    <td><?php echo htmlspecialchars($row['cobit_process_id']); ?></td>
                    <td><?php echo htmlspecialchars($row['cobit_process_name']); ?></td>
                    <td>
                        <a href="?delete_mapping_id=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm">Hapus</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="10" class="text-center">Belum ada mapping.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>
