<?php
// Получить данные из POST-запроса

$mailEmail = $_POST['email'];
$mailUsername = $_POST['username'];
$mailType = $_POST['type'];

require 'db_connection.php';
$sql = "SELECT `password` FROM `users` WHERE `email` = ? AND `username` = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $mailEmail, $mailUsername);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
$password = $row['password'];

$stmt->close();
$mysqli->close();

$to = $mailEmail;
$subject = "Вход на сайт ... ";
$message = " Здравствуйте " . $mailUsername . "\r\n";
$message .= "Ваш пароль " .$password;

$headers = "From: Сайт ";

// Отправка почтового сообщения
if (mail($to, $subject, $message, $headers)) {
    echo "Сообщение успешно отправлено";
} else {
    echo "Ошибка при отправке сообщения";
}

http_response_code(200);
?>