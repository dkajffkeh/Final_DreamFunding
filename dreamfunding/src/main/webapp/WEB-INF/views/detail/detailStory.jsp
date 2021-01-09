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
          <div class="section-left" id="story-section">
            <div class="story-content">
          	  ${ d.projectContent }
            </div>
            <div class="hashtag-box" id="hashtag-box">         
            </div>
          </div>
          
          <jsp:include page="detailReward.jsp"/>
          
        </div>
      </div>
    </main>


   <jsp:include page="../common/footer.jsp"/>

	<script defer>

	   // 해시태그 출력 
	   let hashTag = '${d.hashtag}';
	   // 공백 제거 후 true한 값일 때
	   if(hashTag.trim()){
		   (function(){
			   const ht = hashTag.split(' '); // 공백 기준으로 배열로 담김 
			   
			   ht.forEach(v=>{
				   const hbtn = document.createElement('button');
				   hbtn.className='btn hash-btn';
				   hbtn.innerText= v;
				   document.querySelector('#hashtag-box').appendChild(hbtn);
			   })
		   })()
	   }  
	</script>

</body>
</html>