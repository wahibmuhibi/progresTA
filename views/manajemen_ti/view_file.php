<?php
session_start();
include '../../includes/auth.php';
include '../../includes/db.php';

if (!isset($_GET['question_id'])) {
    die("ID pertanyaan tidak ditemukan.");
}

$question_id = (int)$_GET['question_id'];
$user_id = $_SESSION['user_id'];

$query = "
    SELECT bukti 
    FROM assessment_answers 
    WHERE question_id = $question_id AND user_id = $user_id
";
$result = $conn->query($query);

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();
    header("Content-Type: application/pdf");
    echo $row['bukti'];
} else {
    echo "File tidak ditemukan.";
}
?>
