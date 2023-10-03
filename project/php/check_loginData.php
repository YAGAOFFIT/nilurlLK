<?php
require 'db_connection.php';


$email_db = $_POST["email"];
$password_db = $_POST["password"];

    
$sql = "SELECT * FROM `users` WHERE `email` = ? AND `password` = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $email_db, $password_db);
$stmt->execute();
$result = $stmt->get_result();
    if ($result->num_rows > 0) {
        session_start();
        $_SESSION['email'] = $email_db;
        $stmt->close();
        $conn->close();
        echo 'correct';
        exit();
    } else {
        $stmt->close();
        $conn->close();
        echo 'wrong';
        exit();
    }



?>