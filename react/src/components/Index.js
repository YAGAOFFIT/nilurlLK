import React, { useEffect } from 'react';
import './style.css'; 
import Header from './Header';

function App() {
  useEffect(() => {
    // Обработчик для показа/скрытия списка тегов
    const list = document.querySelector(".search-tag__btn");
    list.addEventListener('click', toggleTagList);

    return () => {
      list.removeEventListener('click', toggleTagList);
    };
  }, []);

  const toggleTagList = () => {
    let svg = document.getElementById("icon");
    let tag = document.querySelector(".search-tag__list");

    if (svg.classList.contains('rotate90')) {
      svg.classList.remove('rotate90');
      tag.style.display = "none";
    } else {
      svg.classList.add('rotate90');
      tag.style.display = "grid";
    }
  };

  return (
    <div>
      <div id="modal-background"></div>
      {/* <div id="myModal" className="modal" onClick={closeModal}> */}
      <div id="myModal" className="modal">
        <div className="modal-content" onClick={(event) => event.stopPropagation()}>
          <img id="img-in-modal-window" src="images/grey-circle.png" alt="" />
          <h2 id="modal-window-create-link">Создать ссылку</h2>
          <div id="center-part-of-modal-window">
            <label id="modal-window-label-for-input-long-link" htmlFor="modal-window-input-long-link">Длинная ссылка</label>
            <input type="text" id="modal-window-input-long-link" className="input-on-modal-window" placeholder="https://t.me/nilurl" />
            <div id="modal-window-row-with-label-and-button">
              <label id="modal-window-label-for-input-short-link" htmlFor="modal-window-input-short-link">Сокращенная ссылка</label>
              <button id="modal-window-button-for-generating-link">
                <img id="image-for-generate-button" src="images/svg1042-arb8.svg" alt="SVG1042" className="create-link-svg" />
                Сгенерировать
              </button>
            </div>
            <div id="modal-window-wrapper-for-long-link">
              <select name="modal-window-select-link" id="modal-window-select-link">
                <option value="nil.url.ru" selected>nil.url.ru</option>
                <option value="nil.url2.ru">nil.url2.ru</option>
              </select>
              <input type="text" id="modal-window-input-short-link" className="input-on-modal-window" placeholder="nilurl" />
            </div>
          </div>
          <button className="links-button-2" onClick={() => console.log(1)}>
            <div className="create-link-text-2">Создать ссылку</div>
          </button><br />
        </div>
      </div>
      <div id="wrapper" className="wrapper">
        <Header />
        <main className="main">
          <div className="main-border">
            <div className="main-container container">
              <div id="links-container">
                <div><h1 id="my-links">Мои ссылки</h1></div>
                {/* <button className="links-button open-modal-button" onClick={openModal}> */}
                <button className="links-button open-modal-button">
                  <div className="create-link-text">Создать ссылку</div>
                  <div className="create-link-icon">C</div>
                </button>
              </div>
            </div>
          </div>
          <div id="sorting-container" className="container">
            <div className="sorting-container row-reverse">
              <div className="wrapper-for-sorting-select">
                <svg id="svg-of-sorting" fill="none" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24" height="24" className="h-4 w-4 shrink-0">
                  <path d="M15 18H3M21 6H3M17 12H3"></path>
                </svg>
                <select name="" id="select-of-sorting-type">
                  <option disabled selected>Сортировать</option>
                  <option value="date">по дате</option>
                  <option value="name">по имени</option>
                </select>
              </div>
            </div>
          </div>
          <div className="content-container container">
            <div id="left-content" className="search">
              <div className="search-iner">
                <div className="search-iner__link">
                  <div className="search-iner__link_name">
                    <h3 id="filter_label">Фильтр</h3>
                  </div>
                  <div className="search-iner__input">
                    <div className="search-iner__input_icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" x2="16.65" y1="21" y2="16.65"></line>
                      </svg>
                    </div>
                    <input type="text" className="search-filter__inp" placeholder="Поиск..." value="" />
                  </div>
                </div>
                <fieldset className="search-tag">
                  <div className="search-tag__name">
                    <button className="search-tag__btn">
                      <svg id="icon" className="" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="9 18 15 12 9 6"></polyline>
                      </svg>
                      <h4>Теги</h4>
                    </button>
                    <button id="add-tag-button" className="search-tag__btn_add">Добавить</button>
                  </div>
                  <div className="search-tag__list" style={{ height: '210px' }}>
                    <div className="search-tag__list_item">
                      <input id="dub.sh" name="dub.sh" type="radio" className="search-tag__list_item_inp" checked />
                      <label htmlFor="dub.sh" className="search-tag__list_item_name">
                        <p>dub.sh</p>
                      </label>
                    </div>
                    <div className="search-tag__list_item">
                      <input id="dub.sh" name="dub.sh" type="radio" className="search-tag__list_item_inp" checked />
                      <label htmlFor="dub.sh" className="search-tag__list_item_name">
                        <p>dub.sh</p>
                      </label>
                    </div>
                    <div className="search-tag__list_item">
                      <input id="dub.sh" name="dub.sh" type="radio" className="search-tag__list_item_inp" checked />
                      <label htmlFor="dub.sh" className="search-tag__list_item_name">
                        <p>dub.sh</p>
                      </label>
                    </div>
                    <div className="search-tag__list_item">
                      <input id="dub.sh" name="dub.sh" type="radio" className="search-tag__list_item_inp" checked />
                      <label htmlFor="dub.sh" className="search-tag__list_item_name">
                        <p>dub.sh</p>
                      </label>
                    </div>
                    <div className="search-tag__list_item">
                      <input id="dub.sh" name="dub.sh" type="radio" className="search-tag__list_item_inp" checked />
                      <label htmlFor="dub.sh" className="search-tag__list_item_name">
                        <p>dub.sh</p>
                      </label>
                    </div>
                    <div className="search-tag__list_item">
                      <input id="dub.sh" name="dub.sh" type="radio" className="search-tag__list_item_inp" checked />
                      <label htmlFor="dub.sh" className="search-tag__list_item_name">
                        <p>dub.sh</p>
                      </label>
                    </div>
                    <div className="search-tag__list_item">
                      <input id="dub.sh" name="dub.sh" type="radio" className="search-tag__list_item_inp" checked />
                      <label htmlFor="dub.sh" className="search-tag__list_item_name">
                        <p>dub.sh</p>
                      </label>
                    </div>
                  </div>
                </fieldset>
              </div>
            </div>
            <div className="right-content">
              <h2 id="result-of-searching-links">
                Ссылок не найдено
              </h2>
              <div>
                <img src="images/1.png" alt="callwaitingsvg169" className="frame-callwaitingsvg" />
              </div>
              <div id="button-wrapper">
                {/* <button className="links-button open-modal-button" onClick={openModal}> */}
                <button className="links-button open-modal-button">
                  <div className="create-link-text">Создать ссылку</div>
                  <div className="create-link-icon">C</div>
                </button>
              </div>
              <p id="message-for-user">или поменяйте параметры фильтра</p>
            </div>
          </div>
        </main>
      </div>
      <script src="main.js?v=11"></script>
    </div>
  );
}

export default App;
