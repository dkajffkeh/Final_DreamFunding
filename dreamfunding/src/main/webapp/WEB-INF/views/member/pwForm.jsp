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
                
                <h5 class="card-title text-center">드림펀드 로그인<br>비밀번호 찾기.</h5>
                <small>
                    드림펀드에 가입하실 때 사용하신 이메일을 입력해주세요<br>
                    해당 이메일로 비밀번호를 재설정 할 수 있는 링크를 보내드립니다.
                </small>


    
                  <hr class="my-4">

                
                    <div class="form-label-group">
                        <input type="email" id="email" class="form-control" name="email" placeholder="Email address" required autofocus>
                        <label for="inputEmail">아이디(이메일)을 입력해주세요</label>
                    </div>

                    <br>
                    <button class="btn btn-lg btn-login btn-block text-uppercase" type="submit">링크빋기</button>
                    <button class="btn btn-lg btn-login btn-block text-uppercase" type="submit">로그인하기</button>

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>