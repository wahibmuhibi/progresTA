<?php
session_start();
include '../../includes/auth.php';
check_role('Admin');
include '../../includes/db.php';
include '../../includes/header.php';

// Debugging koneksi database
if ($conn->connect_error) {
    die("Koneksi database gagal: " . $conn->connect_error);
}

// Ambil data untuk masing-masing framework
$iso_versions = $conn->query("SELECT DISTINCT versi FROM iso");
$itil_versions = $conn->query("SELECT DISTINCT versi FROM itil");
$cobit_versions = $conn->query("SELECT DISTINCT versi FROM cobit");

// Debug query versi
if (!$iso_versions || !$itil_versions || !$cobit_versions) {
    die("Error saat mengambil versi: " . $conn->error);
}

// Ambil data berdasarkan input pengguna (tanpa default value)
$selected_iso_version = isset($_GET['iso_version']) ? $_GET['iso_version'] : null;
$selected_itil_version = isset($_GET['itil_version']) ? $_GET['itil_version'] : null;
$selected_cobit_version = isset($_GET['cobit_version']) ? $_GET['cobit_version'] : null;

// Query data berdasarkan versi yang dipilih
$iso_data = $selected_iso_version ? $conn->query("SELECT annex, control FROM iso WHERE versi = '$selected_iso_version'") : null;
$itil_data = $selected_itil_version ? $conn->query("SELECT service_lifecycle FROM itil WHERE versi = '$selected_itil_version'") : null;
$cobit_data = $selected_cobit_version ? $conn->query("SELECT process_id, process_name FROM cobit WHERE versi = '$selected_cobit_version'") : null;

// Debug query data
if (($selected_iso_version && !$iso_data) || ($selected_itil_version && !$itil_data) || ($selected_cobit_version && !$cobit_data)) {
    die("Error saat mengambil data: " . $conn->error);
}
?>

<h3 class="text-center">Manajemen Standard</h3>

<div class="container mt-4">

    <!-- ISO -->
    <h4>ISO</h4>
    <form method="GET" class="mb-3">
        <label for="iso_version" class="form-label">Pilih Versi ISO</label>
        <select name="iso_version" id="iso_version" class="form-select" onchange="this.form.submit()">
            <option value="">-- Pilih Versi --</option>
            <?php while ($row = $iso_versions->fetch_assoc()): ?>
                <option value="<?php echo $row['versi']; ?>" <?php echo $selected_iso_version === $row['versi'] ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($row['versi']); ?>
                </option>
            <?php endwhile; ?>
        </select>
    </form>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Annex</th>
                <th>Control</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($iso_data && $iso_data->num_rows > 0): ?>
                <?php while ($row = $iso_data->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['annex']); ?></td>
                        <td><?php echo htmlspecialchars($row['control']); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="2" class="text-center">Tidak ada data.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <!-- ITIL -->
    <h4>ITIL</h4>
    <form method="GET" class="mb-3">
        <label for="itil_version" class="form-label">Pilih Versi ITIL</label>
        <select name="itil_version" id="itil_version" class="form-select" onchange="this.form.submit()">
            <option value="">-- Pilih Versi --</option>
            <?php while ($row = $itil_versions->fetch_assoc()): ?>
                <option value="<?php echo $row['versi']; ?>" <?php echo $selected_itil_version === $row['versi'] ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($row['versi']); ?>
                </option>
            <?php endwhile; ?>
        </select>
    </form>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Service Lifecycle</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($itil_data && $itil_data->num_rows > 0): ?>
                <?php while ($row = $itil_data->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['service_lifecycle']); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td class="text-center">Tidak ada data.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <!-- COBIT -->
    <h4>COBIT</h4>
    <form method="GET" class="mb-3">
        <label for="cobit_version" class="form-label">Pilih Versi COBIT</label>
        <select name="cobit_version" id="cobit_version" class="form-select" onchange="this.form.submit()">
            <option value="">-- Pilih Versi --</option>
            <?php while ($row = $cobit_versions->fetch_assoc()): ?>
                <option value="<?php echo $row['versi']; ?>" <?php echo $selected_cobit_version === $row['versi'] ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($row['versi']); ?>
                </option>
            <?php endwhile; ?>
        </select>
    </form>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Process ID</th>
                <th>Process Name</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($cobit_data && $cobit_data->num_rows > 0): ?>
                <?php while ($row = $cobit_data->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['process_id']); ?></td>
                        <td><?php echo htmlspecialchars($row['process_name']); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="2" class="text-center">Tidak ada data.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

</div>

<?php include '../../includes/footer.php'; ?>
// Done