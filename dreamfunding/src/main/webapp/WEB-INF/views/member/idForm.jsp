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

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css" />
</head>
<body>
    <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                <h5 class="card-title text-center">환영합니다</h5>
                
				  <form class="form-signin" id="memberList" action="memberList.me.jm" method="post">
                  <table>
                    <hr class="my-4">
                  <div class="form-label-group">
                  
                    <input type="text" id="memName" class="form-control" name="memName" placeholder="Email address"  required autofocus>
                    <label for="memName">이름을 입력하세요</label>
                  </div>

                
                    <tr>

                        <td>
						   <div class="form-label-group">
		                    <input type="text" id="phone1" class="form-control" name="phone" placeholder="Password" required>
		                    <label for="phone1">휴대폰번호 입력</label>
		                    <div id="namePhone"></div>
		                   </div>
                        </td>
                        <td>
                        	<button type="button" class="form-control btn-request" data-toggle="modal" data-target="#myModal" onclick="certify1();">인증번호 요청</button>
                        </td>
                    </tr>

                    <tr>

                        <td>
						   <div class="form-label-group">
		                    <input type="text" id="certify" class="form-control" name="certify" placeholder="Password" required>
		                    <label for="certify">인증번호 입력</label>
		                    <input type="hidden" id="certifyNum" value="">
		                   </div>
                        </td>
                        <td>
                        	<button type="button" class="form-control btn-request" data-toggle="modal" data-target="#myModal1" onclick="certifycheck();">인증 확인</button>
                        </td>
                    </tr>

                </table>
                <button class="btn btn-lg btn-login btn-block text-uppercase" id="enroll-btn" type="submit" disabled>회원가입</button>
				</form>
                
                <script>
                
            	//이름이랑 핸드폰 번호 ajax
            		var emailPhoneCheck = false;
            		var cCertify = false;
            	
            	
            	
       		       function buttonAble(){

            	        if(emailPhoneCheck == true && cCertify == true){
            	            document.getElementById("enroll-btn").removeAttribute("disabled");
            	        }


              	   }
            	
            	$(function(){
            		
            		var phone = $("#memberList input[name=phone]");
                	var name = $("#memberList input[name=memName]");
            		phone.keyup(function(){

            			

            			if(phone.val().length >= 8){ // 중복체크할만함!!
            				
            				$.ajax({
            					url:"idFind.me.jm", 
            					data:{
            						phone:phone.val(),
            						memName:name.val()
            						},
            					type:"post",
            					success:function(count){
            						
            						if(count >= 1){ 
            							
            							emailPhoneCheck = true;
            							$("#namePhone").show();
            							$("#namePhone").css("color", "green").text("일치하는 회원이있습니다.");
            							$("#certifyReq").removeAttr("disabled");

            							buttonAble()
            							
            						}else{

            							$("#namePhone").show();
            							$("#namePhone").css("color", "red").text("일치하는 회원이없습니다.");
            							$("#certifyReq").attr("disabled", true);
            							emailPhoneCheck = false;

            							buttonAble()
            						}
            						
            					},error:function(){
            						console.log("ajax통신 실패");
            					}
            				});
            			
            				
            			}else{ // 중복체크할 필요도 없음!! 애초에 유효한 아이디가 아님!! 
            				
            				// 어떠한 메세지도 안보이고, 버튼 비활성화
            				$("#check-nick").hide();
            				$("#enroll-btn").attr("disabled", true);
            				
            			}
            			
            			
            			
            		});
           
            		
            	});
                
                
                
                



                
                
                
	                function certify1(){
	            		$.ajax({
	            			url:"message.me.jm",
	            			data:{
	            				phone:$("#phone").val()
	            			},
	            			type:"post",
	            			success:function(certify){
	            				$("#certifyNum").val(certify);
	            			},
	            			error:function(){
	            				console.log("ajax 통신 실패");
	            			},
	            		});
	            	};
	                // 인증번호 확인
	
	                function certifycheck(){
	                	
	                	var certify = $("#certify").val();
	                	var hiddenNum = $("#certifyNum").val();
	                	
						if(certify === hiddenNum){
	
							cCertify = true;
							buttonAble()
						
							
						}else{
							cCertify = false;
							buttonAble()
	
							
						}
	                	
	
	                };

                	
                	

                	
                	
                </script>
                <!-- The Modal -->
				<div class="modal" id="myModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">발송완료</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				      이메일이 발송되었습니다 확인해주십시요.
				      </div>
				
				
				    </div>
				  </div>
				</div>
                
                
                
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>