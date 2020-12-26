<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dream Funding</title>
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="resources/css/detail/detail.css" />
  </head>

<body>

 <jsp:include page="../common/menubar.jsp"/>

  <main class="section">
      <div class="inner">
        <div class="intro__wrapper">
          <div class="intro-top__wrapper">
            <ul>
              <li><button type="button" class="btn btn--icon">잡지</button></li>
              <li>서평 전문 잡지 "드림리뷰오브북스"</li>
              <li>
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
              </li>
            </ul>
          </div>
          <div class="intro-bottom__wrapper">
            <div class="intro-left__wrapper">
              <div class="intro-img">
                <img
                  src="resources/images/dream.jpg"
                  alt="프로젝트 대표 이미지"
                />
              </div>
            </div>
            <div class="intro-right__wrapper">
              <div class="status-wrapper">
                <div class="funding-status__wrapper">
                  <div class="status-title">펀딩금액</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">22,562,500</div>
                    <span class="status-unit">원</span>
                  </div>
                </div>
                <div class="funding-status__wrapper">
                  <div class="status-title">달성률</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">752</div>
                    <span class="status-unit">%</span>
                  </div>
                </div>
                <div class="funding-status__wrapper">
                  <div class="status-title">남은 기간</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">8</div>
                    <span class="status-unit">일</span>
                  </div>
                </div>
                <div class="funding-status__wrapper">
                  <div class="status-title">서포터</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">638</div>
                    <span class="status-unit">명</span>
                  </div>
                </div>
              </div>
              <div class="status-info-box">
                <div class="info-box__inner">
                  <span>
                    목표 금액인
                    <!-- -->
                    "2,500,000"
                    <!-- -->원이 모여야만 결제됩니다. <br />
                    목표 금액을 달성한 경우, 결제예정일은
                    <!-- -->
                    "12월 25일"
                    <!-- -->입니다.
                  </span>
                </div>
              </div>
              <div class="status-btn__wrapper">
                <button type="button" class="btn btn--main">
                  <a href="#rewardLabel">프로젝트 밀어주기</a>
                </button>
                <div class="btn-icon__wrapper">
                  <button type="button" class="btn btn--icon">
                    <span class="material-icons"> favorite_border </span>
                  </button>
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
          <li class="borderLeftRight"><a href="#">스토리</a></li>
          <li class="borderLeftRight"><a href="#">커뮤니티</a></li>
          <li class="borderLeftRight"><a href="#">펀딩 안내</a></li>
        </ul>
        
       
       	

    <!-- 공유하기 모달 -->
    <div id="sns-modal" class="modal__layout">
      <div id="sns-modal-box" class="modal__box">
        <div class="label">프로젝트 공유하기</div>
        <div class="gap"></div>
        <div class="sns__icon__wrapper">
          <i class="fab fa-twitter fa-3x"></i>
          <i class="fab fa-facebook fa-3x"></i>
          <i class="fas fa-comment fa-3x"></i>
        </div>
        <div class="modal__btn__wrapper">
          <button>OK</button>
          <button class="modal-btn" onClick="snsModalClose()">CANCEL</button>
        </div>
      </div>
    </div>

    
    <script defer>
  
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
    </script>
    
       
        
</body>
</html>