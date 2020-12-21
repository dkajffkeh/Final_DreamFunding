<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
                <h5 class="card-title text-center">환영합니다</h5>
                <form class="form-signin">
                  <div class="form-label-group">
                    <input type="email" id="email" class="form-control" name="memberName" placeholder="Email address" required autofocus>
                    <label for="inputEmail">이름을 입력하세요</label>
                  </div>

                  <div class="form-label-group">
                    <input type="password" id="memberPwd" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="inputPassword">별명을 입력해주세요</label>
                  </div>
                  
                  <div class="form-label-group">
                    <input type="password" id="memberPwd" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="inputPassword">이메일(ID)을 입력하세요</label>
                  </div>
                  
                  <div class="form-label-group">
                    <input type="password" id="memberPwd" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="inputPassword">비밀번호</label>
                  </div>
                  <div class="form-label-group">
                    <input type="password" id="memberPwd" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="inputPassword">비밀번호 확인</label>
                  </div>
                  <div class="custom-control custom-checkbox mb-3" align="center">
                    <input type="checkbox" class="custom-control-input" id="M" name="M">
                    <label class="custom-control-label" for="M">남성</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" class="custom-control-input" id="F" name="F">
                    <label class="custom-control-label" for="F">여성</label>
                  </div>
                  <hr class="my-4">
                  <button class="btn btn-lg btn-login btn-block text-uppercase" type="submit">회원가입</button>
                  

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>