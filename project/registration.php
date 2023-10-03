<!DOCTYPE html>
<html>
<head>
    <title>Регистрация</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="styles/registration_style.css">
    <script src="js/registration.js"></script>
</head>
<body>
    <div class="login-container">
        <h2>Регистрация</h2>
        <label for="username">Имя пользователя:</label>
        <input type="text" name="username" id="username" required>

        <label for="email">Почта:</label>
        <input type="email" name="email" id="email" required>
        
        <button class="addUser">Подтвердить</button>
    </div>
</body>
</html>