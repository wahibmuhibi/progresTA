<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';
check_roles(['Manajemen TI']); // Hanya Manajemen TI yang diizinkan

// Ambil pertanyaan berdasarkan ITIL Service Lifecycle
$lifecycle_stages = [
    'Service Strategy',
    'Service Design',
    'Service Transition',
    'Service Operation',
    'Continual Service Improvement'
];

$questions = [];
foreach ($lifecycle_stages as $stage) {
    $questions[$stage] = $conn->query("SELECT * FROM assessment_questions WHERE kode_mapping LIKE '%$stage%'");
}

// Simpan jawaban
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    foreach ($_POST['answers'] as $question_id => $jawaban) {
        $question_id = (int)$question_id;
        $jawaban = $conn->real_escape_string($jawaban);

        $query = "INSERT INTO assessment_answers (user_id, question_id, jawaban) 
                  VALUES ({$_SESSION['user_id']}, $question_id, '$jawaban')
                  ON DUPLICATE KEY UPDATE jawaban = '$jawaban'";

        $conn->query($query);
    }
    $success = "Self-assessment berhasil disimpan.";
}
?>

<h3 class="text-center">Self-Assessment</h3>

<?php if (isset($success)): ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
<?php endif; ?>

<!-- Navigasi Tahapan -->
<ul class="nav nav-tabs" id="selfAssessmentTabs" role="tablist">
    <?php foreach ($lifecycle_stages as $index => $stage): ?>
        <li class="nav-item" role="presentation">
            <button class="nav-link <?php echo $index === 0 ? 'active' : ''; ?>" id="<?php echo strtolower(str_replace(' ', '-', $stage)); ?>-tab" data-bs-toggle="tab" data-bs-target="#<?php echo strtolower(str_replace(' ', '-', $stage)); ?>" type="button" role="tab" aria-controls="<?php echo strtolower(str_replace(' ', '-', $stage)); ?>" aria-selected="<?php echo $index === 0 ? 'true' : 'false'; ?>">
                <?php echo $stage; ?>
            </button>
        </li>
    <?php endforeach; ?>
</ul>

<!-- Form Self-Assessment -->
<form method="POST" action="">
    <div class="tab-content" id="selfAssessmentTabsContent">
        <?php foreach ($lifecycle_stages as $index => $stage): ?>
            <div class="tab-pane fade <?php echo $index === 0 ? 'show active' : ''; ?>" id="<?php echo strtolower(str_replace(' ', '-', $stage)); ?>" role="tabpanel" aria-labelledby="<?php echo strtolower(str_replace(' ', '-', $stage)); ?>-tab">
                <h4 class="mt-3"><?php echo $stage; ?></h4>
                <?php if ($questions[$stage] && $questions[$stage]->num_rows > 0): ?>
                    <?php while ($row = $questions[$stage]->fetch_assoc()): ?>
                        <div class="mb-3">
                            <label for="question_<?php echo $row['id']; ?>" class="form-label"><?php echo htmlspecialchars($row['pertanyaan']); ?></label>
                            <textarea name="answers[<?php echo $row['id']; ?>]" id="question_<?php echo $row['id']; ?>" class="form-control" rows="3" required></textarea>
                        </div>
                    <?php endwhile; ?>
                <?php else: ?>
                    <p class="text-muted">Tidak ada pertanyaan untuk tahap ini.</p>
                <?php endif; ?>
            </div>
        <?php endforeach; ?>
    </div>
    <button type="submit" class="btn btn-primary mt-3">Simpan Self-Assessment</button>
</form>
