<?php
session_start();
include '../../includes/auth.php';
check_roles(['Asesor']);
include '../../includes/db.php';
include '../../includes/header.php';

// Fungsi untuk konversi status.
function mapFormStatusToLabel($status, $role)
{
    $status_map = [
        'Asesi' => [
            0 => 'Belum Diterima',
            1 => 'Diterima',
            2 => 'Draf',
            3 => 'Terkirim'
        ],
        'Asesor' => [
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

// Ambil daftar periode Asesmen
$periode_query = $conn->query("SELECT DISTINCT asesmen_periode FROM asesmen_pertanyaan ORDER BY asesmen_periode DESC");
$asesmen_periode_list = [];
if ($periode_query && $periode_query->num_rows > 0) {
    while ($row = $periode_query->fetch_assoc()) {
        $asesmen_periode_list[] = $row['asesmen_periode'];
    }
}

// Ambil daftar subjek penilaian berdasarkan periode Asesmen
$selected_periode = isset($_GET['asesmen_periode']) ? (int)$_GET['asesmen_periode'] : null;
$asesi_query = $conn->query("
    SELECT a.id AS asesi_id, a.asesmen_kode, u.username, u.institusi, a.asesmen_periode, a.form_status 
    FROM asesi a 
    JOIN users u ON a.user_id = u.id 
    " . ($selected_periode ? "WHERE a.asesmen_periode = $selected_periode" : "") . " 
    ORDER BY a.created_at DESC
");

// Ambil daftar Asesi untuk form tambah Asesi
$manajemen_ti_query = $conn->query("SELECT id, username, institusi FROM users WHERE role = 'Asesi' ORDER BY username ASC");

// Tambah Asesi
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_asesi'])) {
    $user_id = (int)$_POST['user_id'];
    $asesmen_periode = (int)$_POST['asesmen_periode'];
    $asesmen_kode = strtoupper(uniqid("ASESMEN-"));

    if (empty($user_id) || empty($asesmen_periode)) {
        $error = "Akun Asesi dan Periode Asesmen harus dipilih.";
    } else {
        $query = "INSERT INTO asesi (user_id, asesmen_periode, asesmen_kode) VALUES ($user_id, $asesmen_periode, '$asesmen_kode')";
        if ($conn->query($query)) {
            $success = "Asesi berhasil ditambahkan dengan kode Asesmen: $asesmen_kode.";
        } else {
            $error = "Terjadi kesalahan saat menambahkan asesi: " . $conn->error;
        }
    }
}

// Hapus Asesi
if (isset($_GET['delete_asesi_id'])) {
    $delete_asesi_id = (int)$_GET['delete_asesi_id'];
    $query = "DELETE FROM asesi WHERE id = $delete_asesi_id";
    if ($conn->query($query)) {
        $success = "Asesi berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan saat menghapus asesi: " . $conn->error;
    }
}

// Kirim ke Asesi
if (isset($_GET['send_to_asesi_id'])) {
    $send_to_asesi_id = (int)$_GET['send_to_asesi_id'];

    $query = "
        UPDATE asesi 
        SET form_status = 1
        WHERE id = $send_to_asesi_id
    ";

    if ($conn->query($query)) {
        $success = "Formulir berhasil dikirim ke asesi.";
        // Debugging perubahan
        $updated_status_query = $conn->query("SELECT form_status FROM asesi WHERE id = $send_to_asesi_id");
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

<!-- Tabel Asesi -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Username</th>
            <th>Institusi</th>
            <th>Periode Asesmen</th>
            <th>Kode Asesmen</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($asesi_query && $asesi_query->num_rows > 0): ?>
            <?php while ($row = $asesi_query->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['username']); ?></td>
                    <td><?php echo htmlspecialchars($row['institusi']); ?></td>
                    <td><?php echo htmlspecialchars($row['asesmen_periode']); ?></td>
                    <td><?php echo htmlspecialchars($row['asesmen_kode']); ?></td>
                    <td>
                        <?php 
                        $status_label = mapFormStatusToLabel($row['form_status'], 'Asesor');
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
                            <a href="verify_assessment.php?asesi_id=<?php echo $row['asesi_id']; ?>" class="btn btn-sm btn-primary">Verifikasi</a>
                        <?php else: ?>
                            <a href="?send_to_asesi_id=<?php echo $row['asesi_id']; ?>" class="btn btn-sm btn-primary">Kirim</a>
                        <?php endif; ?>
                        <a href="?delete_asesi_id=<?php echo $row['asesi_id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Yakin ingin menghapus Asesi ini?')">Hapus</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="6" class="text-center">Tidak ada Asesi untuk periode ini.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<!-- Form Tambah Asesi -->
<h4 class="mt-4">Tambah Asesi</h4>
<form method="POST" action="">
    <div class="row">
        <div class="col-md-6">
            <label for="user_id" class="form-label">Pilih Akun Asesi</label>
            <select name="user_id" id="user_id" class="form-select" required>
                <option value="" disabled selected>Pilih Akun</option>
                <?php while ($row = $manajemen_ti_query->fetch_assoc()): ?>
                    <option value="<?php echo $row['id']; ?>">
                        <?php echo htmlspecialchars($row['username'] . ' (' . $row['institusi'] . ')'); ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-6">
            <label for="asesmen_periode" class="form-label">Periode Asesmen</label>
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
    <button type="submit" name="add_asesi" class="btn btn-primary mt-3">Tambah Asesi</button>
</form>
