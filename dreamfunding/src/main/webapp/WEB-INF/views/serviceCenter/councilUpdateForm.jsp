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
                <h1>1:1문의 수정</h1>
            </div>
            <br>
            <div class="write-area">
                <form name="enrollForm" action="councilUpdate.gn.no" method="post">
                	<input type="hidden" name="councilNo" value="${co.councilNo }">                	
                    <table class="cwTable">
                        <tr>
                            <th><label for="title">제목</label></th>
                        </tr>
                        <tr>
                            <td><input class="form-control" type="text" id="title" name="councilTitle" required style="width:750px;" value="${co.councilTitle }"></td>
                        </tr>
                        <tr>
                            <th><label for="cate"> 카테고리 :</label></th>
                        </tr>
                        <tr>
                            <td>
                            <c:choose>
                            	<c:when test="${co.councilCate eq 1 }">
                                <select name="councilCate" id="cate" class="form-control" style="width:200px">
                                    <option value="1" selected>리워드</option>
                                    <option value="2">프로젝트</option>
                                    <option value="3">기타</option>
                                </select>
                                </c:when>
                                <c:when test="${co.councilCate eq 2 }">
                                <select name="councilCate" id="cate" class="form-control" style="width:200px">
                                    <option value="1">리워드</option>
                                    <option value="2" selected>프로젝트</option>
                                    <option value="3">기타</option>
                                </select>                                
                                </c:when>
                                <c:otherwise>
                                  <select name="councilCate" id="cate" class="form-control" style="width:200px">
                                    <option value="1">리워드</option>
                                    <option value="2">프로젝트</option>
                                    <option value="3" selected>기타</option>
                                </select>  
                                </c:otherwise>
                            </c:choose>
                            </td>                            
                        </tr>  
                        <tr>
                            <th><label for="content">내용</label></th>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <textarea class="form-control" name="councilContent" id="content" style="resize:none" cols="90" rows="30" required>${co.councilContent }</textarea>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div class="btnArea" align="center">
                        <button type="submit" class="btn btn-secondary">수정하기</button>
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