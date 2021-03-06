<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dream Funding</title>

    <!-- Facebook (Common) Open Graph -->
    <meta property="og:type" content="website" />
	<meta property="og:url" content="http://localhost:8897/dreamfunding/proDetail.de?pno=${ d.projectNo }" />
	<meta property="og:title" content="${d.projectTitle}" />
	<meta property="og:description" content="${d.projectSubtitle}" />
  	<meta property="og:image" content="https://i.imgur.com/B1Xi5dd.jpg" />

 	<!-- Twitter -->
	<meta property="twitter:card" content="summary_large_image" />
    <meta property="twitter:title" content="${d.projectTitle}" />
    <meta
      property="twitter:description"
      content="${d.projectSubtitle}"
    />
    <meta property="twitter:image" content="https://i.imgur.com/B1Xi5dd.jpg" />
    <meta property="twitter:url" content="http://localhost:8897/dreamfunding/proDetail.de?pno=${ d.projectNo }" />
    
    
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="resources/css/detail/detail.css" />    
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>

<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v9.0" nonce="Pc0af6ST"></script>

 <jsp:include page="../common/menubar.jsp"/>

  <main class="section">
      <div class="inner">
        <div class="intro__wrapper">
          <div class="intro-top__wrapper">
            <ul>
            
              <li>
              
              <button type="button" class="btn btn--icon" onclick="goCategory()">${ d.projectCategoryName }</button>
              
              </li>
            
            
              <li>${ d.projectTitle }</li>
              <li>
                  <div class="profile_wrapper">
                        <c:if test="${ !empty d.creatorProfile }">
                        <img
                          class="image"
                          src="resources/images/creatorThumbnail/${ d.creatorProfile }"
                          alt="유저 프로필 이미지"
                        />  
                      </c:if>  
                   	 <c:if test="${ empty d.creatorProfile }">
                   	    <span class="material-icons"> account_circle </span>
                     </c:if>
                        <div class="profile_caption">
                          <span class="name">${ d.creatorName }</span>
                        </div>
                  </div>      
              </li>
            </ul>
          </div>
          <div class="intro-bottom__wrapper">
            <div class="intro-left__wrapper">
              <div class="intro-img">
                <img
                  src="resources/images/projectThumbnail/${ d.projectFileName }"
                  alt="프로젝트 대표 이미지"
                />
              </div>
            </div>
            <div class="intro-right__wrapper">
              <div class="status-wrapper">
                <div class="funding-status__wrapper">
                  <div class="status-title">펀딩금액</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">
                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${ tp }"/>
                    </div>
                    <span class="status-unit">원</span>
                  </div>
                </div>
                
                <fmt:parseNumber value="${d.projectGoalPrice}" var="goalPrice"/>   
                <div class="funding-status__wrapper">
                  <div class="status-title">달성률</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value" id="tp">${ (tp/goalPrice)*100 }</div>
                    <span class="status-unit">%</span>
                  </div>
                </div>
                <div class="funding-status__wrapper">
                  <div class="status-title">남은 기간</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value" id="dDay">${ d.projectEndDate }</div>
                    <span class="status-unit" id='dDay-unit'>일</span>
                  </div>
                </div>
                <div class="funding-status__wrapper">
                  <div class="status-title">총 펀딩 수</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">${ ta }</div>
                    <span class="status-unit">개</span>
                  </div>
                </div>
              </div>
              <div class="status-info-box">
                <div class="info-box__inner">
                  <span>
                    목표 금액인
                    <!-- -->
                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${ d.projectGoalPrice }"/>
                    <!-- -->원이 모여야만 결제됩니다. <br /></span>
                    <span>
                    목표 금액을 달성한 경우, 결제예정일은
                    <!-- -->
                    ${ d.projectEndDate } 이후 10일 이내
                    <!-- -->입니다.
                  </span>
                </div>
              </div>
              <div class="status-btn__wrapper">
                <button type="button" class="btn btn--main btn--p">
                  <a href="#rewardLabel">프로젝트 밀어주기</a>
                </button>
                <div class="btn-icon__wrapper" id="like-btn__wrapper">
                  
                  <c:if test="${!empty loginMem }">
                  	
                  	<c:choose>
                  	  <c:when test="${ lk eq 0 }">
		                  <button type="button" class="btn btn--icon like-btn" onclick="addLike()" id="addLike">
		                    <span class="material-icons">favorite_border</span>   
		                  </button>
	                  </c:when>
	                    <c:when test="${ lk eq 1 }">
		                  <button type="button" class="btn btn--icon like-btn" onclick="removeLike()" id="removeLike">
		                    <span class="material-icons">favorite</span>   
		                  </button>
	                  </c:when>
	      			</c:choose>
		           </c:if>
		           
		              <c:if test="${empty loginMem }">
	                 	
	                  <button type="button" class="btn btn--icon" onclick="alert('로그인해주세요.')">
	                    <span class="material-icons"> favorite_border </span>   
	                  </button>
	      
		           </c:if>
		           
                   <span class="like-count"></span>
                  <button
                    type="button"
                    class="btn btn--icon"
                    onClick="snsModalOpen()"
                  >
                    <span class="material-icons"> share </span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <ul class="content__nav">
          <li class="borderLeftRight" id="story-nav"><a href="proDetail.de?&pno=${d.projectNo}">스토리</a></li>
          <li class="borderLeftRight" id="community-nav"><a href="proDetail.de?page=2&pno=${d.projectNo}">커뮤니티</a></li>
          <li class="borderLeftRight" id="policy-nav"><a href="proDetail.de?page=3&pno=${d.projectNo}">펀딩 안내</a></li>
        </ul>
        
       
       	

    <!-- 공유하기 모달 -->
    <div id="sns-modal" class="modal__layout">
      <div id="sns-modal-box" class="modal__box">
      	<span class="material-icons" onClick="snsModalClose()">close</span>
        <div class="label">프로젝트 공유하기</div>
        <div class="gap"></div>
        <div class="sns__icon__wrapper">
          <a onclick="window.open('https://twitter.com/intent/tweet?text=dreamfunding&url=http://localhost:8897/dreamfunding/proDetail.de?pno=${ d.projectNo }')"><i class="fab fa-twitter fa-3x"></i></a>
          <a onclick="window.open('https://www.facebook.com/sharer.php?u=http://localhost:8897/dreamfunding/proDetail.de?pno=${ d.projectNo }')"><i class="fab fa-facebook fa-3x"></i></a>
		  <!-- 웹페이지가 외부에서 접속 가능해야 메타태그 확인 가능, 외부에서 접속할 수 없는 주소  -->
		  <a id="kakao-link-btn" href="javascript:sendLink()"><i class="fas fa-comment fa-3x"></i></a>
        </div>
        <div class="modal__btn__wrapper"></div>
      </div>
    </div>
    
    <script defer>
 
    // url에서 쿼리스트링 추출 
    function getUrlParams() {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
        return params;
    }
	
    
	function goCategory(){    
	    let categoryName = '${ d.projectCategoryName }';
	      switch(categoryName){
		    case "잡지": location.href='magazine.do';
		    break;
		    case "문학&에세이": location.href='essay.do';
		    break;
		    case "예술": location.href='art.do';
		    break;
		    case "실용&취미": location.href='hobby.do';
		    break;
		    case "그림책": location.href='drawing.do';
		    break;
		    case "기타": location.href='etc.do';
		    break;
	    }
	}
    // 
 	  (function(){
 		  //console.log(location.href);
 		  //console.log(getUrlParams());
 		  const option = parseInt(getUrlParams().page);
 		  if(!option){
 			 document.querySelector('#story-nav').classList.add("nav-active");		 
 		  }else if(option===2){
 			 document.querySelector('#community-nav').classList.add("nav-active");	
 		  }else{
 			 document.querySelector('#policy-nav').classList.add("nav-active");	
 		  }
 	  })()
    
      // sns 모달
      const snsModalOpen = () => {
        document.querySelector("#sns-modal").classList.toggle("modal__active");
      };
      const snsModalClose = () => {
        document.querySelector("#sns-modal").style.animation =
          "fadeOut 0.4s ease-in-out forwards";
        document.querySelector("#sns-modal-box").style.animation =
          "slideDown 0.4s ease-in-out forwards";

        setTimeout(() => {
          document
            .querySelector("#sns-modal")
            .classList.toggle("modal__active");
          document.querySelector("#sns-modal").style.animation =
            "fadeIn 0.4s ease-in-out forwards";
          document.querySelector("#sns-modal-box").style.animation =
            "slideUp 0.4s ease-in-out forwards";
        }, 400);
      };
     
      
      // 좋아요 유무 조회 
      // 로그인한 사용자와 좋아요한 사용자 일치 시 removeLike 함수 호출 
      // 로그인한 사용자와 좋아요한 사용자 불일치 시 addLike 함수 호출 
      const likeBtnWrapper = document.querySelector("#like-btn__wrapper")  
      const makeLikeBtn =(isOk)=>{
    	  const likeBtn = document.createElement("button")
    		likeBtn.type="button"
    		likeBtn.className="btn btn--icon like-btn"
    			if(isOk){
    				likeBtn.onclick=removeLike
    			}else if(!isOk){
    				likeBtn.onclick=addLike
    			}
    	    likeBtn.id="addLike"
   	  const span = document.createElement("span")
   	   span.className="material-icons"
   	   span.innerText = isOk ? "favorite" : "favorite_border" 
   	  
   	  likeBtn.appendChild(span)
      likeBtnWrapper.prepend(likeBtn)

      }
      
      // 좋아요 추가      
      const addLike =()=>{
        axios.get('like.de',{
          params:{
		            memNo:'${loginMem.memNo}',
		            pno:'${d.projectNo}'
		         }
        })
        .then(response=>{
            if(response.data==='success'){
              alert('좋아한 프로젝트에 추가되었습니다.');
              const likeBtn = document.querySelector(".like-btn")
              likeBtn.remove()
              makeLikeBtn(true)
            }
          }).catch(()=>{
            alert('좋아요 실패')
          })
        }
      
      // 좋아요 취소 
      const removeLike =()=>{
          axios.get('deletelike.de',{
            params:{
  		            memNo:'${loginMem.memNo}',
  		            pno:'${d.projectNo}'
  		         }
          })
          .then(response=>{
              if(response.data==='success'){
                alert('취소되었습니다.');
                const likeBtn = document.querySelector(".like-btn")
                likeBtn.remove()
                makeLikeBtn(false)
              }
            }).catch(()=>{
              alert('좋아요 취소 실패')
            })
          }
      
   	  // 프로젝트 달성률 100% 초과 시 css 변경 
   	  (function(){
   		const tp = parseFloat(document.querySelector("#tp").innerText);
   		const res = tp.toString().split('.')[0];
		   		
        if(res.length > 2){
          //100이상 -> 100.**
          document.querySelector('#tp').innerText = tp.toString().substr(0, 6)
        }else{
          //10이상  -> 10.**
          document.querySelector('#tp').innerText = tp.toString().substr(0, 5)
        }
        
   		if(tp>=100){
   			document.querySelector("#tp").style.color='#7F0000';
   			document.querySelector("#tp").style.animation='bling 0.7s ease-in-out alternate infinite';
   		}
   		
   	  })()
   	  
   	  
      // 프로젝트 종료일까지 남은 기간 구하기  기능   
	  const endDate = new Date(document.querySelector('#dDay').textContent); // 프로젝트 종료일 
      const now = new Date(); // 현재 날짜
      const toEndDate = endDate.getTime(); 
      // 1970년 1월 1일 0시 0분 0초부터 해당 날짜까지의 시간을 밀리초 단위로 환산한 값을 숫자로 반환
   	  const toNow = now.getTime(); 

   	  const gap = toEndDate - toNow // 현재 날짜에서 종료일까지 차이
      const resultDay = Math.floor(gap/(1000 * 60 * 60 * 24)+1); // gap을 일(밀리초 * 초 * 분 * 시간)로 나누기  
     
   	  document.querySelector('#dDay').innerText = resultDay;
 
      
 	  // 프로젝트 종료일/종료일 이후 화면 출력 변경 
   	  (function(){
   		  const dDay = parseInt(document.querySelector('#dDay').innerText);
   		  if(dDay===0){
   			  document.querySelector('#dDay').innerText='d-Day';
   			  document.querySelector('#dDay').style.color='#7F0000';
   			  document.querySelector('#dDay').style.animation='bling2 0.5s ease-in-out alternate infinite';
   		  }
   		  if(dDay<0){
   			 document.querySelector("#dDay").innerText='프로젝트가 종료되었습니다.';
   			 document.querySelector("#dDay-unit").innerText=' ';
   		  }
   	  })()
   	  
   	  
	  // 카카오 공유하기 기능
   	  Kakao.init('71db9ed39bf999a17fc5c0963aa8d2bb');
   	  function sendLink() {
   	    Kakao.Link.sendDefault({
   	      objectType: 'feed',
   	      content: {
   	        title: `${ d.projectTitle }`,
   	        description: `${ d.projectSubtitle }`,
   	        imageUrl:
   	        //	 'http://localhost:8897/dreamfunding/resources/images/projectThumbnail/${ d.projectFileName }'
   	         	 'https://i.imgur.com/B1Xi5dd.jpg',
   	          // 외부에서 접근할 수 있는 서버에 업로드된 이미지의 URL만  가능 
   	         link: {
      	          mobileWebUrl: 'http://localhost:8897/dreamfunding/proDetail.de?pno=${ d.projectNo }',
      	          webUrl: 'http://localhost:8897/dreamfunding/proDetail.de?pno=${ d.projectNo }',
      	        }
      	      }
      	    })
      	  }
   	     /*   		  
   	          link: {
   	          mobileWebUrl: 'https://developers.kakao.com',
   	          webUrl: 'https://developers.kakao.com',
   	        },
   	      },
   	      buttons: [
   	        {
   	          title: '웹으로 보기',
   	          link: {
   	            mobileWebUrl: 'https://developers.kakao.com',
   	            webUrl: 'https://developers.kakao.com',
   	          },
   	        },
   	        {
   	          title: '앱으로 보기',
   	          link: {
   	            mobileWebUrl: 'https://developers.kakao.com',
   	            webUrl: 'https://developers.kakao.com',
   	          },
   	        },
   	      ],
   	    })
   	  }
   	  */
    </script>
    
	      
      
    	 
    
       
        
</body>
</html>