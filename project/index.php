<!DOCTYPE html>
<html>
<head>
    <title>Логин</title>
    <link rel="stylesheet" href="styles/index_style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="js/index.js"></script>
</head>
<body>
    <div class="login-container">
        <h2>Вход</h2>
            <label for="username">Почта:</label>
            <input type="email" name="email" id="email" required>
            <label for="password">Пароль:</label>
            <input type="password" name="password" id="password" required>
            <input id ="loginUser" type="submit" value= "Вход" />
        <br>
        <div class ="registration-container">
            <form id = 'reg' action="registration.php">
            <input type="submit" value= "Регистрация" />
            </form>
        </div>
        <?php
        
        ?>
    </div>
    
</body>
</html>