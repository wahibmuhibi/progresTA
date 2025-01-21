<?php
session_start();
include '../includes/auth.php';
include '../includes/db.php';
include '../includes/header.php';

// Ambil informasi pengguna dari session dan database
$user_id = $_SESSION['user_id'];

// Query untuk mengambil data pengguna
$query = "SELECT username, role, created_at, institusi FROM users WHERE id = ?";
$stmt = $conn->prepare($query);

if ($stmt === false) {
    echo "<div class='alert alert-danger'>Gagal mempersiapkan query: " . htmlspecialchars($conn->error) . "</div>";
    include '../includes/footer.php';
    exit;
}

$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result && $result->num_rows > 0) {
    $user = $result->fetch_assoc();
} else {
    echo "<div class='alert alert-danger'>Gagal memuat informasi profil.</div>";
    include '../includes/footer.php';
    exit;
}
?>

<h3 class="text-center">Profil Pengguna</h3>

<div class="card mt-4">
    <div class="card-header bg-primary text-white">
        Informasi Profil
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <tr>
                <th>Username</th>
                <td><?php echo htmlspecialchars($user['username']); ?></td>
            </tr>
            <tr>
                <th>Role</th>
                <td><?php echo htmlspecialchars($user['role']); ?></td>
            </tr>
            <tr>
                <th>Perusahaan/Instansi</th>
                <td><?php echo htmlspecialchars($user['institusi']); ?></td>
            </tr>
            <tr>
                <th>Bergabung Sejak</th>
                <td><?php echo date("d M Y, H:i", strtotime($user['created_at'])); ?></td>
            </tr>
        </table>
    </div>
</div>

<div class="text-center mt-4">
    <a href="edit_profile.php" class="btn btn-warning"><i class="bi bi-pencil-square"></i> Edit Profil</a>
    <a href="change_password.php" class="btn btn-danger"><i class="bi bi-key"></i> Ubah Password</a>
</div>

<?php include '../includes/footer.php'; ?>
