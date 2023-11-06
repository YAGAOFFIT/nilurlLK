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
          showMessageModal('Неправильное имя пользователя', 'Имя пользователя не может быть меньше 3 символов. Так же можно использовать только буквы английского алфавита, цифры и символ "_"');
          break;
        case 'invalid_email':
          showMessageModal('Неправильный Email', 'Почта имеет неправильный формат');
          break;
        case 'unique':
          uniqueUser(username, email);
          showMessageModal('Успех', 'Ваш аккаунт был создан: Пароль для входа был отправлен на вашу почту');
          break;
        case 'not_unique':
          showMessageModal('Данный аккаунт уже существует', 'Выполните вход или восстановите аккаунт');
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

function showMessageModal(title, message) {
  $('#messageModal').find('.modal-title').text(title);
  $('#messageText').text(message);
  $('#messageModal').modal('show');
}