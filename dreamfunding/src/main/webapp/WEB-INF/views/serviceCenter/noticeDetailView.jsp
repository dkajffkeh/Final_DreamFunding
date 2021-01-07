<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.ndMain{
            width:1000px;            
        }
        .detail-area{
            padding:50px;
            background-color: #fff7ed;
        }     
        .ndTable{            
            width:800px;                       
            text-align:left;
            margin:auto;
        }
        .ndTable *{
                  padding:20px;      
        }
        
        #nContent td{
            border:1px solid black;
            height:500px;
            text-align:center;
            background-color: white;;
        }
		.btnArea{
			margin-left:300px;
		}
		.btnArea>button{
			float:left;
			margin-left:30px;						
		}
		#nContent>td{
			text-align:left;
		}
		
</style>

</head>
<body>

	
	<jsp:include page="sCenterSide.jsp"/>
	 <main class="section">	
		<div class="inner">
	        <div class="ndMain">
	            <div class="nametag">
	                <h1>공지사항 조회</h1>
	            </div>
	            <br>
	            <div class="detail-area">
	                <table class="ndTable">
	                    <tr>
	                        <th width="120">제목 :</th>
	                        <td width="400">${n.noticeTitle }</td>                        
	                        <th width="120">작성자 : </th>
	                        <td>관리자</td>
	                    </tr>
	                    <tr>
	                        <th>작성날짜 : </th>
	                        <td>${n.noticeUpload }</td>
	                        <th>조회수 : </th>
	                        <td>${n.noticeCount }</td>
	                    </tr>
	                    <tr>
	                        <th>내용</th>                        
	                    </tr>
	                    <tr id="nContent">
	                        <td colspan="4" align="center">${n.noticeContent }</td>
	                    </tr>
	                </table>                
	            </div>
	            <br>
	            <div class="btnArea" align="center">	            	
		           <button class="btn btn-secondary" onclick="noticeMain()">목록가기</button> &nbsp; &nbsp;
		           <c:if test="${loginMem.memStatus eq 2 }">
			           <button class="btn btn-secondary" onclick="noticeControl(1)">수정하기</button> &nbsp; &nbsp;
			           <button class="btn btn-danger" onclick="noticeControl(2)">삭제하기</button>
			       </c:if>
	            </div>
	            <br>           
	            <form action="updateForm.gn.no" method="post" id="noticeInfo">
	            	<input type="hidden" id="noticeNo" name="nno" value="${n.noticeNo }">
	            </form>
	     </div>
   	</div>
    <br><br>
	
	<script>
		function noticeControl(num){
			var url = "";
			if(num == 1){
				url = "updateForm.gn.no"
			}else if(num == 2){
				url = "delete.gn.no"				
			}
			$("#noticeInfo").attr("action", url).submit();
			
		}
		function noticeMain(){
			location.href = "scenterMain.gn";
		}
		
	</script>
	
    </main>
	
</body>
</html>