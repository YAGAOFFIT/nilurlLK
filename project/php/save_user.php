<?php
// Получить данные из POST-запроса
$userId = $_POST['userId'];
$userEmail = $_POST['email'];
$userName = $_POST['username'];
$mailType = "newPswd";

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

$hash = password_hash($generatedPassword, PASSWORD_DEFAULT);
// Подключение к базе данных
require 'db_connection.php';


$stmt = $conn->prepare("INSERT INTO `users` (userId, username, email, password) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $userId, $userName, $userEmail, $hash);
$stmt->execute();

$stmt->close();
$conn->close();



require 'db_connection.php';
$sql = "SELECT id FROM mail ORDER BY id DESC LIMIT 1";


$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $lastId = $row['id'];
    $currentId = $lastId +1;
} else {
    echo "Нет результатов";
}

$stmt = $conn->prepare("INSERT INTO `mail` (id, type, code, userId) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $currentId, $mailType, $generatedPassword, $userId);
$stmt->execute();
$stmt->close();

$conn->close();


// Возвращаем успешный HTTP-ответ
http_response_code(200);
?>