<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil daftar periode audit dan simpan ke array
$periode_query = $conn->query("SELECT DISTINCT periode_audit FROM eksternal_audit_question ORDER BY periode_audit DESC");
$periode_audit_list = [];
if ($periode_query && $periode_query->num_rows > 0) {
    while ($row = $periode_query->fetch_assoc()) {
        $periode_audit_list[] = $row['periode_audit'];
    }
}

// Ambil daftar subjek penilaian (auditee) berdasarkan periode audit
$selected_periode = isset($_GET['periode_audit']) ? (int)$_GET['periode_audit'] : null;
$auditee_query = $conn->query("
    SELECT a.id AS auditee_id, a.kode_audit, u.username, u.company, a.periode_audit, a.form_status, a.is_read 
    FROM auditee a 
    JOIN users u ON a.user_id = u.id 
    " . ($selected_periode ? "WHERE a.periode_audit = $selected_periode" : "") . " 
    ORDER BY a.created_at DESC
");


// Ambil daftar Manajemen TI untuk form tambah auditee
$manajemen_ti_query = $conn->query("SELECT id, username, company FROM users WHERE role = 'Manajemen TI' ORDER BY username ASC");

// Tambah Auditee
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_auditee'])) {
    $user_id = (int)$_POST['user_id'];
    $periode_audit = (int)$_POST['periode_audit'];
    $kode_audit = strtoupper(uniqid("AUDIT-")); // Generate kode audit unik

    // Validasi input
    if (empty($user_id) || empty($periode_audit)) {
        $error = "Akun Manajemen TI dan Periode Audit harus dipilih.";
    } else {
        $query = "INSERT INTO auditee (user_id, periode_audit, kode_audit) VALUES ($user_id, $periode_audit, '$kode_audit')";
        if ($conn->query($query)) {
            $success = "Auditee berhasil ditambahkan dengan kode audit: $kode_audit.";
        } else {
            $error = "Terjadi kesalahan saat menambahkan auditee: " . $conn->error;
        }
    }
}


// Hapus Auditee
if (isset($_GET['delete_auditee_id'])) {
    $delete_auditee_id = (int)$_GET['delete_auditee_id'];
    $query = "DELETE FROM auditee WHERE id = $delete_auditee_id";

    if ($conn->query($query)) {
        $success = "Auditee berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus auditee: " . $conn->error;
    }
}

// Kirim ke Auditee
if (isset($_GET['send_to_auditee_id'])) {
    $send_to_auditee_id = (int)$_GET['send_to_auditee_id'];
    $query = "UPDATE auditee SET is_read = TRUE WHERE id = $send_to_auditee_id";

    if ($conn->query($query)) {
        $success = "Formulir berhasil dikirim ke auditee.";
    } else {
        $error = "Terjadi kesalahan saat mengirim formulir: " . $conn->error;
    }
}
?>

<h3 class="text-center">Subjek Penilaian</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<!-- Form Pilih Periode Audit -->
<form method="GET" action="" class="mb-4">
    <div class="row">
        <div class="col-md-6">
            <label for="periode_audit" class="form-label">Pilih Periode Audit</label>
            <select name="periode_audit" id="periode_audit" class="form-select" onchange="this.form.submit()">
                <option value="">Semua Periode Audit</option>
                <?php foreach ($periode_audit_list as $periode): ?>
                    <option value="<?php echo $periode; ?>" <?php echo ($selected_periode === (int)$periode) ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($periode); ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
</form>

<!-- Tabel Auditee -->
<h4>Daftar Auditee</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Username</th>
            <th>Company</th>
            <th>Periode Audit</th>
            <th>Kode Audit</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($auditee_query && $auditee_query->num_rows > 0): ?>
            <?php while ($row = $auditee_query->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['username']); ?></td>
                    <td><?php echo htmlspecialchars($row['company']); ?></td>
                    <td><?php echo htmlspecialchars($row['periode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['kode_audit']); ?></td>
                    <td>
                        <?php 
                        if ($row['form_status'] === 'submitted') {
                            echo '<span class="badge bg-success">Self-Assessment Diterima</span>';
                        } elseif ($row['is_read']) {
                            echo '<span class="badge bg-warning">Dilihat</span>';
                        } else {
                            echo '<span class="badge bg-secondary">Dikirim</span>';
                        }
                        ?>
                    </td>
                    <td>
                        <?php if ($row['form_status'] === 'submitted'): ?>
                            <a href="verify_assessment.php?auditee_id=<?php echo $row['auditee_id']; ?>" class="btn btn-sm btn-primary">Verifikasi</a>
                        <?php else: ?>
                            <a href="?send_to_auditee_id=<?php echo $row['auditee_id']; ?>" class="btn btn-sm btn-primary">Kirim</a>
                        <?php endif; ?>
                        <a href="?delete_auditee_id=<?php echo $row['auditee_id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Yakin ingin menghapus auditee ini?')">Hapus</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="6" class="text-center">Tidak ada auditee untuk periode ini.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<!-- Form Tambah Auditee -->
<h4 class="mt-4">Tambah Auditee</h4>
<form method="POST" action="">
    <div class="row">
        <div class="col-md-6">
            <label for="user_id" class="form-label">Pilih Akun Manajemen TI</label>
            <select name="user_id" id="user_id" class="form-select" required>
                <option value="" disabled selected>Pilih Akun</option>
                <?php while ($row = $manajemen_ti_query->fetch_assoc()): ?>
                    <option value="<?php echo $row['id']; ?>">
                        <?php echo htmlspecialchars($row['username'] . ' (' . $row['company'] . ')'); ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-6">
            <label for="periode_audit" class="form-label">Periode Audit</label>
            <select name="periode_audit" id="periode_audit" class="form-select" required>
                <option value="" disabled selected>Pilih Periode</option>
                <?php foreach ($periode_audit_list as $periode): ?>
                    <option value="<?php echo $periode; ?>">
                        <?php echo htmlspecialchars($periode); ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <button type="submit" name="add_auditee" class="btn btn-primary mt-3">Tambah Auditee</button>
</form>
