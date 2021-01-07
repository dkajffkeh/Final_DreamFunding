<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 .ques{
            width:100%;
            margin:0;
             border: 4px solid #7f0000;             
             background-color: white;     
             box-sizing: border-box;
             height:100px;
             font-size: large;
             font-weight: 700;             
             padding-left:20px;
                     
          }
          .answer{
            margin:0;
            border:4px solid #7f0000;
            border-top:none;                        
            box-sizing: border-box; 
            font-size: large;
             font-weight: 700;
             padding-top:10px;
             padding-left:20px;          
            width:100%;
            height:200px;
          }

</style>
</head>
<body>
	
	
	<jsp:include page="sCenterSide.jsp"/>
		
		<main class="section">
			<div class="inner" align="center">
				<div class="nametag">
	            	<br>
	            	<h1>자주묻는 질문 수정하기</h1><br>
	        	</div>
				  <div class="innerMain">
           			 <form action="faqUpdate.gn.no" method="post"> 
           			 	<input type="hidden" name="faqNo" id="fqno" value="${fq.faqNo }">
			            	<c:choose>
			            		<c:when test="${ fq.faqCate eq 1 }">
						            <select id="category" name="faqCate">
						                <option selected value="1">
						                   	 로그인
						                </option>
						                <option value="2">
						                 	 프로젝트 크리에이터
						                </option>
						                <option value="3">
						                	프로젝트 서포터
						                </option>
						            </select>
				            	</c:when>
				            	<c:when test="${ fq.faqCate eq 2 }">
						            <select id="category" name="faqCate">
						                <option value="1">
						                   	 로그인
						                </option>
						                <option selected value="2">
						                 	 프로젝트 크리에이터
						                </option>
						                <option value="3">
						                	프로젝트 서포터
						                </option>
						            </select>
				            	</c:when>
				            	<c:when test="${ fq.faqCate eq 3 }">
						            <select id="category" name="faqCate">
						                <option selected value="1">
						                   	 로그인
						                </option>
						                <option value="2">
						                 	 프로젝트 크리에이터
						                </option>
						                <option selected value="3">
						                	프로젝트 서포터
						                </option>
						            </select>
				            	</c:when>
				            </c:choose>
			            <br><br>
			            <input type="text" name="faqTitle"class="ques" required value="${fq.faqTitle }">
			           
			            <textarea class="answer" name="faqContent">${fq.faqContent }</textarea>
			            <br><br>
			            <div class="btnarea" align="center">
			                <button type="submit" class="btn btn-primary">수정하기</button>
			                
			                <button type="reset" class="btn btn-danger">취소하기</button>
			            </div>
		            </form>
      			 </div>
				
				
				
			</div>
		</main>
		
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>