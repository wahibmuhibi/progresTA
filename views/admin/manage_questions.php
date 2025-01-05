<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

// Tambah Pertanyaan Baru
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_question'])) {
    $ITIL = $_POST['ITIL'];         // ITIL Service Lifecycle
    $iso_code = $_POST['iso_code']; // Annex ISO
    $cobit_code = $_POST['cobit_code']; // COBIT Domain
    $question = $_POST['question']; // Pertanyaan Audit

    // Validasi ITIL Service Lifecycle
    if (!in_array($ITIL, ['Service Strategy', 'Service Design', 'Service Transition', 'Service Operation', 'Continual Service Improvement'])) {
        $error = "ITIL Service Lifecycle tidak valid.";
    } else {
        $query = "INSERT INTO questions (ITIL, iso_code, cobit_code, question)
                  VALUES ('$ITIL', '$iso_code', '$cobit_code', '$question')";
        if ($conn->query($query)) {
            $success = "Pertanyaan berhasil ditambahkan.";
        } else {
            $error = "Terjadi kesalahan: " . $conn->error;
        }
    }
}

// Hapus Pertanyaan
if (isset($_GET['delete_id'])) {
    $id = $_GET['delete_id'];
    $query = "DELETE FROM questions WHERE id = '$id'";
    if ($conn->query($query)) {
        $success = "Pertanyaan berhasil dihapus.";
    } else {
        $error = "Terjadi kesalahan: " . $conn->error;
    }
}

// Ambil Daftar Pertanyaan
$query = "SELECT * FROM questions ORDER BY ITIL, iso_code, cobit_code";
$result = $conn->query($query);
?>

<h3 class="text-center">Manajemen Pertanyaan Audit</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<h4>Tambah Pertanyaan Baru</h4>
<form method="POST" action="">
    <div class="row mb-3">
        <div class="col-md-4">
            <label for="ITIL" class="form-label">ITIL Service Lifecycle</label>
            <select name="ITIL" id="ITIL" class="form-select" required>
                <option value="" disabled selected>Pilih ITIL Service Lifecycle</option>
                <option value="Service Strategy">Service Strategy</option>
                <option value="Service Design">Service Design</option>
                <option value="Service Transition">Service Transition</option>
                <option value="Service Operation">Service Operation</option>
                <option value="Continual Service Improvement">Continual Service Improvement</option>
            </select>
        </div>
        <div class="col-md-4">
            <label for="iso_code" class="form-label">Annex ISO</label>
            <input type="text" name="iso_code" id="iso_code" class="form-control" placeholder="Contoh: 1.1.1" required>
        </div>
        <div class="col-md-4">
            <label for="cobit_code" class="form-label">COBIT Domain</label>
            <input type="text" name="cobit_code" id="cobit_code" class="form-control" placeholder="Contoh: DSS 2" required>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-12">
            <label for="question" class="form-label">Pertanyaan Audit</label>
            <textarea name="question" id="question" class="form-control" placeholder="Masukkan pertanyaan audit" rows="3" required></textarea>
        </div>
    </div>
    <button type="submit" name="add_question" class="btn btn-primary">Tambah Pertanyaan</button>
</form>

<h4 class="mt-5">Daftar Pertanyaan</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>ITIL Service Lifecycle</th>
            <th>Annex ISO</th>
            <th>COBIT Domain</th>
            <th>Pertanyaan Audit</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['ITIL']); ?></td>
                <td><?php echo htmlspecialchars($row['iso_code']); ?></td>
                <td><?php echo htmlspecialchars($row['cobit_code']); ?></td>
                <td><?php echo htmlspecialchars($row['question']); ?></td>
                <td>
                    <a href="?delete_id=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm">Hapus</a>
                </td>
            </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="5" class="text-center">Belum ada pertanyaan.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<?php include '../../includes/footer.php'; ?>

// Done