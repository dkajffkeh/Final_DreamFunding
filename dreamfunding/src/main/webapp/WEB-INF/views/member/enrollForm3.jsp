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
                <form id="enrollForm" class="form-signin" action="insert.me.jm" method="post">
                  <div class="form-label-group">
                  
                    <input type="text" id="memName" class="form-control" name="memName" placeholder="Email address"  required autofocus>
                    <label for="memName">이름을 입력하세요</label>
                  </div>

                  <div class="form-label-group">
                    <input type="text" id="memNick" class="form-control" name="memNick" placeholder="Password" required>
                    <label id="check-nick" for="memNick">별명을 입력해주세요</label>
                  </div>
                  
                  
                  <div class="form-label-group">
                    <input type="email" id="email" class="form-control" name="email" placeholder="Password" required>
                    <label id="check-result" for="email">이메일(ID)을 입력하세요</label>
                  </div>
                  
                  
                  <div class="form-label-group">
                    <input type="password" id="pw" class="form-control" onchange="check_pw()" placeholder="Password" name="memPwd"  required>
                    <label for="pw">비밀번호</label>
                  </div>
                  <div class="form-label-group">
                    <input type="password" id="pw2" class="form-control" onchange="check_pw()" placeholder="Password" required>&nbsp;<span id="check"></span>
                    <label for="pw2">비밀번호 확인</label>
                    
                  </div>
                  
                   <script>
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
			        function check_pw(){
			 
			            var pw = document.getElementById('pw').value;
			            var SC = ["!","@","#","$","%"];
			            var check_SC = 0;
			 
			            if(pw.length < 6 || pw.length>16){
			                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
			                document.getElementById('pw').value='';
			            }
			            for(var i=0;i<SC.length;i++){
			                if(pw.indexOf(SC[i]) != -1){
			                    check_SC = 1;
			                }
			            }
			            if(check_SC == 0){
			                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
			                document.getElementById('pw').value='';
			            }
			            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
			                if(document.getElementById('pw').value==document.getElementById('pw2').value){
			                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
			                    document.getElementById('check').style.color='blue';
			                }
			                else{
			                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
			                    document.getElementById('check').style.color='red';
			                    
			                }
			            }
			        }
			    </script>
                  
                  
                  
                  
                  
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
						   <div class="form-label-group">
		                    <input type="text" id="phone" class="form-control" name="phone" placeholder="Password" required>
		                    <label for="phone">휴대폰번호 입력</label>
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
                <div id="check-nick"></div>
                  <hr class="my-4">
                  <button class="btn btn-lg btn-login btn-block text-uppercase" id="enroll-btn" type="submit" disabled>회원가입</button>
                  

                </form>
                <script>
                	var cNick = false;
                	var cEmail = false;
                	var cCertify = false;
                	var cPwd = false;
                	
			        function check_pw(){
						 
			            var pw = document.getElementById('pw').value;
			            var SC = ["!","@","#","$","%"];
			            var check_SC = 0;
			 
			            if(pw.length < 6 || pw.length>16){
			                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
			                document.getElementById('pw').value='';
			            }
			            for(var i=0;i<SC.length;i++){
			                if(pw.indexOf(SC[i]) != -1){
			                    check_SC = 1;
			                }
			            }
			            if(check_SC == 0){
			                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
			                document.getElementById('pw').value='';
			            }
			            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
			                if(document.getElementById('pw').value==document.getElementById('pw2').value){
			                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
			                    document.getElementById('check').style.color='blue';
			                    cPwd = true;
			                    buttonAble()
			                }
			                else{
			                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
			                    document.getElementById('check').style.color='red';
			                    cPwd = false;
			                    buttonAble()
			                    
			                    
			                }
			            }
			        }

                    function buttonAble(){
		
                    	
                    	        if(cNick == true && cEmail == true && cCertify == true ){
                    	        	if(cPwd == true){
                    	        		document.getElementById("enroll-btn").removeAttribute("disabled");
                    	        	}
                    	            
                    	        }
                    	console.log(cPwd);

                    	   }
                	
                    // 인증번호 전달
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
                

                    
                
                
                
                	//이메일 중복확인
                	$(function(){
                		
                		var emailInput = $("#enrollForm input[name=email]");	
                		
                		emailInput.keyup(function(){
                			

                			if(emailInput.val().length >= 8){ 
                				
                				$.ajax({
                					url:"emailCheck.me.jm", 
                					data:{email:emailInput.val()},
                					type:"post",
                					success:function(count){
                						
                						if(count == 1){ 

                							$("#check-result").show();
                							$("#check-result").css("color", "red").text("중복된 이메일 아이디가 존재합니다. 다시 입력해주세요.");
                							cEmail = false;
                							buttonAble()
                							
                							
                						}else{

                							$("#check-result").show();
                							$("#check-result").css("color", "green").text("사용가능한 이메일입니다.");
                							cEmail = true;
                							buttonAble()
                							
                							
                							
                						}
                						
                					},error:function(){
                						console.log("아이디 중복체크용 ajax통신 실패");
                					}
                				});
                			
                				
                			}else{ 
                				$("#check-result").css("color", "black").text("이메일(ID)을 입력하세요");

                				
                			}
                			
                			
                			
                		});
               
                		
                	});
                	
                	//닉네임 중복확인
                	$(function(){
                		
                		var memNickInput = $("#enrollForm input[name=memNick]");	
                		
                		memNickInput.keyup(function(){
                			
                			
                			if(memNickInput.val().length >= 2){ 
                				
                				$.ajax({
                					url:"memNickCheck.me.jm", 
                					data:{memNick:memNickInput.val()},
                					type:"post",
                					success:function(count){
                						
                						if(count == 1){ 

                							$("#check-nick").show();
                							$("#check-nick").css("color", "red").text("중복된 닉네임가 존재합니다. 다시 입력해주세요.");
                							cNick = false;
                							buttonAble()
                							
                						}else{

                							$("#check-nick").show();
                							$("#check-nick").css("color", "green").text("사용가능한 닉네임입니다.");
                							cNick = true;
                							buttonAble()
                							
                							
                						}
                						
                					},error:function(){
                						console.log("닉네임 중복체크용 ajax통신 실패");
                					}
                				});
                			
                				
                			}else{ 
                				$("#check-nick").css("color", "black").text("별명을 입력해주세요.");

                				
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