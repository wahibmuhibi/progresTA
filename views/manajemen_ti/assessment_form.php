<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';
check_roles(['Manajemen TI']); // Hanya Manajemen TI yang diizinkan

// Ambil ITIL Service Lifecycle secara dinamis
$lifecycle_query = $conn->query("
    SELECT DISTINCT 
        SUBSTRING_INDEX(SUBSTRING_INDEX(kode_mapping, '_', 2), '_', -1) AS itil_service_lifecycle 
    FROM assessment_questions
    WHERE kode_mapping IS NOT NULL
    ORDER BY itil_service_lifecycle ASC
");
$lifecycle_stages = [];
if ($lifecycle_query && $lifecycle_query->num_rows > 0) {
    while ($row = $lifecycle_query->fetch_assoc()) {
        $lifecycle_stages[] = $row['itil_service_lifecycle'];
    }
}

// Ambil kondisi dari jenis kriteria
$criteria_query = $conn->query("SELECT kondisi, skor FROM criteria ORDER BY skor ASC");
$criteria = [];
if ($criteria_query && $criteria_query->num_rows > 0) {
    while ($row = $criteria_query->fetch_assoc()) {
        $criteria[$row['kondisi']] = $row['skor'];
    }
}

// Proses penyimpanan jawaban
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit_assessment'])) {
    foreach ($_POST['answers'] as $question_id => $kondisi) {
        $question_id = (int)$question_id;
        $jawaban = $conn->real_escape_string($kondisi);
        $skor = isset($criteria[$kondisi]) ? $criteria[$kondisi] : 0;

        $query = "INSERT INTO assessment_answers (user_id, question_id, jawaban, skor) 
                  VALUES ({$_SESSION['user_id']}, $question_id, '$jawaban', $skor)
                  ON DUPLICATE KEY UPDATE jawaban = '$jawaban', skor = $skor";

        $conn->query($query);
    }
    $success = "Self-assessment berhasil disimpan.";
}
?>

<h3 class="text-center">Self-Assessment</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>

<!-- Form Pilih Asal Assessment -->
<form method="GET" action="">
    <div class="mb-3">
        <label for="source" class="form-label">Pilih Asal Assessment</label>
        <select name="source" id="source" class="form-select" required>
            <option value="" disabled selected>Pilih Sumber Assessment</option>
            <option value="Tim Penilai" <?php echo (isset($_GET['source']) && $_GET['source'] === 'Tim Penilai') ? 'selected' : ''; ?>>Tim Penilai</option>
            <option value="Auditor Internal" <?php echo (isset($_GET['source']) && $_GET['source'] === 'Auditor Internal') ? 'selected' : ''; ?>>Auditor Internal</option>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Mulai</button>
</form>

<!-- Tahapan Assessment -->
<?php if (isset($_GET['source'])): ?>
    <h4 class="mt-4">Asal Assessment: <?php echo htmlspecialchars($_GET['source']); ?></h4>
    <ul class="nav nav-tabs" id="selfAssessmentTabs" role="tablist">
        <?php foreach ($lifecycle_stages as $index => $stage): ?>
            <li class="nav-item" role="presentation">
                <button class="nav-link <?php echo $index === 0 ? 'active' : ''; ?>" id="<?php echo strtolower(str_replace(' ', '-', $stage)); ?>-tab" data-bs-toggle="tab" data-bs-target="#<?php echo strtolower(str_replace(' ', '-', $stage)); ?>" type="button" role="tab" aria-controls="<?php echo strtolower(str_replace(' ', '-', $stage)); ?>" aria-selected="<?php echo $index === 0 ? 'true' : 'false'; ?>">
                    <?php echo htmlspecialchars($stage); ?>
                </button>
            </li>
        <?php endforeach; ?>
    </ul>

    <form method="POST" action="">
        <div class="tab-content" id="selfAssessmentTabsContent">
            <?php foreach ($lifecycle_stages as $index => $stage): ?>
                <div class="tab-pane fade <?php echo $index === 0 ? 'show active' : ''; ?>" id="<?php echo strtolower(str_replace(' ', '-', $stage)); ?>" role="tabpanel" aria-labelledby="<?php echo strtolower(str_replace(' ', '-', $stage)); ?>-tab">
                    <h4 class="mt-3"><?php echo htmlspecialchars($stage); ?></h4>
                    <?php
                    $questions_query = $conn->query("
                        SELECT id, pertanyaan 
                        FROM assessment_questions 
                        WHERE SUBSTRING_INDEX(SUBSTRING_INDEX(kode_mapping, '_', 2), '_', -1) = '$stage'
                    ");
                    ?>
                    <?php if ($questions_query && $questions_query->num_rows > 0): ?>
                        <?php while ($row = $questions_query->fetch_assoc()): ?>
                            <div class="mb-3">
                                <label for="question_<?php echo $row['id']; ?>" class="form-label"><?php echo htmlspecialchars($row['pertanyaan']); ?></label>
                                <select name="answers[<?php echo $row['id']; ?>]" id="question_<?php echo $row['id']; ?>" class="form-select" required>
                                    <option value="" disabled selected>Pilih Kondisi</option>
                                    <?php foreach ($criteria as $kondisi => $skor): ?>
                                        <option value="<?php echo htmlspecialchars($kondisi); ?>">
                                            <?php echo htmlspecialchars($kondisi); ?> (Skor: <?php echo $skor; ?>)
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <p class="text-muted">Tidak ada pertanyaan untuk tahap ini.</p>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        </div>
        <button type="submit" name="submit_assessment" class="btn btn-primary mt-3">Simpan Self-Assessment</button>
    </form>
<?php endif; ?>
