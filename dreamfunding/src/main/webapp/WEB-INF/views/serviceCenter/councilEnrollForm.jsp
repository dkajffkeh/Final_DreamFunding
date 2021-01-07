<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js?ver=1"></script>
</head>
<style>
	.innerMain{
            width:1000px; 
            margin:auto;           
        }
        .write-area{
            padding:50px;
            background-color: #fff7ed;
            margin:auto;
        }
        .cwTable{
            margin:auto;
        }
        .cwTable tr{
        	margin:10px;
        }
        .btnArea{
        	margin-left:300px;
        }
		.btnArea>button{
			float:left;
			margin-left:30px;						
		}
</style>
<body>
	<jsp:include page="sCenterSide.jsp"/>
	<main class="section">
	 	 <div class="inner" align="center">
	 	 	<div class=innerMain>
            <div class="nametag">
                <h1>1:1문의 작성</h1>
            </div>
            <div class="write-area">
                <form name="enrollForm" action="councilInsert.gn.no" method="post">
                	<input type="hidden" name="memberNo" value="${loginMem.memNo }">
                    <table class="cwTable">
                        <tr>
                            <th><label for="title">제목</label></th>
                        </tr>
                        <tr>
                            <td><input class="form-control" type="text" id="title" name="councilTitle" required placeholder="제목을 입력해주세요" style="width:750px;"></td>
                        </tr>
                        <tr>
                            <th><label for="cate"> 카테고리 :</label></th>
                        </tr>
                        <tr>
                            <td>
                                <select name="councilCate" id="cate" class="form-control" style="width:200px">
                                    <option value="1">리워드</option>
                                    <option value="2">프로젝트</option>
                                    <option value="3">기타</option>
                                </select>
                            </td>                            
                        </tr>  
                        <tr>
                            <th><label for="content">내용</label></th>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <textarea class="form-control" name="councilContent" id="content" style="resize:none" cols="90" rows="30" required placeholder="내용을 입력해주세요"></textarea>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div class="btnArea" align="center">
                        <button type="submit" class="btn btn-secondary">등록하기</button>
                        <button  class="btn btn-danger" onclick="history.back()">뒤로가기</button>
                    </div>
                </form>
            </div>
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