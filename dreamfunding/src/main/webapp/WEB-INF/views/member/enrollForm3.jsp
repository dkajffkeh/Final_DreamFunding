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
                <form class="form-signin" action="insert.me.jm" method="post">
                  <div class="form-label-group">
                    <input type="email" id="memName" class="form-control" name="memberName" placeholder="Email address" required autofocus>
                    <label for="memName">이름을 입력하세요</label>
                  </div>

                  <div class="form-label-group">
                    <input type="text" id="memNick" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="memNick">별명을 입력해주세요</label>
                  </div>
                  
                  <div class="form-label-group">
                    <input type="email" id="email" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="email">이메일(ID)을 입력하세요</label>
                  </div>
                  
                  <div class="form-label-group">
                    <input type="password" id="memPwd" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="memPwd">비밀번호</label>
                  </div>
                  <div class="form-label-group">
                    <input type="password" id="memPwd2" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="memPwd2">비밀번호 확인</label>
                  </div>
                  <div align="center"> 
                    <input type="radio" name="gender" value="M" id="male">
                    <label for="male">남성</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="F" id="female">
                    <label for="female">여성</label>
                  </div>
                  <table>
                    <hr class="my-4">
                    <tr>
                        <td>
                            휴대폰번호 입력
                        </td>
                    </tr>
                
                    <tr>

                        <td>
                            <input type="text" class="form-control form-phone" name="phone">
                        </td>
                        <td>
                            <button type="button" class="form-control btn-request">인증번호 요청</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            인증번호 입력
                        </td>
                    </tr>
                    <tr>

                        <td colspan="2">
                            <input type="text" class="form-control form-phone">
                        </td>
                        
                    </tr>
                </table>
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