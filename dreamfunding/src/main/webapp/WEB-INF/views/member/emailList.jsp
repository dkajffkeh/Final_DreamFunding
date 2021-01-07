<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css" />
</head>
<body>
<div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                
                <h5 class="card-title text-center">금방끝나는 회원가입.</h5>
                <hr class="my-4">

                <table id="boardList" class="table table-hover" align="center">
                    <thead>
                        <tr>
                            <td style="width: 250px;">
                                이메일
                            </td>
                            <td>
                                생성일
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="loginMem" items="${ list }">
	                    <tr>
	                        <td class="bno">${ loginMem.email }</td>
	                        <td>${ loginMem.memCreate }</td>

	                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <br>
				<a class="btn btn-lg btn-login btn-block text-uppercase" href="loginForm.me.jm">로그인하러가기</a>
                
                  <hr class="my-4">
                    
                
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>