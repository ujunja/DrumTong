<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>businessMain :: Laundry</title>
     <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${cpath }/business/css/businessStyle.css">
    <link rel="stylesheet" href="${cpath }/business/css/businessHeader.css">
   <link rel="stylesheet" href="${cpath }/business/css/businessLogin.css"> 
   <link rel="stylesheet" href="${cpath }/business/css/membership/businessAccountInfo.css">   
   <!-- icon -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>   
   
   
<body>   
<%@ include file="../main/businessHeader.jsp" %>


<!-- 스크립트 영역 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Axios js min 파일 -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
   

<div style="width: 70%; height: 100%; min-width: 900px; background-color: #d2d4dc;" class="marginauto">
   

   <div style="text-align: left; margin-bottom: 25px">
      <h1 style="font-size: 32pt; margin-left: 20px;">비즈니스 계정 관리</h1>
      <hr>
   </div>
   
   <div style="width: 80%; height: 80%; display: flex; margin-top: 8%" class="marginauto">
      <div class="leftdiv">   
         <div class="tablediv">
            <div class="celldiv">
               이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름
            </div>
         </div>      
         <div class="tablediv">
            <div class="celldiv">
               생년월일
            </div>
         </div>      
         <div class="tablediv">
            <div class="celldiv">
               성&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp별
            </div>
         </div>      
         <div class="tablediv">
            <div class="celldiv">
               전화번호
            </div>
         </div>      
         <div class="tablediv">
            <div class="celldiv">
               사업번호
            </div>
         </div>      
         <div class="tablediv">
            <div class="celldiv">
               이&nbsp&nbsp메&nbsp&nbsp일
            </div>
         </div>      
         <div class="tablediv">
            <div class="celldiv">
               주&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp소
            </div>
         </div>
         <div class="tablediv">
            <div class="celldiv">
               비밀번호
            </div>
         </div>      
      </div>
      
      <div style="display: inline-block; width: 75%; height: 100%; background-color:    #f8f8fa">
      <form action="${cpath }/business/membership/businessPWFind/" method="post" style="width: 100%; height: 100%;">
         <input type="hidden" value="${bLogin.bpersonid}" id="BPERSONID" name="bpersonid">
   
         <div class="rightdiv">
            <input class="input" type="text" name="name" value="${bLogin.name }" placeholder="이름을 입력하세요" readonly>
            <input type="hidden" value="${bLogin.name }">
            <input class="origininput">
         </div>         
         <div class="rightdiv">
            <input class="input" type="date" name="birth" value="${bLogin.birth }" placeholder="생년월일" readonly>
            <input type="hidden" value="${bLogin.birth }">
            <input class="origininput">
         </div>
         
         <!-- 성별 가져올때 W,M 말고 남자, 여자로 가져올 수 있도록 백엔드 쪽으로 처리하기 -->
         <div class="rightdiv">
            <input class="input" type="text" id="genderboolean" placeholder="성별" value="${fn:contains(bLogin.genderboolean, 'M') ? '남성' : '여성'}" readonly>
            <input type="hidden" value="${fn:contains(bLogin.genderboolean, 'M') ? '남성' : '여성'}">
            <input class="origininput">
         </div>
         <div class="rightdiv">
            <input class="input" type="text" id="phone" placeholder="휴대폰 번호" value="${bLogin.phonenum}" readonly>
            <input type="hidden" value="${bLogin.phonenum }">
            <input class="origininput">
         </div>
         <div id="phonemsg"></div>
         <div class="rightdiv">
            <input class="input" type="text" name="inputcrn" id="inputcrn" placeholder="사업자 번호" value="${bLogin.delegatecrn}" readonly>
            <input type="hidden" value="${bLogin.delegatecrn }">
            <input class="origininput">
         </div>
         <div class="rightdiv">
            <input class="input" type="text" name="inputemail" id="inputemail" placeholder="이메일" value="${bLogin.email}" readonly>
            <input type="hidden" value="${bLogin.email }">
            <input class="origininput">
         </div>
         <div class="rightdiv">
            <input class="input" type="text" id="address" placeholder="주소" value="${bLogin.mainaddress } ${bLogin.detailaddress}" readonly>
            <input type="hidden" value="${bLogin.mainaddress } ${bLogin.detailaddress}">
            <input class="origininput" >
         </div>
         <div class="rightdiv">
            <input class="input" type="password" name="pw" id="pw" placeholder="비밀번호" readonly>
            <input type="hidden" name="option" value="AccountInfo">
            <input class="origininput">
         </div>
      </form>
      </div>
   </div>

</div>
<script src="${cpath }/business/js/membership/businessAccountInfo.js"></script>

<%@ include file="../main/businessFooter.jsp"%>

</body>
</html>