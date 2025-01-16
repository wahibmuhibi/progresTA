<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil daftar kode audit dan score session ID berdasarkan user ID
$user_id = $_SESSION['user_id'];

$audit_query = $conn->query("
    SELECT DISTINCT kode_audit, score_session_id, created_at 
    FROM assessment_answers 
    WHERE user_id = $user_id 
    ORDER BY created_at DESC
");

$audit_data = [];
if ($audit_query && $audit_query->num_rows > 0) {
    while ($row = $audit_query->fetch_assoc()) {
        $audit_data[$row['kode_audit']][] = [
            'score_session_id' => $row['score_session_id'],
            'created_at' => $row['created_at']
        ];
    }
}

// Tangkap kode audit dan score session ID dari form
$kode_audit = isset($_GET['kode_audit']) ? $conn->real_escape_string($_GET['kode_audit']) : null;
$score_session_id = isset($_GET['score_session_id']) ? (int)$_GET['score_session_id'] : null;

$result = null;
if ($kode_audit && $score_session_id) {
    // Ambil data skor berdasarkan kode audit dan score session ID
    $query = "
        SELECT q.kode_mapping, q.pertanyaan, a.jawaban, a.skor 
        FROM assessment_answers a
        JOIN eksternal_audit_question q ON a.question_id = q.id
        WHERE a.kode_audit = '$kode_audit' AND a.score_session_id = $score_session_id AND a.user_id = $user_id
    ";
    $result = $conn->query($query);
}
?>

<h3 class="text-center">Hasil Skor Self-Assessment</h3>

<!-- Form Dropdown -->
<form method="GET" action="score_view.php" class="mb-4">
    <div class="row">
        <div class="col-md-6">
            <label for="kode_audit" class="form-label">Pilih Kode Audit</label>
            <select name="kode_audit" id="kode_audit" class="form-select" required onchange="this.form.submit()">
                <option value="" disabled selected>Pilih Kode Audit</option>
                <?php foreach ($audit_data as $audit_code => $sessions): ?>
                    <option value="<?php echo htmlspecialchars($audit_code); ?>" <?php echo ($kode_audit === $audit_code) ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($audit_code); ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
        <?php if ($kode_audit && isset($audit_data[$kode_audit])): ?>
            <div class="col-md-6">
                <label for="score_session_id" class="form-label">Pilih ID Sesi Skor</label>
                <select name="score_session_id" id="score_session_id" class="form-select" required onchange="this.form.submit()">
                    <option value="" disabled selected>Pilih ID Sesi Skor</option>
                    <?php foreach ($audit_data[$kode_audit] as $session): ?>
                        <option value="<?php echo htmlspecialchars($session['score_session_id']); ?>" <?php echo ($score_session_id == $session['score_session_id']) ? 'selected' : ''; ?>>
                            <?php echo 'ID: ' . htmlspecialchars($session['score_session_id']) . ' | ' . htmlspecialchars($session['created_at']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
        <?php endif; ?>
    </div>
</form>

<!-- Tabel Hasil Skor -->
<?php if ($result && $result->num_rows > 0): ?>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Kode Mapping</th>
                <th>Pertanyaan</th>
                <th>Jawaban</th>
                <th>Skor</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['kode_mapping']); ?></td>
                    <td><?php echo htmlspecialchars($row['pertanyaan']); ?></td>
                    <td><?php echo htmlspecialchars($row['jawaban']); ?></td>
                    <td><?php echo htmlspecialchars($row['skor']); ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
<?php elseif ($kode_audit && $score_session_id): ?>
    <div class="alert alert-warning">Data tidak ditemukan untuk kombinasi kode audit dan ID sesi skor yang dipilih.</div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
