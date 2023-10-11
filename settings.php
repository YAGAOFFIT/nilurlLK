<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css?v=1">
  <title>Document</title>
</head>
<body>
  <div id="wrapper" class="wrapper">
  <?php include 'header.php'; ?>
    <main class="settings-page-main-block">
      <div class="main-border" id="main-border-settings-page">
        <div class="main-container" class="container">
          <div id="settings-title-container">
            <div><h1 id="settings-title">Настройки</h1></div>
          </div>
        </div>
      </div>
      
      <div class="content-container container">
        <div id="left-content-settings-page">
          <div class="container-of-title-of-main-settings">
            <h3 id="title-of-main-settings">Основные</h3>
          </div>
        </div>   

        <div class="settings-page-right-content">
          <div class="settings-page-right-block">
            <h4 id="settings-page-label-for-name">Ваше имя</h4>
            <p id="settings-page-comment-for-name">Будет отображаться в на Nil.</p>
            <input type="text" id="setting-page-input-name" class="input-on-settings-page" value="Артемий Журавлёв">
          </div>
          <div class="settings-page-right-block-lower-part">
            <p id="settings-page-right-block-comment-for-name">Максимум 32 символа</p>
            <button id="settings-page-right-block-save-name-button">Сохранить</button>
          </div>

          <div class="settings-page-right-block">
            <h4 id="settings-page-label-for-email">Ваш email</h4>
            <p id="settings-page-comment-for-email">Привяжите вашу почту.</p>
            <input type="text" id="setting-page-input-email" class="input-on-settings-page" value="artemiy0709@gmail.com">
          </div>
          <div class="settings-page-right-block-lower-part">
            <p id="settings-page-right-block-comment-for-email">Email должен быть действительным</p>
            <button id="settings-page-right-block-save-email-button">Сохранить</button>
          </div>

          <div class="settings-page-right-block-for-deletion">
            <h4 id="settings-page-label-for-deletion">Удалить аккаунт</h4>
            <p id="settings-page-comment-for-deletion">Навсегда удалите аккаунт, вместе с ним удалятся все ссылки</p>
          </div>
          <div class="settings-page-right-block-lower-part-for-deletion">
            <button id="settings-page-right-block-delete-accaunt-button">Удалить аккаунт</button>
          </div>
        </div>
      </div>
    </main>
  </div>  
  
  <script src="main.js"></script>
</body>
</html>