<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dream Funding</title>    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index.css" />
</head>
<body>

	<jsp:include page="common/menubar.jsp"/>
	
	
	
	<main class="section">

      <div class="top"> <!---->
        <!-- 문의하기 버튼(sticky) -->
        <div class="sticky"> 
          <!-- 문의하기 폼 -->
          <div class="qna-form" id="showHide">
            <div class="qna-title">
              <div class="qna-title-detail">
                <span>크라우디</span>
                <button onclick=qnaClose();>X</button>
              </div>
              <div class="qna-time">
                <div>운영시간 아님</div>
                <div>10시간 뒤 상담이 운영됩니다.</div>
                <div>상담시간( 9:00am - 6:00pm )</div>
                <div class="qna-time-image">
                  <span class="material-icons md-48" id="moon">brightness_2</span>
                </div>
              </div>
            </div>
            <div class="qna-full">
              <div class="qna-1">
                <div class="qna-detail">
                  <div class="qna-profile">
                    <div class="qna-profile-image">
                      <span class="material-icons md-48" id="face">face</span>
                    </div>
                    <div class="qna-profile-name">드림 펀딩</div>
                    <div class="qna-profile-content">안녕하세요. 드림펀딩입니다. <br>무엇을 도와드릴까요?</div>
                  </div>
                  <div class="qna-start-button">
                    <button class="btn-qna">대화 시작</button>
                  </div>
                </div>
              </div>
              <div class="qna-call">
                <div>고객센터 ( 031 - 8039 - 5569 )</div>
              </div>
              <div class="qna-bottom">
                <div class="qna-bottom-content">
                  <span class="material-icons" id="bottom-face">face</span>
                  <span>실시간 상담 이용중</span>
                </div>
              </div>
            </div>
          </div>
          <!-- 문의하기 버튼 -->
          <button class="btnQna" onclick=showHide(); >
            <span class="spanQna">문의하기</span>
            <span class="material-icons md-48" id="face">face</span>
          </button>
        </div>

        <!-- 문의하기 스크립트 -->
        <script>
          
          function showHide(){
              if(document.getElementById("showHide").style.display =='none'){
                  document.getElementById("showHide").style.display ='block';
              }
              else{
                  document.getElementById("showHide").style.display ='none';
              }
          }
          function qnaClose(){
              if(document.getElementById("showHide").style.display =='none'){
                  document.getElementById("showHide").style.display ='block';
              }
              else{
                  document.getElementById("showHide").style.display ='none';
              }
          }
        </script>

        <div class="inner">

          <!-- 상단 메인 이미지 -->
          <div style="overflow: hidden;">
            <div class="main-image">
              <div class="inner-image">
                <div class="btn1">
                  <span class="material-icons md-48">navigate_before</span>
                </div>
                <img src="../../../resources/images/book7.jpg" alt="메인이미지" width="1200px" height="400px">
                <div class="btn2"><span class="material-icons md-48">navigate_next</span></div>
              </div>
              <div class="inner-image">
                <div class="btn1"><span class="material-icons md-48">navigate_before</span></div>
                <img src="../../../resources/images/book5.jpg" alt="메인이미지" width="1200px" height="400px">
                <div class="btn2"><span class="material-icons md-48">navigate_next</span></div>
              </div>
              <div class="inner-image">
                <div class="btn1"><span class="material-icons md-48">navigate_before</span></div>
                <img src="../../../resources/images/book14.jpg" alt="메인이미지" width="1200px" height="400px">
                <div class="btn2"><span class="material-icons md-48">navigate_next</span></div>
              </div>
            </div>
          </div>

          <!-- 메인이미지 슬라이드 자바스크립트 -->
          <script>
            document.querySelector('.btn1').addEventListener('click', function(){
              document.querySelector('.main-image').style.transform = 'translate(-100vw)';
            });
            document.querySelector('.btn2').addEventListener('click', function(){
              document.querySelector('.main-image').style.transform = 'translate(-200vw)';
            });
          </script>

          

          <!-- 내부 페이지 -->
          <div class="page" >

            <!-- 제목 : 진행중인 펀딩 -->
            <div class="title title-a">
              <div class="title-main">진행중인 펀딩</div>
              <span class="title-sub">드림펀딩에서 핫한 프로젝트들을 만나보세요!</span>
              <!-- select-box -->
              <div class="select-a">
                <select class="select-box">
                  <option value disabled="disabled" hidden="hidden"></option>
                  <option value="1">펀딩금액순</option>
                  <option value="2">마감임박순</option>
                  <option value="3">최신순</option>
                </select>
              </div>
            </div>

            <!-- 진행중인 펀딩 리스트 start -->
            <section class="thumbnail thumbnail-a">
              <ul class="card-list">
                <li class="card-item">
                  <div class="card-image" style="background-image: url(../../../resources/images/book12.jpg)">
                    <img src="../../../resources/images/book12.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </div>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">BeatChef</div>
                          <div class="project-title">'취미부터 입문자까지 1시간 완성' 비트메이킹 전자책</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">370% 달성!</div>
                          <div class="funding-d-day">D - 10</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book1.jpg)">
                    <img src="../../../resources/images/book1.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book2.jpg)">
                    <img src="../../../resources/images/book2.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book9.jpg)">
                    <img src="../../../resources/images/book9.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
              </ul>
            </section>
            <!-- 진행중인 펀딩 리스트 end -->

            <!-- 더보기 버튼 -->
            <div class="more more-a">
              <button type="button" class="more-btn">진행중인 펀딩 더보기</button>
            </div>

            <!-- 제목 : 실시간 랭킹 -->
            <div class="title title-b">
              <div class="title-main">실시간 랭킹</div>
              <span class="title-sub">오늘 가장 많은 사람들이 <b>#좋아한</b> 프로젝트</span>
              <!-- select-box -->
              <div class="select-b">
                <select class="select-box">
                  <option value disabled="disabled" hidden="hidden"></option>
                  <option value="1">펀딩금액순</option>
                  <option value="2">마감임박순</option>
                  <option value="3">최신순</option>
                </select>
              </div>
            </div>

            <!-- 실시간 랭킹 리스트 start -->
            <section class="thumbnail thumbnail-b">
              <ul class="card-list">
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book12.jpg)">
                    <img src="../../../resources/images/book12.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book1.jpg)">
                    <img src="../../../resources/images/book1.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book2.jpg)">
                    <img src="../../../resources/images/book2.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book9.jpg)">
                    <img src="../../../resources/images/book9.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
            </section>
            <!-- 실시간 랭킹 리스트 end -->

            <!-- 더보기 버튼 -->
            <div class="more more-b">
              <button type="button" class="more-btn">실시간 랭킹 더보기</button>
            </div>

            <!-- 제목 : 종료된 펀딩 -->
            <div class="title title-c">
              <div class="title-main">종료된 펀딩</div>
              <span class="title-sub">드림펀딩에서 마무리된 프로젝트입니다.</span>
            </div>

            <!-- 종료된 펀딩 리스트 start -->
            <section class="thumbnail thumbnail-c">
              <ul class="card-list">
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book12.jpg)">
                    <img src="../../../resources/images/book12.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book1.jpg)">
                    <img src="../../../resources/images/book1.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book2.jpg)">
                    <img src="../../../resources/images/book2.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
                <li class="card-item">
                  <figure class="card-image" style="background-image: url(../../../resources/images/book9.jpg)">
                    <img src="../../../resources/images/book9.jpg" alt="책">
                    <div>
                      <div class="like">
                        <span class="material-icons md-36">favorite</span>
                      </div>
                    </div>
                  </figure>
                  <div class="card-desc">
                      <div class="project-content">
                          <div class="project-company">회사이름</div>
                          <div class="project-title">프로젝트 제목</div>
                      </div>
                      <div class="project-detail">
                          <div class="funding-percent">펀딩 퍼센트</div>
                          <div class="funding-d-day">디데이</div>
                      </div>
                  </div>
                </li>
              </ul>
            </section>
            <!-- 종료된 펀딩 리스트 end -->

            <!-- 더보기 버튼 -->
            <div class="more more-c">
              <button type="button" class="more-btn">종료된 펀딩 더보기</button>
            </div>

            <!-- 문의하기쪽 아랫부분 공간 -->
            <div class="bottom">
              <!-- 여기에 문의하기 그거 들어가야되는디,,,문의하기는 페이지 위에 보여져야되는디,,,, 생각점,,, -->
              <br><br><br><br> 
            </div>


            

          </div>

        </div>
      </div> <!---->
      
      
      <div>
      	<a href="orderTest.test">고독한 결제방</a>
      </div>
      
      <div>
      	<a href="detailStory.de">고독한 디테일방</a>
      </div>
      
    </main>
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="common/footer.jsp"/>


</body>
</html>