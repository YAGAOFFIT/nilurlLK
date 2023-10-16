
const list = document.querySelector(".search-tag__btn");
list.addEventListener('click', () =>{
	let svg = document.getElementById("icon");
	let tag = document.querySelector(".search-tag__list");
	if ( svg.classList.contains('rotate90') ){
		svg.classList.remove('rotate90')
		tag.style.display = "none";
	} else{
		svg.classList.add('rotate90');
		tag.style.display = "grid";
	}
})






const openModalButton = document.getElementById('openModalButton');
openModalButton.addEventListener('click', openModal);

const closeButton = document.querySelector('.close');
closeButton.addEventListener('click', closeModal);

function openModal() {
	document.getElementById("myModal").style.display = "flex";
	document.getElementById("modal-background").style.display = "block"; // Показываем фон
  }
  
  function closeModal() {
	console.log(1);
	document.getElementById("myModal").style.display = "none";
	document.getElementById("modal-background").style.display = "none"; // Скрываем фон
  }
  

  