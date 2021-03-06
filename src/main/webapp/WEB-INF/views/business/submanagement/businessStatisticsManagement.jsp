<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: businessStatisticsManagement</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- businessStatisticsManagement css -->
	<link rel="stylesheet" href="${cpath }/business/css/submanagement/businessStatisticsManagement.css">
	
	
	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- Google Chart -->
   	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
	
	<!-- sub-header(membership) -->
	<%@ include file="../main/businessSubHeader.jsp" %>
	
	  <!-- <div id="myPieChart"></div> -->

	<div class="container">
		<h1 style="font-size: 36pt">통계</h1>
		<div class="flex1">
			<button onclick="contentChange(this)" name="Hits/">조회수</button>
			<button onclick="contentChange(this)" name="Orders/">주문수</button>
			<button style="margin-right: 0 !important;"  onclick="contentChange(this)" name="Price/">주문금액</button>
		</div>
		<div class="flex2">
			<div class="flex3">
				<button class="selected" onclick="lastpath(this)" value="Day/">일간</button>
				<button onclick="lastpath(this)" value="Week/">주간</button>
				<button onclick="lastpath(this)" value="Month/">월간</button>
			</div>
			<div class="flex4">
				<input type="date" name="startDate" id="startDate">
				<span>~</span>
				<input type="date" name="endDate" id="endDate">
			</div>
		</div>
		<div id="chart_div"></div>
		
	</div>



	</section>
	
	
<script type="text/javascript">
/* google.charts.load('current', {packages: ['corechart'], language: 'ja', callback: drawChart});	// current : 현재버전 -> 43버전이면 '43'으로 입력
															// upcoming : 업그레이드 될 예정인 버전
															// 즉, 내가 어떤 특정한 버전을 지정해서 사용하고 싶으면 그 숫자로 입력해야 한다
															// 이것을 'Frozen chart versions' 라고 부른다
															// language 로 나라 언어를 정할 수 있음
// google.charts.setOnLoadCallback(drawChart);
// .setOnLoadCallback(drawChart) 아니라 아래로도 표현가능
//  google.charts.load('current', { packages: [ 'corechart'], callback: drawChart });

function drawChart() {	// callback 시킬 때의 이름과 똑같은 함수여야 합니다
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Element');
  data.addColumn('number', 'Percentage');
  data.addRows([
    ['Nitrogen', 0.78],
    ['Oxygen', 0.17],
    ['Other', 0.05]
  ]);

  // Instantiate and draw the chart.
  var chart = new google.visualization.PieChart(document.getElementById('myPieChart'));
  chart.draw(data, null);
} */

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart1);


//전역변수
var statisticsList =  ${statisticsList };
var lastPath = 'Day/';
var startdatepath = statisticsList[0].start + '/';
var enddatepath = statisticsList[statisticsList.length - 1].end  + '/';

window.onload = function() {
	document.querySelector('div.flex1 button[name="${pageKind}"]').className = 'selected';
	statisticsList = ${statisticsList };
	console.log(statisticsList);
	
	document.getElementById('startDate').value = statisticsList[0].start;
	document.getElementById('endDate').value = statisticsList[statisticsList.length - 1].end;
}

function getWeekNum(formatday) {
	let weekday = new Date(formatday);
    const firstDayOfYear = new Date(weekday.getFullYear(), weekday.getMonth(), 1);
    const pastDaysOfYear = (new Date(weekday) - firstDayOfYear) / 86400000;	//60 x 60 x 24 x 1000
	console.log('결과 : ', Math.ceil((pastDaysOfYear + firstDayOfYear.getDay() + 1) / 7));
	return Math.ceil((pastDaysOfYear + firstDayOfYear.getDay() + 1) / 7);
}

	
function drawChart1() {
// Create the data table.
const data = new google.visualization.DataTable();
data.addColumn('string', 'LastDate');
data.addColumn('number', 'View');
// data.addRows 는 한번에 데이터를 입력하는 것이고, data.addRow는 하나씩 데이터를 입력하는 것이다
// 즉, Json 형태로 받아온 녀석을 바로 입력하려면 data.addRows 를 사용하고
// 반복문을 통하여 어떤 작업을 수행하고 싶다면 data.addRow를 사용하시오
// data.addRows([				
//   ['Mushrooms', 3],
//   ['Onions', 1],
//   ['Olives', 1], 
//   ['Zucchini', 1],
//   ['Pepperoni', 2]
// ]);

// 		let today = new Date(statisticsList[2].startdate);
// 		let year = today.getFullYear(); // 년도
// 		let month = today.getMonth() + 1;  // 월
// 		let date = today.getDate();  // 날짜
// 		let day = today.getDay();  // 요일
var i = 0;
if (document.querySelector('.flex3 button.selected').value == 'Day/') {
	for(i = 0; i < statisticsList.length; i++){
 		if(i == 0) {
 			data.addRow(['', 0]);
 		}
		data.addRow([statisticsList[i].end, statisticsList[i].value]);
	}
}
else if (document.querySelector('.flex3 button.selected').value == 'Week/') {
	for (i = 0; i < statisticsList.length; i++){
 		if(i == 0) {
 			data.addRow(['', 0]);
 		}
 		const splitDate1 = (statisticsList[i].end).split('-');
//  		console.log('statisticsList[i].enddate : ', statisticsList[i].enddate);
		data.addRow([splitDate1[1] + '월 ' + getWeekNum(statisticsList[i].enddate) +  '주', statisticsList[i].value ]);
	}
}
else if (document.querySelector('.flex3 button.selected').value == 'Month/') {
	for(i = 0; i < statisticsList.length; i++){
 		if(i == 0) {
 			data.addRow(['', 0]);
 		}
 		const splitDate2 = (statisticsList[i].end).split('-');
		data.addRow([splitDate2[0] + '년 ' + splitDate2[1] + '월', statisticsList[i].value]);
	}
}
// data.setCell(2,0,'lswn');

var options = {
		  'legend': 'none',
		  'title': (document.querySelector('.flex1 button.selected').name).slice(0,-1) + ' / ' + (document.querySelector('.flex3 button.selected').value).slice(0,-1) + ' Graph',
		  'is3D':true,
		  'width': 1100,
		  'height':800,
		  animation:{
		        duration: 1000,
		        easing: 'out'
		      },
//		  'curveType': 'function',
		  'chartArea': {right: 40, width: '85%'},
		  series: {
			0: {lineWidth: 3,				// 선 굵기
				pointShape: 'Circle',		// 포인트 부분 모양
				pointSize: 18,				// 포인트 부분 굵기
			},
		  },
		  hAxis: {
			  title: 'Date',
			  textPosition: 'out',
			  titleTextStyle: {color: 'black', fontSize: '40px'},
// 				direction : -1, // 상하 반전
			  "slantedText" : true,
// 			  "slantedTextAngle" : 45,
		  },
		  vAxis: {
			  className:'12345',
			  title: (document.querySelector('.flex1 button.selected').name).slice(0,-1),
			  titleFontSize: 18,
			  viewWindow: {
	              min:0,
	            },
	          baselineColor: 'none',	// 밑줄친 부분 색상
		  },
		  colors: ['black'],

		}

const chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
chart.draw(data, options);

let axies = document.querySelectorAll('svg g g text[text-anchor="middle"]');
for(k = 0; k < axies.length; k++) {
	axies[k].style.fontSize = '20pt';
}

console.log('startdatepath : ' , startdatepath);
console.log('enddatepath : ' , enddatepath);
console.log('lastPath : ' , lastPath);
console.log('path : ', window.location.href + 'Day/' + startdatepath + enddatepath );
}




document.getElementById('startDate').addEventListener('change', function() {
// 	console.log('vlaue1 : ', this.value);
	const endDate = document.getElementById('endDate').value;
	startdatepath = this.value + '/';
	if(endDate == '') {
		return false;
	}
	if(endDate < this.value ) {
		alert('끝 날짜보다 앞선 날짜를 선택해 주십시오');
		this.value = '';
		return false;
	}
	// ■ 영경 : 아래 코드에서 에러가 나서 주석 처리함 ■
// 	console.log('path : ', document.querySelector('.flex button.selected').name);

	pageKindAxios(document.querySelector('.flex3 button.selected').value);
	
})

document.getElementById('endDate').addEventListener('change', function() {
// 	console.log('vlaue2 : ', this.value);
	const startDate = document.getElementById('startDate').value;
	if(startDate > this.value) {
		alert('시작 날짜보다 지난 날짜를 선택해 주십시오');
		this.value = '';
		return false;
	}
	if(startDate == '') {
		return false;
	}
	enddatepath = this.value + '/';
	pageKindAxios(document.querySelector('.flex3 button.selected').value);
})

// 동기식으로 페이지 이동시켜주는 함수(조회수, 주문수, 주문금액)
function contentChange(obj) {
	location.href = window.location.href + obj.name + 'Day/' + startdatepath + enddatepath;
}

// 일간, 주간, 월간을 구분시켜주는 함수
function lastpath(obj) {
	lastPath = obj.value;
	for(i = 0; i < obj.parentNode.children.length; i++) {
 		obj.parentNode.children[i].className = '';
	}
	obj.className = 'selected';
	pageKindAxios(obj.value);
}


// 날짜를 선택했을 때 새로운 리스트 들고오는 함수
function pageKindAxios(path) {
	
	let ob={	// ■ 영경 : pagekind의 k를 대문자로 수정 ■
				'pageKind' : (document.querySelector('.flex1 button.selected').name).slice(0,-1),
				'option' : path.slice(0,-1),
				'startDate': document.getElementById('startDate').value,
			    'endDate': document.getElementById('endDate').value,
	      	};

	if(document.getElementById('endDate').value == '' && document.getElementById('startDate').value == '') {
		let today = new Date();
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		let day = today.getDay();  // 요일
		let prevyear, prevmonth, prevdate = null;
		switch (path) {
		case 'Day/':
			today.setDate(today.getDate()  - 6);
			prevyear = today.getFullYear();
			prevmonth = today.getMonth() + 1;
			prevdate = today.getDate();
			ob.endDate = year + '-' + month + '-' + date;
			ob.startDate = prevyear + '-' + prevmonth + '-' + prevdate;
			break;
		case 'Week/':
			today.setDate(today.getDate()  - 35);
			prevyear = today.getFullYear();
			prevmonth = today.getMonth() + 1;
			prevdate = today.getDate();
			ob.endDate = year + '-' + month + '-' + date;
			ob.startDate = prevyear + '-' + prevmonth + '-' + prevdate;
			break;
		case 'Month/':
			today.setDate(today.getDate()  - 120);
			prevyear = today.getFullYear();
			prevmonth = today.getMonth() + 1;
			prevdate = today.getDate();
			ob.endDate = year + '-' + month + '-' + date;
			ob.startDate = prevyear + '-' + prevmonth + '-' + prevdate;
			break;
		}
	}
	
	console.log('ob : ',ob);
	const axiosPath = '/drumtong/business/subManagement/businessStatisticsManagement/rest/';
	const axPost = async (ob) => { // ■ 영경 : 여기 ob를 넘겨주지 않았음! ■   // async : 비동기 실행 함수
	    await axios.post(axiosPath, ob)	// ■ 영경 : 여기 ob를 넘겨주지 않았음! ■
	    // 정상
			.then( (response) => {
	    const data = response.data;
// 	    console.log('data : ', data);
	  	statisticsList = data;			// 반환 결과 불러오기
	  	document.getElementById('chart_div').innerHTML = '';
	    drawChart1();
	     })
	  }
	return axPost(ob);
}

</script>
</body>
</html>