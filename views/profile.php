<?php
session_start();
include '../includes/auth.php';
include '../includes/db.php';
include '../includes/header.php';

// Ambil informasi pengguna dari session dan database
$user_id = $_SESSION['user_id'];

$query = "SELECT username, role, created_at, company FROM users WHERE id = $user_id";
$result = $conn->query($query);

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
        <table class="table">
            <tr>
                <th>Username</th>
                <td><?php echo htmlspecialchars($user['username']); ?></td>
            </tr>
            <tr>
                <th>Role</th>
                <td><?php echo htmlspecialchars($user['role']); ?></td>
            </tr>
            <tr>
                <th>Company</th>
                <td><?php echo htmlspecialchars($user['company']); ?></td>
            </tr>
            <tr>
                <th>Bergabung Sejak</th>
                <td><?php echo htmlspecialchars($user['created_at']); ?></td>
            </tr>
        </table>
    </div>
</div>

<div class="text-center mt-4">
    <a href="edit_profile.php" class="btn btn-warning">Edit Profil</a>
    <a href="change_password.php" class="btn btn-danger">Ubah Password</a>
</div>

<?php include '../includes/footer.php'; ?>
