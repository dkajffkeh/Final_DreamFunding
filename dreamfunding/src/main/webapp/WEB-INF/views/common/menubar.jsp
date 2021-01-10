<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
      integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
      crossorigin="anonymous"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩 css cdn을 추가하면 메뉴바가 깨집니다.. -->
    <!-- 아이콘fontawesome.com 스크립트  -->
    <script src="https://kit.fontawesome.com/d324e8cb88.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonUpdate.css" />
</head>
<body>
	<header>
      <div class="inner">
        <div class="header__left">
          <a class="logo" href="">
            <img src="${pageContext.request.contextPath}/resources/images/mainlogo.png" alt="" />
          </a>
          <ul class="header__nav">
            <li><a href="categoryViewAll.in">펀딩하기</a></li>
        
            <li><a href="mypage.me">마이페이지</a></li>
   
            <li><a href="scenterMain.gn">고객센터</a></li>
          </ul>
          <c:if test="${ !empty loginMem }">
          <button class="btn btn--main"><a href="projectinsert.pi.hy?mno=${ loginMem.memNo }">프로젝트 만들기</a></button>
          </c:if>
          
        </div>

		


        <!-- 로그인 전 출력 영역 -->
        <c:choose>
        	<c:when test="${ empty loginMem }">
        <div class="header__right">
          <div class="search__box"  >
          	<form action="search.do">
	            <input type="text" class="search-bar" placeholder="프로젝트 검색" id="keyword" name="keyword" />
	            <span><button type="submit" style="border:none;"><span class="material-icons"> search </span></button></span>
        	</form>
            
          </div>
          <a href="loginForm.me.jm" class="sign__group">로그인</a>
          <a href="enrollForm.me.jm" class="sign__group">회원가입</a>
        </div>
        
		</c:when>

         
         
         
         
		<c:otherwise>
        <!-- 로그인 시 출력 영역 -->
         
        <div class="header__right">
          <div class="search__box">
            <form action="search.do">
	            <input type="text" class="search-bar" placeholder="프로젝트 검색" id="keyword" name="keyword" />
	            <span><button type="submit" style="border:none; background-color:white;"><span class="material-icons"> search </span></button></span>
        	</form>
          </div>
        </div>

        <div>
          <button type="button" class="alarm-btn" data-container="body" data-toggle="popover" data-placement="bottom" style="display:none;">
            <i class="header__icon" ><span class="material-icons"> notifications </span></i>
          </button>
            
               &nbsp;
              <c:choose>
              <c:when test="${ empty loginMem.memSystemname }">
			  <a href="optionAccount.me"><i class="header__icon"><span class="material-icons"> account_circle </span></i></a>
              </c:when>
              <c:when test="${ loginMem.memNo == 1 }">
              <i class="header__icon"><span class="material-icons"> account_circle </span></i>
			  <i class="header__icon"><span class="material-icons" onclick="location.href='daminIndex.ad'" style="cursor:pointer;">admin_panel_settings</span></i>
              </c:when>
              <c:otherwise>
              
              
              <a href="optionAccount.me"><img src="${pageContext.request.contextPath}/resources/images/profile/${loginMem.memSystemname}"
              		 	  style="text-align: justify; margin-bottom: 1em; display:inline;width:30px; height:30px; border-radius: 50%;"></a>
              		 	  
              		 	  
               </c:otherwise>
              </c:choose>
          &nbsp;&nbsp;
          
            <a href="logout.me.jm"><i class="fas fa-sign-out-alt" style="font-size: 34px"></i></a>
          
          
          
         
        </div>

		
		</c:otherwise>
		</c:choose>
          <!-- 실시간 알림 스크립트 -->
          <script>
            $(document).ready(function(){

              var content = ['<div class="timePickerCanvas">실시간알림..</div>',
                              '<div class="timePickerClock timePickerHours">. . .</div>',
                              '<div class="timePickerClock timePickerMinutes"> . . . </div>',].join('');

              $('.alarm-btn').popover({title: "<div><a>실시간 알림</a></div>", content: content, html: true, placement: "bottom"}); 
            });
          </script>
          

        

      </div>
    </header>
</body>
</html>