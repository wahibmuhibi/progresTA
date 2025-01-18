<?php
session_start();
include '../../includes/auth.php';
check_roles(['Tim Penilai']);
include '../../includes/db.php';
include '../../includes/header.php';

// Proses pembatalan verifikasi
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['cancel_verification'])) {
    $asesmen_kode = $conn->real_escape_string($_POST['asesmen_kode']);

    // Hapus kode verifikasi dan tanggal verifikasi
    $delete_query = "
        UPDATE assessment_results 
        SET verification_code = NULL, verified_at = NULL 
        WHERE asesmen_kode = '$asesmen_kode'
    ";

    if ($conn->query($delete_query)) {
        echo "<div class='alert alert-success'>Verifikasi untuk kode audit $asesmen_kode telah dibatalkan.</div>";
    } else {
        echo "<div class='alert alert-danger'>Gagal membatalkan verifikasi. Kesalahan: {$conn->error}</div>";
    }
}

// Ambil data ranking berdasarkan rata-rata skor yang telah diverifikasi
$rankings_query = $conn->query("
    SELECT r.asesmen_kode, r.verification_code, u.username AS asesi_name, AVG(r.average_score) AS overall_average, r.verified_at
    FROM assessment_results r
    JOIN asesi a ON r.asesmen_kode = a.asesmen_kode
    JOIN users u ON a.user_id = u.id
    WHERE r.verification_code IS NOT NULL
    GROUP BY r.asesmen_kode
    ORDER BY overall_average DESC
");

?>

<h3 class="text-center">Ranking Asesi</h3>

<?php if ($rankings_query && $rankings_query->num_rows > 0): ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Rank</th>
                <th>Nama Asesi</th>
                <th>Kode Audit</th>
                <th>Kode Verifikasi</th>
                <th>Rata-Rata Skor</th>
                <th>Tanggal Verifikasi</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $rank = 1;
            while ($row = $rankings_query->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $rank++; ?></td>
                    <td><?php echo htmlspecialchars($row['asesi_name']); ?></td>
                    <td><?php echo htmlspecialchars($row['asesmen_kode']); ?></td>
                    <td><?php echo htmlspecialchars($row['verification_code']); ?></td>
                    <td><?php echo htmlspecialchars(round($row['overall_average'], 2)); ?></td>
                    <td><?php echo htmlspecialchars($row['verified_at']); ?></td>
                    <td>
                        <form method="POST" action="" onsubmit="return confirm('Yakin ingin membatalkan verifikasi untuk kode audit ini?');">
                            <input type="hidden" name="asesmen_kode" value="<?php echo htmlspecialchars($row['asesmen_kode']); ?>">
                            <button type="submit" name="cancel_verification" class="btn btn-danger btn-sm">Batalkan</button>
                        </form>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
<?php else: ?>
    <div class="alert alert-warning">Belum ada data yang diverifikasi.</div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
