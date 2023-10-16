<?php
require 'db_connection.php';

function isValidUsername($username) {
    return preg_match('/^[a-zA-Z0-9_]+$/', $username) && strlen($username) > 3;
}

function isValidEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

$checkUsername = $_POST["username"];
$checkEmail = $_POST["email"];

if (!isValidUsername($checkUsername)) {
    echo 'invalid_username';
    $conn->close();
    exit;
}

if (!isValidEmail($checkEmail)) {
    echo 'invalid_email';
    $conn->close();
    exit;
}

$stmtUsername = $conn->prepare("SELECT * FROM users WHERE username = ?");
$stmtUsername->bind_param("s", $checkUsername);
$stmtUsername->execute();
$resultUsername = $stmtUsername->get_result();

$stmtUsername->close();

if ($resultUsername->num_rows > 0) {
    echo 'not_unique';
    $conn->close();
    exit;
}



$stmtEmail = $conn->prepare("SELECT * FROM users WHERE email = ?");
$stmtEmail->bind_param("s", $checkEmail);
$stmtEmail->execute();
$resultEmail = $stmtEmail->get_result();

$stmtEmail->close();
if ($resultEmail->num_rows > 0) {
    echo 'not_unique';
    $conn->close();
    exit;
}

$conn->close();

echo 'unique';

?>