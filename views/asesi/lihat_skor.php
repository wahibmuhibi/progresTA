<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';
include '../../includes/header.php';

// Ambil daftar kode asesmen dan score session ID berdasarkan user ID
$user_id = $_SESSION['user_id'];

// Ambil semua sesi skor untuk user
$audit_query = $conn->query("
    SELECT DISTINCT asesmen_kode, score_session_id, created_at 
    FROM asesmen_jawaban 
    WHERE user_id = $user_id 
    ORDER BY created_at DESC
");

$audit_data = [];
if ($audit_query && $audit_query->num_rows > 0) {
    while ($row = $audit_query->fetch_assoc()) {
        $audit_data[$row['asesmen_kode']][] = [
            'score_session_id' => $row['score_session_id'],
            'created_at' => $row['created_at']
        ];
    }
}

// Tangkap kode asesmen dan score session ID dari form
$asesmen_kode = isset($_GET['asesmen_kode']) ? $conn->real_escape_string($_GET['asesmen_kode']) : null;
$score_session_id = isset($_GET['score_session_id']) ? (int)$_GET['score_session_id'] : null;

$result = null;
$categories = [
    'Service Strategy' => 0,
    'Service Design' => 0,
    'Service Transition' => 0,
    'Service Operation' => 0,
    'Continual Service Improvement' => 0,
];
$counts = array_fill_keys(array_keys($categories), 0);

// Default value for overall_average
$overall_average = 0;

if ($asesmen_kode && $score_session_id) {
    // Ambil data skor berdasarkan kode asesmen dan score session ID
    $query = "SELECT q.kode_mapping, q.pertanyaan, a.jawaban, a.skor FROM asesmen_jawaban a JOIN asesmen_pertanyaan q ON a.question_id = q.id WHERE a.asesmen_kode = '$asesmen_kode' AND a.score_session_id = $score_session_id AND a.user_id = $user_id";
    $result = $conn->query($query);

    // Hitung rata-rata skor untuk kategori ITIL Service Lifecycle
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $aspek = explode('_', $row['kode_mapping'])[1]; // Ambil kategori dari kode_mapping
            if (isset($categories[$aspek])) {
                $categories[$aspek] += $row['skor'];
                $counts[$aspek]++;
            }
        }

        // Hitung rata-rata skor setiap kategori
        foreach ($categories as $aspek => $total_score) {
            $categories[$aspek] = $counts[$aspek] > 0 ? $total_score / $counts[$aspek] : 0;
        }

        // Hitung rata-rata keseluruhan dengan formula (*18)
        $overall_average = array_sum($categories) / count($categories) * 18;
    }
}

// Menyimpan Data Tabel
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['send_to_asesor'])) {
    $asesmen_kode = $conn->real_escape_string($_POST['asesmen_kode']);
    $score_session_id = (int) $_POST['score_session_id'];
    $categories = json_decode($_POST['categories'], true);

    foreach ($categories as $aspek => $skor_rata_rata) {
        $aspek = $conn->real_escape_string($aspek);
        $skor_rata_rata = (float) $skor_rata_rata;

        $insert_query = "
            INSERT INTO asesmen_hasil (asesmen_kode, score_session_id, aspek, skor_rata_rata)
            VALUES ('$asesmen_kode', $score_session_id, '$aspek', $skor_rata_rata)
        ";

        if (!$conn->query($insert_query)) {
            echo "<div class='alert alert-danger'>Gagal menyimpan hasil untuk kategori $aspek. Kesalahan: {$conn->error}</div>";
        }
    }

    echo "<div class='alert alert-success'>Hasil berhasil dikirim ke Asesor.</div>";
}
?>

<h3 class="text-center">Hasil Skor Self-Assessment</h3>

<form method="GET" action="lihat_skor.php" class="mb-4">
    <div class="row">
        <div class="col-md-6">
            <label for="asesmen_kode" class="form-label">Pilih Kode Asesmen</label>
            <select name="asesmen_kode" id="asesmen_kode" class="form-select" required onchange="this.form.submit()">
                <option value="" disabled selected>Pilih Kode Asesmen</option>
                <?php foreach ($audit_data as $audit_code => $sessions): ?>
                    <option value="<?php echo htmlspecialchars($audit_code); ?>" <?php echo ($asesmen_kode === $audit_code) ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($audit_code); ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
        <?php if ($asesmen_kode && isset($audit_data[$asesmen_kode])): ?>
            <div class="col-md-6">
                <label for="score_session_id" class="form-label">Pilih ID Sesi Skor</label>
                <select name="score_session_id" id="score_session_id" class="form-select" required onchange="this.form.submit()">
                    <option value="" disabled selected>Pilih ID Sesi Skor</option>
                    <?php foreach ($audit_data[$asesmen_kode] as $session): ?>
                        <option value="<?php echo htmlspecialchars($session['score_session_id']); ?>" <?php echo ($score_session_id == $session['score_session_id']) ? 'selected' : ''; ?>>
                            <?php echo 'ID: ' . htmlspecialchars($session['score_session_id']) . ' | ' . htmlspecialchars($session['created_at']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
        <?php endif; ?>
    </div>
</form>

<?php if ($asesmen_kode && $score_session_id): ?>
    <?php if ($result && $result->num_rows > 0): ?>
        <h3 class="text-center mt-5">Detail Jawaban Self-Assessment</h3>
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
                <?php $result->data_seek(0); ?>
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

        <h3 class="text-center mt-5">Output Dashboard Kinerja</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Kategori</th>
                    <th>Rata-Rata Skor</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($categories as $aspek => $average): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($aspek); ?></td>
                        <td><?php echo round($average, 2); ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <h3 class="text-center mt-5">Output Tingkat Kesiapan Keamanan</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Kategori</th>
                    <th>Rata-Rata</th>
                    <th>Pointer Value</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Tingkat Kesiapan Keamanan</td>
                    <td><?php echo round($overall_average / 18, 2); ?></td>
                    <td><?php echo round($overall_average, 2); ?></td>
                </tr>
            </tbody>
        </table>
    <?php else: ?>
        <div class="alert alert-warning">Data tidak ditemukan untuk kode asesmen dan ID sesi skor ini.</div>
    <?php endif; ?>
<?php endif; ?>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-annotation"></script>
<script>
    const radarCtx = document.getElementById('radarChart').getContext('2d');
    new Chart(radarCtx, {
        type: 'radar',
        data: {
            labels: [
                'Kesiapan Organisasi (Service Strategy)',
                'Manajemen Aset (Service Design)',
                'Penyusunan Keamanan TI (Service Transition)',
                'Pelaksanaan Keamanan TI (Service Operation)',
                'Perencanaan Pengembangan (Continual Service Improvement)'
            ],
            datasets: [{
                label: 'Rata-Rata Skor',
                data: [
                    <?php echo $categories['Service Strategy']; ?>,
                    <?php echo $categories['Service Design']; ?>,
                    <?php echo $categories['Service Transition']; ?>,
                    <?php echo $categories['Service Operation']; ?>,
                    <?php echo $categories['Continual Service Improvement']; ?>
                ],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                r: {
                    angleLines: { display: true },
                    suggestedMin: 0,
                    suggestedMax: 5
                }
            },
            plugins: {
                legend: { display: true }
            }
        }
    });

    const speedometerCtx = document.getElementById('speedometerChart').getContext('2d');
    const speedometerValue = <?php echo round($overall_average, 2); ?>;

    new Chart(speedometerCtx, {
        type: 'doughnut',
        data: {
            labels: ['Rendah (Merah)', 'Sedang (Kuning)', 'Baik (Hijau)'],
            datasets: [{
                data: [20, 30, 50],
                backgroundColor: ['#dc3545', '#ffc107', '#28a745'],
                borderWidth: 0,
            }]
        },
        options: {
            rotation: -90,
            circumference: 180,
            cutout: '70%',
            plugins: {
                legend: { display: false },
                annotation: {
                    annotations: {
                        pointer: {
                            type: 'line',
                            xMin: 50 + (speedometerValue / 100) * 150,
                            xMax: 50 + (speedometerValue / 100) * 150,
                            yMin: 0,
                            yMax: 80,
                            borderColor: 'black',
                            borderWidth: 3,
                        }
                    }
                }
            }
        }
    });
</script>

<!-- Tombol Kirim ke Asesor -->
<?php if ($result && $result->num_rows > 0): ?>
    <div class="text-center mt-4">
        <form method="POST" action="">
            <input type="hidden" name="asesmen_kode" value="<?php echo htmlspecialchars($asesmen_kode); ?>">
            <input type="hidden" name="score_session_id" value="<?php echo htmlspecialchars($score_session_id); ?>">
            <input type="hidden" name="categories" value="<?php echo htmlspecialchars(json_encode($categories)); ?>">
            <input type="hidden" name="overall_score" value="<?php echo htmlspecialchars($overall_average); ?>">
            <button type="submit" name="send_to_asesor" class="btn btn-primary">Kirim ke Asesor</button>
        </form>
    </div>
<?php endif; ?>

<?php include '../../includes/footer.php'; ?>