
const account = document.querySelector('#account');
const inputName = document.querySelector('#name');
const inputUser = document.querySelector('#email');
const inputPassword = document.querySelector('#password');
const inputConfirm = document.querySelector('#confirm-password');
const btnSubmit = document.querySelector('#btn-submit');
const noteText = document.querySelectorAll('.error-text');

const regMail = /(\w+\.?|-?\w+?)+@\w+\.?-?\w+?(\.\w{2,3})+/;
// Password must contain: Between 8 and 24 chars, 1 lowercase, 1 uppercase, 1 number, 1 special char
const regex = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,24}$/;

btnSubmit.addEventListener('click', function(event) {
	event.preventDefault();

	// Form register
	const typeOfAction = location.pathname;
	if (typeOfAction=="/yeudienthoai/register"){
		const nameResponse = _validateName(inputName.value);
		const mailResponse = _validateMail(inputUser.value);
		const passwordResponse = _validatePassword(inputPassword.value);
		const confirmResponse = _validateConfirm(inputPassword.value, inputConfirm.value);
		
		// Validate thành công sẽ submit form, không thì sẽ báo lỗi tương ứng
		if (nameResponse == "ok" && mailResponse == "ok" && passwordResponse == "ok" && confirmResponse == "ok") {		
			account.submit();
		}else{
			noteText.forEach(ele=>ele.innerHTML="");
			noteText.forEach(ele=>ele.previousElementSibling.style.border="");
		}
		if(nameResponse != "ok"){
			_generateHtml(nameResponse, inputName);
		}
		if(mailResponse != "ok"){
			_generateHtml(mailResponse,inputUser);
		}
		if(passwordResponse != "ok"){
			_generateHtml(passwordResponse,inputPassword);
		}else if(confirmResponse != "ok") {
			_generateHtml(confirmResponse, inputConfirm);
		}	
	}
	
	// Form login
	if (typeOfAction=="/yeudienthoai/login"){	
		const mailResponse = _validateMail(inputUser.value);
		const passwordResponse = _validatePassword(inputPassword.value);

		// Validate thành công sẽ submit form, không thì sẽ báo lỗi tương ứng
		if (mailResponse == "ok" && passwordResponse == "ok") {
			account.submit();
			return;
		}else{
			noteText.forEach(ele=>ele.innerHTML="");
			noteText.forEach(ele=>ele.previousElementSibling.style.border="");
		}
		if(mailResponse != "ok"){
			_generateHtml(mailResponse,inputUser);
		}
		if(passwordResponse != "ok"){
			_generateHtml(passwordResponse,inputPassword);
		}
		
	}

});

function _validateName (data){
	let dataResponse = "ok";
	if (!data){
		dataResponse = "Tên của bạn không được trống.";
	}
	return dataResponse;
}

function _validateMail (data){
	let dataResponse = "ok";
	if (!data) {
		dataResponse = "Email không được trống.";
	} else if (!regMail.test(data)){
		dataResponse = "Email chưa đúng định dạng.";
	}
	return dataResponse;
}

function _validatePassword (data){
	let dataResponse = "ok";
	if (!data) {
		dataResponse = "Mật khẩu không được trống.";
	} else if (!regex.test(data)){
		dataResponse = "Mật khẩu chưa đúng định dạng.";
	}
	return dataResponse;
}

function _validateConfirm (data, data1){
	let dataResponse = "ok";
	if (!data) {
		dataResponse = "Mật khẩu không được trống.";	
	} else if (data != data1 ){
		dataResponse = "Mật khẩu chưa khớp.";
	}	
	return dataResponse;
}

function _generateHtml(err, ele) {
	ele.style.border="1px solid var(--red)";
	ele.nextElementSibling.insertAdjacentHTML("afterbegin", err);
}


























