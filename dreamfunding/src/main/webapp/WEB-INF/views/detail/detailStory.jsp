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
    <link rel="stylesheet" href="/resources/css/detail/detail.css" />
  </head>

<body>
	
	<jsp:include page="detailHeader.jsp"/>
        
        <div class="content__wrapper">
          <div class="section-left">
            <div class="story-content">
              <img src="resources/images/dream.jpg" alt="" />
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
          
          <jsp:include page="detailReward.jsp"/>
          
        </div>
      </div>
    </main>


   <jsp:include page="../common/footer.jsp"/>


</body>
</html>