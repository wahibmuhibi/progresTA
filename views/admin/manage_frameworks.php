<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil data untuk masing-masing framework
$iso_versions = $conn->query("SELECT DISTINCT version FROM iso");
$itil_versions = $conn->query("SELECT DISTINCT version FROM itil");
$cobit_versions = $conn->query("SELECT DISTINCT version FROM cobit");

// Ambil data default untuk tabel
$selected_iso_version = isset($_GET['iso_version']) ? $_GET['iso_version'] : '27001';
$selected_itil_version = isset($_GET['itil_version']) ? $_GET['itil_version'] : '4';
$selected_cobit_version = isset($_GET['cobit_version']) ? $_GET['cobit_version'] : '2019';

$iso_data = $conn->query("SELECT annex, control FROM iso WHERE version = '$selected_iso_version'");
$itil_data = $conn->query("SELECT service_lifecycle FROM itil WHERE version = '$selected_itil_version'");
$cobit_data = $conn->query("SELECT domain FROM cobit WHERE version = '$selected_cobit_version'");
?>

<h3 class="text-center">Manajemen Framework</h3>

<div class="container mt-4">

    <!-- ISO -->
    <h4>ISO</h4>
    <form method="GET" class="mb-3">
        <label for="iso_version" class="form-label">Pilih Versi ISO</label>
        <select name="iso_version" id="iso_version" class="form-select" onchange="this.form.submit()">
            <?php while ($row = $iso_versions->fetch_assoc()): ?>
                <option value="<?php echo $row['version']; ?>" <?php echo $selected_iso_version === $row['version'] ? 'selected' : ''; ?>>
                    <?php echo "ISO " . $row['version']; ?>
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
            <?php if ($iso_data->num_rows > 0): ?>
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
            <?php while ($row = $itil_versions->fetch_assoc()): ?>
                <option value="<?php echo $row['version']; ?>" <?php echo $selected_itil_version === $row['version'] ? 'selected' : ''; ?>>
                    <?php echo "ITIL " . $row['version']; ?>
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
            <?php if ($itil_data->num_rows > 0): ?>
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
            <?php while ($row = $cobit_versions->fetch_assoc()): ?>
                <option value="<?php echo $row['version']; ?>" <?php echo $selected_cobit_version === $row['version'] ? 'selected' : ''; ?>>
                    <?php echo "COBIT " . $row['version']; ?>
                </option>
            <?php endwhile; ?>
        </select>
    </form>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Domain</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($cobit_data->num_rows > 0): ?>
                <?php while ($row = $cobit_data->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['domain']); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td class="text-center">Tidak ada data.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

</div>

<?php include '../../includes/footer.php'; ?>
