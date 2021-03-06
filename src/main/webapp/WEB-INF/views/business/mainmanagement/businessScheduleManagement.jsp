<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- title -->
    <title>businessScheduleManagement :: Laundry</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- content css -->
	<link rel="stylesheet" href="${cpath }/business/css/management/businessScheduleManagement.css">
	<!-- calendar css -->
	<link rel="stylesheet" href="${cpath }/business/css/management/businessScehduleCalendar.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- jQuery -->
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>

	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp"%>

	<!-- section -->
	<section>
		<!-- top-header(membership) -->
		<%@ include file="../main/businessSubHeader.jsp"%>

		<!-- 일정관리 -->	
		<!-- <form class="content_wrapper"> -->
		<div class="content_wrapper">
			<!-- 영업 시간-->
			<!-- <form class="working_hour"> -->
			<div class="working_hour">
				<!-- title -->	
				<div class="content_title_con">
					<div>
						<span class="content_title">영업 시간 설정</span>
						<i class="far fa-question-circle" style="font-weight: 600">도움말</i>
					</div>
					<!-- buttons -->
					<div class="btn_con">
						<div id="modify-working-hour" class="btn format_btn">
							<div class="icon_con">
								<i class="fas fa-plus-square"></i>
							</div>
							<div class="btn_title">시간 수정</div>
						</div>
						<div id="complete-working-hour" class="btn update_btn">
							<div class="icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="btn_title">수정 완료</div>
						</div>
					</div>
				</div>
				<!-- input -->
				<div class="working_hour_input">
				
					<!-- 체크 옵션 -->
					<div class="select_con">
						<!-- 주말 운영 옵션 -->
						<div class="radio_con">
							<button id="week-only-btn" class="btn radioBtn" onclick="radioSelect('week-only')">
								주말 휴무
							</button>
							<input id="week-only" type="radio" name="workingHour">
							<button id="weekend-also-btn" class="btn radioBtn" onclick="radioSelect('weekend-also')">
								주말 운영
							</button>
							<input id="weekend-also" type="radio" name="workingHour">
						</div>
						<!-- 토/일 선택 체크박스 -->
						<div class="checkbox_con">
							<input id="weekday-only" type="checkbox" name="" value="">
							<button id="weekday-only-btn" class="checkBtn" onclick="checkOption('weekday-only')" disabled>토요일 운영</button>
							<input id="whole-week" type="checkbox" name="" value="">
							<button id="whole-week-btn" class="checkBtn" onclick="checkOption('whole-week')" disabled>일요일 운영</button>
						
						</div>
					</div>	
					
					<!-- 시간 입력 -->
					<div class="input_time_form">
						<ul class="input_title_con">
							<li class="day_range">월 ~ 금</li>
							<li class="day_range">토</li>
							<li class="day_range">일</li>
						</ul>
						<ul class="input_time_con">
							<li class="time_range">
							<!-- from -->
								<div class="time_zone_con">
									<input class="time_zone_input" type="radio" name="timeZone" value="daytime">
									<button class="btn time_zone_btn border_r">오전</button>
									<input class="time_zone_input" type="radio" name="timeZone" value="nighttime">
									<button class="btn time_zone_btn border_l">오후</button>
								</div>
								<input type="number" name="hour" max="12" placeholder="시">
								<input type="number" name="minute" max="59" placeholder="분">
								<div class="time_range_text">
									<span>부터</span>
								</div>
							<!-- to -->
								<div class="time_zone_con">
									<input class="time_zone_input" type="radio" name="timeZone" value="daytime">
									<button class="btn time_zone_btn border_r">오전</button>
									<input class="time_zone_input" type="radio" name="timeZone" value="nighttime">
									<button class="btn time_zone_btn border_l">오후</button>
								</div>
								<input type="number" name="hour" max="12" placeholder="시">
								<input type="number" name="minute" max="59" placeholder="분">
								<div class="time_range_text">
									<span>까지</span>
								</div>
								<div class="all_day_con">
									<button class="btn">
										<i class="far fa-clock"></i>
										<span>24시간</span>
									</button>
								</div>
							</li>
							<li class="time_range"></li>
							<li class="time_range"></li>							
						</ul>
					</div>
				</div>
				
			</div>
			<!-- </form> -->
			
			<!-- 정기 휴무 설정 -->
			<!-- <form class="holiday"> -->
			<div class="holiday">
				<!-- title -->
				<div class="content_title_con">
					<div>
						<span class="content_title">정기 휴무 설정</span> 
						<i class="far fa-question-circle" style="font-weight: 600">도움말</i>
					</div>
					<!-- button -->
					<div class="btn_con">
						<div id="modify-holiday" class="btn format_btn">
							<div class="icon_con">
								<i class="fas fa-plus-square"></i>
							</div>
							<div class="btn_title">일자 변경</div>
						</div>
						<div id="complete-holiday" class="btn update_btn">
							<div class="icon_con">
								<i class="fas fa-check-square"></i>
							</div>
							<div class="btn_title">수정 완료</div>
						</div>
					</div>
				</div>

				<!-- input -->
				<div>


					<!-- 달력 -->
					<div id="calander" class="calendar">
						<div class="calendar_selector_con">
							<!-- year(left) -->
							<div class="year_selector">
								<button class="calendar_btn" onclick="showMenu('years')">
									<span id="current-year"></span>
								</button>
								<div id="years" class="years" style="display: none;"></div>
							</div>
							<!-- month(right) -->
							<div class="month_selector">
								<button class="calendar_btn" onclick="showMenu('months')">
									<span id="current-month"></span>
								</button>
								<div id="months" class="months" style="display: none;"></div>
							</div>
						</div>

						<!-- date & day -->
						<div class="calendar_day_con">
							<!-- day of week -->
							<div class="day_of_week">
								<div class="day">일요일</div>
								<div class="day">월요일</div>
								<div class="day">화요일</div>
								<div class="day">수요일</div>
								<div class="day">목요일</div>
								<div class="day">금요일</div>
								<div class="day">토요일</div>
							</div>

							<!-- days -->
							<div id="calendar-days" class="days"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- </form> -->
		</div>
		<!-- </form> -->
	</section>

<!-- footer -->
	<%-- <%@ include file="../main/businessFooter.jsp" %> --%>

	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/interface.js"></script>
	<script type="text/javascript" src="${cpath }/business/js/scheduleManagement/calendar.js"></script>


</body>
</html>