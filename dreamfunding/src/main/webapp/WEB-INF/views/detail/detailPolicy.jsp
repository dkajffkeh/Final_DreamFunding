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
	       <div class="section-left" id="policy-section">
	            <div class="policy-label">교환 및 환불 정책</div>
	            <div class="content-box">
	              <div class="detail-policy-label">
	                크리에이터 교환 및 환불 정책
	              </div>
	              <p class="detail-policy">
	                ${ d.projectRefundPolicy }
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
	             
	              <c:if test="${ !empty loginMem }">
	             	 <button class="btn btn--main report" onClick="reportModalOpen()">신고하기</button>
	              </c:if>
	             <c:if test="${ empty loginMem }">
	             	 <button class="btn btn--main report" onclick="alert('로그인 사용자만 신고 가능합니다.')">신고하기</button>
	              </c:if>
	          
	           	</div>
	          </div>
          
        <jsp:include page="detailReward.jsp"/>
          
        </div>
      </div>
    </main>


 	<!-- 신고하기 모달 -->
    <div id="report-modal" class="modal__layout">
      <div id="report-modal-box" class="modal__box">
        <div class="label">프로젝트 신고하기</div>
        <div class="gap"></div>    
        <form action="" method="post">
          <h1>신고할 프로젝트</h1>
			  <div class="pro-title">${ d.projectTitle }</div>
          <h1>신고내용</h1>
	          <textarea name="reportContent" id="reportContent" placeholder="신고사유를 작성해주세요."></textarea>
	          <div class="modal__btn__wrapper">
	            <button onclick="addReport()">OK</button>
	            <button class="modal-btn" onClick="reportModalClose()">CANCEL</button>
	          </div>
        </form>
      </div>
    </div>
    
   <jsp:include page="../common/footer.jsp"/>

<script defer>

	// report 모달
	const reportModalOpen = () => {
	  document
	    .querySelector("#report-modal")
	    .classList.toggle("modal__active");
	};
	const reportModalClose = () => {
	  document.querySelector("#report-modal").style.animation =
	    "fadeOut 0.4s ease-in-out forwards";
	  document.querySelector("#report-modal-box").style.animation =
	    "slideDown 0.4s ease-in-out forwards";
	
	  setTimeout(() => {
	    document
	      .querySelector("#report-modal")
	      .classList.toggle("modal__active");
	    document.querySelector("#report-modal").style.animation =
	      "fadeIn 0.4s ease-in-out forwards";
	    document.querySelector("#report-modal-box").style.animation =
	      "slideUp 0.4s ease-in-out forwards";
	  }, 400);
	};


	 // 신고하기 등록 
	 const addReport =()=> {
			 if(document.querySelector('#reportContent').value.trim().length > 0) {
		  		 axios.get('report.de',{
		  			 params:{
			  				 memNo:'${loginMem.memNo}',
			  				 pno:'${d.projectNo}',
			  			     reportContent:document.querySelector('#reportContent').value,
		  					 }
			  		 })
			  		 .then(response=>{
			         if(response.data==='success'){
			           alert('신고가 정상적으로 접수되었습니다.');
			           reportModalClose();
			         }
			       }).catch(()=>{
			         alert('신고에 실패했습니다.');
			         reportModalClose();
			       })
			     }
			   }
	 
</script>



</body>
</html>