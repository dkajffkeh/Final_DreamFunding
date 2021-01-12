<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/datailSearch.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	
	
	<!-- 이곳에 페이지 내용 작성 -->
    <main class="section">
        
        <!-- 문의하기 폼 들어갈곳 -->
        <div class="top"> <!---->
        <!-- 문의하기 버튼(sticky) -->
        <div class="sticky" style="display:none;"> 
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
          function detailClick(pno){
       		location.href = "proDetail.de?pno=" + pno;
       	  }
        </script>

            <div class="inner">
            	<br>
            
                <div class="search-title">
                  <span>실시간 랭킹</span>
                  <div style="color: rgb(138, 138, 138); font-size:1.5rem"><a>오늘 가장 많은 사람들이 <b>#좋아한</b> 프로젝트</a></div>
                </div>

                <br>

                <!-- 제목 -->
                <div class="title-form">
                    <!-- 카테고리 이름 바뀌는 부분! -->
                    <div class="title">
                      <span>프로젝트</span>
                      <span style="color: rgb(127,0,0);">${fn:length(list)}</span><span>개</span>
                    </div>
                    <!-- select-box -->
                    <div class="select-a">
                        <select class="select-box" id="selectValue" onchange="changeSelect()">
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
                        <c:forEach var="p" items="${ list }">
	                          <li class="card-item">
	                            <figure class="card-image" style="background-image: url(/dreamfunding/resources/images/projectThumbnail/${p.projectFileName})">
		                            <div>
				    				  <div class='like'>
				    				  		"<div class='finish' style='visibility:hidden;'><span>마감임박</span></div>"
		  	                  				<div onclick='likeClick(${p.projectNo});'>
		    	                        	<div id="${p.projectNo}">
		    	                        		<span class='material-icons md-36' name='likeIcon'>favorite</span>
		    	                        		<div class='pno' style='display:none;'>${p.projectNo}</div>
		    	                        	</div>
		    	                        </div>
		    	                      </div>
		    	                    </div>
	    	                  	</figure>
	                            <div class="card-desc" onclick="detailClick(${p.projectNo})">
	                                <div class="project-content">
	                                    <div class="project-company">${p.creatorName}</div>
	                                    <div class="project-title">${p.projectTitle }</div>
	                                </div>
	                                <div class="project-detail">
	                                	<c:if test="${p.projectGoal eq 'Y'}">
	                                		<div class="funding-percent">펀딩금액 달성!</div>
	                                	</c:if>
	                                	<c:if test="${p.projectGoal ne 'Y'}">
	                                		<div class="funding-percent">펀딩진행중!</div>
	                                	</c:if>
	                                    <div class="funding-d-day">${p.projectCloseDt}</div>
	                                </div>
	                            </div>
	                          </li>
                         </c:forEach>
                          
                          
                        </ul>
                    </section>
                </div>
            </div>

            <br><br>

            <!-- 페이징 -->
            <nav aria-label="Page navigation example">
                <div id="pagingArea">
	                <ul class="pagination justify-content-center">
	                	
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="rankingMore.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
	                    	</c:otherwise>
	                    </c:choose>	
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="rankingMore.do?currentPage=${ p }">${ p }</a></li>
	                   	</c:forEach> 
	                    
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="rankingMore.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                </ul>
	            </div>
            </nav>

        </div>
    </main>
    
    <!-- select box 진행중인 펀딩 -->
	        <script>
	        
	        
	        
	        function changeSelect(){
	        	
	        	var selectOption = document.getElementById("selectValue");
	        	
	        	var selectedValue = selectOption.options[selectOption.selectedIndex].value;
	        	
	        	var selectedText = selectOption.options[selectOption.selectedIndex].text;
	        	
	        	console.log(selectedValue);
	        	
	        	console.log(selectedText);
	        	
				if(selectedValue == 1){
	        		$.ajax({
	        			url:"selectMoney.do",
	        			success:function(selectMoneyList){
	        				console.log("펀딩금액순 통신성공");
	        				
	        				
	        				var value = "";
	        				
	        				
	        				for(var i in selectMoneyList){
	        					
	        					var today = new Date();
		        				var closeDay = new Date(selectMoneyList[i].projectCloseDt);
		        				var gapDay = closeDay.getTime() - today.getTime();
		        				gapDay = Math.floor(gapDay / (1000 * 60 * 60 * 24));
	        					
	        					if(i<8){	
		    						value += "<li class='card-item'>" + 
			    								 "<figure class='card-image' style='background-image: url(" + "/dreamfunding/resources/images/projectThumbnail/" + selectMoneyList[i].projectFileName + ")'>" +
				    								 "<div>" +
				    				                  "<div class='like'>";
	    	                  		if(gapDay < 20){
	    	                  			 value += "<div class='finish'><span>마감임박</span></div>";
	    	                  		}else{
	    	                  			value += "<div class='finish' style='visibility:hidden;'><span>마감임박</span></div>";
	    	                  		}
						    	                        
	    	                  		value += "<div onclick='likeClick(" + selectMoneyList[i].projectNo + ");'>" + 
			    	                        	"<div id=" + selectMoneyList[i].projectNo + ">" +
			    	                        		"<span class='material-icons md-36' name='likeIcon'>favorite</span>" + 
			    	                        		"<div class='pno' style='display:none;'>" + selectMoneyList[i].projectNo + "</div>" +
			    	                        	"</div>" +
			    	                        "</div>" +
			    	                      "</div>" +
			    	                    "</div>" +
			    	                  "</figure>" +
				    	                  "<div class='card-desc' onclick='detailClick(" + selectMoneyList[i].projectNo + ")'>" +
				    	                      "<div class='project-content'>" +
				    	                          "<div class='project-company'>" + selectMoneyList[i].creatorName + "</div>" +
				    	                          "<div class='project-title'>" + selectMoneyList[i].projectTitle + "</div>" +
				    	                      "</div>" +
				    	                      "<div class='project-detail'>" +
				    	                          "<div class='funding-percent'>" + selectMoneyList[i].projectStartDt + "</div>" +
				    	                          "<div class='funding-d-day'>" + selectMoneyList[i].projectCloseDt + "</div>" + 
				    	                      "</div>" +
				    	                  "</div>" +
			    	                  "</li>";
	        					}else{
	        						break;
	        					}
	        				}
	        				$(".thumbnail-a ul").html(value);
	        				likeList();
	        			},error:function(){
	        				console.log("ajax 통신 실패!");
	        			}
	        		})
	        	}else if(selectedValue == 2){
	        		$.ajax({
	        			url:"selectClosed.do",
	        			success:function(selectClosedList){
	        				console.log("마감임박순 통신성공");
	        				var value = "";
	        				for(var i in selectClosedList){
	        					
	        					var today = new Date();
		        				var closeDay = new Date(selectClosedList[i].projectCloseDt);
		        				var gapDay = closeDay.getTime() - today.getTime();
		        				gapDay = Math.floor(gapDay / (1000 * 60 * 60 * 24));
		        				
	    						if(i<8){
		        					value += "<li class='card-item'>" + 
			    								 "<figure class='card-image' style='background-image: url(" + "/dreamfunding/resources/images/projectThumbnail/" + selectClosedList[i].projectFileName + ")'>" +
				    								 "<div>" +
				    				                  "<div class='like'>";
	    	                  		if(gapDay < 20){
	    	                  			 value += "<div class='finish'><span>마감임박</span></div>";
	    	                  		}else{
	    	                  			value += "<div class='finish' style='visibility:hidden;'><span>마감임박</span></div>";
	    	                  		}
						    	                        
	    	                  		value += "<div onclick='likeClick(" + selectClosedList[i].projectNo + ");'>" + 
			    	                        	"<div id=" + selectClosedList[i].projectNo + ">" +
			    	                        		"<span class='material-icons md-36' name='likeIcon'>favorite</span>" + 
			    	                        		"<div class='pno' style='display:none;'>" + selectClosedList[i].projectNo + "</div>" +
			    	                        	"</div>" +
			    	                        "</div>" +
			    	                      "</div>" +
			    	                    "</div>" +
			    	                  "</figure>" +
						    	                  "<div class='card-desc' onclick='detailClick(" + selectClosedList[i].projectNo + ")'>" +
						    	                      "<div class='project-content'>" +
						    	                          "<div class='project-company'>" + selectClosedList[i].creatorName + "</div>" +
						    	                          "<div class='project-title'>" + selectClosedList[i].projectTitle + "</div>" +
						    	                      "</div>" +
						    	                      "<div class='project-detail'>" +
						    	                          "<div class='funding-percent'>" + selectClosedList[i].projectStartDt + "</div>" +
						    	                          "<div class='funding-d-day'>" + selectClosedList[i].projectCloseDt + "</div>" + 
						    	                      "</div>" +
						    	                  "</div>" +
					    	                  "</li>";
	    						}else{
	    							break;
	    						}                  
	        				}
	        				$(".thumbnail-a ul").html(value);
	        				likeList();
	        			},error:function(){
	        				console.log("ajax 통신 실패!");
	        			}
	        		})
	        	}else{
	        		$.ajax({
	        			url:"selectNew.do",
	        			success:function(selectNewList){
	        				console.log("최신순 통신성공");
	        				var value = "";
	        				for(var i in selectNewList){
	        					
	        					var today = new Date();
		        				var closeDay = new Date(selectNewList[i].projectCloseDt);
		        				var gapDay = closeDay.getTime() - today.getTime();
		        				gapDay = Math.floor(gapDay / (1000 * 60 * 60 * 24));
	        					
	        					if(i<8){
		    						value += "<li class='card-item'>" + 
			    								 "<figure class='card-image' style='background-image: url(" + "/dreamfunding/resources/images/projectThumbnail/" + selectNewList[i].projectFileName + ")'>" +
				    								 "<div>" +
				    				                  "<div class='like'>";
	    	                  		if(gapDay < 20){
	    	                  			 value += "<div class='finish'><span>마감임박</span></div>";
	    	                  		}else{
	    	                  			value += "<div class='finish' style='visibility:hidden;'><span>마감임박</span></div>";
	    	                  		}
						    	                        
	    	                  		value += "<div onclick='likeClick(" + selectNewList[i].projectNo + ");'>" + 
			    	                        	"<div id=" + selectNewList[i].projectNo + ">" +
			    	                        		"<span class='material-icons md-36' name='likeIcon'>favorite</span>" + 
			    	                        		"<div class='pno' style='display:none;'>" + selectNewList[i].projectNo + "</div>" +
			    	                        	"</div>" +
			    	                        "</div>" +
			    	                      "</div>" +
			    	                    "</div>" +
			    	                  "</figure>" +
						    	                  "<div class='card-desc' onclick='detailClick(" + selectNewList[i].projectNo + ")'>" +
						    	                      "<div class='project-content'>" +
						    	                          "<div class='project-company'>" + selectNewList[i].creatorName + "</div>" +
						    	                          "<div class='project-title'>" + selectNewList[i].projectTitle + "</div>" +
						    	                      "</div>" +
						    	                      "<div class='project-detail'>" +
						    	                          "<div class='funding-percent'>" + selectNewList[i].projectStartDt + "</div>" +
						    	                          "<div class='funding-d-day'>" + selectNewList[i].projectCloseDt + "</div>" + 
						    	                      "</div>" +
						    	                  "</div>" +
					    	                  "</li>";
	        					}else{
	        						break;
	        					}                  
	        				}
	        				$(".thumbnail-a ul").html(value);
	        				likeList();
	        			},error:function(){
	        				console.log("ajax 통신 실패!");
	        			}
	        		})
	        	}
	        	
	        }
	        
	        
	        </script>
	        
	        <!-- 좋아요 스크립트 -->
	        <script>
	        		var memNo = "${loginMem.memNo}";
	        		
	        		window.onload = function(){
	        			likeList();
	        		}
	        		
	        	
	        		function likeList() {
		        	 
		        		$.ajax({
		        			url:"likeList.do",// 라이크리스트 다셀렉해오는거
		        			data:{mno:memNo},
		        			success:function(likeList){
		        				if(likeList == null){
		        					return;
		        				}else{
		        					console.log()
		        					for(var i in likeList){
		        						$("#" + likeList[i].projectNo).find(".material-icons").css("color","rgb(127,0,0)");
		        					}
		        				}
		        				
		        			},error:function(){
		        				console.log("memNo없음");
		        			}
		        		})
	        		}
	        
	        	function likeClick(pno){
	        		
	        		if(memNo == ""){
    					swal("좋아요 실패", "로그인 후 이용해주세요!", "warning");
	        		}else{
	        			$.ajax({
		        			url:"likeBtn.do",
		        			data:{
		        					pno:pno,
		        					mno:memNo
	        					 },
		        			success:function(result){
		        				
		        				//console.log(result);
		        				
		        				//console.log("좋아요 클릭");
		        				
		        				var value="";
		        				if(result == 1){
		        					$("#" + pno).find(".material-icons").css("color","rgb(127,0,0)");
		        					swal("좋아요!", "좋아한 프로젝트에 추가되었습니다.", "success");
		        				}else{
		        					$("#" + pno).find(".material-icons").css("color","");
		        					swal("좋아요 취소!", "취소되었습니다.", "success");	        					
		        				}
		        				
		        				
		        			},error:function(){
		        				console.log("ajax 통신 실패!");
		        			}
		        		})
								
    				}
	        		
	        		
	        	}
	        	
	        </script>




	<jsp:include page="../common/footer.jsp"/>


</body>
</html>