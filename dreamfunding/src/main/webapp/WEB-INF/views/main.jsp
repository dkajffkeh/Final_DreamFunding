<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dream Funding</title>    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
          <div class="main-image-full" style="overflow: hidden;">
            <div class="main-image">
              <div class="inner-image">
                <img src="${pageContext.request.contextPath}/resources/images/main01.jpg" alt="메인이미지" width="1200px" height="400px">
              </div>
              <div class="inner-image">
                <img src="${pageContext.request.contextPath}/resources/images/main02.jpg" alt="메인이미지" width="1200px" height="400px">
              </div>
              <div class="inner-image">
                <img src="${pageContext.request.contextPath}/resources/images/main03.jpg" alt="메인이미지" width="1200px" height="400px">
              </div>
              
            </div>
          </div>
          <div class="main-slide-button">
            	<button class="btn1">1</button>
            	<button class="btn2">2</button>
            	<button class="btn3">3</button>
          </div>

          <!-- 메인이미지 슬라이드 자바스크립트 -->
          <script>
          	document.querySelector('.btn1').addEventListener('click', function(){
              document.querySelector('.main-image').style.transform = 'translate(0vw)';
            });
            document.querySelector('.btn2').addEventListener('click', function(){
              document.querySelector('.main-image').style.transform = 'translate(-100vw)';
            });
            document.querySelector('.btn3').addEventListener('click', function(){
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
                <select class="select-box" id="selectValue" onchange="changeSelect()">
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
                
              </ul>
            </section>
            <!-- 진행중인 펀딩 리스트 end -->
            
            <!-- 진행중인 펀딩 리스트 ajax -->
            <script>
	        	$(function(){
	        		selectProgressFundingList();
	        	})
	        	
	        	function detailClick(pno){
	        		location.href = "proDetail.de?pno=" + pno;
	        	}
	        	function selectProgressFundingList(progressList){
	        		
	        		
	        		
	        		$.ajax({
	        			url:"progressList.do",
	        			success:function(progressList){
	        				
	        				var value = "";
	        				
	        				for(var i in progressList){
	        					
	        					var today = new Date();
		        				var closeDay = new Date(progressList[i].projectCloseDt);
		        				var gapDay = closeDay.getTime() - today.getTime();
		        				gapDay = Math.floor(gapDay / (1000 * 60 * 60 * 24));
		        				
		        				
	        					if(i < 8){
		    						value += "<li class='card-item'>" +
			    								 "<figure class='card-image' style='background-image: url(" + "/dreamfunding/resources/images/projectThumbnail/" + progressList[i].projectFileName + ")'>" +
						    	                    "<div>" +
						    	                      "<div class='like'>";
	    	                  		if(gapDay < 20){
	    	                  			 value += "<div class='finish'><span>마감임박</span></div>";
	    	                  		}else{
	    	                  			value += "<div class='finish' style='visibility:hidden;'><span>마감임박</span></div>";
	    	                  		}
						    	                        
						    	               value += "<div onclick='likeClick(" + progressList[i].projectNo + ");'>" + 
						    	                        	"<div name=" + progressList[i].projectNo + ">" +
						    	                        		"<span class='material-icons md-36' name='likeIcon'>favorite</span>" + 
						    	                        		"<div class='pno' style='display:none;'>" + progressList[i].projectNo + "</div>" +
						    	                        	"</div>" +
						    	                        "</div>" +
						    	                      "</div>" +
						    	                    "</div>" +
						    	                  "</figure>" +
						    	                  "<div class='card-desc' onclick='detailClick(" + progressList[i].projectNo + ")'>" +
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
	        </script>
	        
	        <!-- 좋아요 스크립트 -->
	        <script>
	        		var memNo = "${loginMem.memNo}";
	        		
	        		function likeList() {
		        	 
		        		$.ajax({
		        			url:"likeList.do",// 라이크리스트 다셀렉해오는거
		        			data:{mno:memNo},
		        			success:function(likeList){
		        				if(likeList == null){
		        					return;
		        				}else{
		        					//console.log(likeList);
		        					for(var i in likeList){
		        						//console.log($("[name="+ likeList[i].projectNo +"]"));
		        						$("[name=" + likeList[i].projectNo + "]").find(".material-icons").css("color","rgb(127,0,0)");
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
		        					$("[name=" + pno + "]").find(".material-icons").css("color","rgb(127,0,0)");
		        					swal("좋아요!", "좋아한 프로젝트에 추가되었습니다.", "success");
		        				}else{
		        					$("[name=" + pno + "]").find(".material-icons").css("color","");
		        					swal("좋아요 취소!", "취소되었습니다.", "success");	       
		        				}
		        				
		        			},error:function(){
		        				console.log("ajax 통신 실패!");
		        			}
		        		})
								
    				}
	        		
	        		
	        	}
	        	
	        </script>
	        
	        
	        	
	        
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
			    	                        	"<div name=" + selectMoneyList[i].projectNo + ">" +
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
			    	                        	"<div name=" + selectClosedList[i].projectNo + ">" +
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
			    	                        	"<div name=" + selectNewList[i].projectNo + ">" +
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
            

            <!-- 더보기 버튼 -->
            <div class="more more-a">
              <button class="moreBtn" onclick="location.href='progressMore.do'">진행중인 펀딩 더보기</button>
            </div>

            <!-- 제목 : 실시간 랭킹 -->
            <div class="title title-b">
              <div class="title-main">실시간 랭킹</div>
              <span class="title-sub">가장 많은 사람들이 <b>#조회한</b> 프로젝트</span>
              
            </div>

            <!-- 실시간 랭킹 리스트 start -->
            <section class="thumbnail thumbnail-b">
              <ul class="card-list">
                
              </ul>
            </section>
            <!-- 실시간 랭킹 리스트 end -->
            
            <!-- 실시간 랭킹 리스트 ajax -->
            <script>
	        	$(function(){
	        		selectRankingList();
	        	})
	        	
	        	function selectRankingList(rankingList){
	        		
	        		$.ajax({
	        			url:"rankingList.do",
	        			success:function(rankingList){
	        				
	        				var value = "";
	        				for(var i in rankingList){
	        					
	        					var today = new Date();
		        				var closeDay = new Date(rankingList[i].projectCloseDt);
		        				var gapDay = closeDay.getTime() - today.getTime();
		        				gapDay = Math.floor(gapDay / (1000 * 60 * 60 * 24));
		        				
	        					if(i<8){
	        						
	        					
		    						value += "<li class='card-item'>" +
			    								 "<figure class='card-image' style='background-image: url(" + "/dreamfunding/resources/images/projectThumbnail/" + rankingList[i].projectFileName + ")'>" +
				    								 "<div>" +
				    								 "<div class='like'>";
	    	                  		if(gapDay < 20){
	    	                  			 value += "<div class='finish'><span>마감임박</span></div>";
	    	                  		}else{
	    	                  			value += "<div class='finish' style='visibility:hidden;'><span>마감임박</span></div>";
	    	                  		}
						    	                        
	    	                  		value += "<div onclick='likeClick(" + rankingList[i].projectNo + ");' >" + 
			    	                        	"<div name=" + rankingList[i].projectNo + ">" +
			    	                        		"<span class='material-icons md-36' name='likeIcon' >favorite</span>" + 
			    	                        		"<div class='pno' style='display:none;'>" + rankingList[i].projectNo + "</div>" +
			    	                        	"</div>" +
			    	                        "</div>" +
			    	                      "</div>" +
			    	                    "</div>" +
			    	                  "</figure>" +
						    	                  "<div class='card-desc' onclick='detailClick(" + rankingList[i].projectNo + ")'>" +
						    	                      "<div class='project-content'>" +
						    	                          "<div class='project-company'>" + rankingList[i].creatorName + "</div>" +
						    	                          "<div class='project-title'>" + rankingList[i].projectTitle + "</div>" +
						    	                      "</div>" +
						    	                      "<div class='project-detail'>" +
						    	                          "<div class='funding-percent'>" + rankingList[i].projectStartDt + "</div>" +
						    	                          "<div class='funding-d-day'>" + rankingList[i].projectCloseDt + "</div>" + 
						    	                      "</div>" +
						    	                  "</div>" +
					    	                  "</li>";
	        					}else{
	        						break;
	        					}
	        				}
	        				
	        				$(".thumbnail-b ul").html(value);
	        				likeList();
	        				
	        			},error:function(){
	        				console.log("ajax 통신 실패!");
	        			}
	        		})
	        		
	        	}
	        </script>

            <!-- 더보기 버튼 -->
            <div class="more more-b">
              <button class="moreBtn" onclick="location.href='rankingMore.do'">실시간 랭킹 더보기</button>
            </div>

            <!-- 제목 : 종료된 펀딩 -->
            <div class="title title-c">
              <div class="title-main">종료된 펀딩</div>
              <span class="title-sub">드림펀딩에서 마무리된 프로젝트입니다.</span>
            </div>

            <!-- 종료된 펀딩 리스트 start -->
            <section class="thumbnail thumbnail-c">
              <ul class="card-list">
                
              </ul>
            </section>
            <!-- 종료된 펀딩 리스트 end -->
            
            <!-- 종료된 펀딩 리스트 ajax -->
            <script>
	        	$(function(){
	        		selectClosedFundingList();
	        	})
	        	
	        	function selectClosedFundingList(closedList){
	        		
	        		$.ajax({
	        			url:"closedList.do",
	        			success:function(closedList){
	        				
	        				var value = "";
	        				for(var i in closedList){
	        					if(i<8){
		    						value += "<li class='card-item'>" +
			    								 "<figure class='card-image' style='background-image: url(" + "/dreamfunding/resources/images/projectThumbnail/" + closedList[i].projectFileName + ")'>" +
				    								 "<div>" +
						    	                      "<div class='like'>" +
						    	                        "<div class='finish'><span>펀딩완료</span></div>" +
						    	                        	"<div><span class='material-icons md-36'>favorite</span></div>" +
						    	                      "</div>" +
						    	                    "</div>" +
						    	                  "</figure>" +
						    	                  "<div class='card-desc' onclick='detailClick(" + closedList[i].projectNo + ")'>" +
						    	                      "<div class='project-content'>" +
						    	                          "<div class='project-company'>" + closedList[i].creatorName + "</div>" +
						    	                          "<div class='project-title'>" + closedList[i].projectTitle + "</div>" +
						    	                      "</div>" +
						    	                      "<div class='project-detail'>" +
						    	                          "<div class='funding-percent'>" + closedList[i].projectStartDt + "</div>" +
						    	                          "<div class='funding-d-day'>" + closedList[i].projectCloseDt + "</div>" + 
						    	                      "</div>" +
						    	                  "</div>" +
					    	                  "</li>";
	        					}else{
	        						break;
	        					}
	        				}
	        				
	        				$(".thumbnail-c ul").html(value);
	        				likeList();
	        				
	        			},error:function(){
	        				console.log("ajax 통신 실패!");
	        			}
	        		})
	        		
	        	}
	        </script>
            

            <!-- 더보기 버튼 -->
            <div class="more more-c">
              <button class="moreBtn" onclick="location.href='closedMore.do'"><span>종료된 펀딩 더보기</span></button>
            </div>

            <!-- 문의하기쪽 아랫부분 공간 -->
            <div class="bottom">
              <br><br><br><br> 
            </div>


            

          </div>

        </div>
      </div> <!---->
      
      
      <div>
      	<a href="detailStory.de">고독한 디테일방</a>
      </div>
      
      <div>
      	<a href="daminIndex.ad">졸라 고독한 관리자페이지</a>
      </div>
      
    </main>
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="common/footer.jsp"/>


</body>
</html>