<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
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
              <li><button type="button" class="btn btn--icon">${project.proCategoryNo}</button></li>
              <li>${project.projectTitle}</li>
              <c:if test="${empty project.creatorProfile }"> 
              <li>
                <i class="main__icon"
                  >
                  <c:if test="${ !empty project.creatorName }">
                  <span class="material-icons"> account_circle</span>${ project.creatorName }
                  </c:if>
                  <c:if test="${  empty project.creatorName }">
                  <span class="material-icons"> account_circle</span>${ loginMem.memNick } 
                  </c:if>
                  </i
                > 
              </li>
              </c:if>
              <c:if test="${not empty project.creatorProfile }" >
              <li>
              	<c:if test="${ !empty project.creatorName }">
                <img id="creatorProfileImg" src="${pageContext.request.contextPath}/resources/images/projectThumbnail/${project.projectFileName}">
                ${ project.creatorName }
                </c:if>
                <c:if test="${ empty project.creatorName }">
                <img id="creatorProfileImg" src="${pageContext.request.contextPath}/resources/images/projectThumbnail/${project.projectFileName}">
                ${ loginMem.memNick }
                </c:if>
              </li>
              </c:if>
            </ul>
          </div>
          <div class="intro-bottom__wrapper">
            <div class="intro-left__wrapper"> 
              <c:if test = "${ !videoURL.equals('emptyURL') }">
            <figure class="intro-img">   
               <iframe width="620" 
               		   height="390"    
               		   src="https://www.youtube.com/embed/${ videoURL }" 
               		   frameborder="0" 
               		   allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
               		   allowfullscreen></iframe>
              </figure> 
              </c:if>
            <c:if test = "${ not empty project.projectFileName and videoURL.equals('emptyURL') }">
              <figure class="intro-img">   
               	<img
                  src="${pageContext.request.contextPath}/resources/images/projectThumbnail/${ project.projectFileName }"
                  alt="프로젝트 대표 이미지"
                />
              </figure>
              </c:if>
              <c:if test = "${ empty project.projectFileName and videoURL.equals('emptyURL') }">
              <figure class="intro-img">   
               	<img
                  src="${pageContext.request.contextPath}/resources/images/ec025c3.png"
                  alt="프로젝트 대표 이미지"
                />
              </figure>
              </c:if>
         
            </div>
            <div class="intro-right__wrapper">
              <div class="status-wrapper">
                <div class="funding-status__wrapper">
                  <div class="status-title">펀딩금액</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">0</div>
                    <span class="status-unit">원</span>
                  </div>
                </div>
                <div class="funding-status__wrapper">
                  <div class="status-title">달성률</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">0</div>
                    <span class="status-unit">%</span>
                  </div>
                </div>
                <div class="funding-status__wrapper">
                  <div class="status-title">남은 기간</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">${ dDay }</div>
                    <span class="status-unit">일</span>
                  </div>
                </div>
                <div class="funding-status__wrapper">
                  <div class="status-title">서포터</div>
                  <div class="value-unit_wrapper">
                    <div class="status-value">0</div>
                    <span class="status-unit">명</span>
                  </div>
                </div>
              </div>
              <div class="status-info-box">
                <div class="info-box__inner">
                  <span>
                    목표 금액인
                    <!-- -->
                    ${ project.projectGoalPrice }
                    <!-- -->원이 모여야만 결제됩니다. <br />
                    목표 금액을 달성한 경우, 결제예정일은
                    <!-- -->
                    ${ project.projectEndDate }
                    <!-- -->입니다.
                  </span>
                </div>
              </div>
              <div class="status-btn__wrapper">
                <button type="button" class="btn btn--main">
                  프로젝트 밀어주기
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
          <li class="borderLeftRight story">스토리</li>
          <li class="borderLeftRight funding">펀딩 안내</li>
        </ul>
        
        <div class="content__wrapper">
          
          <div class="section-left upperleft">
            <!---->
            <div class="story-content">
         	${project.projectContent }
            </div>
            <div class="hashtag-box">
            <c:if test="${ !hashArr.equals('emptyArr') }">
            <c:forEach var="i" items="${ hashArr }">
            	
              <button class="btn hash-btn">${ i }</button>    
              </c:forEach>
            </c:if>     
            </div>

            <div class="section-left belowleft">
              <div class="policy-label">교환 및 환불 정책</div>
              <div class="content-box">
             
                <p class="detail-policy">
                ${ project.projectRefundPolicy }
                </p>
              </div>
  
            </div>
          </div>

          <div class="section-right">
            <div class="creator-label">크리에이터 소개</div>
            <div class="creator-info__wrapper">
            
              <div class="creator-title">
              <c:if test="${ empty project.creatorProfile }">
                <div class="creator-profile">
                  <span class="material-icons"> account_circle  </span
                  >
                </div>
                <c:if test="${ empty project.creatorName }">  
                <div class="creator-name">이름이 지정되지 않았습니다</div>
                </c:if>
                <c:if test="${not empty project.creatorName }">
                <div class="creator-name">${ project.creatorName }</div>
                </c:if>
              </c:if>
              
              <c:if test="${not empty project.creatorProfile }">
              
                 <div class="creator-profile">
               	  <img id="creatorProfileImg" src="${pageContext.request.contextPath}/resources/images/projectThumbnail/${project.projectFileName}">
                ${ project.creatorName }
           
                </div>  
                   <c:if test="${ empty project.creatorName }">  
                <div class="creator-name">이름이 지정되지 않았습니다</div>
                </c:if>
                <c:if test="${not empty project.creatorName }">
                <div class="creator-name">${ project.creatorName }</div>
                </c:if>
              </c:if>
              </div>
              
              <div class="creator-intro">
                <span>
                 ${ project.projectSubtitle }
                 
                </span>
              </div>
              <div class="btn pressDownButton">
                <span class="material-icons"> email </span>크리에이터에게 메시지
                보내기
              </div>
            </div>

            <div class="reward-label" id="rewardLabel">리워드 선택</div>
            <div class="reward__wrapper">
                     
             <c:if test="${ !rList.equals('emptyArr') }">
             <c:forEach var="i" items="${ rList }"> 
                   
              <div class="reward-box">
                  <div class="reward-price"><fmt:formatNumber value="${ i.rewardPrice }" pattern="#,###,###" /> + </div>
                  <ul class="reward-option">
              	<c:if test="${ !oList.equals('emptyArr') }">
               		<c:forEach var="j" items="${ oList }">
               			<c:if test="${ i.rewardNo eq j.rewardNo }">
                    <li>● ${ j.rewardContent }</li>
                    	</c:if>
                    </c:forEach>
              	</c:if>		
                  </ul>
                  <c:if test="${ i.rewardStatus.equals('Y') }">
                  <div class="reward-status">총 ${ i.rewardNumber }개의 리워드가 제공됩니다.</div>
                  </c:if>
                  <c:if test="${ i.rewardStatus.equals('N') }">
                  <div class="reward-status">제한이 없는 리워드 입니다.</div>
                  </c:if>
               
              </div>
              
              </c:forEach>  
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </main>
<jsp:include page="../common/footer.jsp"/>

 <script defer src="${pageContext.request.contextPath}/resources/js/projectPreview/preview.js?ver=1"></script>
  </body>
</html>