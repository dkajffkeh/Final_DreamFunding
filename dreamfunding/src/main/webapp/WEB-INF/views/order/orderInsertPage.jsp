<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<style>
	 #paymentMain{
        width:90%;
        height:250px;
        margin:auto;
    }
    #paymentMain > div{
        height:100%;
        float:left;
    }
    #paymentIns{
        width:50%;
        height:100%;
    }
    #paymentInfo{
        width:50%;
        height:100%;
    }
    #cardSel div{
        width:180px;
        height:70px;
        background-color:pink;
        color:white;
        text-align:center;
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>

	<div id="inner">
		<form action="order.send" name="orderInsertForm" id="fndInsert2" method="post"> <!--onsubmit="return checkCheckBox(this)" -->
        <h3 align="center" style="">프로젝트 후원하기</h3>
        <br><br>
        <h3>리워드</h3>
        <hr>
           <h4> ${ p.projectTitle } </h4>
            <ul id="optionList">
            	<c:forEach var="re" items="${ reOp }">
            		<li>${ re.rewardContent }<li>
            	</c:forEach>
            </ul>
            <br> 
            <h4 align="center">가격 : ${ rewardPri }  원</h4>
        <hr>
            <h4> 추가후원금 </h4>
            후원금 : 
            <input type="number" id="supportPrice" name="rewardPlus" value="0" onkeyup="verify.sum()" numberOnly> 원
            <br><br>
            <div id="total" style="text-align:center"></div>
            <input type="hidden" name="projectNo" value="${ p.projectNo }">

      <script>
	      $("input:text[numberOnly]").on("focus", function() {
			    var x = $(this).val();
			    x = removeCommas(x);
			    $(this).val(x);
			}).on("focusout", function() {
			    var x = $(this).val();
			    if(x && x.length > 0) {
			        if(!$.isNumeric(x)) {
			            x = x.replace(/[^0-9]/g,"");
			        }
			        x = addCommas(x);
			        $(this).val(x);
			    }
			}).on("keyup", function() {
			    $(this).val($(this).val().replace(/[^0-9]/g,""));
			});
      
      
      		function verifyTotal(subPri, result_id, result, total_html){
      			this.subPri = subPri;
      			this.result_id = result_id;
      			this.result = result;
      			this.total_html = total_html;
      			
      			
      			this.sum = function(){
      				
      				var subPrice = document.getElementById('supportPrice').value;
      				subPrice = Number(subPrice);
      				
      				console.log(this.subPri);
      				var r = document.getElementById(this.result_id);
      				this.result = subPrice + ${rewardPri};
      				
      				this.total_html = "<h4> 총합 : " + this.result + " 원 </h4>" +
      									"<input type=\"hidden\" name=\"totalPrice\" value=\" " + this.result + "\" >";
      				r.innerHTML = this.total_html;
      				
      			}
      		}
      		
      		function verifyInput(){
      			
      			
      			verify = new verifyTotal();
      			verify.subPri = document.getElementById('supportPrice').value;
      			verify.subPri = 12;
      			verify.result_id = 'total';
      			verify.result = 0;
      			verify.total_html = '';
      			console.log(verify.subPri);
      			verify.sum();
      			
      		}

      		
      		function addLoadEvent(func) {
      		  var oldonload = window.onload;
      		  if (typeof window.onload != 'function') {
      		    window.onload = func;
      		  } else {
      		    window.onload = function() {
      		      if (oldonload) {
      		        oldonload();
      		      }
      		      func();
      		    }
      		  }
      		}

      		addLoadEvent(function() {
      		  verifyInput();
      		});
      		
			
			</script>
        
            <h3> 배송지 선택  </h3>
            <hr>
            <div id="delivery">
                <input type="radio" id="basicDev" name="dev" value="B"> 
                <label for name="basicDev">기본 배송지</label>
                <br>
                <input type="radio" id="newDev" name="dev" value="N" checked>
                <label for name="newDev">새로운 배송지</label>
                <br><br>

                <table id="dev_table" align="center" width="1000">
                    <tr>
                        <td colspan="2">이름</td>
                        <td colspan="2">전화번호</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text" id="receieverName" name="receieverName" style="width:250px"></td>
                        <td colspan="2"><input type="text" id="receieverPhone" name="receieverPhone" style="width:450px" placeholder="(-)생략 작성"></td>
                    </tr>
                    <tr>
                        <td colspan="4">주소</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width:600px"><input type="text" style="width:550px" id="shippingSAddr" name="shippingSAddr"></td>
                        <td align="center"><input type="text" id="shippingZipcode" name="shippingZipcode"></td>
                        <td> <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
                    </tr>
                    <tr>
                        <td colspan="4">상세주소</td>
                    </tr>
                    <tr>
                        <td colspan="4"><input type="text" style="width:100%" id="shippingDAddr" name="shippingDAddr"></td>
                    </tr>
                    <tr>
                        <td colspan="4">배송시 전달사항</td>
                    </tr>
                    <tr>
                        <td colspan="4"><input type="text" style="width:100%" name="purinfoReq"></td>
                    </tr>
                    <tr>
                        <td colspan="4">*요청사항은 배송에 관련된 상황만 적어주세요.</td>
                    </tr>
                </table>
                <br><br>
                
                <script>

                    function sample6_execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var addr = ''; // 주소 변수
                                var extraAddr = ''; // 참고항목 변수

                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                    addr = data.roadAddress;
                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                    addr = data.jibunAddress;
                                }

                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('shippingZipcode').value = data.zonecode;
                                document.getElementById("shippingSAddr").value = addr;
                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById("shippingDAddr").focus();
                            }
                        }).open();
                    }
                </script>
                
                
                <script>

				

				$(document).ready(function(){
					 
				    // 라디오버튼 클릭시 이벤트 발생
				    $("input:radio[name=dev]").click(function(){
				 
				        if($("input[name=dev]:checked").val() == 'B'){
				 
				        	document.getElementById('receieverName').value = '${s.receieverName}';
				        	document.getElementById('receieverPhone').value = '${s.receieverPhone}';
				        	document.getElementById('shippingSAddr').value = '${s.shippingSAddr}';
				        	document.getElementById('shippingZipcode').value = '${s.shippingZipcode}';
				        	document.getElementById('shippingDAddr').value = '${s.shippingDAddr}';
				        	
				        }else{
				        	
				        	document.getElementById('receieverName').value = '';
				        	document.getElementById('receieverPhone').value = '';
				        	document.getElementById('shippingSAddr').value = '';
				        	document.getElementById('shippingZipcode').value = '';
				        	document.getElementById('shippingDAddr').value = '';
				        
				        }
				    });
				});
				
				</script>
                
                
            <h3>결제정보</h3>
            <hr>
            <h4>기본 결제수단</h4>
                <table id="cardSel">
                	<tbody>
                		<tr>
                			
	                		<c:forEach var="c" items="${ mp }" varStatus="i" >
		                        <td>&nbsp;&nbsp;<input type="radio"  name="paymentSel" value="${ i.index }">&nbsp;&nbsp;</td>
	                       	 	<td>
		                            <div>
		                                <p>${ c.purchaseBasic }</p>
		                                <p> 
		                                	************
		                                	<c:forTokens var="cards" items="${ c.purchaseCNumber }" delims="-" begin="3" end="3" step="1">
	                								<c:out value="${cards}"/>
	                						</c:forTokens>
		                                </p>
		                            </div>
	                        	</td>
	                    	</c:forEach>
                    	</tr>
                	</tbody>  
                </table>
                <br>
            <input type="radio" name="paymentSel" value="N" id="paymentSel" checked> 
            <label for ="paymentSel"><h4>새로운 결제수단</h4></label>

            

            <div id="paymentMain">
                <div id="paymentIns">
                    <table  style="width:90%">
                        <tr>
                            <td colspan="4"><b style="font-size:18px">카드번호</b></td>
                        </tr>
                        <tr>
                            <td><input type="text" style="width:120px" name="cardNum" id="cardNum1"></td>
                            <td><input type="password" style="width:120px" name="cardNum" id="cardNum2"></td>
                            <td><input type="password" style="width:120px" name="cardNum" id="cardNum3"></td>
                            <td><input type="text" style="width:120px" name="cardNum" id="cardNum4"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><b style="font-size:18px">유효기간</b></td>
                            <td colspan="2"><b style="font-size:18px">카드 비밀번호</b></td>
                        </tr>
                        <tr>
                            <td><input type="text" placeholder="YYYY" style="width:120px" name="purchaseVYear" id="cardVYear"></td>
                            <td><input type="text" placeholder="mm" style="width:130px" name="purchaseVMonth" id="cardVMonth"></td>
                            <td><input type="password" placeholder="앞 2자리" style="width:130px" name="purchaseCPwd" id="cardVPwd"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <b style="font-size:18px">생년월일 (주민번호 앞 6자리)</b><br>
                                무기명 법인카드는 사업자등록번호 10자리를 입력하세요                        
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><input type="text" style="width:520px" name="purchaseCDate" id="cardBirth"></td>
                        </tr>
                    </table>
                </div>
                
                <script>
                	
               
	                $(document).ready(function(){
						 
					    // 라디오버튼 클릭시 이벤트 발생
					    $("input:radio[name=paymentSel]").click(function(){
					 
					        if($("input[name=paymentSel]:checked").val() == 'N'){
		        				
					        	document.getElementById('cardNum1').value = '';
					        	document.getElementById('cardNum2').value = '';
					        	document.getElementById('cardNum3').value = '';
					        	document.getElementById('cardNum4').value = '';
					        	document.getElementById('cardVYear').value = '';
					        	document.getElementById('cardVMonth').value = '';
					        	document.getElementById('cardVPwd').value = '';
					        	document.getElementById('cardBirth').value = '';
					        	
					        }else{
					        	
					        	
					        	//var card = document.getElementById('paymentSel').value;	
					        	var card = $('input:radio[name="paymentSel"]:checked').val();

					        	console.log(card);
					        	if(card == 0){
					        		<c:set var="card" value="${card}"/>
							        	console.log('${mp[0].purchaseCNumber}');
						        		var cardNum = '${mp[0].purchaseCNumber}';
						        		var cardnum = cardNum.split('-');
							        
							        	for(var i=0; i<4; i++){

							        		document.getElementById('cardNum' + (i+1)).value = cardnum[i];
							        	}
							        	
							        	
							        	document.getElementById('cardVYear').value = '${ mp[0].purchaseVYear}';
							        	document.getElementById('cardVMonth').value = '${ mp[0].purchaseVMonth}';
							        	document.getElementById('cardVPwd').value = '${ mp[0].purchaseCPwd}';
							        	document.getElementById('cardBirth').value = '${mp[0].purchaseCDate}';
					        	}else if (card == 1){
					        		<c:set var="card" value="${card}"/>
						        		var cardNum = '${mp[1].purchaseCNumber}';
						        		var cardnum = cardNum.split('-');
							        
							        	for(var i=0; i<4; i++){

							        		document.getElementById('cardNum' + (i+1)).value = cardnum[i];
							        	}
							        	
							        	
							        	document.getElementById('cardVYear').value = '${ mp[1].purchaseVYear}';
							        	document.getElementById('cardVMonth').value = '${ mp[1].purchaseVMonth}';
							        	document.getElementById('cardVPwd').value = '${ mp[1].purchaseCPwd}';
							        	document.getElementById('cardBirth').value = '${mp[1].purchaseCDate}';
					        	}else if (card == 2){
					        		<c:set var="card" value="${card}"/>
						        		var cardNum = '${mp[2].purchaseCNumber}';
						        		var cardnum = 'cardNum.split('-')';
							        
							        	for(var i=0; i<4; i++){

							        		document.getElementById('cardNum' + (i+1)).value = cardnum[i];
							        	}
							        	
							        	
							        	document.getElementById('cardVYear').value = '${ mp[2].purchaseVYear}';
							        	document.getElementById('cardVMonth').value = '${ mp[2].purchaseVMonth}';
							        	document.getElementById('cardVPwd').value = '${ mp[2].purchaseCPwd}';
							        	document.getElementById('cardBirth').value = '${mp[2].purchaseCDate}';
					        	}else if (card == 3){
					        		<c:set var="card" value="${card}"/>
						        		var cardNum = '${mp[3].purchaseCNumber}';
						        		var cardnum = 'cardNum.split('-')';
							        
							        	for(var i=0; i<4; i++){

							        		document.getElementById('cardNum' + (i+1)).value = cardnum[i];
							        	}
							        	
							        	
							        	document.getElementById('cardVYear').value = '${ mp[3].purchaseVYear}';
							        	document.getElementById('cardVMonth').value = '${ mp[3].purchaseVMonth}';
							        	document.getElementById('cardVPwd').value = '${ mp[3].purchaseCPwd}';
							        	document.getElementById('cardBirth').value = '${mp[3].purchaseCDate}';
					        	}else if (card == 4){
					        		<c:set var="card" value="${card}"/>
						        		var cardNum = '${mp[4].purchaseCNumber}';
						        		var cardnum = 'cardNum.split('-')';
							        
							        	for(var i=0; i<4; i++){

							        		document.getElementById('cardNum' + (i+1)).value = cardnum[i];
							        	}
							        	
							        	
							        	document.getElementById('cardVYear').value = '${ mp[4].purchaseVYear}';
							        	document.getElementById('cardVMonth').value = '${ mp[4].purchaseVMonth}';
							        	document.getElementById('cardVPwd').value = '${ mp[4].purchaseCPwd}';
							        	document.getElementById('cardBirth').value = '${mp[4].purchaseCDate}';
					        	}

					        }
					    });
					});
                	
                </script>
                
                
                <input type="hidden" name="purchaseCNumber" id="purchaseCNumber">
                <input type="hidden" name="purchaseBkey">
                <input type="hidden" name="payToken" id="payToken">
                <input type="hidden" name="mno" value="${ mno }">
                <input type="hidden" name="pno" value="${ p.projectNo }">
                <input type="hidden" name="reNo" value="${ re.rewardNo }">
                <input type="hidden" name="rewardAmount" value="${ rewardAmount }">
                
                
                
                
                <div id="paymentInfo">
                    <h5>결제(예약)시 주의사항</h5>
                    <p>
                    결제실행일에 결제자 귀책사유(한도초과, 이용정지 등)로 인하여 결제가 실패할 수 있으니, 결제수단이 유효한지 한번 확인하세요.
                        <br><br>
                    1차 결제 실패 시 실패일로부터 3 영업일 동안 재 결제를 실행합니다.
                        <br><br>
                    결제 예약 이후, 결제할 카드를 변경하려면 마이페이지 > 나의 펀딩의 결제정보에서 카드정보를 변경해주세요.
                    </p>
                </div>
            </div>
            <input type="checkbox" id="mainAgree" name="mainAgree" value="agree">
            <label for ="mainAgree"><b>전체 동의하기</b></label>
            <br>
            <input type="checkbox" id="subAgree1" name="subAgree1" value="agree">
            <label for ="subAgree">제 3자에 대한 개인정보 제공 동의하기</label>
            <br>
            <input type="checkbox" id="subAgree2" name="subAgree2" value="agree">
            <label for ="subAgree">책임 규정에 대한 동의하기</label>

            <br><br>
            <div style="text-align:center">
                <input class="btn btn-primary" id="paysend" type="submit" value="결제하기" disabled="disabled"></input>
                <input class="btn btn-secondary" type="reset" value="취소하기"></input>
            </div>    
        </form>
        
        <script>
        /*
        $(function(){
        	$("#paysend").on("click", function(){
            	
            	
            	gainToken();
            	
            	var token = $("#payToken").val();
            	ajaxBilling();
            
            })
        })
        
        $(function(){
        	$("#paysend1").on("click", function(){
            	
            	
            	gainToken();
            	
            	var token = $("#payToken").val();
            	ajaxBilling();
            
            })
        })
        */
        <!--
        // header 정보를 추가합니다. 
		var myHeaders = new Headers();
		myHeaders.append("Authorization", "Bearer mF_9.B5f-4.1JqM");
		fetch('https://server.example.com/resource',{
		    "headers":myHeaders
		}).then(function(res){
		    // 서버의 응답이 json인 경우 아래의 코드를 통해서 js의 객체로 변환된 결과를 얻을 수 있습니다. 
		    return res.json();
		}).then(function(data){
		    // json으로 변환된 결과를 출력합니다. 
		    console.log(data);
		});
        -->
        function gainToken(){
      		
  			var impKey = "imp_apikey";
  			var impSecret = "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f";
        	
        	$.ajax({
        		url: "https://api.iamport.kr/users/getToken",
        		type: "POST",
        		data:{ imp_key:impKey,
        			   imp_secret:impSecret
        			 },
        		dataType:"JSON",
        		error: function(e){ console(e) },
				success: function(result){
					
					var key = result.response.access_token;
					console.log(key);
					$("input[name=payToken]").val(key);
				}
        	});
        	
        	
        }
        
        /*
     	// Ajax로 카드사와 통신하는 메서드
        function ajaxBilling() {
        	var c1 = $("#cardNum1").val();
        	var c2 = $("#cardNum2").val();
        	var c3 = $("#cardNum3").val();
        	var c4 = $("#cardNum4").val();
        	var card_number = c1 + "-" + c2 + "-" + c3 + "-" + c4;
        	$("input[name=purchaseCNumber]").val(card_number);
        	
        	var vm = $("#cardVMonth").val();
        	var vy = $("#cardVYear").val();
        	var expiry = vy + "-" + vm;
        	
        	var birth = $("#cardBirth").val();
        	var pwd_2digit = $("#cardVPwd").val();
        	var authori = "Bearer " +  $("#payToken").val();
        	var amount = $("input[name=totalPrice]").val();
        	
        	var result = "";
        	for ( var i = 0 ; i < 5 ; i++ ) {
        		result += Math.floor(Math.random() * 10);
        	}
        	console.log(result)
        	$("input[name=bKey]").val("${ prj.pNo }" + "_" + "${ loginUser.userNo }" + "_"+ result+ "_" + $("#cardNo4").val() );
        	var merchant_uid = $("input[name=bKey]").val();
        	var customer_uid = "12454sdfsdf1";
        	var buyerName = "테스트"
        	$.ajax({
        		url: "https://api.iamport.kr/subscribe/payments/onetime",
        		type: "POST",
        		data: {
        				Authorization:authori
        				},
        				{ merchant_uid: merchant_uid,
        				amount:amount,
        				tax_free:0,
        			    card_number: card_number,
        				expiry: expiry,
        				birth: birth,
        				pwd_2digit: pwd_2digit,
        				customer_uid: customer_uid,
        				name:"default",
        				buyer_name: buyerName
        				},
        		dataType: "JSON",
        		error: function(e){ console.log(e) },
        		success: function( result ){
        			console.log(result);
        			// 카드정보 입력에 성공하면 폼을 서브밋해 우리 서버로 정보를 넘김
        			$("#fndInsert2").submit();
        		}
        	});
        }
        */
        </script>
        
        
        <!-- 결제하기버튼 활성화 스크립트 -->
        <script>

	        $("input#mainAgree").click(function() {
	        	   if ($("#mainAgree:checked").val() == "agree") // 활성화
	        	   {
	        		   document.getElementById('subAgree1').checked = true;
	        		   document.getElementById('subAgree2').checked = true;
	        	   }
	        	   else // 비활성화
	        	   {
	        		   document.getElementById('subAgree1').checked = false;
	        		   document.getElementById('subAgree2').checked = false;
	        	   }   
	        	  });
	        
	        $("input#mainAgree").click(function() {
	        	   if ($("#subAgree1:checked").val() == "agree" && $("#subAgree2:checked").val() == "agree"
	        			   ) // 활성화
	        	   {
	        	    $("input#paysend").removeAttr("disabled");
	        	    var cardNumber = $("#cardNum1").val() + "-" + $("#cardNum2").val() + "-" 
	        	    				+$("#cardNum3").val() + "-" +$("#cardNum4").val();
	        	    document.getElementById('purchaseCNumber').value = cardNumber;
	        	   }
	        	   else // 비활성화
	        	   {
	        	    $("input#paysend").attr("disabled", true);
	        	   }   
	        	  });
	        
	        $("input#subAgree1").click(function() {
	        	   if ($("#subAgree1:checked").val() == "agree" && $("#subAgree2:checked").val() == "agree") // 활성화
	        	   {
	        	    $("input#paysend").removeAttr("disabled");
	        	    var cardNumber = $("#cardNum1").val() + "-" + $("#cardNum2").val() + "-" 
    								+$("#cardNum3").val() + "-" +$("#cardNum4").val();
	        	    document.getElementById('purchaseCNumber').value = cardNumber;
	        	   }
	        	   else // 비활성화
	        	   {
	        	    $("input#paysend").attr("disabled", true);
	        	   }   
	        	  });
	        
	        $("input#subAgree2").click(function() {
	        	   if ($("#subAgree1:checked").val() == "agree" && $("#subAgree2:checked").val() == "agree") // 활성화
	        	   {
	        	    $("input#paysend").removeAttr("disabled");
	        	    var cardNumber = $("#cardNum1").val() + "-" + $("#cardNum2").val() + "-" 
									+$("#cardNum3").val() + "-" +$("#cardNum4").val();
	        	    document.getElementById('purchaseCNumber').value = cardNumber;
	        	   }
	        	   else // 비활성화
	        	   {
	        	    $("input#paysend").attr("disabled", true);
	        	   }   
	        	  });
        </script>



    </div>


	<jsp:include page="../common/footer.jsp"/>


</body>
</html>