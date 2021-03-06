// default text
document.getElementsByClassName('store_intro_input')[0].value
	= document.getElementsByClassName('shop_text_view')[0].innerHTML.trim();

//Test Introduction Modal
const introModal = document.getElementById('intro-modal');
const introBtn = document.getElementById('intro-modal-btn');
const closeSpan = document.getElementsByClassName('intro_close')[0];                                          

introBtn.addEventListener('click', function(e) {
	introModal.style.display = "block";	
});

closeSpan.onclick = function() {
	introModal.style.display = "none";
}

window.onclick = function(e) {
    if (e.target == introModal) {
    	introModal.style.display = "none";
    }
}

// 테이블 초기 레이아웃 (13, 13, 48, 10, 10 - %)
const thead = document.getElementById("item-list-thead");
const tbody = document.getElementById("item-list-tbody");
const ths = thead.getElementsByTagName("th");

for (let i = 0; i < ths.length; i++) {
	switch(i) {
	case 0:
		ths[i].style.width = "13%";
		break;
	case 1:
		ths[i].style.width = "13%";
		break;
	case 2:
		ths[i].style.width = "48%";
		break;
	case 3:
		ths[i].style.width = "10%";
		break;
	case 4:
		ths[i].style.width = "10%";
		break;
	default:
		alert("설정된 항목 5개 초과");
	}
}