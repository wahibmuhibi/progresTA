<?php
function get_audit_results($conn) {
    $stmt = $conn->prepare("SELECT * FROM audit_results");
    $stmt->execute();
    return $stmt->get_result();
}
?>
