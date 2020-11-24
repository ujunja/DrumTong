<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
	<!-- title -->
    <title>businessShopManagement :: Laundry</title>

	<!-- global css -->	
	<link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
	<!-- sub header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSubHeader.css">
	<!-- side header css -->
	<link rel="stylesheet" href="${cpath }/business/css/businessSideHeader.css">
	<!-- content css -->
	<link rel="stylesheet" href="${cpath }/business/css/management/businessShopManagement.css">

	<!-- Font -->
   	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
   
   	<!-- icon -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

   	<!-- Axios -->
   	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   	
   	<!-- jQuery -->
   	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
     

<!-- body -->
<body>
	
	<!-- side-header(navbar) -->
	<%@ include file="../main/businessSideHeader.jsp" %>
	
	<!-- section -->
	<section>
		<!-- top-header(membership) -->
		<%@ include file="../main/businessSubHeader.jsp" %>
		
		<div class="shop_introduction">
			<div class="shop_image_con">
				
			<!-- title -->	
				<div class="shop_info_title_con">
					<span class="shop_info_title">매장 사진</span>
				</div>
				
			<!-- cover-image input form -->
				<form id="shop-image-view" class="shop_image_view">
					<div class="upload_icon_con">
						<label for="cover-img-upload" class="upload_link">
							<i class="fas fa-upload fa-3x"></i>
						</label>
						<div class="cover_file_text_con">
						
						<!-- select cover image -->
							<div class="cover_file_text">
								매장 대표사진 업로드(위 아이콘 클릭)
							</div>
						
						<!-- cover image name view -->	
							<input id="file-name" class="upload_file_name" type="text" readonly disabled
								onchange='return checkFile()' placeholder="현재 선택된 사진이 없습니다.">
								
						<!-- cover image input -->
							<input id="cover-img-upload" class="upload_file_input" type="file"
								onchange="javascript:document.getElementById('file-name').value=this.value">
						
						<!-- upload cover image button for modification -->		
							<span>
								<input class="upload_button" type="button" onclick="imageCheck('file-name')" value="확인">
							</span>
							
						</div>
					</div>
				</form>
			
			<!-- image viewer as long as cover image is already uploaded when you visit this page for modification -->
				<div id="main-image-con" class="main_image_con">
					<img id="main-image">
				</div>
				
			<!-- Sub Slider -->
				<div style="position: relative;">
					<ul id="image-preview" class="shop_image_slider">
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_02.jpg" alt="">
							<i class="fas fa-times"></i>
							<i class="fas fa-star"><span>대표사진</span></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_03.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_04.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_02.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_03.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
						<li class="shop_picture">
							<img src="${cpath }/resources/business/img/laundry1_04.jpg" alt="">
							<i class="fas fa-times"></i>
						</li>
					</ul>

				<!-- Slide Move Button -->
					<div class="slide_btn">
   	        			<a class="prev">&#10094;</a>
       	    			<a class="next">&#10095;</a>
       				</div>	
       						
       			<!-- add new photo -->			
       				<div id="photo-modal-btn" class="photo_add_con">
       					<input id="add-photo" class="add_photo_input" type="file" name="" onchange="imageCheck('add-photo')">
       					<label for="add-photo">
       						<span>새로운 사진 추가하기
       							<i class="far fa-images"></i>
       						</span>
       					</label>
       				</div>
        		</div>
			</div>
			
		<!-- Text Introduction -->
			<div class="shop_text_intro_con">
			
			<!-- title -->
				<div class="shop_info_title_con">
					<span class="shop_info_title">매장 소개글</span>
				</div>
			
			<!-- text content -->
				<div class="shop_text_intro">
					<p class="shop_text_view">
						이곳은 당신이 작성한 매장 소개글을 확인할 수 있는 칸입니다. 작성한 글이 마음에 들지 않을 경우 아래 '작성하기'버튼을 통해 기존에 작성하신 글을 수정하시거나 새로운 내용의 소개글을 작성하실 수 있습니다.
					</p>
				</div>

			<!-- add store introduction -->
				<div id="intro-modal-btn" class="intro_add_con">
       				<span>매장 소개글 등록 & 수정
       					<i class="far fa-file-alt"></i>
       				</span>
       			</div>
			
			</div>
			
		 	
		</div>


		<!-- menu table -->
		<div class="current_menu_con">

			<!-- title -->
			<div class="shop_info_title_con">
				<span class="shop_info_title">등록된 서비스 메뉴</span>
			</div>

			<div class="current_menu">

			<!-- empty table -->
				<table class="current_menu_table">
					<!-- thead -->
					<thead>
						<tr>
							<th scope="cols">서비스 유형</th>
							<th scope="cols">서비스 타입</th>
							<th scope="cols">세부 내용</th>
							<th scope="cols">가격</th>
							<th scope="cols">예상 소요시간</th>
							<th scope="cols">기타</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="even" colspan="6" style="text-align: center">
								등록된 상품 목록이 없습니다.<br>
								아래 [서비스 등록] 항목에서 서비스 등록이 필요합니다.	
							</th>
						</tr>
					</tbody>
				</table>
				
			<!-- registered table -->
				<table class="current_menu_table">
				<!-- thead -->
					<thead>
						<tr>
							<th scope="cols">서비스 유형</th>
							<th scope="cols">서비스 타입</th>
							<th scope="cols">세부 내용</th>
							<th scope="cols">가격</th>
							<th scope="cols">예상 소요시간</th>
							<th scope="cols">기타</th>
						</tr>
					</thead>
					
				<!-- tbody -->
					<tbody>
						<tr>
							<th scope="row">서비스1</th>
							<td>내용1</td>
							<td>내용2</td>
							<td>내용3</td>
							<td>내용4</td>
							<td>내용5</td>
						</tr>
						<tr>
							<th scope="row" class="even">서비스2</th>
							<td class="even">내용1</td>
							<td class="even">내용2</td>
							<td class="even">내용3</td>
							<td class="even">내용4</td>
							<td class="even">내용5</td>
						</tr>
						<tr>
							<th scope="row">서비스3</th>
							<td>내용1</td>
							<td>내용2</td>
							<td>내용3</td>
							<td>내용4</td>
							<td>내용5</td>
						</tr>
						<tr>
							<th scope="row" class="even">서비스4</th>
							<td class="even">내용1</td>
							<td class="even">내용2</td>
							<td class="even">내용3</td>
							<td class="even">내용4</td>
							<td class="even">내용5</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- create menu -->
		<div class="create_menu_con">

			<!-- title -->
			<div class="shop_info_title_con">
				<span class="shop_info_title">서비스 등록</span>
				<i class="far fa-question-circle">도움말</i>
				<!-- add button -->
				<div id="add-item-btn" class="add_menu_btn_con">
					<div class="add_menu_icon_con">
						<i class="fas fa-plus-square"></i>
					</div>
					<div class="add_menu_btn_title">메뉴 추가</div>
				</div>
			</div>

			<div class="create_menu">
			
			
			<!-- item customizing -->
				
			<!-- head -->
				<div style="display: block">
					<ul class="customize_menu_head">
						<li class="service_main">서비스 유형</li>
						<li class="service_sub">서비스 타입</li>
						<li class="service_details">세부 내용</li>
						<li class="service_price">가격</li>
						<li class="service_time">예상 소요시간</li>
						<li class="service_confirm">확인</li>
						<li class="service_cancle">삭제</li>
					</ul>
				</div>
<!-- ----------------------------------------- -->
				<div id="add-item-list" class="add_item_list">
					
					<div class="single_item_selector">
						
						<div class="first_item_prop">
							<select id="first-selector" class="service_selector" name="" onchange="directType('first-type')">
								<option hidden="true" disabled selected>서비스 타입 선택</option>
								<option value="">type1</option>
								<option value="">type2</option>
								<option value="">type3</option>
								<option value="">type4</option>
								<option value="">type5</option>
								<option id="first-type" value="">직접입력</option>
							</select>
							<input type="text" class="first_direct_input" name="">
						</div>
						
						<div class="second_item_prop">
							<select id="second-selector" class="service_selector" onchange="directType('second-type')">
								<option hidden="true" disabled selected>세부 서비스 유형 선택</option>
								<option value="">type1</option>
								<option value="">type2</option>
								<option value="">type3</option>
								<option value="">type4</option>
								<option value="">type5</option>
								<option id="second-type" value="selectDirectType">직접입력</option>
							</select>
					<!-- <input type="text" name=""> -->
						</div>
						
						<div class="third_item_prop">
							<input type="text" name="" placeholder="세부 서비스 내용을 입력해주세요.">
						</div>

						<div class="forth_item_prop">
							<input type="text" name="" placeholder="서비스 가격(원)">
						</div>

						<div class="fifth_item_prop">
							<input type="text" name="" placeholder="서비스 소요시간">
						</div>
						
						<div class="complete_listing">
							<i class="fas fa-check"></i>
							<span>확인</span>
						</div>

						<div class="cancle_listing">
							<i class="fas fa-times"></i>
							<span>취소</span>
						</div>
						
					</div>
					
				</div>
<!-- ----------------------------------------- -->
				
			</div>
		</div>

	</section>
		
		
	<!-- footer -->
	<%-- <%@ include file="../main/businessFooter.jsp" %> --%>

	<!-- Modal  -->
	<div id="intro-modal" class="intro_modal">

		<!-- Modal content -->
		<div class="intro_content_con">
			<span class="intro_close">&times;</span>
			<div class="intro_content">
				<textarea class="store_intro_input" name="" maxlength="500" placeholder="매장 소개글을 적어주세요." autofocus resizable="false"></textarea>
				<input class="store_intro_btn" type="button" value="작성완료" onclick='comfirmIntro()' >
			</div>
		</div>

	</div>



	<script type="text/javascript" src="${cpath }/business/js/shopmanagement/businessShopManagement.js"></script>

</body>
</html>