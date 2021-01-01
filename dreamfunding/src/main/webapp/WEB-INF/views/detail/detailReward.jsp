<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/detail/detail.css" />
</head>
<body>


 <div class="section-right">
            <div class="creator-label">크리에이터 소개</div>
            <div class="creator-info__wrapper">
             <div class="profile_wrapper">
                     
                        <img
                          class="image"
                          src="resources/images/creatorThumbnail/${ d.creatorProfile }"
                          alt="유저 프로필 이미지"
                        />  
                        
                        
                        <div class="profile_caption">
                          <span class="name">${ d.creatorName }</span>
                        </div>
                  </div>      
            
<!--           <div class="creator-title">
                <div class="creator-profile">
                  <span class="material-icons"> account_circle </span
                  ><img src="#" alt="" />
                </div>
                <div class="creator-name">드림리뷰오브북스</div>
              </div>
-->
              <div class="creator-intro">
       			 ${d.creatorIntro} 
              </div>
              <div class="btn pressDownButton" onClick="messageModalOpen()">
                <span class="material-icons"> email </span>크리에이터에게 메시지 보내기
              </div>
            </div>
		
		

            <div class="reward-label" id="rewardLabel">리워드 선택</div>
    		
		      <c:forEach var="w" items="${ rw }">
		        <div class="reward__wrapper">	
		          <div class="reward-box">
		            <a href="#">
		              <div class="reward-price">
		              <fmt:formatNumber type="number" maxFractionDigits="3" value="${w.rewardPrice}"/>원 펀딩</div>
		                   
		              <ul class="reward-option">
		             	<c:forEach var="o" items="${ w.detailRewardOptList }">
		               		 <li>${ o.rewardContent }</li> 
		                </c:forEach>
		              </ul>    
		              
		              <c:choose>
		                <c:when test="${w.rewardStatus eq 'N'}">
		                  <div class="reward-status">제한 수량 무제한</div>
		                </c:when>	  
		                <c:when test="${w.rewardStatus eq 'Y'}">
		                  <div class="reward-status">제한 수량 ${ w.rewardNumber }개</div>
		                </c:when>	                  
		              <c:otherwise>
		                <div class="reward-status">옵션이 제공되지 않습니다.</div>
		              </c:otherwise>
		            </c:choose>
		      
		            <c:if test="${!empty w.saleCount}">
		                <div class="reward-salecount">총 ${ w.saleCount }개 펀딩 완료</div>
		            </c:if>	
		            </a> 
		          </div>
		        </div>
		      </c:forEach>
		      
              
          
          
    <!-- 메시지 모달 -->
    <div id="message-modal" class="modal__layout">
      <div id="message-modal-box" class="modal__box">
        <div class="label">크리에이터에게 메시지 보내기</div>
        <div class="gap"></div>
       
        <form action="" method="post">
         <h1>제목</h1>
          <input type="hidden" name="" value="" />
          <input type="text" name="" />
          <h1>내용</h1>
          <textarea name="messageContent" id=""></textarea>
          <div class="modal__btn__wrapper">
            <button>OK</button>
            <button class="modal-btn" onClick="messageModalClose()">
              CANCEL
            </button>
          </div>
        </form>
      </div>
    </div>
    
     <script defer>
     // message 모달
      const messageModalOpen = () => {
        document
          .querySelector("#message-modal")
          .classList.toggle("modal__active");
      };
      const messageModalClose = () => {
        document.querySelector("#message-modal").style.animation =
          "fadeOut 0.4s ease-in-out forwards";
        document.querySelector("#message-modal-box").style.animation =
          "slideDown 0.4s ease-in-out forwards";

        setTimeout(() => {
          document
            .querySelector("#message-modal")
            .classList.toggle("modal__active");
          document.querySelector("#message-modal").style.animation =
            "fadeIn 0.4s ease-in-out forwards";
          document.querySelector("#message-modal-box").style.animation =
            "slideUp 0.4s ease-in-out forwards";
        }, 400);
      };
      
      </script>

</body>
</html>