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
	            	<h1>자주묻는 질문 작성하기</h1><br>
	        	</div>
				  <div class="innerMain">
           			 <form action="faqInsert.gn.no" method="post"> 
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
			            <br><br>
			            <input type="text" name="faqTitle"class="ques" required placeholder="등록할 질문을 입력해주세요">
			           
			            <textarea class="answer" name="faqContent" placeholder="등록할 답변을 입력해주세요"></textarea>
			            <br><br>
			            <div class="btnarea" align="center">
			                <button type="submit" class="btn btn-primary">등록하기</button>
			                &nbsp;&nbsp;&nbsp;
			                <button class="btn btn-danger" onclick="history.back()">뒤로가기</button>
			            </div>
		            </form>
      			 </div>
				
				
				
			</div>
		</main>
		
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>