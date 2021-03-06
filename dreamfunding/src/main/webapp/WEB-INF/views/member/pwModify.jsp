<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                <h5 class="card-title text-center">비밀번호를 수정해주세요</h5>
                <hr class="my-4">
                <form class="form-signin" action="updatePwd.me.jm" method="post">
                
                  <div class="form-label-group">
                    <input type="password" id="memPwd" class="form-control" name="memPwd" placeholder="Password" required>
                    <label for="memPwd">비밀번호</label>
                  </div>
                  <div class="form-label-group">
                    <input type="password" id="memPwd2" class="form-control" placeholder="Password" required>
                    <label for="memPwd2">비밀번호 확인</label>
                  </div>
					<input type="hidden" name="email" value=<%=email %>>
                  	
                    <hr class="my-4">
                    
                  
                  <button class="btn btn-lg btn-login btn-block text-uppercase" type="submit">변경</button>
                  

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>
