<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
  
<style>
    @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap");

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
  padding-top:15px;
 background-color:#ccc4bb;
 color:#7f0000;
 text-align:center;}

.nav-item{background-color:rgba(153, 153, 153, 0.89);
    color:#7f0000;}

.supporter-menu{
  text-decoration:none;
text-align:left;}

.creator-menu{
  text-align:right;}

.menu-content a{
  text-decoration:none;
}


#menu1{padding:0px;}
#menu2{padding:0px;}

#menu1 a:hover{
 text-decoration:none;
 color:#7f0000;}

#menu2 a:hover{
  text-decoration:none;
  color:#7f0000;}

  .supporter-menu {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.2s ease-in-out;  /* 서서히 확대 */
}
.supporter-menu:hover {
  transform: scale(1.01);
  -webkit-transform: scale(1.01);
  -moz-transform: scale(1.01);
  -ms-transform: scale(1.01);
  -o-transform: scale(1.01);
}

.creator-menu {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.2s ease-in-out;  /* 서서히 확대 */
}
.creator-menu:hover {
  transform: scale(1.01);
  -webkit-transform: scale(1.01);
  -moz-transform: scale(1.01);
  -ms-transform: scale(1.01);
  -o-transform: scale(1.01);
}

.profile-img{
  margin-top:10px;
}







/*세부메뉴 스타일*/

.detail-menu {
  width:100%;
  height:50px;
  text-align:center;
  position:relative;
  display:inline-block;
}
.menu--item__one {
  width:100px;
  list-style:none;
  display:inline-block;
  margin-right:35px;
  margin-left:16px;
}
.menu--item__two {
  width:100px;
  list-style:none;
  display:inline-block;
  margin-right:35px;
}
.menu--item__three {
  width:100px;
  list-style:none;
  display:inline-block;
  margin-right:17px;
}
.menu--item__four {
  width:100px;
  list-style:none;
  display:inline-block;
  margin-right:17px;
}

.link {
  text-decoration:none;
  cursor:pointer;
}
.link1 {
  text-decoration:none;
  cursor:pointer;
}
.link2 {
  text-decoration:none;
  cursor:pointer;
}
.bottom__line {
  list-style:none;
  display:inline-block;
  margin-left:317.5px;
  position:absolute;
  top:30px;
  left:0px;
  width:130px;
  height:3px;
  background-color: #7f0000;
  border-radius: 100%;
  
}
.bottom__active {
  transform: translate3d(0%, 0, 0);
  transition:all linear 240ms;
}
.bottom__active1 {
  transform: translate3d(130%, 0, 0);
  transition:all linear 240ms;
}
.bottom__active2 {
  transform: translate3d(260%, 0, 0);
  transition:all linear 240ms;
}
.color,.color1,.color2 {
  color:#7f0000;
  transition:all linear 100ms;
}

.hrs{
  margin-top:8px;

}

.p{
  font-size:18px;
  width:200px;
}

.profile-wrap{margin:10px;
margin-left:30px;
margin-right:30px;}

.profile{
  text-align:left;
  margin:30px;
  margin-left:220px;
  width:700px;
}

.togglee{float:right;
margin-right:20px;}

.button{
  text-decoration: none;
  border:none;
  background-color: white;
  color:#7f0000;
}

.button1{
  text-decoration: none;
  border:none;
  background-color: white;
  color:#7f0000;
}

.button2{
  text-decoration: none;
  border:none;
  background-color: white;
  color:#7f0000;
}

.button3{
  text-decoration: none;
  border:none;
  background-color: white;
  color:#7f0000;
}

.button4{
  text-decoration: none;
  border:none;
  background-color: white;
  color:#7f0000;
}


/*세부메뉴 스타일*/
.nav-link{
  font-size:20px;
  padding-top:15px;
 background-color:#ccc4bb;
 color:#7f0000;
 text-align:center;}


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

.h3{margin-top:7px;}
</style>




  

  </head>
  <body>
    <jsp:include page="../common/menubar.jsp"/>
    

    <br>
    <div class="wrap1">
       <!--설정아이콘-->
       <a href="optionProfile.me"><span class="material-icons" id="setting">settings</span></a>
       <!-- 마이페이지 프로필 div-->
        <div class="page-name"> 
          <h style=" font-weight:bold;">마이페이지</h><br>
          <a href="mypage.me"><img src="${pageContext.request.contextPath}/resources/images/book1.jpg" 
          class="profile-img" width="80px;" height="80px;" style="border-radius:70px;" ></a>
        </div>
    </div>
    
    
        
    


    <!-- 이곳에 페이지 내용 작성 -->
    <main class="section">
      <div class="inner">
        <!--  페이지 내용 작성하는곳 -->
        <div class="wrap2">
           <!--서포터, 크리에이터 탭-->
            <div class="container mt-3" >
              <br>
              
              <ul class="nav nav-tabs nav-justified" style="border-radius: 20px; border:none;">
                <li class="nav-item" style="background-color:none; border-radius:20px;">
                  <a class="nav-link"style="border-radius: 20px; border:1px solid rgb(206, 206, 206);"><h3 class="h3" style="font-weight:bold;">설정</h3></a> 
                </li>
                
              </ul>
              
              
            
              <!-- 세부메뉴 -->
                 <!--세부메뉴 html-->
            <div class="tab-content" style=" margin-bottom: 10px;">
              <div id="menu1" class="container tab-pane active" ><br><br>
                <nav class="nav--top">
                  <ul>
                      <li><a href="optionProfile.me">프로필</a></li>
                      <li><a href="optionAccount.me">계정</a></li>
                      <li><a href="optionPay.me">결제수단</a></li>
                      <li><a href="optionShipping.me">배송지</a></li>
                  </ul>
              </nav>
              <hr class="line" style=" margin-top:0px;">
                
              </div>
                
           
            </div>  
            </div>
            

            <!--이메일-->


          <div class="profile-wrap" >
            <div class="profile" >
              <p class="p">이메일</p>
                <h>${ loginMem.email }</h>
                  <div class="togglee">
                    
                    <hr> 
                      </div><br><br>

                   <hr> 
            </div>
          </div>

          
          <!--비밀번호-->

         <!--스크립트-->
          <script>
            $(function (){
              $(".button1").click(function (){
                $("#divToggle1").toggle();
              });
            });
          </script>

            <div class="profile-wrap" >
              <div class="profile" >
                <p class="p" >비밀번호</p>
                  
                    <div class="togglee">
                      <button class="button1" style="background-color:white;
                        border:none;">변경</button>
                        <hr> 
                        </div><br>
                        
                        <br>
                        <!-- 저장  -->
                          <div id="divToggle1" style="display: none;">
                          <form action="">
                          	<p>현재 비밀번호</p>
                          	
                            <input type="text" class="form-control" id="cmemPwd1" style="width:200px;
                                          margin-top:5px; margin-bottom:10px;" placeholder="현재 비밀번호";>
                            <input type="hidden" name="${ loginMem.email }">              
                            <input type="password" class="form-control" id="cmemPwd2" placeholder="변경할 비밀번호"; style="width:200px;
                            margin-top:5px; margin-bottom:10px;" name="memPwd">
                            <input type="password" class="form-control" id="cmemPwd3" placeholder="변경할 비밀번호 확인"; style="width:200px;
                            margin-top:5px; margin-bottom:10px;">
        
                            <button type="button" class="btn" style="background-color: #7f0000; color:white;" onclick="modifyPwd()">저장</button>
                            </form>
                            </div>
                            
                              <hr> 
                            <script>
                            	function modifyPwd(){
                            		
                            		
                            		
                            		
                            	}
                            </script>  
                              
                              
                              
                              
                              
              </div>
            </div>


            <!--연락처-->

         <!--스크립트-->
          <script>
            $(function (){
              $(".button2").click(function (){
                $("#divToggle2").toggle();
              });
            });
          </script>

            <div class="profile-wrap" >
              <div class="profile">
                <p class="p">연락처</p>
                 <h>${ loginMem.phone }</h>
                    <div class="togglee">
                      <button class="button2" style="background-color:white;
                        border:none;">변경</button>
                        <hr> 
                        </div><br>
                        
                        <br>
                          <div id="divToggle2" style="display: none;">
                          <form ></form>
                            <input type="text" class="form-control" id="usr" style="width:200px;
                                          margin-top:5px; margin-bottom:10px;" name="username">
                                          
                            <button type="button" class="btn" style="background-color: #7f0000; color:white;">저장</button>
                          </div>
                        <hr> 
              </div>
            </div>


            <!--네이버 계정 연동-->

         <!--스크립트-->
          <script>
            $(function (){
              $(".button3").click(function (){
                $("#divToggle3").toggle();
              });
            });
          </script>

            <div class="profile-wrap" >
              <div class="profile" >
                <p class="p">계정연동</p>
                    <div class="togglee">
                      <button class="button3" style="background-color:white;
                        border:none;">연동하기</button>
                        <!-- 전부 -->
                        <hr> 
                        </div><br><br>
                          
                          
                          
                          
                              <hr> 
              </div>
            </div>

            <!--회원탈퇴-->

         <!--스크립트-->
          <script>
            $(function (){
              $(".button4").click(function (){
                $("#divToggle4").toggle();
              });
            });
          </script>

            <div class="profile-wrap" >
              <div class="profile" >
                <p class="p">회원탈퇴</p>
                    <div class="togglee">
                      <button type="button" class="btn"  style="background-color:white;color:#7f0000;
                        border:none;" data-toggle="modal" data-target="#myModal">
  탈퇴하기
</button>

                        <hr> 
                        </div><br><br>
                          <!-- 모델창 만들기 -->
                          
                        <hr> 
              </div>
            </div>
                          
              
          </div>
        </div>
            
        <!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">탈퇴 하실건가요..??</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <form  action="delete.me.jm" method="post">
		      <div class="modal-body">
		        
		        <div>탈퇴하시려면 비밀번호를 입력해주세요.</div>
		        <input type="password" class="form-control" name="memPwd" placeholder="Password" required>
		        
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-danger">탈퇴하기</button>
		      </div>
			</form>
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
  </body>
</html>
  