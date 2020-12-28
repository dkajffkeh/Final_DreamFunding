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

/*서포터, 크리에이터 메뉴 스타일*/
  .nav-link{
    padding-top:15px;
   background-color:#ccc4bb;
   color:#7f0000;
   text-align:center;}
  
  .nav-item{}
  
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
// 네번째
$(".menu--item__four").click(function(){
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
      <div class="inner">
        <!--  페이지 내용 작성하는곳 -->
        <div class="wrap2">
           <!--서포터, 크리에이터 탭-->
            <div class="container mt-3" >
              <br>
              
              <ul class="nav nav-tabs nav-justified">
                <li class="nav-item" >
                  <a class="nav-link" data-toggle="tab" href="#menu1"><h3 style="font-weight:bold;">옵션</h3></a> 
                </li>
                
              </ul>
            
              <!--세부메뉴 html-->
            <div class="tab-content" style=" margin-bottom: 10px;">
              <div id="menu1" class="container tab-pane active" ><br><br>
                <nav class="nav--top">
                  <ul>
                      <li><a href="#">프로필</a></li>
                      <li><a href="#">계정</a></li>
                      <li><a href="#">결제수단</a></li>
                      <li><a href="#">배송지</a></li>
                  </ul>
              </nav>
              <hr class="line" style=" margin-top:0px;">
                
              </div>
                
           
            </div>  
          </div>
            </div>
            

            <!--프로필-->

            <!--스크립트-->
            <script>
            $(function (){
              $(".button").click(function (){
                $("#divToggle").toggle();
              });
            });
          </script>
          <div class="profile-wrap" >
            <div class="profile">
              <p class="p">프로필변경</p>
              <a href=""><img src="C:/DreamFunding-FrontRepo/webapp/resources/images/book5.jpg"
                          style="width:70px; height:70px; border-radius: 50%;"></a> 
                
                  <div class="togglee">
                    <button class="button">변경</button>
                      </div><br><br>
                        <div id="divToggle" style="display: none;">
                          <button type="button" class="btn" style="background-color: #7f0000; color:white;
                                                              transform: translate(0%,30%)">저장</button>
                          
                          <input type="file" style="margin-left:10px; transform: translate(30%,-300%);"></input></div>
                          
                          <hr> 
            </div>
          </div>

          
          <!--이름-->

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
                <p class="p">이름</p>
                  <h>홍길동</h>
                    <div class="togglee">
                      <button class="button1" style="background-color:white;
                        border:none;">변경</button>
                        </div><br><br>
                          <div id="divToggle1" style="display: none;">
                            <input type="text" class="form-control" id="usr" style="width:200px;
                                          margin-top:5px; margin-bottom:10px;" name="username">
                            <button type="button" class="btn" style="background-color: #7f0000; color:white;">저장</button></div>
                              <hr> 
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