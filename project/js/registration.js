$(document).ready(function() {
  $('#back-btn').click(function() {
    window.location.href = '../index.php';
  });

  $('#addUser').click(function() {
    var username = $("#passp-field-username").val();
    var email = $("#passp-field-email").val();
    checkRegistrationData(username, email);
  });
});

function checkRegistrationData(username, email) {
  $.ajax({
    url: '../php/check_registrationData.php',
    method: 'POST',
    data: {
      username: username,
      email: email
    },
    success: function(response) {
      switch (response) {
        case 'invalid_username':
          Swal.fire({
            icon: 'error',
            title: 'Неправильное имя пользователя',
            text: 'Имя пользователя не может быть меньше 3 символов. Так же можно использовать только буквы английского алфавита, цифры и символ "_"',
          });
          break;
        case 'invalid_email':
          Swal.fire({
            icon: 'error',
            title: 'Неправильный Email',
            text: 'Почта имеет неправильный формат',
          });
          break;
        case 'unique':
          uniqueUser(username, email);
          Swal.fire({
            icon: 'success',
            title: 'Ваш аккаунт был создан',
            text: 'Пароль для входа был отправлен на вашу почту',
            html: '<a href="index.html">Вернуться на страницу входа</a> ',
          });
          break;
        case 'not_unique':
          Swal.fire({
            icon: 'error',
            title: 'Данный аккаунт уже существует',
            text: 'Выполните вход или восстановите аккаунт',
          });
          break;
        default:
          console.error('Неизвестный ответ от сервера:', response);
          break;
      }
    },
    error: function(xhr, status, error) {
      console.error('Ошибка при проверке уникальности:', error);
    }
  });
}
function uniqueUser(username, email) {
  var userId = "user" + Date.now();
  saveUser(userId, email, username);
  emailSend(userId, email, username, "newPswd");
}

function saveUser(userId, email, username) {
  $.ajax({
    url: "../php/save_user.php",
    method: "POST",
    data: {
      userId: userId,
      email: email,
      username: username
    },
    success: function(response) {
      console.log("Пользователь успешно сохранен.");
    },
    error: function(xhr, status, error) {
      console.error("Ошибка при сохранении пользователя:", error);
    }
  });
}

function emailSend(userId, email, username, type) {
  $.ajax({
    url: "../php/email_send.php",
    method: "POST",
    data: {
      userId:userId,
      email: email,
      username: username,
      type: type
    },
    success: function(response) {
      console.log("Письмо успешно отправлено.");
    },
    error: function(xhr, status, error) {
      console.error("Ошибка при отправке письма:", error);
    }
  });
}