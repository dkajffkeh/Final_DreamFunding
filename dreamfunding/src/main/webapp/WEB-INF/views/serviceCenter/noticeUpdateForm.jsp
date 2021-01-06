<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	  .innerMain{
            width:1000px;            
        }
        .write-area{
            padding:50px;
            background-color: #fff7ed;
        }
        .nwTable{
           margin:auto;
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
	<div class="inner">
        <div class=innerMain>
            <div class="nametag">
                <h1>공지사항 수정</h1>
            </div>
            <div class="write-area">
                <form name="enrollForm" action="noticeUpdate.gn.no" method="post">
                	<input type="hidden" value="${n.noticeNo }" name="noticeNo">
                    <table class="nwTable">
                        <tr>
                        	<th><label for="title">제목</label></th>
                        <tr>
                        <tr>                            
                            <td><input type="text" class="form-control" name="noticeTitle" id="title" required value="${n.noticeTitle }" style="width:800px;"></td>
                            
                        </tr>                   
                        <tr>
                        	<th><label for=content>내용</label><th>
                        </tr>
                        <tr>
                           <th><textarea class ="form-control" required name="noticeContent" id="content" cols="90" rows="30" style="resize:none">${n.noticeContent}</textarea></th>
                        </tr>
                    </table>
                    <br>
                    <div class="btnArea" align="center">
                        <button type="submit" class="btn btn-secondary">수정하기</button>
                        <button type="reset" class="btn btn-danger">취소하기</button>
                    </div>

                </form>
            </div>
            <br><br>
        </div> 
	
	</div>
	</main>
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>