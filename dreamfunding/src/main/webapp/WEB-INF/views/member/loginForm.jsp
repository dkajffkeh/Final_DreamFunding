<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <script src="https://kit.fontawesome.com/d324e8cb88.js" crossorigin="anonymous"></script>

	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css" />
</head>

<body>

	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
    <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                <h5 class="card-title text-center">환영합니다<br><small><a href="enrollForm.me.jm">빠른 회원가입!</a></small></h5>
                <form class="form-signin" action="login.me.jm" method="post">
                  <div class="form-label-group">
                    <input type="email" id="email" class="form-control" name="email" placeholder="Email address" required autofocus>
                    <label for="email">아이디(이메일)</label>
                  </div>
    
                  <div class="form-label-group">
                    <input type="password" id="memberPwd" class="form-control" name="memPwd" placeholder="Password" required>
                    <label for="memberPwd">비밀번호</label>
                  </div>
    
                  <div class="custom-control custom-checkbox mb-3">
                    <table>
                        <tr>
                            <td style="width: 200px;">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">아이디 저장하기</label>
                            </td>
                            <td>
                                <a href="findMember.me.jm">아이디 비밀번호 찾기</a>
                            </td>
                        </tr>
                    </table>
                  </div>
                  <button class="btn btn-lg btn-login btn-block text-uppercase"  onclick="login();">로그인</button>
                  <hr class="my-4">
                  <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> 구글로 로그인 하기</button>
                  <button class="btn btn-lg btn-naver btn-block text-uppercase" type="submit"><i class="fab fa-envira mr-2"></i>네이버로 로그인 하기</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>


</body>
</html>