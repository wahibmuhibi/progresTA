<?php
session_start();
include '../../includes/auth.php';
check_role('Admin');
include '../../includes/db.php';
include '../../includes/header.php';

// Inisialisasi variabel filter
$start_date = isset($_GET['start_date']) ? $_GET['start_date'] : '';
$end_date = isset($_GET['end_date']) ? $_GET['end_date'] : '';

// Query dasar
$query = "SELECT a.id, u.username, a.aktivitas, a.timestamp 
          FROM log_aktivitas a 
          JOIN users u ON a.user_id = u.id";

// Tambahkan filter berdasarkan waktu
if (!empty($start_date) && !empty($end_date)) {
    $query .= " WHERE a.timestamp BETWEEN '$start_date 00:00:00' AND '$end_date 23:59:59'";
}

$query .= " ORDER BY a.timestamp DESC";
$result = $conn->query($query);
?>

<h3 class="text-center">Log Aktivitas Pengguna</h3>

<!-- Form Filter Waktu -->
<form method="GET" action="" class="mb-4">
    <div class="row">
        <div class="col-md-5">
            <label for="start_date" class="form-label">Tanggal Mulai</label>
            <input type="date" id="start_date" name="start_date" class="form-control" value="<?php echo htmlspecialchars($start_date); ?>">
        </div>
        <div class="col-md-5">
            <label for="end_date" class="form-label">Tanggal Selesai</label>
            <input type="date" id="end_date" name="end_date" class="form-control" value="<?php echo htmlspecialchars($end_date); ?>">
        </div>
        <div class="col-md-2 d-flex align-items-end">
            <button type="submit" class="btn btn-primary w-100">Filter</button>
        </div>
    </div>
</form>

<!-- Tabel Log Aktivitas -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Username</th>
            <th>Aktivitas</th>
            <th>Waktu</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($result && $result->num_rows > 0): 
            $no = 1;
            while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo htmlspecialchars($row['username']); ?></td>
                <td><?php echo htmlspecialchars($row['aktivitas']); ?></td>
                <td><?php echo htmlspecialchars($row['timestamp']); ?></td>
            </tr>
        <?php endwhile; else: ?>
            <tr>
                <td colspan="4" class="text-center">Belum ada log aktivitas.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>
