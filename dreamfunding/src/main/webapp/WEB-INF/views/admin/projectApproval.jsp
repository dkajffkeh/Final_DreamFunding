<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>
	<style type="text/css">
	  #dataTable > tbody > tr{
	  	cursor:pointer
	  }
	  #dataTable > tbody > tr:hover{
	  background-color:whitesmoke;
	  color:grey;
	  }
		
	</style>
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="../common/adminSidebar.jsp" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <jsp:include page="../common/adminSearchbar.jsp" />

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">프로젝트 관리</h1>
                    <p class="mb-4"><a target="_blank"
                            href="https://datatables.net"></a></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">프로젝트 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th style="display:none"></th>
                                            <th style="width:18%">크리에이터명</th>
                                            <th style="width:44%">프로젝트명</th>        
                                            <th style="width:18%">승인 신청 날짜</th>
                                            <th style="width:18%">프로젝트 승인</th>
                                        </tr>
                                    </thead>
                                
                                    <tbody>
	                                    <c:forEach var="p" items="${ pList }">
	                                        <tr onclick="toPreview(this);">
	                                        	<td style="display:none">${ p.projectNo }</td>	
	                                            <td>${ p.creatorName }</td>
	                                            <td>${ p.projectTitle }</td>
	                                            <td>${ p.createDate }</td>
	                                            <td>
	                                            	<a class="btn btn-primary btn-sm" href="approval.gn?pno=${ p.projectNo }">승인</a>
	                                            	<button data-toggle="modal" data-target="#rejectProject" data-pno="${p.projectNo }" class="btn btn-danger btn-sm" ">반려</button>
	                                            </td>
	                                        </tr>
	                                    </c:forEach>    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
					<div class="modal fade" id="rejectProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="myModalLabel">반려 사유를 입력해주세요. </h5>
					      </div>
					      <div class="modal-body">
					        <input type="text" id="rejectReason" style="width:400px">
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary" onclick="reject();">확인</button>
					      </div>
					    </div>
 						 </div></div>
					
                </div>
               
            </div>
            

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Dream Funding 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
	
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

  
    
    <script>
    
    var pno="";
   
    
    $(document).ready(function() {     
        $('#rejectProject').on('show.bs.modal', function(event) {          
            pno = $(event.relatedTarget).data('pno');   
        });
    });
 
	 function reject()
	    {
	        var reason = $('#rejectReason').val();
	        location.href='rejected.gn?pno='+pno+'&reason='+reason;
	    }
	 
	 function toPreview(event){
		
		 window.open("gotoPreview?projectNo="+event.childNodes[1].innerHTML);
		 
	 }
	 
	 

    	
    </script>
    

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/adminResources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/adminResources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/adminResources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/adminResources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/adminResources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/adminResources/js/demo/datatables-demo.js"></script>

</body>

</html>
