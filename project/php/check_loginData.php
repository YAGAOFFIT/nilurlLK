<?php
require 'db_connection.php';

$email_db = $_POST["email"];
$password_input = $_POST["password"];

$sql = "SELECT * FROM `users` WHERE `email` = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email_db);
$stmt->execute();

$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $hash_db = $row['password'];

    if (password_verify($password_input, $hash_db)) {
        $stmt->close();
        $conn->close();
        echo 'correct';
        exit();
    }
}

// Если не удалось авторизоваться
$stmt->close();
$conn->close();
echo 'wrong';
exit();
?>