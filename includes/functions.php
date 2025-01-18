<?php
// Fungsi Log Activity

function log_activity($user_id, $activity, $conn) {
    // Escape input untuk mencegah SQL Injection
    $user_id = $conn->real_escape_string($user_id);
    $activity = $conn->real_escape_string($activity);

    // Query untuk menyimpan log aktivitas
    $query = "INSERT INTO log_aktivitas (user_id, activity) VALUES ('$user_id', '$activity')";

    // Eksekusi query
    if (!$conn->query($query)) {
        // Debugging jika terjadi error
        error_log("Error logging activity: " . $conn->error);
    }
}

?>