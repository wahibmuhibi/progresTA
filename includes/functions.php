<?php
// Fungsi Log Aktivitas

function log_activity($user_id, $aktivitas, $conn) {
    // Escape input untuk mencegah SQL Injection
    $user_id = $conn->real_escape_string($user_id);
    $aktivitas = $conn->real_escape_string($aktivitas);

    // Query untuk menyimpan log aktivitas
    $query = "INSERT INTO log_aktivitas (user_id, aktivitas) VALUES ('$user_id', '$aktivitas')";

    // Eksekusi query
    if (!$conn->query($query)) {
        // Debugging jika terjadi error
        error_log("Error logging aktivitas: " . $conn->error);
    }
}

?>