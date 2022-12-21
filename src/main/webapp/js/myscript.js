
const overlay = document.querySelector('.overlay');
const headerMenu = document.querySelector('.header-menu');
const btnUser = document.querySelector('#header-user');
const btnLogin = document.querySelector('#header-login');
const optionMember = document.querySelector('.popup-wrapper');
const brandBtn = document.querySelector('#brands-menu-btn');

const toHidden = [headerMenu,optionMember];

if(location.pathname=="/yeudienthoai/register" || location.pathname=="/yeudienthoai/login"){
	btnLogin.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 560 560" width="20"><defs><style>#icon-smember .cls-1 {
                fill: none;
                stroke: #fff;
                stroke-width: 30px;
              }</style></defs><g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><circle cx="280" cy="280" r="265" class="cls-1"></circle> <circle cx="280" cy="210" r="115" class="cls-1"></circle> <path d="M86.82,461.4C124.71,354.71,241.91,298.93,348.6,336.82A205,205,0,0,1,473.18,461.4" class="cls-1"></path></g></g></svg>
					<span>Member</span>`;
	btnLogin.classList.add('disabled');
}

else {
	if (btnUser != null)
		btnUser.addEventListener('click', openPopup.bind(optionMember));
}

document.querySelector('.header-menu-btn').addEventListener('click', openPopup.bind(headerMenu));

if (brandBtn != null)
	document.querySelector('#brands-menu-btn').addEventListener('click', function (){
		document.querySelector('#brands-menu').classList.toggle('show');
	});

overlay.addEventListener('click', closePopup);

function openPopup() {
	if(!overlay.classList.contains('active')){
		overlay.classList.add('active');
		this.classList.add('show');
	}else{
		closePopup();
	}
}

function closePopup() {	
	overlay.classList.remove('active');
	toHidden.forEach(item => item.classList.remove('show'));
}

