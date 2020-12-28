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
              <img src="resources/images/${ d.projectFileName }" alt="" />
          	  ${ d.projectContent }
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