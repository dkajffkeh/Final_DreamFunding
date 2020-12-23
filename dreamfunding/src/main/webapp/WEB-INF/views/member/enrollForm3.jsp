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
                <h5 class="card-title text-center">ȯ���մϴ�</h5>
                <form class="form-signin" action="insert.me.jm" method="post">
                  <div class="form-label-group">
                    <input type="email" id="memName" class="form-control" name="memberName" placeholder="Email address" required autofocus>
                    <label for="memName">�̸��� �Է��ϼ���</label>
                  </div>

                  <div class="form-label-group">
                    <input type="text" id="memNick" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="memNick">������ �Է����ּ���</label>
                  </div>
                  
                  <div class="form-label-group">
                    <input type="email" id="email" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="email">�̸���(ID)�� �Է��ϼ���</label>
                  </div>
                  
                  <div class="form-label-group">
                    <input type="password" id="memPwd" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="memPwd">��й�ȣ</label>
                  </div>
                  <div class="form-label-group">
                    <input type="password" id="memPwd2" class="form-control" name="memberPwd" placeholder="Password" required>
                    <label for="memPwd2">��й�ȣ Ȯ��</label>
                  </div>
                  <div align="center"> 
                    <input type="radio" name="gender" value="M" id="male">
                    <label for="male">����</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="F" id="female">
                    <label for="female">����</label>
                  </div>
                  <table>
                    <hr class="my-4">
                    <tr>
                        <td>
                            �޴�����ȣ �Է�
                        </td>
                    </tr>
                
                    <tr>

                        <td>
                            <input type="text" class="form-control form-phone" name="phone">
                        </td>
                        <td>
                            <button type="button" class="form-control btn-request">������ȣ ��û</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ������ȣ �Է�
                        </td>
                    </tr>
                    <tr>

                        <td colspan="2">
                            <input type="text" class="form-control form-phone">
                        </td>
                        
                    </tr>
                </table>
                  <hr class="my-4">
                  <button class="btn btn-lg btn-login btn-block text-uppercase" type="submit">ȸ������</button>
                  

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>