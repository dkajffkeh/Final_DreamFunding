<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
                          src="resources/images/book7.jpg"
                          alt="유저 프로필 이미지"
                        />  
                        <div class="profile_caption">
                          <span class="name">드림리뷰오브북스</span>
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
                드림리뷰오브북스는 각 분야를 전공한 <br />
                학생들이 모여 만드는 서평 잡지 프로젝트 팀입니다.
              </div>
              <div class="btn pressDownButton" onClick="messageModalOpen()">
                <span class="material-icons"> email </span>크리에이터에게 메시지
                보내기
              </div>
            </div>

            <div class="reward-label" id="rewardLabel">리워드 선택</div>
            <div class="reward__wrapper">
              <div class="reward-box">
                <a href="#">
                  <div class="reward-price">15,000원 펀딩</div>
                  <div class="reward-option">
                    <span>기본 옵션 </span>
                    <span>리워드는 제공되지 않습니다. </span>
                  </div>
                  <div class="reward-status">제한 수량 무제한</div>
                  <div class="reward-salecount">총 5개 펀딩 완료</div>
                </a>
              </div>
              <div class="reward-box">
                <a href="#">
                  <div class="reward-price">15,000원 펀딩</div>
                  <div class="reward-option">
                    <span>드림리뷰오브북스 0호(x1) </span>
                  </div>
                  <div class="reward-status">제한 수량 무제한</div>
                  <div class="reward-salecount">총 32개 펀딩 완료</div>
                </a>
              </div>
              <div class="reward-box">
                <a href="#">
                  <div class="reward-price">25,000원 펀딩</div>
                  <ul class="reward-option">
                    <li>드림리뷰오브북스 0호 (x1)</li>
                    <li>엽서+스티커 세트 (x1)</li>
                    <li>미니 수첩 (x1)</li>
                  </ul>
                  <div class="reward-status">제한 수량 200개</div>
                  <div class="reward-salecount">총 77개 펀딩 완료</div>
                </a>
              </div>
            </div>
          </div>
          
          
          
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