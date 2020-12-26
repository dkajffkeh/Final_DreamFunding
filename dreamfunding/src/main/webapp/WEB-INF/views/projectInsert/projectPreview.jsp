<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dream Funding</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
      integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
      crossorigin="anonymous"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/projectInsertForm/projectPreview.css"/>
  </head>
  <body>

	 <jsp:include page="../common/menubar.jsp"/>
    <!-- 이곳에 페이지 내용 작성 -->
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
                  src="${pageContext.request.contextPath}/resources/images/dream.jpg"
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
                  <button type="button" class="btn btn--icon">
                    <span class="material-icons"> share </span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <ul class="content__nav">
          <li class="borderLeftRight"><a href="#">스토리</a></li>
          <li class="borderLeftRight"><a href="#">펀딩 안내</a></li>
        </ul>
        <div class="content__wrapper">
          
          <div class="section-left upperleft">
            <!---->
            <div class="story-content">
              <img src="${pageContext.request.contextPath}/resources/images/dream.jpg" alt="" />
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
              <button class="btn hash-btn">#잡지asdasdasdasd</button>
              <button class="btn hash-btn">#서평</button>
              <button class="btn hash-btn">#리뷰</button>
              <button class="btn hash-btn">#잡지</button>
              <button class="btn hash-btn">#서평</button>
              <button class="btn hash-btn">#리뷰</button>
              <button class="btn hash-btn">#잡지</button>
              <button class="btn hash-btn">#서평</button>
              <button class="btn hash-btn">#리뷰</button>
            </div>

            <div class="section-left belowleft">
              <div class="policy-label">교환 및 환불 정책</div>
              <div class="content-box">
                <div class="detail-policy-label">
                  크리에이터 교환 및 환불 정책
                </div>
                <p class="detail-policy">
                  1. 단순 변심에 의한 환불은 불가합니다. <br />
                  2. 검수 미스, <br />
                  배송불량으로 인한 파본은 새로운 제품으로 교환해드립니다. (환불은
                  불가하며 배송비는 드림리뷰오브북스에서 부담합니다.) <br />
                  3. 결제가 이루어진 후 수령하신 리워드에 대해 색감 착오 등으로
                  인한 교환은 불가합니다. 모니터 색상에 따라 실제와 색상차이가
                  있을 수 있습니다. <br />
                  4. 결제가 이루어진 후에 요청하시는 옵션변경은 해드리지
                  않습니다.<br />
                </p>
                <div class="detail-policy-label">드림펀딩 교환 및 환불 정책</div>
                <p class="detail-policy dream">
                  - 펀딩 취소는 프로젝트 종료 전까지만 마이페이지의 펀딩한
                  프로젝트에서 할 수 있으며, 드림펀딩의 특성상 프로젝트 종료 이후
                  단순 변심에 의한 펀딩 취소가 불가능합니다.<br />
                  - 프로젝트 종료 이후의 AS, 교환 및 환불에 관한 문의는 진행자의
                  교환 및 환불 정책을 따르거나 진행자의 연락처로 문의해야
                  합니다.<br />
                </p>
              </div>
              <div class="content-box report">
                <div class="policy-label report">프로젝트 신고하기</div>
                <div class="detail-policy report-Info">
                  해당 프로젝트에 허위사실 및 지적재산권 침해, 기타 드림펀딩의
                  정책을 위반하는 내용이 있다면 신고해주세요
                </div>
                <button class="btn btn--main report">신고하기</button>
              </div>
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
              <div class="btn pressDownButton" onClick="deleteModalOpen()">
                <span class="material-icons"> email </span>크리에이터에게 메시지
                보내기
              </div>
            </div>

            <div class="reward-label" id="rewardLabel">리워드 선택</div>
            <div class="reward__wrapper">
              <div class="reward-box">
             
                  <div class="reward-price">15,000원 펀딩</div>
                  <div class="reward-option">
                    <span>기본 옵션 </span>
                    <span>리워드는 제공되지 않습니다. </span>
                  </div>
                  <div class="reward-status">제한 수량 무제한</div>
                  <div class="reward-salecount">총 5개 펀딩 완료</div>
            
              </div>
              <div class="reward-box">
             
                  <div class="reward-price">15,000원 펀딩</div>
                  <div class="reward-option">
                    <span>드림리뷰오브북스 0호(x1) </span>
                  </div>
                  <div class="reward-status">제한 수량 무제한</div>
                  <div class="reward-salecount">총 32개 펀딩 완료</div>
            
              </div>
              <div class="reward-box">
              
                  <div class="reward-price">25,000원 펀딩</div>
                  <ul class="reward-option">
                    <li>드림리뷰오브북스 0호 (x1)</li>
                    <li>엽서+스티커 세트 (x1)</li>
                    <li>미니 수첩 (x1)</li>
                  </ul>
                  <div class="reward-status">제한 수량 200개</div>
                  <div class="reward-salecount">총 77개 펀딩 완료</div>
               
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
<jsp:include page="../common/footer.jsp"/>
  </body>
</html>