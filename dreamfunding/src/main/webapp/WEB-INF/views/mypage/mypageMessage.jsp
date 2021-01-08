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

    <link rel="stylesheet" href="../../../resources/css/common.css" />

   
    <link rel="stylesheet" href="../../../resources/css/detail/message.css" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap");
html,
body {
  font-size: 15px;
}

p {
  margin-bottom: 0 !important;
  text-align: start;
}
* {
  outline: none;
  box-sizing: border-box;
}

.padding {
  padding: 20px;
}

.clearfix {
  display: table;
  overflow: hidden;
}
.clearfix:before {
  content: " ";
  display: block;
}

.font-size-small {
  font-size: 0.7rem;
}

.chat-wrapper {
  width: 100%;
  height: 100vh;
  display: block;
  overflow: scroll;
  padding-bottom: 100px;
}
.chat-wrapper:before {
  content: " ";
  display: block;
}
.chat-wrapper .chat-content {
  background-color: #fff;
}
.chat-wrapper .chat-image {
  float: left;
  border-radius: 50%;
  margin-top: 10px;
}
.chat-wrapper .chat-image.chat-image-default {
  width: 50px;
  height: 50px;
}
.chat-wrapper .chat-message {
  margin-bottom: 20px;
  width: 100%;
  display: table;
  overflow: hidden;
}
.chat-wrapper .chat-message:before {
  content: " ";
  display: block;
}
.chat-wrapper .chat-message:last-of-type {
  margin-bottom: 0;
}
.chat-wrapper .chat-message .chat-message-wrapper {
  max-width: 70%;
  display: block;
  margin: 0 20px;
  padding-top: 10px;
  position: relative;
}
.chat-wrapper .chat-message .chat-message-wrapper:before {
  content: " ";
  display: block;
  width: 0;
  height: 0;
  border: 12px solid transparent;
  top: 20px;
  position: absolute;
  z-index: 2;
}
.chat-wrapper .chat-message .chat-message-wrapper p {
  padding: 10px 20px;
  color: #333;
  border-top: 1px solid;
  max-width: 230px;
}
.chat-wrapper .chat-message .chat-message-wrapper p:first-of-type {
  border-top: 0 !important;
}
.chat-wrapper .chat-message.chat-message-recipient .chat-message-wrapper,
.chat-wrapper .chat-message.chat-message-recipient .chat-message-content {
  float: left;
}
.chat-wrapper
  .chat-message.chat-message-recipient
  .chat-message-wrapper:before {
  left: -20px;
  border-right-color: #fff;
}
.chat-wrapper .chat-message.chat-message-recipient p {
  background-color: #fff;
  border-top-color: #fff;
}
.chat-wrapper .chat-message.chat-message-sender .chat-message-wrapper,
.chat-wrapper .chat-message.chat-message-sender .chat-message-content {
  float: right;
}
.chat-wrapper .chat-message.chat-message-sender .chat-message-wrapper:before {
  right: -20px;
  border-left-color: #ccc4bb;
}
.chat-wrapper .chat-message.chat-message-sender p {
  background: #ccc4bb;
  border-top-color: #ccc4bb;
}
.chat-wrapper .chat-message.chat-message-sender img {
  float: right;
}
.chat-wrapper .chat-message .chat-message-content {
  display: table;
  overflow: hidden;
  border-radius: 4px;
}
.chat-wrapper .chat-message .chat-message-content:before {
  content: " ";
  display: block;
}
.chat-wrapper .chat-message .chat-details {
  clear: both;
  width: 100%;
  display: block;
  overflow: hidden;
  text-align: start;
  padding-left: 15px;
}
.chat-wrapper .chat-message .chat-details:before {
  content: " ";
  display: block;
}
.chat-wrapper .chat-message .chat-details span {
  padding: 0 !important;
  color: #bbb;
}
.chat__input__wrapper {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 60px;
  background: #ccc4bb;
  display: flex;
  align-items: center;
  justify-content: center;
}
.chat__input__wrapper input {
  border: none;
  width: 95%;
  height: 60%;
  background: none;
  border-bottom: 2px solid #fff;
  color: #fff;
  font-size: 18px;
}
.chat__input__wrapper span {
  position: absolute;
  color: #fff;
  font-size: 24px;
  right: 4%;
  cursor: pointer;
}
.chat__input__wrapper span:hover {
  color: #fff;
}
.chat__title__wrapper {
  height: 50px;
  background: #ccc4bb;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}
.chat__title__wrapper p {
  position: absolute;
  right: 20px;
  color: #fff;
  cursor: pointer;
}
.chat__title__wrapper span {
  font-size: 23px;
  color: #fff;
}

/* 


/* */

.message__container {
  display: flex;
  gap: 40px;
  align-items: center;
  justify-content: center;
  line-height: 1.5;
  height: 50vh;
  box-sizing: border-box;
  font-family: "Open Sans", sans-serif;
  position: relative;
}

html body .container .card {
  background: #ccc4bb;
  width: 300px;
  height: 300px;
  border-radius: 6px;

  color: rgb(100, 100, 100);
  box-shadow: 0 0.25rem 0.25rem rgba(0, 0, 0, 0.2), 0 0 1rem rgba(0, 0, 0, 0.2);
  overflow: hidden;
}
.card img {
  max-width: 100%;
}

.card__image-container {
  margin: -2rem -2rem;
}

.card__title {
  color: white;
  font-weight: 800;
  letter-spacing: 0.01em;
  font-size: 16px;
}
.card__content {
  overflow: hidden;
  width: 100%;
  height: 120px;
  background: #ccc4bb;
  display: flex;
  flex-direction: column;
  justify-content: end;
  align-items: center;
  padding: 20px 30px;
  position: absolute;
  margin-top: 160px;
}

.card__content span {
  display: block;
  color: #fff;
  font-size: 12px;
  text-align: start;
}

.card__content p {
  text-align: center;
  margin-bottom: 10px !important;
  font-size: 12px;
}

@keyframes LineFadeIn {
  0% {
    opacity: 0;
    d: path(
      "M 0 300 Q 0 300 0 300 Q 0 300 0 300 C 0 300 0 300 0 300 Q 0 300 0 300 "
    );
    stroke: #fff;
  }
  50% {
    opacity: 1;
    d: path(
      "M 0 300 Q 50 300 100 300 Q 250 300 350 300 C 350 300 500 300 650 300 Q 750 300 800 300"
    );
    stroke: #888bff;
  }
  100% {
    opacity: 1;
    d: path(
      "M -2 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 802 400"
    );
    stroke: #545581;
  }
}
@keyframes ContentFadeIn {
  0% {
    transform: translateY(-1rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes ImageFadeIn {
  0% {
    transform: translate(-0.5rem, -0.5rem) scale(1.05);
    opacity: 0;
    filter: blur(2px);
  }
  50% {
    opacity: 1;
    filter: blur(2px);
  }
  100% {
    transform: translateY(0) scale(1);
    opacity: 1;
    filter: blur(0);
  }
}

.card:hover .card__cover {
  display: flex;
}
@keyframes fadein {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
.card__cover {
  cursor: pointer;
  display: none;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.7);
  border-radius: 3px;
  animation: fadein 0.3s forwards;
}
.card__cover button {
  font-size: 17px;
  color: #fff;
  border: 1px solid #fff;
  background: none;
  padding: 7px 24px;
}

/* .chat__wrapper_cover {
  position: relative;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.8);
  display: flex;
  z-index: 9999;
} */
.chat__wrapper {
  position: fixed;
  bottom: 0;
  top: 0;
  right: 0;
  width: 400px;
  box-shadow: 0 0 20px gray;
  display: none;
  background: #fff7ed;
  z-index: 9999;
}
@keyframes slideleft {
  0% {
    transform: translateX(500px);
  }
  100% {
    transform: translateX(000px);
  }
}
.chat-active {
  display: initial;
  animation: slideleft 0.3s ease forwards;
}


/* COMMON */
* {
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}

a {
  text-decoration: none;
  color: #333;
}

.inner {
  max-width: 1200px;
  margin: 0 auto;
  color: #333;
}

header .inner {
  height: 78px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 15px;
  font-weight: 600;
}

.header__left {
  display: flex;
  flex: 1;
  align-items: center;
}

header a:hover {
  font-weight: bold;
  color: #ccc4bb;
}

/* BTN */
.btn {
  outline: none;
  border: none;
  padding: 7px 20px;
  border-radius: 5px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}
.btn--main {
  background: #7f0000 linear-gradient(#8b1111, #7f0000);
  transition: all 0.2s;
}
.btn--main:hover {
  background: #630000;
  box-shadow: 0 0 7px gray;
}
.btn a {
  color: #fff;
  font-weight: bold;
}
.search__box {
  position: relative;
}

.search__box span {
  position: absolute;
  right: 3px;
  top: 3px;
  cursor: pointer;
}

.search-bar {
  width: 200px;
  font-size: 14px;
  padding: 5px;
  outline: none;
  border: 1px solid #999;
  border-radius: 5px;
  transition: all 0.3s;
}

.search-bar:focus {
  width: 230px;
  border: 1px solid #000;
}

.header__left .logo {
  display: block;
  max-width: 160px;
  margin-right: 20px;
}

.logo img {
  width: 100%;
}
.header__left .header__nav {
  display: flex;
}

.header__nav li a {
  padding: 5px 10px;
}

.header__left .btn {
  margin-left: 20px;
}

.header__right {
  display: flex;
  align-items: center;
  gap: 15px;
}
.header__right .header__icon {
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}

.header__right .sign__group {
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}

.header__icon span {
  font-size: 30px;
}

/* FOOTER */
footer {
  font-size: 10px;
  font-weight: 600;
  position: relative;
  background-color: #ccc4bb;
}

footer .footer__inner {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  line-height: 2;
  padding: 10px 0 30px 0;
  letter-spacing: 0.2px;
}

.footer__bottom {
  width: 100%;
  display: flex;
  justify-content: space-between;
}
.footer__left {
  display: flex;
  flex-direction: column;
  gap: 15px;
  text-align: left;
}

.footer__left .summary__title {
  color: #7f0000;
}

.footer__left .summary__description {
  color: #333;
}

.footer__right {
  text-align: right;
  display: flex-end;
  flex-direction: column;
  gap: 15px;
}

.footer__right .summary__title {
  color: #7f0000;
}

.footer__right .summary__description {
  color: #333;
}

.footer__center {
  display: flex;
  width: 100%;
  justify-content: center;
}
.footer__center img {
  height: 40px;
  margin: 0 auto;
}

.section {
  min-height: 700px;
}

/*마이페이지 스타일*/

.wrap1{
  height:100%;
  text-align:center;}

.page-name{
   margin-left:60px;
   padding-top:30px;
   width:500px;
   text-align:center;
   display:inline-block;
   font-size:30px;}

#setting{
  font-size:40px;
  float:right;
  margin-right:20px;
  margin-top:10px;}

.wrap2{
  text-align:center;}

  /*서포터, 크리에이터 메뉴 스타일*/
.nav-link{
  font-size:20px;
  padding-top:15px;
 background-color:#ccc4bb;
 color:#7f0000;
 text-align:center;}

.nav-item a:hover{
  background-color:rgba(153, 153, 153, 0.89);
  color:#7f0000;}

.supporter-menu{
  text-decoration:none;
text-align:center;}

.creator-menu{
  text-align:center;}

.menu-content a{
  text-decoration:none;
}



/*세부메뉴css*/
.nav--top{
  margin-right:130px;
}
.nav--top > ul {
    
    font-size: 15px;
    margin: 0;
    margin-top:40px;
    padding: 0;
    list-style: none;
    text-align: center;
}

.nav--top > ul > li {
    line-height: normal;
    padding: 0px;
    margin:  0 0 1rem
}

@media (min-width: 52em) {
    .nav--top > ul > li {
        margin: 0 0 0 5rem;
        display: inline-block
    }
}

.nav--top > ul > li a {
    display: inline-block;
    vertical-align: middle;
    -webkit-transform: translateZ(0);
    transform: translateZ(0);
    box-shadow: 0 0 1px transparent;
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
    -moz-osx-font-smoothing: grayscale;
    position: relative;
    padding: 0 0 .15rem;
    text-decoration: none;
    font-weight: 400;
    color: #787777
}

.nav--top > ul > li a:before {
    content: "";
    position: absolute;
    z-index: -1;
    left: 0;
    right: 100%;
    bottom: -2px;
    background: #7f0000;
    height: 4px;
    -webkit-transition-property: right;
    transition-property: right;
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-timing-function: ease-out;
    transition-timing-function: ease-out
}

.nav--top > ul > li a:hover:before,
.nav--top > ul > li a:focus:before,
.nav--top > ul > li a:active:before,
.nav--top > ul > li.current_page_item a:before {
    right: 0
}

.nav--top > ul > li a:hover,
.nav--top > ul > li a:focus,
.nav--top > ul > li a:active,
.nav--top > ul > li.current_page_item a {
    border-bottom: 0px solid #fff;
    color: #121212
}


</style>

  </head>
  <body>
    <jsp:include page="../common/menubar.jsp"/>

    <br />
    <div class="wrap1">
      <!--설정아이콘-->
      <a href="optionProfile.me"><span class="material-icons" id="setting">settings</span></a>
      <!-- 마이페이지 프로필 div-->
      <div class="page-name">
        <h style="font-weight: bold">마이페이지</h><br />
        <a href=""
          ><img
            src="${pageContext.request.contextPath}/resources/images/book1.jpg"
            class="profile-img"
            width="80px;"
            height="80px;"
            style="border-radius: 70px"
        /></a>
      </div>
    </div>

    <!-- 이곳에 페이지 내용 작성 -->
    <main class="section">
      <div class="inner" style="border-color:none;">
        <!--  페이지 내용 작성하는곳 -->
        <div class="wrap2" style="border-color:none;">
          <!--서포터, 크리에이터 탭-->
          <div class="container mt-3" >
            <br>
             
             
            <ul class="nav nav-tabs nav-justified" style="border-radius: 20px; border:none;"  >
              <li class="nav-item">
                <a class="nav-link active" style="line-height:10px; margin-right:10px; border-radius: 20px; border:1px solid rgb(206, 206, 206);" data-toggle="tab" href="#menu1"><h3 class="h3" style="font-weight:bold;">서포터</h3></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="border-radius: 20px; border:1px solid rgb(206, 206, 206);" data-toggle="tab" href="#menu2"><h3 class="h3" style="font-weight:bold;">크리에이터</h3></a>
              </li>
            </ul>

           <!--세부메뉴 html-->
          <div class="tab-content" style=" margin-bottom: 10px; ">
            <div id="menu1" class="container tab-pane active" ><br><br>
              <nav class="nav--top">
                <ul>
                    <li><a href="myFundingProject.me">펀딩한 프로젝트</a></li>
                    <li><a href="myLikeProject.me">관심있는 프로젝트</a></li>
                    <li><a href="mypageMessage.me">메시지</a></li>
                </ul>
            </nav>
            <hr class="line" style=" margin-top:0px;">
              
            </div>
              
            <div id="menu2" class="container tab-pane fade"><br><br>
              <nav class="nav--top">
                <ul>
                    <li><a href="makeProject.me">프로젝트 만들기</a></li>
                    <li><a href="myMadeProject.me">제작한 프로젝트</a></li>
                    <li><a href="mypageMessage.me">메시지</a></li>
                </ul>
            </nav>
            <hr class="line" style=" margin-top:0px;">
            </div>

          </div>  

              <ul class="message__container" >
                <!-- 아이템1 -->
                <li class="card">
                  <div class="card__image-container">
                    <img
                      class="card__image"
                      src="https://images.unsplash.com/photo-1519999482648-25049ddd37b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2126&q=80"
                      alt=""
                    />
                  </div>

                  <div class="card__content">
                    <h3 class="card__title">프로젝트 제목 프로젝트 제목</h3>
                    <p>last message</p>
                    <span class="card__last-comment"
                      >안녕하세요 크리에이터님, 혹시 얼리버드로 마감된 리워드
                      수량은 추가 예정 없나요?</span
                    >
                  </div>

                  <div class="card__cover">
                    <button>ENTER</button>
                  </div>
                </li>

                <!-- 아이템2 -->
                <li class="card">
                  <div class="card__image-container">
                    <img
                      class="card__image"
                      src="../../../resources/images/dream.jpg"
                      alt=""
                    />
                  </div>

                  <div class="card__content">
                    <h3 class="card__title">프로젝트 제목</h3>
                    <p>last message</p>
                    <span class="card__last-comment"
                      >더 좋은 프로젝트로 찾아뵙겠습니다 :) 더 좋은 프로젝트로
                      찾아뵙겠습니다 :)더 좋은 프로젝트로 찾아뵙겠습니다
                      :)</span
                    >
                  </div>
                  <div class="card__cover">
                    <button>ENTER</button>
                  </div>
                </li>

                <!-- 아이템3 -->
                <li class="card">
                  <div class="card__image-container">
                    <img
                      class="card__image"
                      src="../../../resources/images/book14.jpg"
                      alt=""
                    />
                  </div>

                  <div class="card__content">
                    <h3 class="card__title">프로젝트 제목</h3>
                    <p>last message</p>
                    <span class="card__last-comment"
                      >더 좋은 프로젝트로 찾아뵙겠습니다 :)</span
                    >
                  </div>
                  <div class="card__cover">
                    <button>ENTER</button>
                  </div>
                </li>
              </ul>

              <!-- 채팅방 -->
              <div class="chat__wrapper">
                <div class="chat__title__wrapper">
                  <span>프로젝트 제목</span>
                  <p id="chat_close" onclick="toggleChat()">닫기</p>
                </div>
                <div class="chat-wrapper">
                  <div class="chat-message padding">
                    <div class="chat-message chat-message-recipient">
                      <img
                        class="chat-image chat-image-default"
                        src="../../../resources/images/cat.jpg"
                      />

                      <div class="chat-message-wrapper">
                        <div class="chat-message-content">
                          <p>
                            안녕하세요 크리에이터님, 혹시 얼리버드로 마감된
                            리워드 수량은 추가 예정 없나요?
                          </p>
                        </div>
                        <div class="chat-details">
                          <span class="chat-message-read-status font-size-small"
                            >- 2020.12.11</span
                          >
                        </div>
                      </div>
                    </div>

                    <div class="chat-message chat-message-sender">
                      <img
                        class="chat-image chat-image-default"
                        src="../../../resources/images/dream.jpg"
                      />

                      <div class="chat-message-wrapper">
                        <div class="chat-message-content">
                          <p>
                            서포터님 안녕하세요? 드림리뷰오브북스입니다.
                            안타깝게도 현재 마감된 얼리버드 리워드의 수량 증량
                            계획은 아직 없습니다. 감사합니다.
                          </p>
                        </div>

                        <div class="chat-details">
                          <span class="chat-message-read-status font-size-small"
                            >-2020.12.11</span
                          >
                        </div>
                      </div>
                    </div>

                    <div class="chat-message chat-message-recipient">
                      <img
                        class="chat-image chat-image-default"
                        src="../../../resources/images/cat.jpg"
                      />

                      <div class="chat-message-wrapper">
                        <div class="chat-message-content">
                          <p>아쉽네요ㅠㅠ 다음 펀딩 기다리겠습니다!</p>
                        </div>

                        <div class="chat-details">
                          <span class="chat-message-read-status font-size-small"
                            >-2020.12.12</span
                          >
                        </div>
                      </div>
                    </div>

                    <div class="chat-message chat-message-sender">
                      <img
                        class="chat-image chat-image-default"
                        src="../../../resources/images/dream.jpg"
                      />

                      <div class="chat-message-wrapper">
                        <div class="chat-message-content">
                          <p>더 좋은 프로젝트로 찾아뵙겠습니다 :)</p>
                        </div>
                        <div class="chat-details">
                          <span class="chat-message-read-status font-size-small"
                            >-2020.12.12</span
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="chat__input__wrapper">
                  <input type="text" />
                  <span class="material-icons"> send </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <footer>
      <div class="footer__inner">
        <div class="footer__center">
          <img src="../../../resources/images/logo3.png" alt="" />
        </div>

        <div class="footer__bottom">
          <div class="footer__left">
            <div class="summary__title">투자위험고지</div>
            <div class="summary__description">
              (주)드림펀딩은 중개업(온라인소액투자중개 및 통신판매중개)을
              영위하는 플랫폼 제공자로 자금을 모집하는 당사자가 아닙니다.<br />
              따라서 투자손실의 위험을 보전하거나 리워드 제공을 보장해 드리지
              않으며 이에 대한 법적인 책임을 지지 않습니다.
            </div>
          </div>
          <div class="footer__right">
            <div class="summary__title">고객센터</div>
            <div class="summary__description">
              OPEN : AM 10 : 10 ~ PM 05 : 30 ( LUNCH AT 12 : 00 ~ 13 : 00 )<br />
              대표전화 : 031 - 8039 - 5569<br />
              주소지 : 경기도 성남시 수정구 대왕판교로 815 기업지원허브 814호<br />
            </div>
          </div>
        </div>
      </div>
    </footer>
    <script>
      const toggleChat = () => {
        document
          .querySelector(".chat__wrapper")
          .classList.toggle("chat-active");
      };
      document.querySelectorAll(".card__cover").forEach((v) => {
        v.addEventListener("click", toggleChat);
      });

      // 제목 13글자 초과 시 ... 표시
      const cardTitle = document.querySelectorAll(".card__title");
      cardTitle.forEach((v) => {
        console.log(v.textContent.length);
        if (v.textContent.length > 13) {
          const newText = v.innerText.substring(0, 14) + "...";

          // console.log(newText)
          v.innerText = newText;
        }
      });

      // 마지막 메시지 45글자 초과 시 ... 표시
      const lastComment = document.querySelectorAll(".card__last-comment");
      lastComment.forEach((v) => {
        console.log(v.textContent.length);
        if (v.textContent.length > 45) {
          const newText = v.innerText.substring(0, 46) + "...";

          // console.log(newText)
          v.innerText = newText;
        }
      });

      
    </script>
  </body>
</html>
</head>
