<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	  #scboard_tb{text-align: center; width:1000px;}
      
      .innerMain{height:700px;}
      
      #scboard_tb tr{                    
          border-bottom: 1px solid darkgray; 
                           
      }     
      #scboard_tb tr>td{
        padding:10px;
           	
      }
      
      .innerMain{
        width:80%;
        
      }
      #pagingArea{width:fit-content;margin:auto;}

      #searchForm{    
          width:fit-content;        
          margin:auto;
      }
      #searchForm>*{
          float:left;
          margin:5px;
      }
      #btnarea{
        margin-left:850px;
      }
</style>

</head>
<body>
	
	
	<jsp:include page="sCenterSide.jsp"/>
	 <main class="section">
      
      <div class="inner" align="center">        
        <div class="nametag">
        <h1>공지사항</h1>
        </div>
        <br><br>
        <div class="innerMain">
            <table id="scboard_tb" class="table table-hover">
            	<thead>
                <tr>
                    <th style="width:60px">글번호</th>
                    <th style="width:400px">제목</th>
                    <th style="width:100px">작성자</th>
                    <th style="width:50px">조회수</th>
                    <th style="width:100px">작성날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="n" items="${ list }">
	                <tr>
	                    <td class="nno">${ n.noticeNo }</td>
	                    <td>${ n.noticeTitle }</td>
	                    <td>관리자</td>
	                    <td>${ n.noticeCount }</td>
	                    <td>${ n.noticeUpload }</td>                    
	                </tr>
                </c:forEach>
                	                
                </tbody>                
            </table>
            <br>
            
            <c:if test="${loginMem.memStatus eq 2 }">
	            <div id="btnarea">
	              <a class="btn btn-secondary btn-sm" href="enrollForm.gn.no" style="width:80px">글작성</a>
	           </div>
	        </c:if>   
        </div>
        
        <script>
        	$(function(){
        		$("#scboard_tb tbody tr").click(function(){
        			location.href = "detail.gn.no?nno=" + $(this).children(".nno").text();
        		});
        	})
        </script>
        
        <br>
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
       <br>
        
        

        <form id="searchForm" action="searchNotice.gn.no" method="Get" align="center">
            <div class="select">
                <select class="custom-select" name="cate">                  
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            <div class="text">
                <input type="text" class="form-control" name="keyword">
            </div>
            <button type="submit" class="searchBtn btn btn-primary">검색</button>
        </form>           
      
    </div>
    <br><br>

    </main>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>