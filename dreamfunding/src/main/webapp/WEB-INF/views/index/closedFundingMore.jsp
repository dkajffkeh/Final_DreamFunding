<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/datailSearch.css?after" />

</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	
	
	<!-- 이곳에 페이지 내용 작성 -->
    <main class="section">
        
        <!-- 문의하기 폼 들어갈곳 -->
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
            	<br>
            
                <div class="search-title">
                  <span>종료된 펀딩</span>
                  <div style="color: rgb(138, 138, 138); font-size:1.5rem"><a>드림펀딩에서 마무리된 프로젝트입니다.</a></div>
                </div>

                <br>

                <!-- 제목 -->
                <div class="title-form">
                    <!-- 카테고리 이름 바뀌는 부분! -->
                    <div class="title">
                      <span>프로젝트</span>
                      <span style="color: rgb(127,0,0);">64</span><span>개</span>
                    </div>
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

                <div class="page">

                    <!-- 펀딩 리스트 -->
                    <section class="thumbnail thumbnail-a">
                        <ul class="card-list">
                          
                        </ul>
                    </section>
                    
                </div>
            </div>
            
            
            <!-- 진행중인 펀딩 리스트 ajax -->
            <script>
	        	$(function(){
	        		selectProgressFundingList();
	        	})
	        	
	        	function selectProgressFundingList(progressList){
	        		
	        		$.ajax({
	        			url:"progressList.do",
	        			success:function(progressList){
	        				
	        				var value = "";
	        				for(var i in progressList){
	    						value += "<li class='card-item'>" + 
		    								 "<figure class='card-image' style='background-image: url(" + "/dreamfunding/resources/images/projectThumbnail/" + progressList[i].projectFileName + ")'>" +
					    	                    "<img src='../../../resources/images/book2.jpg'>" +
					    	                    "<div>" +
					    	                      "<div class='like'>" +
					    	                        "<span class='material-icons md-36'>favorite</span>" +
					    	                      "</div>" +
					    	                    "</div>" +
					    	                  "</figure>" +
					    	                  "<div class='card-desc'>" +
					    	                      "<div class='project-content'>" +
					    	                          "<div class='project-company'>" + progressList[i].creatorName + "</div>" +
					    	                          "<div class='project-title'>" + progressList[i].projectTitle + "</div>" +
					    	                      "</div>" +
					    	                      "<div class='project-detail'>" +
					    	                          "<div class='funding-percent'>" + progressList[i].projectStartDt + "</div>" +
					    	                          "<div class='funding-d-day'>" + progressList[i].projectCloseDt + "</div>" + 
					    	                      "</div>" +
					    	                  "</div>" +
				    	                  "</li>";
	        				}
	        				
	        				$(".thumbnail-a ul").html(value);
	        				
	        				
	        			},error:function(){
	        				console.log("ajax 통신 실패!");
	        			}
	        		})
	        		
	        	}
	        </script>

            <br><br>

            <!-- 페이징 -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                  </li>
                </ul>
            </nav>

        </div>
    </main>




	<jsp:include page="../common/footer.jsp"/>


</body>
</html>