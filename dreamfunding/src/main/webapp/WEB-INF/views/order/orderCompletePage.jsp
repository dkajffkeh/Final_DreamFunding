<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>

		#inner{height:100%;}
	    #inner>div{width:100%; float:left;}
	    #titleMain{width:100%; height:10%;}
	    #titleMain>div{height:100%; float:left;}
		#order{width:100%; height:40%;}
		#recommendPro{width:100%; height:50%;}
		
	    #titleImg{width: 30%; height:100%;}
	    #titleSub{width:70%; height:100%;}
	    	
	    #recommendPro>div{height:100%; float:left;}
		#reHead{height:5%; width:100%;}
	    #subContent{width:10%; height:95%;}
	    #mainContent{width:90%; height:95%;}
	    #mainContent>div{height:100%; float:left;}
	    .subImg1{width: 30%; height:400px;}
	    #resubImg{width: 30%; height:360px;}
	    #resubImg:hover{transform: scale(1.05);}
	    footer{position:relative; bottom:0;}
 </style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<div id="inner" class="inner" style="width:1200px; height:auto; margin:auto; overflow-x:hidden; overflow-y:hidden"">
        <div id="titleMain">
		        <h3 align="center" style="font-weight:bold">결제 완료</h3>
		        <br><br>
	            <div id="titleImg">
	            	<img
	                  src="/dreamfunding/resources/images/projectThumbnail/${ pro.projectFileName }"
	                  style="width:300px; height:250px"
	                />
	            </div>
	            <div id="titleSub">
	                <br>
	                <p style="font-size:25px; font-weight:bold;">
	               		 ${ pro.projectTitle }
	                </p>
	                	${ proc.projectCategoryName }<br><br><br><br>
	                <p style="font-size:22px; color:red; font-weight:bold;">${ pro.projectEndDate }</p>
	                            <br><br><br><br>
	            </div>
        </div>
        <div id="order">
            <br><br><br><br>
            <h3 style="text-align:center; font-weight:bold;">리워드</h3>
            <hr>
                <ul>
	                <c:forEach var="r" items="${ reOp }">
	            		<li>${ r.rewardContent }<li>
	            	</c:forEach>
                </ul>
                <br>
                <h4 align="center">가격 : ${ pi.rewardAmount * re.rewardPrice }원</h4>
            <hr>
                <h4> 추가후원금 </h4>
                 	&nbsp;&nbsp;&nbsp; 후원금 :   
                <b> ${ pi.rewardPlus }</b> 원
                <br><br>
                <h4 align="center">총합 : ${ pi.rewardPlus + (pi.rewardAmount * re.rewardPrice) }원</h4>
            <hr>
        </div>
        <div id="recommendPro">
        	<div id="reHead">
	        	 <br><br>
	            <h3 align="center" style="font-weight:bold;">후원자 추천 프로젝트</h3>
            </div>
            <div id="subContent">
            	&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div id="mainContent">
            	<!-- 
		        <c:forEach var="rPro" items="${ proList }">
					<div id="resubImg" style="height:360px">
						<img src="/dreamfunding/resources/images/projectThumbnail/${ rPro.projectFileName }" style="width:300px; height:250px">
		                <br><b  style="display:inline-block; width:300px;">${ rPro.projectTitle }</b>
		                <br><p style="font-size:20px; color:red; font-weight:bold;">${ rPro.projectEndDate }</p>
					</div>	
				</c:forEach>
				 -->
				<c:forEach var ="i" begin="0" end="8">
		        	<div id="resubImg" style="height:360px" onclick="location.href='proDetail.de?pno=${ proList[i].projectNo }';">
						<img src="/dreamfunding/resources/images/projectThumbnail/${ proList[i].projectFileName }" style="width:300px; height:250px">
		                <br><b  style="display:inline-block; width:300px;">${ proList[i].projectTitle }</b>
		                <br><p style="font-size:20px; color:red; font-weight:bold;">${ proList[i].projectEndDate }</p>
					</div>	
		        </c:forEach>
			</div>
		</div>

    </div>
	<jsp:include page="../common/footer.jsp"/>
	

</body>
</html>