<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	cdMain{
            width:1000px;            
        }
        .detail-area{
            padding:50px;
            background-color: #fff7ed;
        }     
        .cdTable{            
            width:800px;                       
            text-align:left;
            margin:auto;
        }
        .cdTable *{
                  padding:20px;      
        }
        
        #ques td{
            border:1px solid black;
            height:500px;
            text-align:center;
            background-color: white;;
        }
        #answer td{
            border:1px solid black;
            height:300px;
            text-align:center;
            background-color: white;
        }
        .btnArea{
			margin-left:400px;
		}
		.btnArea>button{
			float:left;
			margin-left:30px;						
		}
		.emptyArea{
			padding:35px;
            height:100px;
            text-align:center;
            background-color: #fff7ed;
			
		}
		.abtn{
			float:left;
			margin-left:30px;
		}
</style>

</head>
<body>
	<jsp:include page="sCenterSide.jsp"/>
	<main class="section">
	 	 <div class="inner" align="center">
	 	 	<div class="cdMain">
	            <div class="nametag">
	                <h1>1:1문의 조회</h1>
	            </div>
	            <br>
	            <div class="detail-area">
	                <table class="cdTable">
	                    <tr>
	                        <th width="120">제목 :</th>
	                        <td width="400">${co.councilTitle }</td>                        
	                        <th width="120">작성자 : </th>
	                        <td>${co.memberName }</td>
	                    </tr>
	                    <tr>
	                        <th>작성날짜 : </th>
	                        <td>${co.councilCdate }</td>
	                        <th>카테고리 : </th>	                       
	                        <c:choose>
			                   	<c:when test="${co.councilCate eq 1 }">
			                    	<td>리워드</td>
			                    </c:when>
			                   	<c:when test="${co.councilCate eq 2 }">
			                    	<td>프로젝트</td>
			                   	</c:when>
			                   	<c:otherwise>
			                    	<td>기타</td>
			                    </c:otherwise>
		                   	</c:choose>
	                        
	                    </tr>
	                    <tr>
	                        <th>내용</th>                        
	                    </tr>
	                    <tr id="ques">
	                        <td colspan="4">${co.councilContent }</td>
	                    </tr>
	                </table>                
	            </div>
	            <br>
	            <div class="btnArea" align="center">
	            <button class="btn btn-secondary" onclick="history.back()">목록가기</button>
	            <c:if test="${loginMem.memName eq co.memberName }">
	            	<a class="btn btn-secondary abtn"  style="width:100px" href="councilUpdateForm.gn.no?cno=${co.councilNo }">수정하기</a>
	            	<a class="btn btn-danger abtn" style="width:100px" href="councilDelete.gn.no?cno=${co.councilNo }">삭제하기</a>
				</c:if>
	            </div>
		            <br>  
		            <br>
		            <br>    
		      	<c:choose>
					<c:when test="${co.councilStatus eq 'N' }">
					<div class="emptyArea">
						<p><b>죄송합니다! 현재 처리중인 답변입니다.</b></p>
					</div>
					<br>
			        <div class="btnArea" align="center">
			        <c:if test="${loginMem.memStatus eq 2 }">
			            <a class="btn btn-primary abtn" style="width:100px" href="answerEnrollFrom.gn.no?cno=${co.councilNo }">답변하기</a>
			        </c:if>
			        </div>
		       		</c:when>
		       		<c:otherwise>
				        <div class="detail-area">
				            <table class="cdTable">
				                <tr>
				                    <th width="520">답변</th>
				                    <th width="120">답변날짜 : </th>
				                    <td>${co.councilAdate }</td>                    
				                </tr>
				                <tr id="answer">
				                    <td colspan="3">${co.councilAns }</td>
				                </tr>
				            </table>
				        </div> 
				        <br>
				        
				        <div class="btnArea" align="center">				            
				         	<c:if test="${loginMem.memStatus eq 2 }">
					         	<a class="btn btn-secondary abtn" style="width:100px" href="answerUpdateForm.gn.no?cno=${co.councilNo }">답변수정</a>
					            <a class="btn btn-danger abtn" style="width:100px" href="answerDelete.gn.no?cno=${co.councilNo }">답변삭제</a>
					        </c:if>
				            <br><br>
				        </div>
		        	</c:otherwise>
		        </c:choose>
		        <br>
		        <br>       
		  </div>
		    
	 	 
	 	 
	 	 </div>
	</main>	
	<jsp:include page="../common/footer.jsp"/>

	
	
	
</body>
</html>