<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.innerMain{
              /* border:2px solid #7f0000; */
              background-color: #fff7ed;
              width: 800px;
              height:600px;
          }
          .nametag{
              width:800px;
          }
          .ques{
            margin:0;
             border: 4px solid #7f0000;
             border-top:none;
             background-color: white;     
             box-sizing: border-box;
             height:100px;
             font-size: large;
             font-weight: 700;
             padding-top:40px;
             padding-left:20px;
             cursor:pointer;           
          }
          .answer{
            margin:0;
            padding:10px;
            border:4px solid #7f0000;
            border-top:none;
            display:none; 
            box-sizing: border-box;           
          }
          #faqtop{
              border-top:4px solid #7f0000;
          }
          #pagingArea{width:fit-content;margin:auto;}

        #searchForm{    
            width:fit-content;        
            margin:auto;
        }
        #searchForm>*{
            float:left;
            margin:5px;
        }
        .category a{
        	margin: 50px;
        	
        }
        .btnArea{
        	margin-left:380px
        }
        .btnArea>a,input{
        	
			float:left;
			margin-left:20px;						
		}
		.btnArea>input{
			margin-left:30px;
		}
</style>
</head>
<body>
	
	
	<jsp:include page="sCenterSide.jsp"/>
	<main class="section">
		<div class="inner" align="center">
		
			<div class="nametag">
            <br>
            <h1>자주묻는 질문</h1><br>
            <div class="category" align="center">
              	<a href="faqList.gn.no?ctno=1">로그인</a>
              	<a href="faqList.gn.no?ctno=2">프로젝트 크리에이터</a>
              	<a href="faqList.gn.no?ctno=3">프로젝트 서포터</a>	               
            </div>            
        	</div>
        <br><br>
        <div class="innerMain" align="left">
            <c:forEach var="fq" items="${ list }">
            	
		        <div class="ques" id="faqtop">${fq.faqNo}. ${ fq.faqTitle }</div>
		        <p class="answer">${ fq.faqContent }</p>
		        
            </c:forEach>
            
        </div>
         <br><br><br><br><br><br><br><br>
         <c:if test="${loginMem.memStatus eq 2 }">
	         <div class="btnArea" align="center">
				<a class="btn btn-primary btn-sm" href="faqEnrollForm.gn.no" style="width:100px">작성하기</a>
				<input type="number" id="faqno" name="fqno" class="form-conotrol" style="width:70px">
				<a class="btn btn-secondary btn-sm" onclick="updateFaq()" style="width:100px">수정하기</a>
				<a class="btn btn-danger btn-sm" onclick="deleteFaq()" style="width:100px">삭제하기</a>
			</div>
        </c:if>
		</div>
        <br><br><br>
       
        <div id="pagingArea" align="center">
        <br><br>
            <ul class="pagination">
	            <c:choose>
	            	<c:when test="${ pi.currentPage eq 1 }">
	                	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                </c:when>
	                <c:otherwise>
	                	<li class="page-item"><a class="page-link" href="scenterMain.gn?currentPage=${pi.currentPage -1 }">Previous</a></li>
	                </c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                	<li class="page-item"><a class="page-link" href="scenterMain.gn?currentPage=${p }">${p }</a></li>
                </c:forEach>
                
                <c:choose>
                	<c:when test = "${pi.currentPage eq pi.maxPage }">
                		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                	</c:when>
                	<c:otherwise>
                		<li class="page-item"><a class="page-link" href="scenterMain.gn?currentPage=${pi.currentPage+1 }">Next</a></li>
                	</c:otherwise>
                	
                </c:choose>
            </ul>
        </div>
       <br>
        
        

   
    <br><br>
    
    <div style="display: block;">
    <script>
        $(function(){
            $(".ques").click(function(){

                var $p = $(this).next();
                if($p.css("display") == "none" ){
                    
                    $(this).siblings("p").slideUp();
                    $p.slideDown();

                }else{
                
                    $p.slideUp();

                }

            });
        });
        function updateFaq(){
			var nno = $("#faqno").val();
			
			location.href = "faqUpdateForm.gn.no?fno=" + nno;
		}
		
		function deleteFaq(){
			var nno = $("#faqno").val();
			
			location.href = "faqDelete.gn.no?fno=" + nno;
		}
    </script>
		
		
		</div>
	</main>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>