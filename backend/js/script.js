var texts = ["Введите Ваше имя:", "Введите Вашу фамилию:", "Введите Вашу почту:", "Спасибо!"];
var step = 0;
var emailPattern = /[0-9a-z\.]+@[0-9a-z]+\.[a-z]{2,5}/;

function back() {
	switch(step) {
		case 1:
			$(".back-button").addClass("invisible");
		case 2:
			step--;
			document.getElementById("text").innerHTML = texts[step];
	}		document.getElementById("name").value = "";
}

function next() {
	switch(step) {
		case 0:
		case 1:
			if(document.getElementById("name").value === "") {
				alert("Поле не должно быть пустым");
			} else {
				step++;
				document.getElementById("text").innerHTML = texts[step];
				$(".back-button").removeClass("invisible");
				document.getElementById("name").value = "";
			}
			break;
		case 2:
			if(document.getElementById("name").value === "") {
				alert("Поле не должно быть пустым");
			} else if(!emailPattern.test(document.getElementById("name").value)) {
				alert("Некорректный email");
			} else {
				step++;
				document.getElementById("text").innerHTML = texts[step];
				$(":input").addClass("invisible");
			}
	}	
}