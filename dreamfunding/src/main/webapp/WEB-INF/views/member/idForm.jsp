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
                

                  <div class="form-label-group">
                  
                    <input type="text" id="memName" class="form-control" name="memName" required autofocus>
                    <label for="memName">이름을 입력하세요</label>
                  </div>
                  <table>
                    
                    
                    <tr>
                        <td>
                            휴대폰번호 입력
                        </td>
                    </tr>
                
                    <tr>

                        <td>
                            <input type="text" class="form-control form-phone" name="phone" id="phone">
                        </td>
                        <td>
                        	<button class="form-control btn-request" id="certifyReq" data-toggle="modal" data-target="#myModal" onclick="certify();">인증번호 요청</button>
                        	<div id="namePhone"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            인증번호 입력
                        </td>
                    </tr>
                    <tr>

                        <td colspan="2">
                            <input type="text" class="form-control form-phone" id="certifyCheck">
                            <input type="hidden" id="certifyNum" value="certify">
                        </td>
                        
                    </tr>
                </table>
                  <hr class="my-4">
                  <button class="btn btn-lg btn-login btn-block text-uppercase" id="enroll-btn" type="submit">회원가입</button>
                  

                
                <script>
                	
                // 인증번호 확인
                	function certify(){
                	var userName = $("#memName").val();
                	var certify = $("input[name=phone]");
                	var phone = $("#phone").val();
                	if(userName){
                		$.ajax({
                			url:"message.me.jm",
                			data:{
                				phone:$("#phone").val()
                			},
                			type:"post",
                			success:function(certify){
                				
                				
                				
                			},
                			error:function(){
                				console.log("ajax 통신 실패")
                			},
                		});
                	}
                	}
                	
                	
                	//이름이랑 핸드폰 번호 ajax
                	$(function(){
                		
                		var phone = $("input[name=phone]");
                    	var name = $("input[name=memName]")
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
                						
                						if(count == 1){ 
                							// 중복된 아이디 존재 => 사용불가
                							// => 메세지 빨간색 출력, 버튼 비활성화
                							$("#namePhone").show();
                							$("#namePhone").css("color", "red").text("일치하는 회원이있습니다.");
                							$("#certifyReq").removeAttr("disabled");
                							
                							
                						}else{
                							// 중복된 아이디 없음 => 사용가능
                							// => 메세지 초록색 출력, 버튼 활성화
                							$("#namePhone").show();
                							$("#namePhone").css("color", "green").text("일치하는 회원이없습니다.");
                							$("#certifyReq").attr("disabled", true);
                							
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
                	
                	
                </script>
                <!-- The Modal -->
				<div class="modal" id="myModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">인증번호</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				
				      <!-- Modal body -->
				      <div class="modal-body">
				       	인증번호가 발송되었습니다.
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