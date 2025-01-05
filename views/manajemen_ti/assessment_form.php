<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil framework dari pengguna atau tetap default
$framework = isset($_GET['framework']) ? $_GET['framework'] : 'ISO 27002';

// Ambil daftar pertanyaan berdasarkan framework
$query = "SELECT * FROM questions WHERE framework = '$framework' ORDER BY question_number";
$result = $conn->query($query);

// Simpan jawaban self-assessment
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_SESSION['user_id'];

    foreach ($_POST['answers'] as $question_id => $answer) {
        $query = "INSERT INTO self_assessments (user_id, question_id, assessment, status) 
                  VALUES ('$user_id', '$question_id', '$answer', 'Pending')";
        if (!$conn->query($query)) {
            $error = "Terjadi kesalahan: " . $conn->error;
        }
    }

    if (!isset($error)) {
        $success = "Jawaban berhasil disimpan. Menunggu verifikasi.";
    }
}
?>

<h3 class="text-center">Self-Assessment Maturity - <?php echo $framework; ?></h3>
<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<form method="POST" action="">
    <div class="mb-3">
        <label for="framework" class="form-label">Pilih Framework</label>
        <select id="framework" name="framework" class="form-select" onchange="location = '?framework=' + this.value;">
            <option value="ISO 27002" <?php echo $framework === 'ISO 27002' ? 'selected' : ''; ?>>ISO 27002</option>
            <option value="ITIL" <?php echo $framework === 'ITIL' ? 'selected' : ''; ?>>ITIL</option>
            <option value="COBIT" <?php echo $framework === 'COBIT' ? 'selected' : ''; ?>>COBIT</option>
        </select>
    </div>

    <div class="mb-3">
        <h4>Pertanyaan</h4>
        <?php if ($result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                <div class="mb-4">
                    <label class="form-label">
                        <?php echo $row['question_number'] . '. ' . $row['question']; ?>
                    </label>
                    <textarea name="answers[<?php echo $row['id']; ?>]" class="form-control" rows="2" required></textarea>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <div class="alert alert-warning">Tidak ada pertanyaan untuk framework ini.</div>
        <?php endif; ?>
    </div>

    <button type="submit" class="btn btn-primary">Simpan Jawaban</button>
</form>

<?php include '../../includes/footer.php'; ?>
