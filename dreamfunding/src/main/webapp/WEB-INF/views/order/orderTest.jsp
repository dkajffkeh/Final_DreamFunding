<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
	<h1>
		오더,결제 관련 테스트 페이지
	</h1>
	
	<div>
		<form action="orderInsert.me" method="post">
			<table>
				<tr>
					<th>프로젝트 제목 : </th>
					<td><input type="number" name="pno"></td>
				</tr>
				<tr>
					<th>멤버 번호 : </th>
					<td><input type="number" name="mno"></td>
				</tr>
				<tr>
					<th>옵션 : </th>
					<td>
						1.<input type="text" name="content">
						<%--
						2.<input type="text" name="rewardContent2">
						 --%>
					</td>
				</tr>
				<tr>
					<th>갯수 : </th>
					<td><input type="number" name="rewardNum"></td>
				</tr>
				<tr>
					<th>가격 : </th>
					<td><input type="number" name="rewardPrice"></td>
				</tr>
			</table>
			<input type="submit" value="제출">
		</form>
	</div>
	<div>
		<a href="orderCom.co"></a>
	</div>
	
	<form action="https://www.myservice.com/subscription/issue-billing" method="post">
	    <div>
	        <label for="card_number">카드 번호 XXXX-XXXX-XXXX-XXXX</label>
	        <input id="card_number" type="text" name="card_number">
	    </div>
	    <div>
	        <label for="expiry">카드 유효기간 YYYY-MM</label>
	        <input id="expiry" type="text" name="expiry">
	    </div>
	    <div>
	        <label for="birth">생년월일 YYMMDD</label>
	        <input id="birth" type="text" name="birth">
	    </div>
	    <div>
	        <label for="pwd_2digit">카드 비밀번호 앞 두자리 XX</label>
	        <input id="pwd_2digit" type="text" name="pwd_2digit">
	    </div>
	    <input hidden type="text" value="gildong_0001_1234" name="customer_uid">
	    <input type="submit" value="결제하기">
  	</form>
  	
  	<a href="hello3.no">테스트</a>
  	
  	<form action="hello3.no" method="post">
  		<input type="hidden" name="imp_key" value="imp_apikey">
  		<input type="hidden" name="imp_secret" value="ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f">
  		<input type="submit">
  	</form>
	
	
	<script>
					/*
		             // Ajax로 카드사와 통신하는 메서드
		                function ajaxBilling() {
		                	var c1 = $("#cardNo1").val();
		                	var c2 = $("#cardNo2").val();
		                	var c3 = $("#cardNo3").val();
		                	var c4 = $("#cardNo4").val();
		                	var card_number = c1 + "-" + c2 + "-" + c3 + "-" + c4;
		                	var expiry = $("#expiry").val();
		                	var birth = $("#authentication").val();
		                	var pwd_2digit = $("#pwd2").val();
		                	var result = "";
		                	for ( var i = 0 ; i < 5 ; i++ ) {
		                		result += Math.floor(Math.random() * 10);
		                	}
		                	console.log(result)
		                	$( "input[name=bKey]" ).val("${ prj.pNo }" + "_" + "${ loginUser.userNo }" + "_"+ result+ "_" + $("#cardNo4").val() );
		                	var customer_uid = $("input[name=bKey]").val();
		                	$.ajax({
		                		url: "http://localhost:8081/ajaxBillingServer",
		                		type: "POST",
		                		data: { card_number: card_number,
		                				expiry: expiry,
		                				birth: birth,
		                				pwd_2digit: pwd_2digit,
		                				customer_uid: customer_uid },
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


	<jsp:include page="../common/footer.jsp"/>

</body>
</html>