document.querySelector('.openbtn').addEventListener('click', function(){
	document.querySelector('#sidebar').classList.toggle('show-sidebar');
});

document.querySelectorAll('.components li').forEach(el=>{
	if(el.dataset.active == document.querySelector('body').id){
		el.classList.add('active');
	}else{
		el.classList.remove('active');
	}
})