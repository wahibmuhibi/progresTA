<?php
session_start();
include '../../includes/auth.php';
check_roles(['Manajemen TI']);
include '../../includes/db.php';
include '../../includes/header.php';

// Fungsi Mapping Status
function mapFormStatusToLabel($status, $role)
{
    $status_map = [
        'Manajemen TI' => [
            0 => 'Belum Diterima',
            1 => 'Diterima',
            3 => 'Terkirim'
        ],
        'Tim Penilai' => [
            0 => 'Belum Dikirim',
            1 => 'Dikirim',
            3 => 'Self-Assessment Diterima'
        ]
    ];
    return isset($status_map[$role][$status]) ? $status_map[$role][$status] : 'Tidak Diketahui';
}

// Inisialisasi variabel
$kode_audit = isset($_GET['kode_audit']) ? $conn->real_escape_string($_GET['kode_audit']) : null;

// Ambil data ITIL Service Lifecycle
$lifecycle_query = $conn->query("
    SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(kode_mapping, '_', 2), '_', -1) AS itil_service_lifecycle 
    FROM eksternal_audit_question
    WHERE kode_mapping IS NOT NULL
    ORDER BY itil_service_lifecycle ASC
");
$lifecycle_stages = [];
if ($lifecycle_query && $lifecycle_query->num_rows > 0) {
    while ($row = $lifecycle_query->fetch_assoc()) {
        $lifecycle_stages[] = $row['itil_service_lifecycle'];
    }
}

// Ambil pertanyaan berdasarkan ITIL Service Lifecycle
$questions_by_lifecycle = [];
if ($kode_audit) {
    foreach ($lifecycle_stages as $stage) {
        $questions_query = $conn->query("
            SELECT DISTINCT q.id, q.kode_mapping, q.pertanyaan 
            FROM eksternal_audit_question q
            JOIN auditee a ON a.periode_audit = q.periode_audit
            WHERE SUBSTRING_INDEX(SUBSTRING_INDEX(q.kode_mapping, '_', 2), '_', -1) = '$stage'
            AND a.kode_audit = '$kode_audit'
        ");
        $questions_by_lifecycle[$stage] = $questions_query ? $questions_query->fetch_all(MYSQLI_ASSOC) : [];
    }
}

// Ambil data kriteria dari tabel Manajemen Kriteria
$criteria_query = $conn->query("SELECT kondisi, skor FROM criteria ORDER BY skor ASC");
$criteria = [];
if ($criteria_query && $criteria_query->num_rows > 0) {
    while ($row = $criteria_query->fetch_assoc()) {
        $criteria[$row['kondisi']] = $row['skor'];
    }
}

// Logika untuk mengambil jawaban yang sudah tersimpan
$existing_answers_query = $conn->query("
    SELECT question_id, jawaban, skor 
    FROM assessment_answers 
    WHERE kode_audit = '$kode_audit' AND user_id = {$_SESSION['user_id']}
");
$existing_answers = [];
if ($existing_answers_query && $existing_answers_query->num_rows > 0) {
    while ($row = $existing_answers_query->fetch_assoc()) {
        $existing_answers[$row['question_id']] = $row;
    }
}

// Proses penyimpanan jawaban
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!$kode_audit) {
        $error = "Kode audit tidak ditemukan.";
    } else {
        // Ambil periode audit berdasarkan kode audit
        $periode_query = $conn->query("SELECT periode_audit FROM auditee WHERE kode_audit = '$kode_audit'");
        $periode_audit = $periode_query && $periode_query->num_rows > 0 ? $periode_query->fetch_assoc()['periode_audit'] : null;

        if (!$periode_audit) {
            $error = "Periode audit tidak ditemukan untuk kode audit: $kode_audit.";
        } else {
            // Generate score_session_id baru
            $score_session_id = time(); // Gunakan timestamp sebagai ID sesi unik

            foreach ($_POST['answers'] as $question_id => $data) {
                $question_id = (int)$question_id;
                $jawaban = isset($data['jawaban']) ? $conn->real_escape_string($data['jawaban']) : '';
                $skor = isset($criteria[$jawaban]) ? $criteria[$jawaban] : 0;

                // Simpan atau perbarui data ke database
                $query = "
                    INSERT INTO assessment_answers (user_id, question_id, kode_audit, jawaban, skor, periode_audit, score_session_id) 
                    VALUES ({$_SESSION['user_id']}, $question_id, '$kode_audit', '$jawaban', $skor, '$periode_audit', $score_session_id)
                    ON DUPLICATE KEY UPDATE jawaban = '$jawaban', skor = $skor, score_session_id = $score_session_id
                ";
                if (!$conn->query($query)) {
                    $error = "Query gagal untuk pertanyaan ID: $question_id. Kesalahan: " . $conn->error;
                }
            }

            // Redirect ke halaman skor
            header("Location: score_view.php?kode_audit=$kode_audit&score_session_id=$score_session_id");
            exit;
        }
    }
}

// Ambil daftar formulir masuk
$incoming_forms_query = $conn->query("
    SELECT a.kode_audit, a.periode_audit, a.form_status, COALESCE(q.source, 'Tim Penilai') AS source, COUNT(q.id) AS total_questions
    FROM auditee a
    JOIN eksternal_audit_question q ON a.periode_audit = q.periode_audit
    WHERE a.user_id = {$_SESSION['user_id']}
    GROUP BY a.kode_audit, a.periode_audit, q.source
    ORDER BY a.periode_audit DESC
");
?>

<!-- Tampilkan Notifikasi -->
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif; ?>

<!-- Form dan Tabel -->
<h3 class="text-center">Formulir Self-Assessment</h3>

<!-- Tabel Formulir Masuk -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Periode Audit</th>
            <th>Sumber</th>
            <th>Kode Audit</th>
            <th>Jumlah Pertanyaan</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($incoming_forms_query && $incoming_forms_query->num_rows > 0): ?>
            <?php while ($row = $incoming_forms_query->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['periode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['source']); ?></td>
                    <td><?php echo htmlspecialchars($row['kode_audit']); ?></td>
                    <td><?php echo htmlspecialchars($row['total_questions']); ?></td>
                    <td>
                        <?php
                        $status_label = mapFormStatusToLabel((int)$row['form_status'], 'Manajemen TI');
                        $badge_class = $row['form_status'] == 3 ? 'success' : ($row['form_status'] == 2 ? 'warning' : ($row['form_status'] == 1 ? 'primary' : 'secondary'));
                        ?>
                        <span class="badge bg-<?php echo $badge_class; ?>">
                            <?php echo htmlspecialchars($status_label); ?>
                        </span>
                    </td>
                    <td>
                        <?php if ((int)$row['form_status'] === 3): ?>
                            <a href="score_view.php?kode_audit=<?php echo urlencode($row['kode_audit']); ?>" class="btn btn-sm btn-success">Lihat Skor</a>
                        <?php else: ?>
                            <a href="assessment_form.php?kode_audit=<?php echo urlencode($row['kode_audit']); ?>" class="btn btn-sm btn-primary">
                                <?php echo (int)$row['form_status'] === 2 ? 'Lanjutkan' : 'Mulai Mengisi'; ?>
                            </a>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="6" class="text-center">Tidak ada formulir masuk atau riwayat pengisian.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<!-- Form Self-Assessment -->
<form method="POST" action="assessment_form.php?kode_audit=<?php echo htmlspecialchars($kode_audit); ?>">
    <?php foreach ($lifecycle_stages as $stage): ?>
        <h4><?php echo htmlspecialchars($stage); ?></h4>
        <table class="table">
            <thead>
                <tr>
                    <th>Nomor Audit</th>
                    <th>Pertanyaan</th>
                    <th>Jawaban</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($questions_by_lifecycle[$stage])): ?>
                    <?php foreach ($questions_by_lifecycle[$stage] as $question): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($question['kode_mapping']); ?></td>
                            <td><?php echo htmlspecialchars($question['pertanyaan']); ?></td>
                            <td>
                                <select name="answers[<?php echo $question['id']; ?>][jawaban]" class="form-select" required>
                                    <option value="">Pilih Jawaban</option>
                                    <?php foreach ($criteria as $kondisi => $skor): ?>
                                        <option value="<?php echo htmlspecialchars($kondisi); ?>"
                                            <?php echo isset($existing_answers[$question['id']]['jawaban']) && $existing_answers[$question['id']]['jawaban'] === $kondisi ? 'selected' : ''; ?>>
                                            <?php echo htmlspecialchars($kondisi); ?> (Skor: <?php echo $skor; ?>)
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="3">Tidak ada pertanyaan.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    <?php endforeach; ?>
    <button type="submit" name="submit_assessment" class="btn btn-primary">Lihat Skor</button>
</form>

<?php include '../../includes/footer.php'; ?>
