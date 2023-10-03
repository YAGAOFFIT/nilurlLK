$(document).ready(function() {
  $('#back-btn').click(function() {
    window.location.href = '../index.php';
  });

  $('.addUser').click(function() {
    var username = $('#username').val();
    var email = $('#email').val();
    checkUnique(username, email);
  });
});

function checkUnique(username, email) {
  $.ajax({
    url: '../php/check_unique.php',
    method: 'POST',
    data: {
      username: username,
      email: email
    },
    success: function(response) {
      if (response === 'unique') {
        uniqueUser(username, email);
      } else {
        console.log('Не уникальные');
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
  emailSend(email, username, "newPswd");
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

function emailSend(email, username, type) {
  $.ajax({
    url: "../php/email_send.php",
    method: "POST",
    data: {
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