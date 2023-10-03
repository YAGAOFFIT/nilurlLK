<?php
// Получить данные из POST-запроса
$userId = $_POST['userId'];
$userEmail = $_POST['email'];
$userName = $_POST['username'];
function generatePassword() {
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ*_/!';
    $password = '';

    for ($i = 0; $i < 8; $i++) {
        $index = rand(0, strlen($characters) - 1);
        $password .= $characters[$index];
    }

    return $password;
}

$generatedPassword = generatePassword();
// Подключение к базе данных
require 'db_connection.php';


$stmt = $conn->prepare("INSERT INTO `users` (userId, username, email, password) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $userId, $userName, $userEmail, $generatedPassword);
$stmt->execute();

$stmt->close();
$conn->close();

// Возвращаем успешный HTTP-ответ
http_response_code(200);
?>