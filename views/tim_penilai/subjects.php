<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Fungsi untuk konversi status.
function mapFormStatusToLabel($status, $role)
{
    $status_map = [
        'Manajemen TI' => [
            0 => 'Belum Diterima',
            1 => 'Diterima',
            2 => 'Draf',
            3 => 'Terkirim'
        ],
        'Tim Penilai' => [
            0 => 'Belum Dikirim',
            1 => 'Dikirim',
            2 => 'Dibaca',
            3 => 'Self-Assessment Diterima'
        ]
    ];
    if (isset($status_map[$role]) && isset($status_map[$role][$status])) {
        return $status_map[$role][$status];
    }
    return 'Tidak Diketahui';
}

// Ambil daftar periode audit
$periode_query = $conn->query("SELECT DISTINCT asesmen_periode FROM asesmen_pertanyaan ORDER BY asesmen_periode DESC");
$asesmen_periode_list = [];
if ($periode_query && $periode_query->num_rows > 0) {
    while ($row = $periode_query->fetch_assoc()) {
        $asesmen_periode_list[] = $row['asesmen_periode'];
    }
}

// Ambil daftar subjek penilaian berdasarkan periode audit
$selected_periode = isset($_GET['asesmen_periode']) ? (int)$_GET['asesmen_periode'] : null;
$auditee_query = $conn->query("
    SELECT a.id AS auditee_id, a.kode_audit, u.username, u.company, a.asesmen_periode, a.form_status 
    FROM auditee a 
    JOIN users u ON a.user_id = u.id 
    " . ($selected_periode ? "WHERE a.asesmen_periode = $selected_periode" : "") . " 
    ORDER BY a.created_at DESC
");

// Ambil daftar Manajemen TI untuk form tambah auditee
$manajemen_ti_query = $conn->query("SELECT id, username, company FROM users WHERE role = 'Manajemen TI' ORDER BY username ASC");

// Tambah Auditee
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_auditee'])) {
    $user_id = (int)$_POST['user_id'];
    $asesmen_periode = (int)$_POST['asesmen_periode'];
    $kode_audit = strtoupper(uniqid("AUDIT-"));

    if (empty($user_id) || empty($asesmen_periode)) {
        $error = "Akun Manajemen TI dan Periode Audit harus dipilih.";
    } else {
        $query = "INSERT INTO auditee (user_id, asesmen_periode, kode_audit) VALUES ($user_id, $asesmen_periode, '$kode_audit')";
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

    $query = "
        UPDATE auditee 
        SET form_status = 1
        WHERE id = $send_to_auditee_id
    ";

    if ($conn->query($query)) {
        $success = "Formulir berhasil dikirim ke auditee.";
        // Debugging perubahan
        $updated_status_query = $conn->query("SELECT form_status FROM auditee WHERE id = $send_to_auditee_id");
        $updated_status = $updated_status_query->fetch_assoc();
        error_log("Status setelah dikirim: " . $updated_status['form_status']);
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

<!-- Tabel Auditee -->
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
                    <td><?php echo htmlspecialchars($row['asesmen_periode']); ?></td>
                    <td><?php echo htmlspecialchars($row['kode_audit']); ?></td>
                    <td>
                        <?php 
                        $status_label = mapFormStatusToLabel($row['form_status'], 'Tim Penilai');
                        $badge_class = $row['form_status'] == 3 ? 'success' :
                                    ($row['form_status'] == 2 ? 'warning' : 
                                    ($row['form_status'] == 1 ? 'primary' : 'secondary'));
                        ?>
                        <span class="badge bg-<?php echo $badge_class; ?>">
                            <?php echo htmlspecialchars($status_label); ?>
                        </span>
                    </td>
                    <td>
                        <?php if ($row['form_status'] == 3): ?>
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
            <label for="asesmen_periode" class="form-label">Periode Audit</label>
            <select name="asesmen_periode" id="asesmen_periode" class="form-select" required>
                <option value="" disabled selected>Pilih Periode</option>
                <?php foreach ($asesmen_periode_list as $periode): ?>
                    <option value="<?php echo $periode; ?>">
                        <?php echo htmlspecialchars($periode); ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <button type="submit" name="add_auditee" class="btn btn-primary mt-3">Tambah Auditee</button>
</form>
