<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';
check_roles(['Tim Penilai']); // Hanya Tim Penilai yang diizinkan

// Ambil data self-assessment
$self_assessments = $conn->query("SELECT sa.*, u.username, u.company 
    FROM self_assessment sa 
    JOIN users u ON sa.user_id = u.id 
    ORDER BY sa.created_at DESC");
?>

<h3 class="text-center">Verifikasi Self-Assessment</h3>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Username</th>
            <th>Company</th>
            <th>Kode Mapping</th>
            <th>Jawaban</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($self_assessments && $self_assessments->num_rows > 0): ?>
            <?php while ($row = $self_assessments->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['username']); ?></td>
                    <td><?php echo htmlspecialchars($row['company']); ?></td>
                    <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                    <td><?php echo htmlspecialchars($row['jawaban']); ?></td>
                    <td>
                        <a href="/tugasakhir/views/tim_penilai/score_maturity.php?id=<?php echo $row['id']; ?>" class="btn btn-primary btn-sm">Beri Skor</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="5" class="text-center">Belum ada self-assessment yang masuk.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>
