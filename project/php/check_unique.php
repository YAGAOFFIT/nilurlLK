<?php
require 'db_connection.php';


    $checkUsername = $_POST["username"];
    $checkEmail = $_POST["email"];

    $stmtUsername = $conn->prepare("SELECT * FROM users WHERE username = ?");
    $stmtUsername->bind_param("s", $username);
    $stmtUsername->execute();
    $resultUsername = $stmtUsername->get_result();

if ($resultUsername->num_rows > 0) {
    echo 'not_unique';
    exit;
}
$stmtUsername->close();




    $stmtEmail = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmtEmail->bind_param("s", $checkEmail);
    $stmtEmail->execute();
    $resultEmail = $stmtEmail->get_result();

if ($resultEmail->num_rows > 0) {
    echo 'not_unique';
    exit;
}

$stmtEmail->close();
$conn->close();

echo 'unique';
?>