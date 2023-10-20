$(document).ready(function() {
 
  $('#loginUser').click(function() {
    var email = $('#email').val();
    var password = $('#password').val();
    checkLoginData(email, password);
  });
});

function checkLoginData(email, password) {
  $.ajax({
    url: '../php/check_loginData.php',
    method: 'POST',
    data: {
      email: email,
      password:password
    },
    success: function(response) {
      if (response === 'correct') {
        window.location.href = "main.html";
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Ошибка входа',
          text: 'Неправильный логин или пароль.',
        });
      }
    },
    error: function(xhr, status, error) {
      console.error('Ошибка при проверке уникальности:', error);
    }
  });
}