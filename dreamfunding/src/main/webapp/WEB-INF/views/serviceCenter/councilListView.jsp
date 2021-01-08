<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#scboard_tb{
          text-align: center; width:1000px;
          background-color: #fff7ed;
          }

      
      #scboard_tb tr{                    
          border-bottom: 1px solid #7f0000;
                            
      }     
      #scboard_tb tr>td{
        padding:10px;
        
      }
      .innerMain{
        width:80%;
        height:700px;
       
      }
	
	#pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>
	
	<jsp:include page="sCenterSide.jsp"/>
	<main class="section">
	 	 <div class="inner" align="center">
     

        <div class="nametag">
        <h1>1:1 문의</h1>
        </div>
        <br><br>
        <div class="innerMain">
            <table id="scboard_tb" class="table-hover">
                <thead>
                <tr>
                    <th style="width:60px">글번호</th>
                    <th style="width:80px">카테고리</th>
                    <th style="width:400px">제목</th>
                    <th style="width:50px">작성자</th>
                    <th style="width:100px">답변상태</th>
                    <th style="width:100px">작성날짜</th>
                </tr>
                </thead>
                <tbody>
                
                	<c:forEach var="co" items="${list }">
		                <tr>
		                    <td class="cno">${co.councilNo }</td>
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
		                    <td>${co.councilTitle }</td>
		                    <td>${co.memberName }</td>
		                    	<c:choose>
		                    		<c:when test="${co.councilStatus eq 'N' }">
		                    			<td style="color:red;">처리중</td>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<td style="color:blue;">처리완료</td>
		                    		</c:otherwise>
		                    	</c:choose>
		                    <td>${co.councilCdate }</td>                    
		                </tr>
		           </c:forEach>    
              </tbody>
            </table>
            <br>
            <c:if test="${loginMem.memStatus eq 1 || loginMem.memStatus eq 3}">
	            <div class="clbtn" style="width:800px;" align="right">            
	            <a class="btn btn-secondary" href="coucilEnrollForm.gn.no" style="width:110px">문의작성</a>            
            	</div>
            </c:if>
        </div>
        <br><br>
	 	<div id="pagingArea" align="center">
            <ul class="pagination">
	            <c:choose>
	            	<c:when test="${ pi.currentPage eq 1 }">
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                </c:when>
	                <c:otherwise>
	                	<li class="page-item"><a class="page-link" href="scenterMain.gn?currentPage=${pi.currentPage -1 }">Previous</a></li>
	                </c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                	<li class="page-item"><a class="page-link" href="scenterMain.gn?currentPage=${p }">${p }</a></li>
                </c:forEach>
                
                <c:choose>
                	<c:when test = "${pi.currentPage eq pi.maxPage }">
                		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                	</c:when>
                	<c:otherwise>
                		<li class="page-item"><a class="page-link" href="scenterMain.gn?currentPage=${pi.currentPage+1 }">Next</a></li>
                	</c:otherwise>
                	
                </c:choose>
            </ul>
        </div>
	 	</div>
	 	<script>
	 	$(function(){
    		$("#scboard_tb tbody tr").click(function(){
    			location.href = "councilDetail.gn.no?cno=" + $(this).children(".cno").text();
    		});
    	})
	 	
	 	</script>
	</main>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>