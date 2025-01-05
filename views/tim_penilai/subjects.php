<?php
session_start();
include '../../includes/auth.php'; // Pastikan hanya pengguna yang memiliki sesi valid yang dapat mengakses
include '../../includes/db.php';
include '../../includes/header.php';

// Periksa role pengguna
if ($_SESSION['role'] !== 'Tim Penilai') {
    die('Unauthorized Access');
}

// Ambil daftar subjek penilaian (Manajemen TI)
$query = "SELECT * FROM users WHERE role = 'Manajemen TI'";
$result = $conn->query($query);
?>

<h3 class="text-center">Subjek Penilaian</h3>
<?php if ($result->num_rows > 0): ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Username</th>
                <th>Company</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['username']); ?></td>
                    <td><?php echo htmlspecialchars($row['company']); ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
<?php else: ?>
    <div class="alert alert-warning text-center">
        Tidak ada subjek penilaian yang ditemukan.
    </div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
