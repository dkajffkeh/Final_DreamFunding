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

              <div class="creator-intro">
       			 ${d.creatorIntro} 
              </div>
          <!--    <div class="btn pressDownButton" onClick="messageModalOpen()">
                <span class="material-icons"> email </span>크리에이터에게 메시지 보내기
              </div> --> 
            </div>
		       
            <div class="reward-label" id="rewardLabel">리워드 선택</div>
    		  <ul class="reward__wrapper reward-list">
		      <c:forEach var="w" items="${ rw }">	
		          <li class="reward-box" id="reward-box${w.rewardNo}">
		        	<c:if test="${ !empty loginMem}">	
								
				           	<c:if test="${w.rewardNumber gt w.saleCount || w.rewardStatus eq 'N'}">
				           		 <a href='orderInsert.me?pno=${d.projectNo}&mno=${loginMem.memNo}&rewardNum=${w.rewardNo}&rewardAmount=1'>
							</c:if>
							<c:if test="${ w.rewardStatus eq 'Y' && w.rewardNumber le w.saleCount }">
					        	<a href='#' onclick="alert('해당 리워드는 마감되었습니다.')">
					        </c:if>	

					</c:if>
					<c:if test="${ empty loginMem }">
		           	 <a href='#' onclick="alert('로그인 사용자만 프로젝트 펀딩이 가능합니다.')">
					</c:if>
			              <div class="reward-price">
			              <fmt:formatNumber type="number" maxFractionDigits="3" value="${w.rewardPrice}"/>원 펀딩</div>
			                   
			              <ul class="reward-option">
			             	<c:forEach var="o" items="${ w.detailRewardOptList }">
			               		 <li>${ o.rewardContent }</li> 
			                </c:forEach>
			              </ul>    

			              <c:choose>
			                <c:when test="${w.rewardStatus eq 'N'}">
			                  <div class="reward-status">제한 수량 무제한<span class="reward-number"></span></div>
			                </c:when>	  
			                <c:when test="${w.rewardStatus eq 'Y'}">
			                  <div class="reward-status">제한 수량 <span class="reward-number">${ w.rewardNumber }</span>개</div>
			                </c:when>	                  
			              <c:otherwise>
			                <div class="reward-status">옵션이 제공되지 않습니다.<span class="reward-number"></span></div>
			              </c:otherwise>
			            </c:choose>
		      
		            <c:if test="${!empty w.saleCount}">
		                <div class="reward-salecount">총 <span class="sale-count">${ w.saleCount }</span>개 펀딩 완료</div>
		            </c:if>
					</a>
		          </li>
		   
		      </c:forEach>
		 	</ul>
              
          
          
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
      

   let rewardBox = document.querySelectorAll(".reward-box");
   let rewardList = document.querySelectorAll(".reward-list .reward-box");
   let rewardStatus = document.querySelectorAll(".reward-list .reward-box .reward-status");
   let rewardNumber2 = document.querySelectorAll(".reward-list .reward-box .reward-status .reward-number");
   let saleCount2 = document.querySelectorAll(".reward-list .reward-box .reward-salecount .sale-count");
   
   
    (function(){
		rewardBox.forEach((v, i)=>{
		
			if(rewardNumber2[i].innerHtml != ""){
				if(parseInt(rewardNumber2[i].innerText)<=parseInt(saleCount2[i].innerText)){
					v.classList.add('disabled-reward');
				}
			}
		});    		 
     })()
      
      
       
      </script>

</body>
</html>