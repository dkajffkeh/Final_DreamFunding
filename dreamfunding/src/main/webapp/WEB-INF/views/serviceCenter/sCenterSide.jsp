<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<style>

	 .scSidebar{
	 	margin-left:100px;
	 }
	 .sidenav {
                height:100%;
                width: 0;
                position: fixed;
                z-index:1;
                top: 0;
                left: 0;
                background-color: rgb(255,247,237);
                overflow-x: hidden;
                transition:0.5s ease-in-out;
                padding-top: 60px;
            }
            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color:#7f0000;
                display: block;
                transition: 0.2s ease-in-out;
            }
            .sidenav a:hover, .offcanvas a:focus {
                color: #000;
            }
            .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px !important;
                margin-left: 50px;
            }
            .openmenu:hover {
                color:rgb(0,154,200);
                transition:0.5s ease-in-out;
            }
            .openmenu {
                font-size: 25px;
                cursor:pointer;
                transition:0.5s ease-in-out;
            }
            .openmenu > i {
                font-size: 30px;
            }
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="scSidebar">
      <span class="openmenu" onclick='openNav()'>메뉴</span>
      </div>
      <div id="mysidenav" class="sidenav">
          <a href="#" class="closebtn" onclick='closeNav()'>x</a>
          <a href="scenterMain.gn">공지사항</a>
          <a href="faqList.gn.no?ctno=1">자주 묻는 질문</a>
          <a href="councilList.gn.no?mno=${loginMem.memNo }">1:1문의</a>          
    </div>
    
    
	  <script>
          function openNav() {
              document.getElementById('mysidenav').style.width = '250px';
          }
          function closeNav() {
              document.getElementById('mysidenav').style.width = '0';
          }
      </script>
	
</body>
</html>