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
    <main class="main">
      <div class="main-border">
        <div class="main-container container">
          <div id="links-container">
            <div><h1 id="my-links">Мои ссылки</h1></div>
              <button class="links-button">
                <div class="create-link-text">Создать ссылку</div>
                <div class="create-link-icon">C</div>
              </button>
          </div>
        </div>
      </div>

      <div id="sorting-container" class="container">
        <div id="sorting-container" class="container row-reverse">
          <div class="wrapper-for-sorting-select">
            <svg id="svg-of-sorting" fill="none" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24" height="24" class="h-4 w-4 shrink-0"><path d="M15 18H3M21 6H3M17 12H3"></path></svg>
            <select name="" id="select-of-sorting-type">
                <option disabled selected>Сортировать</option>
                <option value="date">по дате</option>
                <option value="name">по имени</option>
            </select>
          </div>

        </div>
      </div>
      
      <div class="content-container container">
        <div id="left-content" class="search">
          <div class="search-iner">
            <div class="search-iner__link">
              <div class="search-iner__link_name">
                <h3 id="filter_label">Фильтр</h3>
              </div>
              <div class="search-iner__input">
                <div class="search-iner__input_icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" x2="16.65" y1="21" y2="16.65"></line>
                  </svg>
                </div>
                <input type="text" class="search-filter__inp" placeholder="Поиск..." value="">
              </div>
            </div>
      
            <fieldset class="search-tag">
              <div class="search-tag__name">
                <button class="search-tag__btn">
                  <svg id="icon" class="" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" >
                    <polyline points="9 18 15 12 9 6"></polyline>
                  </svg>
                  <h4>Теги</h4>
                </button>
                <!-- <button class="search-tag__btn_add">
                  <p>Добавить</p>
                </button> -->
                <button id="add-tag-button" class="search-tag__btn_add">Добавить</button>
              </div>
              <div class="search-tag__list" style="height: 210px;">
                <div class="search-tag__list_item">
                  <input id="dub.sh" name="dub.sh" type="radio" class="search-tag__list_item_inp" checked="">
                  <label for="dub.sh" class="search-tag__list_item_name">
                    <p>dub.sh</p>
                  </label>
                </div>
                <div class="search-tag__list_item">
                  <input id="dub.sh" name="dub.sh" type="radio" class="search-tag__list_item_inp" checked="">
                  <label for="dub.sh" class="search-tag__list_item_name">
                    <p>dub.sh</p>
                  </label>
                </div>
                <div class="search-tag__list_item">
                  <input id="dub.sh" name="dub.sh" type="radio" class="search-tag__list_item_inp" checked="">
                  <label for="dub.sh" class="search-tag__list_item_name">
                    <p>dub.sh</p>
                  </label>
                </div>
                <div class="search-tag__list_item">
                  <input id="dub.sh" name="dub.sh" type="radio" class="search-tag__list_item_inp" checked="">
                  <label for="dub.sh" class="search-tag__list_item_name">
                    <p>dub.sh</p>
                  </label>
                </div>
                <div class="search-tag__list_item">
                  <input id="dub.sh" name="dub.sh" type="radio" class="search-tag__list_item_inp" checked="">
                  <label for="dub.sh" class="search-tag__list_item_name">
                    <p>dub.sh</p>
                  </label>
                </div>
                <div class="search-tag__list_item">
                  <input id="dub.sh" name="dub.sh" type="radio" class="search-tag__list_item_inp" checked="">
                  <label for="dub.sh" class="search-tag__list_item_name">
                    <p>dub.sh</p>
                  </label>
                </div>
                <div class="search-tag__list_item">
                  <input id="dub.sh" name="dub.sh" type="radio" class="search-tag__list_item_inp" checked="">
                  <label for="dub.sh" class="search-tag__list_item_name">
                    <p>dub.sh</p>
                  </label>
                </div>
              </div>
            </fieldset>
          </div>
        </div>   

        <div class="right-content">          
          <h2 id="result-of-searching-links">
            Ссылок не найдено
          </h2>
          <div>
            <img src="images/1.png" alt="callwaitingsvg169" class="frame-callwaitingsvg">
          </div>
          <div id="button-wrapper">
            <button id="second-button-for-creation-link">
              <div class="create-link-text">Создать ссылку</div>
              <div class="create-link-icon">C</div>
            </button>
          </div>
          <p id="message-for-user">или поменяйте параметры фильтра</p>
        </div>

      </div>
    </main>
  </div>
  
  
  <script src="main.js"></script>
</body>
</html>