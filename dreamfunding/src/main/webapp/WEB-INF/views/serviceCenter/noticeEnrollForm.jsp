<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js?ver=1"></script>
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
                <h1>공지사항 작성</h1>
            </div>
            <div class="write-area">
                <form name="enrollForm" action="noticeInsert.gn.no" method="post">
                	<input type="hidden" name="memberNo" value="${loginMem.memNo }">
                    <table class="nwTable">
                        <tr>
                        	<th><label for="title">제목</label></th>
                        <tr>
                        <tr>                            
                            <td><input type="text" class="form-control" name="noticeTitle" id="title" required placeholder="제목을 입력해주세요" style="width:800px;"></td>
                            
                        </tr>                   
                        <tr>
                        	<th><label for=content>내용</label><th>
                        </tr>
                        <tr>
                           <th><textarea class ="form-control" required name="noticeContent" id="content" cols="150" rows="30" style="resize:none" placeholder="내용을 입력해주세요"></textarea></th>
                        	
							</tr>
				  	</table>
                    <br>
                    <div class="btnArea" align="center">
                        <button type="submit" class="btn btn-secondary">등록하기</button>
                        <button class="btn btn-danger" onclick="history.back()">뒤로가기</button>
                    </div>

                </form>
            </div>
            <br><br>
        </div> 
		<script type="text/javascript">
							 CKEDITOR.replace('content'
							                , {height: 500                                                 
							                 });
		</script>
	</div>
	</main>
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>