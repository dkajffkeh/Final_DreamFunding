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

	<jsp:include page="detailHeader.jsp"/>
        
        <div class="content__wrapper">
          <div class="section-left">
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
          
          <jsp:include page="detailReward.jsp"/>
          
        </div>
      </div>
    </main>


   <jsp:include page="../common/footer.jsp"/>




</body>
</html>