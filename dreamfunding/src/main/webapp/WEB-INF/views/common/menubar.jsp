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
          <button class="btn btn--main"><a href="projectinsert.pi.hy">프로젝트 만들기</a></button>
        </div>




        <!-- 로그인 전 출력 영역 -->
        <c:choose>
        	<c:when test="${ empty loginMem }">
        <div class="header__right">
          <div class="search__box"  >
            <input type="text" class="search-bar" placeholder="프로젝트 검색" id="search" onclick=showHideSearch(); />
            <span class="material-icons"> search </span>
        
            <!-- 검색창 클릭 시 나올 창 -->
             
            <div class="search-slide" id="showHideSearch" >
              <div class="search-category">
                <button class="search-cate-btn">최근</button>
                <button class="search-cate-btn">카테고리</button>
              </div>
              <div class="search-text">
                
                <!-- 카테고리 -->
                <!-- <div>
                  <ul>
                    <li>잡지</li>
                    <li>문학 & 에세이</li>
                    <li>예술</li>
                    <li>실용 & 취미</li>
                    <li>그림책</li>
                    <li>기타</li>
                  </ul>
                </div> -->

                <!-- 최근검색어 -->
                 
                <div class="search-text-content">
                  <ul>
                    <li>
                      강아지
                    </li>
                  </ul>
                </div>
                <div class="search-text-delete">
                  <button class="search-text-btn">X</button>
                </div>
              </div>
              <div class="search-bottom">
                <div>
                  <button class="search-bot-btn-delete">전체 삭제</button>
                </div>
                <div>
                  <button class="search-bot-btn-close" onclick= searchClose();>닫기</button>
                </div>
              </div>
            </div>
          </div>
          <a href="loginForm.me.jm" class="sign__group">로그인</a>
          <a href="enrollForm.me.jm" class="sign__group">회원가입</a>
        </div>
        
		</c:when>

         
         
         
         
		<c:otherwise>
        <!-- 로그인 시 출력 영역 -->
         
        <div class="header__right">
          <div class="search__box">
            <input type="text" class="search-bar" placeholder="프로젝트 검색" onclick=showHideSearch(); />
            <span class="material-icons"> search </span>
		
              <!-- 검색창 클릭 시 나올 창 -->
              
              <div class="search-slide" id="showHideSearch" >
                <div class="search-category">
                  <button class="search-cate-btn">최근</button>
                  <button class="search-cate-btn">카테고리</button>
                </div>
                <div class="search-text">
                 
                  <!-- 카테고리 -->
                  <!-- <div>
                    <ul>
                      <li>잡지</li>
                      <li>문학 & 에세이</li>
                      <li>예술</li>
                      <li>실용 & 취미</li>
                      <li>그림책</li>
                      <li>기타</li>
                    </ul>
                  </div> -->

                  <!-- 최근검색어 -->
                  
                  <div class="search-text-content">
                    <ul>
                      <li>
                        강아지
                      </li>
                    </ul>
                  </div>
                  <div class="search-text-delete">
                    <button class="search-text-btn">X</button>
                  </div>
                </div>

                <div class="search-bottom">
                    <div>
                      <button class="search-bot-btn-delete">전체 삭제</button>
                    </div>
                    <div>
                      <button class="search-bot-btn-close" onclick= searchClose();>닫기</button>
                    </div>
                </div>
              </div>
          </div>
        </div>

        <div>
          <button type="button" class="alarm-btn" data-container="body" data-toggle="popover" data-placement="bottom">
            <i class="header__icon"><span class="material-icons"> notifications </span></i>
          </button>
            
          <i class="header__icon"><span class="material-icons"> account_circle </span></i>&nbsp;&nbsp;
          
          
            <a href="logout.me.jm"><i class="fas fa-sign-out-alt fa-2x" ></i></a>
          
          
          
         
        </div>

		
		</c:otherwise>
		</c:choose>
          <!-- 실시간 알림 스크립트 -->
          <script>
            $(document).ready(function(){

              var content = ['<div class="timePickerCanvas">asfaf asfsadf</div>',
                              '<div class="timePickerClock timePickerHours">asdf asdddddddddddddddddddddddddddddddddddddddddfasf</div>',
                              '<div class="timePickerClock timePickerMinutes"> asfa </div>',].join('');

              $('.alarm-btn').popover({title: "<div><a>실시간 알림</a></div>", content: content, html: true, placement: "bottom"}); 
            });
          </script>
                  <!-- 검색어 슬라이드 스크립트 -->
        <script>
          
          function showHideSearch(){
              if(document.getElementById("showHideSearch").style.display =='none'){
                  document.getElementById("showHideSearch").style.display ='block';
              }
              else{
                  document.getElementById("showHideSearch").style.display ='none';
              }
          }
          function searchClose(){
              if(document.getElementById("showHideSearch").style.display =='none'){
                  document.getElementById("showHideSearch").style.display ='block';
              }
              else{
                  document.getElementById("showHideSearch").style.display ='none';
              }
          }
        </script>

        

      </div>
    </header>
</body>
</html>