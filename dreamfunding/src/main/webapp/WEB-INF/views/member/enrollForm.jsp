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
                
                <h5 class="card-title text-center">금방끝나는 회원가입.</h5>
                <hr class="my-4">
                <form class="form-signin">
                  
                  <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> 구글로 회원가입</button>
                  <button class="btn btn-lg btn-naver btn-block text-uppercase" type="submit"><i class="fab fa-naver mr-2"></i>네이버로 회원가입</button>
                  <hr class="my-4">
                  <a class="btn btn-lg btn-login btn-block text-uppercase" href="enrollForm.me.jm">이메일로 회원가입</a>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>