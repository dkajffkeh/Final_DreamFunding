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

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.2.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/enrollForm.css" />
</head>
<body>
    <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                
                <h5 class="card-title text-center">금방끝나는 회원가입.</h5>
                <hr class="my-4">
                
                    <div class="join_inner_float">
                        <div class="input_line">
                            <h3 class="join_minisub">약관동의</h3>
                        </div>


                            <div class="check_line check_all">
                                <!-- onclick은 이벤트 핸들러이므로 javascript_:가 필요없음 -->
                                <input name="chkAll" type="checkbox" id="allCheck" class="fakebox" />
                                <!-- label의 for는 id와 1:1 매칭 -->
                                <label for="allCheck" class="">전체동의</label>
                            </div>

                            <div class="check_line">
                                <!-- 전체동의를 제외한 체크박스는 check라는 클래스를 추가 -->
                                <input type="checkbox" name="check_01" id="check_01" class="fakebox check">
                                <label for="check_01" class="labelbox">
                                    회원 이용 약관 (필수)
                                    
                                </label>
                            </div>

                            <div class="check_line">
                                <input type="checkbox" id="check_02" class="fakebox check">
                                <label for="check_02" class="labelbox">
                                    개인정보 처리방침 (필수)
                                    
                                </label>
                            </div>
                            
                            <div class="check_line">
                                <input type="checkbox" id="check_03" class="fakebox check">
                                <label for="check_03" class="labelbox">
                                    개인정보 수집 및 이용 (필수) 
                                </label>
                            </div>

                    </div>

    
                  <hr class="my-4">
                    
                <form class="form-signin" >
                    
                    <br>
                    <a class="btn btn-lg btn-login btn-block text-uppercase" href="enrollForm3.me.jm">다음</a>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <script type="text/javascript">
        $(document).on("click", "#allCheck", function(e) {
            // 만약 전체 체크박스가 체크가 되면
            if ($(this).is(":checked")) {
                // 모든 체크박스를 체크
                $(":checkbox.check").prop("checked", true);
            } else {
                // 아니면 모든 체크박스를 해제
                $(":checkbox.check").removeAttr("checked");
            }
        });
    
        $(document).on("click", ":checkbox.check", function(e) {
            var length = $(":checkbox.check").length;
            var checkLen = $(":checkbox.check:checked").length;
            // 만약 모든 체크박스가 체크된 상태일 때
            if (length == checkLen) {
                // 전체동의를 체크해준다
                $(":checkbox#allCheck").prop("checked", true);
            } else {
                // 만약 하나라도 해제가 되었다면? 전체동의 체크 해제
                $("#allCheck").removeAttr("checked");
            }
        });
        </script>
</body>
</html>