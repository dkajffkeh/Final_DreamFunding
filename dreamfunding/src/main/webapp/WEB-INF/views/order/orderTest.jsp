<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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


	<jsp:include page="../common/footer.jsp"/>

</body>
</html>