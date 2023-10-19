$(document).ready(function() {
  $('#modal-window-button-for-generating-link').click(function() {
    const generatedString = generateRandomString();
    const inputField = document.getElementById('modal-window-input-short-link');
    inputField.value = generatedString;
  });

  function generateRandomString() {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let randomString = '';
    let length = 6;
    const charactersLength = characters.length;

    for (let i = 0; i < length; i++) {
      const randomIndex = Math.floor(Math.random() * charactersLength);
      randomString += characters.charAt(randomIndex);
    }

    return randomString;
  }

  $('#generate-link').click(function() {
    let longLink = $('#modal-window-input-long-link').val();

    if (isValidURL(longLink)) {
      let domenElement = document.getElementById("modal-window-select-link");
      let shortLink = document.getElementById("modal-window-input-short-link")
      let fullShortLink = "http://" + domenElement.value + "/" + shortLink.value;

      if (isValidURL(fullShortLink) && shortLink.value.length >= 6 && shortLink.value.length <=20 ) {
        checkUniqueLink(fullShortLink)
          .then(function(result) {
            if (result === 'unique') {
              saveLink(longLink, fullShortLink);
            } else {
              Swal.fire({
                icon: 'error',
                title: 'Введёные данные неккоректны',
                text: fullShortLink,
              });
            }
          })
          .catch(function(error) {
            Swal.fire({
              icon: 'error',
              title: 'Ошибка при проверке уникальности',
              text: "Данный короткий url уже существует. Ошибка: " + error,
              
            });
          });
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Введёные данные неккоректны',
          text: 'Данный короткий URL не может существовать или сокращённая ссылка меньше 6 или больше 20 символов.',
        });
      }
    } else {
      Swal.fire({
        icon: 'error',
        title: 'Введёные данные неккоректны',
        text: 'Данный длинный URL не может существовать.',
      });
    }
  });

  function isValidURL(url) {
    const urlPattern = new RegExp("^(https?://)?([\\da-z.-]+\\.[a-z.]{2,6}|[\\d.]+)([/?#][^\\s]*)?$");
    return urlPattern.test(url);
  }

  function checkUniqueLink(shortLink) {
    return new Promise(function(resolve, reject) {
      $.ajax({
        url: '../php/check_uniqueLink.php',
        method: 'POST',
        data: {
          shortLink: shortLink
        },
        success: function(response) {
          if (response === 'unique') {
            resolve('unique');
          } else {
            reject('not_unique');
          }
        },
        error: function(xhr, status, error) {
          reject('error');
        }
      });
    });
  }

  function saveLink(longLink, shortLink) {
    $.ajax({
      url: '../php/save_link.php',
      method: 'POST',
      data: {
        longLink: longLink,
        shortLink: shortLink
      },
      success: function() {
        Swal.fire({
          icon: 'success',
          title: 'Ваш URL создан',
          text: shortLink,
        });
      },
      error: function(xhr, status, error) {
        Swal.fire({
          icon: 'error',
          title: 'Ошибка при сохранении URL',
          text: error,
        });
      }
    });
  }
});

const openModalButton = document.getElementById('openModalButton');
openModalButton.addEventListener('click', openModal);

const closeButton = document.querySelector('.close');
closeButton.addEventListener('click', closeModal);

function openModal() {
  document.getElementById("myModal").style.display = "flex";
  document.getElementById("modal-background").style.display = "block";
}

function closeModal() {
  document.getElementById("myModal").style.display = "none";
  document.getElementById("modal-background").style.display = "none";
}