<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.cdMain{
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
      	.btnArea{
      		margin-left:300px;
      	}
        .btnArea>button{
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
                <h1>답변수정</h1>
            </div>
            <br>
            <div class="detail-area">
            	<form name="answerEnrollForm" action="answerInsert.gn.no" method="post">
            	<input type="hidden" name="memberNo" value="${loginMem.memNo }">
            	<input type="hidden" name="councilNo" value="${co.councilNo }">
                <table class="cdTable">
                    <tr>
                        <th width="200" colspan="2">현재 상담 중인 글 :</th>
                        <td width="300" colspan="4">${co.councilTitle }</td> 
                    </tr>                    
                    <tr>
                        <th width="100">작성자 : </th>
                        <td width="100">${co.memberName }</td>
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
                        <th width="520" colspan="6"><label for="content">답변</label></th>                                    
                    </tr>
                    <tr>
                        <td colspan="6">
                            <textarea id="content" name="councilAns" cols="105" rows="10" class="form-control" required style="resize:none">${co.councilAns }</textarea>
                        </td>

                    </tr>
                </table> 
				<div class="btnArea" align="center">                
	                <button type="submit" class="btn btn-secondary">답변수정</button>
	                <button class="btn btn-danger" onclick="history.back()">뒤로가기</button>	                
            	</div>
                </form>
            </div> 
            <br>
          
           
            <br>
            <br>       
   		</div>
			
			
				 	 	
	 	 	
		</div>
	</main>
<jsp:include page="../common/footer.jsp"/>
	
	
</body>
</html>