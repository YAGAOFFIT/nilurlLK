<?php
$mailEmail = $_POST['email'];
$mailUsername = $_POST['username'];
$mailType = $_POST['type'];

require 'db_connection.php';


$mailEmail = mysqli_real_escape_string($conn, $mailEmail);
$mailUsername = mysqli_real_escape_string($conn, $mailUsername);

$sql = "SELECT `password` FROM `users` WHERE `email` = ? AND `username` = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $mailEmail, $mailUsername);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $password = $row['password'];

    $to = $mailEmail;
    $subject = "Вход на сайт ... ";
    $message = " Здравствуйте " . $mailUsername . "\r\n";
    $message .= "Ваш пароль " . $password;

    $headers = "From: Сайт ";

    // Отправка почтового сообщения
    if (mail($to, $subject, $message, $headers)) {
        echo "Сообщение успешно отправлено";
    } else {
        echo "Ошибка при отправке сообщения";
    }
} else {
    echo "Пользователь не найден";
}

$stmt->close();
$conn->close();
http_response_code(200);
?>






