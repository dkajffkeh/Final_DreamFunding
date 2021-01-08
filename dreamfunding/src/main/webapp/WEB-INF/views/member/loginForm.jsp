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
                    <input type="email" id="userId" class="form-control" name="email" placeholder="Email address" required autofocus>
                    <label for="userId">아이디(이메일)</label>
                  </div>
    
                  <div class="form-label-group">
                    <input type="password" id="memberPwd" class="form-control" name="memPwd" placeholder="Password" required>
                    <label for="memberPwd">비밀번호</label>
                  </div>
    
                  <div class="custom-control custom-checkbox mb-3">
                    <table>
                        <tr>
                            <td style="width: 200px;">
                                <input type="checkbox" class="custom-control-input" id="idSaveCheck">
                                <label class="custom-control-label" for="idSaveCheck">아이디 저장하기</label>
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
      <script>
      $(document).ready(function(){
    	  
    	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    	    var key = getCookie("key");
    	    $("#userId").val(key); 
    	     
    	    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    	    }
    	     
    	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
    	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
    	            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
    	        }else{ // ID 저장하기 체크 해제 시,
    	            deleteCookie("key");
    	        }
    	    });
    	     
    	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    	    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
    	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
    	            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
    	        }
    	    });
    	});
    	 
    	function setCookie(cookieName, value, exdays){
    	    var exdate = new Date();
    	    exdate.setDate(exdate.getDate() + exdays);
    	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    	    document.cookie = cookieName + "=" + cookieValue;
    	}
    	 
    	function deleteCookie(cookieName){
    	    var expireDate = new Date();
    	    expireDate.setDate(expireDate.getDate() - 1);
    	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    	}
    	 
    	function getCookie(cookieName) {
    	    cookieName = cookieName + '=';
    	    var cookieData = document.cookie;
    	    var start = cookieData.indexOf(cookieName);
    	    var cookieValue = '';
    	    if(start != -1){
    	        start += cookieName.length;
    	        var end = cookieData.indexOf(';', start);
    	        if(end == -1)end = cookieData.length;
    	        cookieValue = cookieData.substring(start, end);
    	    }
    	    return unescape(cookieValue);
    	}
      </script>


</body>
</html>