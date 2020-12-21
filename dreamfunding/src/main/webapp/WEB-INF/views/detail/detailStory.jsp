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
    <link rel="stylesheet" href="/resources/css/common.css" />
    <link rel="stylesheet" href="/resources/css/detail/detail.css" />
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
                <i class="main__icon"
                  ><span class="material-icons"> account_circle </span></i
                >
                드림리뷰오브북스
              </li>
            </ul>
          </div>
          <div class="intro-bottom__wrapper">
            <div class="intro-left__wrapper">
              <figure class="intro-img">
                <img
                  src="../../../resources/images/dream.jpg"
                  alt="프로젝트 대표 이미지"
                />
              </figure>
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
        <div class="content__wrapper">
          <div class="section-left">
            <div class="story-content">
              <img src="../../../resources/images/dream.jpg" alt="" />
              <h1>서평 전문 잡지 '드림리뷰오브북스'</h1>
              <p>
                실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는
                원질이 되는 것이다 그들은 앞이 긴지라 착목한는 이것이야말로
                무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이
                있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을
                위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서
                방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을
                위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가?
                아니다 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다
                풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는
                얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는
              </p>
            </div>
            <div class="hashtag-box">
              <button class="btn hash-btn">#잡지</button>
              <button class="btn hash-btn">#서평</button>
              <button class="btn hash-btn">#리뷰</button>
            </div>
          </div>
          <div class="section-right">
            <div class="creator-label">크리에이터 소개</div>
            <div class="creator-info__wrapper">
              <div class="creator-title">
                <div class="creator-profile">
                  <span class="material-icons"> account_circle </span
                  ><img src="#" alt="" />
                </div>
                <div class="creator-name">드림리뷰오브북스</div>
              </div>
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

    <!-- 메시지 모달 -->
    <div id="message-modal" class="modal__layout">
      <div id="message-modal-box" class="modal__box">
        <div class="label">크리에이터에게 메시지 보내기</div>
        <div class="gap"></div>
        <h1>제목</h1>
        <form action="" method="post">
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
    
    
   <jsp:include page="../common/footer.jsp"/>
	

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