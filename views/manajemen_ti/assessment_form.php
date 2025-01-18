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
$asesmen_kode = isset($_GET['asesmen_kode']) ? $conn->real_escape_string($_GET['asesmen_kode']) : null;

// Ambil data ITIL Service Lifecycle
$lifecycle_query = $conn->query("
    SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(kode_mapping, '_', 2), '_', -1) AS itil_service_lifecycle 
    FROM asesmen_pertanyaan
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
if ($asesmen_kode) {
    foreach ($lifecycle_stages as $stage) {
        $questions_query = $conn->query("
            SELECT DISTINCT q.id, q.kode_mapping, q.pertanyaan 
            FROM asesmen_pertanyaan q
            JOIN asesi a ON a.asesmen_periode = q.asesmen_periode
            WHERE SUBSTRING_INDEX(SUBSTRING_INDEX(q.kode_mapping, '_', 2), '_', -1) = '$stage'
            AND a.asesmen_kode = '$asesmen_kode'
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
    WHERE asesmen_kode = '$asesmen_kode' AND user_id = {$_SESSION['user_id']}
");
$existing_answers = [];
if ($existing_answers_query && $existing_answers_query->num_rows > 0) {
    while ($row = $existing_answers_query->fetch_assoc()) {
        $existing_answers[$row['question_id']] = $row;
    }
}

// Proses penyimpanan jawaban
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!$asesmen_kode) {
        $error = "Kode Asesmen tidak ditemukan.";
    } else {
        // Ambil periode asesmen berdasarkan kode asesmen
        $periode_query = $conn->query("SELECT asesmen_periode FROM asesi WHERE asesmen_kode = '$asesmen_kode'");
        $asesmen_periode = $periode_query && $periode_query->num_rows > 0 ? $periode_query->fetch_assoc()['asesmen_periode'] : null;

        if (!$asesmen_periode) {
            $error = "Periode Asesmen tidak ditemukan untuk kode asesmen: $asesmen_kode.";
        } else {
            // Generate score_session_id baru
            $score_session_id = time(); // Gunakan timestamp sebagai ID sesi unik

            foreach ($_POST['answers'] as $question_id => $data) {
                $question_id = (int)$question_id;
                $jawaban = isset($data['jawaban']) ? $conn->real_escape_string($data['jawaban']) : '';
                $skor = isset($criteria[$jawaban]) ? $criteria[$jawaban] : 0;

                // Simpan atau perbarui data ke database
                $query = "
                    INSERT INTO assessment_answers (user_id, question_id, asesmen_kode, jawaban, skor, asesmen_periode, score_session_id) 
                    VALUES ({$_SESSION['user_id']}, $question_id, '$asesmen_kode', '$jawaban', $skor, '$asesmen_periode', $score_session_id)
                    ON DUPLICATE KEY UPDATE jawaban = '$jawaban', skor = $skor, score_session_id = $score_session_id
                ";
                if (!$conn->query($query)) {
                    $error = "Query gagal untuk pertanyaan ID: $question_id. Kesalahan: " . $conn->error;
                }
            }

            // Redirect ke halaman skor
            header("Location: score_view.php?asesmen_kode=$asesmen_kode&score_session_id=$score_session_id");
            exit;
        }
    }
}

// Ambil daftar formulir masuk
$incoming_forms_query = $conn->query("
    SELECT a.asesmen_kode, a.asesmen_periode, a.form_status, COALESCE(q.source, 'Tim Penilai') AS source, COUNT(q.id) AS total_questions
    FROM asesi a
    JOIN asesmen_pertanyaan q ON a.asesmen_periode = q.asesmen_periode
    WHERE a.user_id = {$_SESSION['user_id']}
    GROUP BY a.asesmen_kode, a.asesmen_periode, q.source
    ORDER BY a.asesmen_periode DESC
");
?>

<!-- Tampilkan Notifikasi -->
<?php if (isset($error)): ?>
    <div class="alert alert-danger"><?php echo $error; ?></div>
<?php endif;

?>

<!-- Tabel Formulir Masuk -->
<div class="container my-5">
    <h3 class="text-center mb-4"><i class="bi bi-file-earmark-text"></i> Formulir Self-Assessment</h3>
    <p class="text-center text-muted">Di bawah ini adalah daftar formulir self-assessment yang perlu diisi atau telah dikirimkan.</p>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Periode Asesmen</th>
                <th>Sumber</th>
                <th>Kode Asesmen</th>
                <th>Jumlah Pertanyaan</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($incoming_forms_query && $incoming_forms_query->num_rows > 0): ?>
                <?php while ($row = $incoming_forms_query->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['asesmen_periode']); ?></td>
                        <td><?php echo htmlspecialchars($row['source']); ?></td>
                        <td><?php echo htmlspecialchars($row['asesmen_kode']); ?></td>
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
                                <a href="score_view.php?asesmen_kode=<?php echo urlencode($row['asesmen_kode']); ?>" class="btn btn-sm btn-success">Lihat Skor</a>
                            <?php else: ?>
                                <a href="assessment_form.php?asesmen_kode=<?php echo urlencode($row['asesmen_kode']); ?>" class="btn btn-sm btn-primary">
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
</div>

<!-- Form Self-Assessment -->
<?php if ($asesmen_kode): ?>
    <div class="container mt-5">
        <form method="POST" action="assessment_form.php?asesmen_kode=<?php echo htmlspecialchars($asesmen_kode); ?>">
            <?php foreach ($lifecycle_stages as $stage): ?>
                <h4 class="mt-4"><?php echo htmlspecialchars($stage); ?></h4>
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>Nomor Asesmen</th>
                            <th>Pertanyaan</th>
                            <th>Jawaban</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $questions_query = $conn->query("
                            SELECT DISTINCT q.id, q.kode_mapping, q.pertanyaan 
                            FROM asesmen_pertanyaan q
                            JOIN asesi a ON a.asesmen_periode = q.asesmen_periode
                            WHERE SUBSTRING_INDEX(SUBSTRING_INDEX(q.kode_mapping, '_', 2), '_', -1) = '$stage'
                            AND a.asesmen_kode = '$asesmen_kode'
                        ");
                        $questions = $questions_query ? $questions_query->fetch_all(MYSQLI_ASSOC) : [];

                        if (!empty($questions)): ?>
                            <?php foreach ($questions as $question): ?>
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
                                <td colspan="3" class="text-center">Tidak ada pertanyaan untuk tahap ini.</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            <?php endforeach; ?>
            <div class="text-end">
                <button type="submit" name="submit_assessment" class="btn btn-primary">Lihat Skor</button>
            </div>
        </form>
    </div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>
