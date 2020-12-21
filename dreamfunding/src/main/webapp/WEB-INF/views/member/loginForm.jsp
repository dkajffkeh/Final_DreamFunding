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

	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.2.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css" />
</head>
<body>
    <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                <h5 class="card-title text-center">ȯ���մϴ�</h5>
                <form class="form-signin" action="login.me.jm" method="post">
                  <div class="form-label-group">
                    <input type="email" id="email" class="form-control" name="email" placeholder="Email address" required autofocus>
                    <label for="email">���̵�(�̸���)</label>
                  </div>
    
                  <div class="form-label-group">
                    <input type="password" id="memberPwd" class="form-control" name="memPwd" placeholder="Password" required>
                    <label for="memberPwd">��й�ȣ</label>
                  </div>
    
                  <div class="custom-control custom-checkbox mb-3">
                    <table>
                        <tr>
                            <td style="width: 200px;">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">��й�ȣ �����ϱ�</label>
                            </td>
                            <td>
                                <a href="enrollForm.me.jm">ȸ������</a>
                            </td>
                        </tr>
                    </table>
                  </div>
                  <button class="btn btn-lg btn-login btn-block text-uppercase" type="submit">�α���</button>
                  <hr class="my-4">
                  <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> ���۷� �α��� �ϱ�</button>
                  <button class="btn btn-lg btn-naver btn-block text-uppercase" type="submit"><i class="fab fa-naver mr-2"></i>���̹��� �α��� �ϱ�</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>