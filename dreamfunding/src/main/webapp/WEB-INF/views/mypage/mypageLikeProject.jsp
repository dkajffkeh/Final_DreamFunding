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

    

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


 

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




/*서포터, 크리에이터 메뉴 스타일*/
.nav-link{
  padding-top:15px;
 background-color:#ccc4bb;
 color:#7f0000;
 text-align:center;}

.nav-item a:hover{
  background-color:rgba(153, 153, 153, 0.89);
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
  width:130px;
  list-style:none;
  display:inline-block;
  margin-right:35px;
  margin-left:16px;
}
.menu--item__two {
  width:130px;
  list-style:none;
  display:inline-block;
  margin-right:35px;
}
.menu--item__three {
  width:130px;
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


/*컨텐트*/
.wrap2{
  
  margin-left:30px;
  margin-right:30px;
  margin-top:30px;
  width:1140px;
  height:100%;
}

.like-project{
  overflow:hidden;
  margin:11px;
  width:100%;
  height:100%;
  
}
.like-project-list{
  margin:5px;
  width:100%;
  height:100%;
  display:grid;
	grid-template-columns: repeat(3, 1fr);
	column-gap: 3%;
  row-gap:5%
  
}
.like-project-detail{
  width:320px;
}

.like-project-name a:hover{
  color:#7f0000;
  text-decoration: none;
}

   
</style>

<!--세부메뉴 스크립트-->
<script>
  $(document).ready(function(){
$(".link").addClass("color");
//   첫번째
$(".menu--item__one").click(function(){
   $(".bottom__line").addClass("bottom__active");
   $(".link").addClass("color");
   $(".link1").removeClass("color1");
   $(".link2").removeClass("color2");
   $(".bottom__line").removeClass("bottom__active1 bottom__active2");
});

//  두번째
$(".menu--item__two").click(function(){
    $(".bottom__line").addClass("bottom__active1");
    $(".link1").addClass("color1");
    $(".link").removeClass("color");
    $(".link2").removeClass("color2");
    $(".bottom__line").removeClass("bottom__active bottom__active2");
});

// 세번째
 $(".menu--item__three").click(function(){
      $(".bottom__line").addClass("bottom__active2");
      $(".link2").addClass("color2");
      $(".link").removeClass("color");
      $(".link1").removeClass("color1");
      $(".bottom__line").removeClass("bottom__active bottom__active1");
});
});
</script>



  

  </head>
  <body>
   
   <jsp:include page="../common/menubar.jsp"/>

    <br>
    <div class="wrap1">
       <!--설정아이콘-->
       <a href=""><span class="material-icons" id="setting">settings</span></a>
       <!-- 마이페이지 프로필 div-->
        <div class="page-name"> 
          <h style=" font-weight:bold;">마이페이지</h><br>
          <a href=""><img src="C:/DreamFunding-FrontRepo/webapp/resources/images/book5.jpg" 
          class="profile-img" width="80px;" height="80px;" style="border-radius:70px;" ></a>
        </div>
    </div>
    
    
        
    


    <!-- 이곳에 페이지 내용 작성 -->
    <main class="section">
      <div class="inner" >
        <!--  페이지 내용 작성하는곳 -->
           <!--서포터, 크리에이터 탭-->
            <div class="container mt-3" >
              <br>
              
              <ul class="nav nav-tabs nav-justified" >
                <li class="nav-item" >
                  <a class="nav-link active" data-toggle="tab" href="#menu1"><h3 style="font-weight:bold;">서포터</h3></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#menu2"><h3 style="font-weight:bold;">크리에이터</h3></a>
                </li>
              </ul>
            
              <!-- 세부메뉴 -->
              <div class="tab-content"  >
                
                <div id="menu1" class="container tab-pane active"   ><br><br>
                  <ul class="detail-menu">
                    <li class="menu--item__one">
                      <a class="link">펀딩한 프로젝트</a>
                    </li>
                    <li class="menu--item__two">
                      <a class="link1">관심있는 프로젝트</a>
                    </li>
                    <li class="menu--item__three">
                      <a class="link2">메시지</a>
                    </li>
                    <li class="bottom__line" >
                    </li><hr class="hrs">
                  </ul>
                  
                </div>
                  
                <div id="menu2" class="container tab-pane fade"><br><br>
                  <ul class="detail-menu">
                    <li class="menu--item__one">
                      <a class="link">프로젝트 만들기</a>
                    </li>
                    <li class="menu--item__two">
                      <a class="link1">제작한 프로젝트</a>
                    </li>
                    <li class="menu--item__three">
                      <a class="link2">메시지</a>
                    </li>
                    <li class="bottom__line">
                    </li><hr class="hrs">
                  </ul>
                </div>
              </div>
            </div>


            <!--컨텐트-->


            <div class="wrap2">
              <div class="like-project">
                <ul class="like-project-list">
                  <li class="like-project-detail">
                    
                    <figure class="like-project-image" >
                      <a href=""><img src="C:/DreamFunding-FrontRepo/webapp/resources/images/book5.jpg" alt="책" style=" border-radius:1%; width:100%; height:200px;"></a>
                    </figure>
                    <figcaption>
                      <h class="like-project-name"><a href="">웹툰 어시스트가 월300만원 이상 수익 꾸준히 얻는 방법</a></h><br>
                      <h style="font-size:11px;">웹툰 어시뿐 아니라 웹툰작가, 지망생, 그리고 그림그리는 모든 프리랜서들에게 유용한 이야기</h><br><br>
                      <h>936,000원</h>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <h style="color:#7f0000;" >312%</h>
                      <h style="float:right;">49일 남음</h>
                    </figcaption>
                  </li>
                  <li class="like-project-detail">
                    <figure class="like-project-image" >
                      <a href=""><img src="C:/DreamFunding-FrontRepo/webapp/resources/images/book5.jpg" alt="책" style=" border-radius:1%; width:100%; height:200px;"></a>
                    </figure>
                    <figcaption>
                      <h class="like-project-name"><a href="">웹툰 어시스트가 월300만원 이상 수익 꾸준히 얻는 방법</a></h><br>
                      <h style="font-size:11px;">웹툰 어시뿐 아니라 웹툰작가, 지망생, 그리고 그림그리는 모든 프리랜서들에게 유용한 이야기</h><br><br>
                      <h>936,000원</h>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <h style="color:#7f0000;" >312%</h>
                      <h style="float:right;">49일 남음</h>
                    </figcaption>
                  </li>
                  <li class="like-project-detail">
                    <figure class="like-project-image" >
                      <a href=""><img src="C:/DreamFunding-FrontRepo/webapp/resources/images/book5.jpg" alt="책" style=" border-radius:1%; width:100%; height:200px;"></a>
                    </figure>
                    <figcaption>
                      <h class="like-project-name"><a href="">웹툰 어시스트가 월300만원 이상 수익 꾸준히 얻는 방법</a></h><br>
                      <h style="font-size:11px;">웹툰 어시뿐 아니라 웹툰작가, 지망생, 그리고 그림그리는 모든 프리랜서들에게 유용한 이야기</h><br><br>
                      <h>936,000원</h>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <h style="color:#7f0000;" >312%</h>
                      <h style="float:right;">49일 남음</h>
                    </figcaption>
                  </li>
                  
                  
                  
                </ul>
                
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
  </body>
</html>
