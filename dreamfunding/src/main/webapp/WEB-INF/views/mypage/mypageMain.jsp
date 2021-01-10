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

.nav-link{

  padding-top:30px;
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
  text-decoration:none;}


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
  transition: all 0.2s ease-in-out;}  /*(서포터) 서서히 확대 */

.supporter-menu:hover {
  transform: scale(1.01);
  -webkit-transform: scale(1.01);
  -moz-transform: scale(1.01);
  -ms-transform: scale(1.01);
  -o-transform: scale(1.01);}

.creator-menu {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.2s ease-in-out;}  /*(크리에이터) 서서히 확대 */

.creator-menu:hover {
  transform: scale(1.01);
  -webkit-transform: scale(1.01);
  -moz-transform: scale(1.01);
  -ms-transform: scale(1.01);
  -o-transform: scale(1.01);}

.profile-img{
  margin-top:10px;}


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
        <div class="wrap2">
          <div class="page-menu">
           <!--서포터, 크리에이터 탭-->
            <div class="container mt-3">
              <br>
              <!-- Nav tabs -->
              <ul class="nav nav-tabs nav-justified" style="border-radius: 20px; border:none;"  >
                <li class="nav-item">
                  <a class="nav-link active" style="line-height:10px; margin-right:10px; border-radius: 20px; border:1px solid rgb(206, 206, 206);" data-toggle="tab" href="#menu1"><h3 class="h3" style="font-weight:bold;">서포터</h3></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" style="border-radius: 20px; border:1px solid rgb(206, 206, 206);" data-toggle="tab" href="#menu2"><h3 class="h3" style="font-weight:bold;">크리에이터</h3></a>
                </li>
              </ul>
            
              <!-- Tab panes -->
              <div class="tab-content" >
                
                <div id="menu1" class="container tab-pane active" ><br><br><br>
                  <a href="myFundingProject.me?mno=${ loginMem.memNo }"><h4 class="supporter-menu" style="font-weight:bold;">펀딩한 프로젝트</h4></a><br><br>
                  <a href="myLikeProject.me?mno=${ loginMem.memNo }"><h4 class="supporter-menu" style="font-weight:bold;">관심있는 프로젝트</h4></a><br><br>
                  
                </div>
                <div id="menu2" class="container tab-pane fade"><br><br><br>
                  <a href="makeProject.me"><h4 class="creator-menu" style="font-weight:bold;">프로젝트 만들기</h4></a><br><br>
                  <a href="myMadeProject.me"><h4 class="creator-menu" style="font-weight:bold;">제작한 프로젝트</h4></a><br><br>
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

</body>
</html>