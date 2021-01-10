<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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

.wrap{
  height:100%;
  text-align:center;}

.page-name{
   margin-left:490px;
   margin-right:250px;
   padding-top:30px;
   width:500px;
   text-align:center;
   display:inline-block;
   font-size:30px;}

#setting{
  font-size:40px;
  margin-right:200px;
  margin-top:50px;}




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


/*정렬방식 select옵션*/
.sort{margin-left:1000px;
}



/*후원결과 알림박스*/
.inform-box{
  width:850px;
  height:50px;
  display:inline-block;
  margin:20px auto;
  padding-left:30px;
  line-height: 2.6;
  font-size:large;
  background-color: rgba(212, 211, 211, 0.342)
}

/*펀딩한 프로젝트 박스*/
.funding-box{
  border:2px solid rgba(128, 128, 128, 0.336);
  width:850px;
  height:180px;
  display: inline-flex;
  margin: 20px auto;}


/*펀딩박스*/
.funding-date{
  display:inline-block;
  height:30px;
  margin-left:20px;
  margin-top:5px;

}

.funding-img{
  display:inline-block;
  width:200px;
  height:120px;
  transform: translate(-41%, 37%);
}

.funding-name{
  display:inline-flex;
  height:100px;
  line-height: 1.8;
  transform: translate(-35%, 52%);
  
}

.funding-label{
  display:inline-block;
  
  transform: translate(-86%, 28%);

}

.label {
  color: white;
  padding: 4px;
  border-radius: 10%;
  transform: translate(10%, -30%);
}
.success {background-color: #7f0000;} /* Green */

.detail-box{
  display:inline-block;
  transform: translate(100%, 41%)
  
}

#detail-button{
  font-size: 40px;;
}



.h3{margin-top:7px}

#pagingArea{text-align:center;}
</style>




  

  </head>
  <body>
  
   <jsp:include page="../common/menubar.jsp"/>
   

    <br>
    <!-- 마이페이지 고정된 상단 화면-->
    <div class="wrap">
      
       <!-- 마이페이지 프로필 div-->
        <div class="page-name"> 
          <h style=" font-weight:bold;">마이페이지</h><br>

              <c:choose>
              <c:when test="${ empty loginMem.memSystemname }">
              <a href="mypage.me">
              <img src="${pageContext.request.contextPath}/resources/images/book1.jpg"
                          style="width:70px; height:70px; border-radius: 50%;">
                          </a>
              </c:when>
              <c:otherwise>
              <a href="mypage.me">
              <img src="${pageContext.request.contextPath}/resources/images/profile/${loginMem.memSystemname}"
              		 	  style="width:70px; height:70px; border-radius: 50%;">
              		 	  </a>
               </c:otherwise>
              </c:choose>
        </div>
         <!--설정아이콘-->
       <a href="optionProfile.me"><span class="material-icons" id="setting">settings</span></a>
    </div>
    
    
        
    


    <!-- 이곳에 페이지 내용 작성 -->
    <main class="section" >

        <div class="inner" >

            <div class="wrap2" style=" margin-top: 10px;">
          <!--서포터, 크리에이터 탭-->
           <div class="container mt-3" style=" margin-bottom: 10px;">
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
            <div class="tab-content" style=" margin-bottom: 10px;">
              <div id="menu1" class="container tab-pane active" ><br><br>
                <nav class="nav--top" style="margin-left:55px;">
                  <ul>
                      <li><a href="myFundingProject.me?mno=${ loginMem.memNo }">펀딩한 프로젝트</a></li>
                      <li><a href="myLikeProject.me?mno=${ loginMem.memNo }">관심있는 프로젝트</a></li>
                  </ul>
              </nav>
              <hr class="line" style=" margin-top:0px;">
                
              </div>
                
              <div id="menu2" class="container tab-pane fade"><br><br>
                <nav class="nav--top" style="margin-left:55px;">
                  <ul>
                      <li><a href="makeProject.me">프로젝트 만들기</a></li>
                      <li><a href="myMadeProject.me">제작한 프로젝트</a></li>
                  </ul>
              </nav>
              <hr class="line" style=" margin-top:0px;">
              </div>

            </div>  
          </div>
            <!--진짜 내용 작성시작-->
            <div class="real-content" style=" text-align:center;"><br>
	              <select class="sort">
	                <option>모두보기</option>
	                <option>펀딩 진행중</option>
	                <option>펀딩 완료</option>
	                <option>취소/ 실패</option>
	              </select><br>

              <!--펀딩결과 알림 박스-->
              <div class="inform-box" >총 ${ mypi.listCount }건의 펀딩결과가 있습니다.</div>

              <!--펀딩한 프로젝트 박스-->
              <c:forEach var="f" items="${list}">
              <div class="funding-box" onclick="location.href='proDetail.de?pno=${ f.projectNo }';">
                <div class="funding-date">${ f.projectStartDate}</div><div></div>
                <div class="funding-img"><img src="/dreamfunding/resources/images/projectThumbnail/${ f.projectFileName }"
                                          style="width:200px; height:120px;"></div>
                                          <div class="funding-label"><span class="label success">펀딩완료</span></div>
                <div class="funding-name"><br>${f.projectTitle } <br>결제예약 10000원<br>${f.projectCloseDate}</div>
                <div class="detail-box"><a href="proDetail.de?pno=${ f.projectNo }"><span id="detail-button" class="material-icons">
                  keyboard_arrow_right
                  </span></a></div>
              </div>
              </c:forEach>
              
              

              
              <br><br><br><br>
              <!--더보기-->
              
            </div>
            
            <br><br>
          <div id="pagingArea"  >
              	<ul class="pagination" style="justify-content: center; ">
              	
              	<c:choose>
              	  <c:when test="${mypi.currentPage eq 1 }">
				 	 <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
				  </c:when>
				  <c:otherwise>
				 	 <li class="page-item"><a class="page-link" href="myFundingProject.me?currentPage=${mypi.currentPage -1 }">이전</a></li>
				  </c:otherwise>
				</c:choose>
				  
				  <c:forEach var="p" begin="${mypi.startPage }" end="${mypi.endPage }">
				    <li class="page-item"><a class="page-link" href="myFundingProject.me?currentPage=${ p }">${ p }</a></li>
				  </c:forEach>
				  
				  <c:choose>
				  	<c:when test="${mypi.currentPage eq mypi.maxPage }">
				  		<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
				    </c:when>
				    <c:otherwise>
				 		<li class="page-item"><a class="page-link" href="myFundingProject.me?currentPage=${mypi.currentPage +1 }">다음</a></li>
			  	  	</c:otherwise>
			  	  </c:choose>
			  	</ul>
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