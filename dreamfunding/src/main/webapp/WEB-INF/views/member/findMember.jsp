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
<body>
    <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                
                <h5 class="card-title text-center">아이디, 비밀번호가 <br>기억이 안나요.</h5>
                


    
                  <hr class="my-4">

                    <table class="form-signin">

                    
                        <tr>

                            <td>
                                <center><a class="form-control btn-request" href="idForm.me.jm">아이디 찾기</a></center>
                            </td>
                            <td>
                               <center><a class="form-control btn-request" href="pwForm.me.jm">비밀번호 찾기</a></center>
                            </td>
                            </td>
                        </tr>

                    </table>
                    <br><br>
                    <a class="btn btn-lg btn-login btn-block text-uppercase" href="redirect.me.jm">메인으로 가기</a>

                
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>