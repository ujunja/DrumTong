// 상품 추가 버튼
const addItemBtn = document.getElementById('add-item-btn');
// 상품 추가 완료 버튼
const updateItemBtn = document.getElementById("update-item-btn");
// 줄을 추가할 컨테이너
const itemlist = document.getElementById('add-item-list')
// 입력 줄 전체
let singleList = document.querySelector('.single_item_selector');
// 메뉴 테이블 수정 버튼
const modifyListBtn = document.getElementById("update-list-btn");
// 테이블 내부 행 삭제 버튼
const deleteBtn = document.getElementsByClassName("delete_item");


// 취소 - 클릭 이벤트(1줄씩 추가)
addItemBtn.addEventListener('click', function() {
	console.log('Add List');
	singleList = singleList.cloneNode(true);
	itemlist.appendChild(singleList);
});

// 등록 - 클릭이벤트(작성한 리스트 추가)
updateItemBtn.addEventListener('click', function() {
	console.log('Update List');
})

// 메뉴 수정 버튼(th & td > input + 삭제 버튼)
modifyListBtn.addEventListener('click', function() {
	
	// 삭제 활성화가 되어 있을 시(폼 변경 후), 작동안함
	if(document.getElementById("delete_title")) {
		return;
	}
	
	const tableHead = document.getElementsByClassName("current_menu_table")[1].getElementsByTagName("thead")[0];
	const tableBody = document.getElementsByClassName("current_menu_table")[1].getElementsByTagName("tbody")[0];
	
	// 상품 리스트 수(= 행 개수)
	const tr = tableBody.getElementsByTagName("tr");
	const trLength = tr.length;
	
	// 열 길이
	const columnLength = tableHead.children[0].children.length;
	
	// 수정 폼 타입(X > index를 사용한 switch로 대체)
	// const types = [ "first_select", "second_select", "detail", "price", "time"];
	
	// 테이블(thead) 삭제 열 추가
	const deleteList = document.createElement("th");
	deleteList.setAttribute("id", "delete_title");
	deleteList.scope = "cols";
	deleteList.innerHTML = "삭제";
	deleteList.style.width = "5%";
	
	tableHead.children[0].appendChild(deleteList);
	
	// 테이블(tbody) 삭제 버튼 추가 & 폼(input) 변경
	for(let i = 0; i < tr.length; i++) {
		const td = document.createElement("td");
		td.style.padding = "5px";
		
		// 내부 폼 변경	
		for (let j = 0; j < columnLength; j++) {
			const select = document.createElement("select");
			const defaultOption = document.createElement("option");
			const testOption = document.createElement("option");
			const typeOption = document.createElement("option");
			const directInput = document.createElement("input");
			
			const detailInput = document.createElement("input");
			const priceInput = document.createElement("input");
			const timeInput = document.createElement("input");

		// 홀수 행(흰색 배경)
			if(i % 2 !== 0) {
				td.setAttribute("class", "even delete_item");
				td.innerHTML = "<div onclick='deleteList(this.parentElement.parentElement)'>" + "<i class='fas fa-times'></i>" + "<span>삭제</span>" + "</div>";
			}
		// 짝수 행(하늘색 배경)
			else {
				td.setAttribute("class", "delete_item");
				td.innerHTML = "<div onclick='deleteList(this.parentElement.parentElement)'>" + "<i class='fas fa-times'></i>" + "<span>삭제</span>" + "</div>";			
			}
			
		// switch
			switch(j) {
		// 첫번째 select
			case 0:	
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].style.width = "13%";
				tr[i].children[j].style.padding = "5px";

				select.className = "service_selector";
				select.name = ""
				select.setAttribute("onchange", "directType(this)");
				
				// (DB) 옵션 추가(types ~ 직접입력)
				// placeholder
				defaultOption.hidden = "true";
				defaultOption.disabled = "true";
				defaultOption.selected = "true";
				defaultOption.innerHTML = "초기값(DB)";			
				defaultOption.value = "초기값(DB)";			
				
				// 기타 옵션들(사용자에 따라 설정된 옵션)
				testOption.innerHTML = "Service 1";
				
				// 직접입력
				typeOption.value = "selectedDirect";
				typeOption.className = "selectedDirect"; 
				typeOption.innerHTML = "직접입력";
				
				// 옵션 주입
				select.appendChild(defaultOption);
				select.appendChild(testOption);
				select.appendChild(typeOption);
				
				// 직접입력 input 생성
				directInput.type="text";
				directInput.className = "direct_type_input";
				directInput.name = "";
				directInput.placeholder = "서비스 입력";
				directInput.style.display = "none";
				
				// select & input 주입
				tr[i].children[j].appendChild(select);
				tr[i].children[j].appendChild(directInput);
				
				break;
				
		// 두번째 select
			case 1:
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].style.width = "13%";
				tr[i].children[j].style.padding = "5px";
				
				select.className = "service_selector";
				select.name = ""
				select.setAttribute("onchange", "directType(this)");
				
				// (DB) 옵션 추가(types ~ 직접입력)
				// placeholder
				defaultOption.hidden = "true";
				defaultOption.disabled = "true";
				defaultOption.selected = "true";
				defaultOption.innerHTML = "초기값(DB)";			
				defaultOption.value = "초기값(DB)";			
				
				// 기타 옵션들(사용자에 따라 설정된 옵션)
				testOption.innerHTML = "Type 1";
				
				// 직접입력
				typeOption.value = "selectedDirect";
				typeOption.className = "selectedDirect"; 
				typeOption.innerHTML = "직접입력";
				
				// 옵션 주입
				select.appendChild(defaultOption);
				select.appendChild(testOption);
				select.appendChild(typeOption);
				
				// 직접입력 input 생성
				directInput.type="text";
				directInput.className = "direct_type_input";
				directInput.name = "";
				directInput.placeholder = "서비스 입력";
				directInput.style.display = "none";
				
				// select & input 주입
				tr[i].children[j].appendChild(select);
				tr[i].children[j].appendChild(directInput);
				
				break;
		// 세부내용
			case 2:	
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].className += " third_item_prop";
				tr[i].children[j].style.width = "43%";
				tr[i].children[j].style.padding = "5px";
				
				detailInput.type = "text";
				detailInput.className = "service_detail_input";
				detailInput.placeholder = 
					tr[i].children[j].innerHTML ? "초기값(DB)" : "세부 서비스 내용을 입력해주세요.";
				
				tr[i].children[j].appendChild(detailInput);
				
				break;
		// 가격
			case 3:	
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].className += " forth_item_prop";
				tr[i].children[j].style.width = "10%";
				tr[i].children[j].style.padding = "5px";
				
				priceInput.type = "text";
				priceInput.className = "service_detail_input";
				priceInput.placeholder = 
					tr[i].children[j].innerHTML ? "초기값(DB)" : "가격(원)";
				
				tr[i].children[j].appendChild(priceInput);
				
				break;
		// 시간
			case 4:	
				// 초기화(default 값 지정 가능)
				tr[i].children[j].innerHTML = "";
				tr[i].children[j].className += " fifth_item_prop";
				tr[i].children[j].style.width = "10%";
				tr[i].children[j].style.padding = "5px";
				
				timeInput.type = "text";
				timeInput.className = "service_detail_input";
				timeInput.placeholder = 
					tr[i].children[j].innerHTML ? "초기값(DB)" : "소요시간";
				
				tr[i].children[j].appendChild(timeInput);
				
				break;
			}
			
			let value = tr[i].children[j].innerHTML;
//			console.log(value);
			
		}
		
		
		tr[i].appendChild(td);						
		
	}
});

// 상품 리스트 삭제
function deleteList(tr) {
	const answer = confirm("해당 목록을 삭제하시겠습니까?");
	if (answer === true ) {
		tr.remove();		
	}
}

// 취소 버튼
function dismissInput(entireNode) {
	// 목록이 하나 남았을 때
	if (itemlist.children.length === 1) {
		
		const directInputs = document.querySelectorAll(".direct_type_input");
		const selector = document.querySelectorAll(".service_selector");
		const directInputCheck = document.querySelectorAll(".selectedDirect");
		
		// 직접입력 체크 O > input 제거 & 값 초기화
		if(directInputCheck[0].selected === true || directInputCheck[1].selected === true) {
			directInputs[0].value = '';
			directInputs[1].value = '';
			directInputs[0].style.display = 'none';
			directInputs[1].style.display = 'none';
		    
		}
		
		// 직접입력 체크 X > select 옵선 초기화
		selector[0].children[0].selected = true;
		selector[1].children[0].selected = true;
		
		// 세부내용, 가격, 시간 초기화
		document.querySelector(".service_detail_input").value = '';
		document.querySelector(".service_price_input").value = '';
		document.querySelector(".service_time_input").value = '';

		return;
	}
	
	// 목록이 2개 이상 > 해당 줄 삭제
	entireNode.remove();
}

//직접입력 > input 열기
function directType(obj) {
	if(obj.value === 'selectedDirect') {
		obj.parentNode.querySelector('.direct_type_input').style.display = '';s
	}
	else {
		obj.parentNode.querySelector('.direct_type_input').style.display = 'none';
		obj.parentNode.querySelector('.direct_type_input').value = '';
	}
}

