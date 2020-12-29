<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body id="page-top">
	<div id="wrapper">

		<jsp:include page="../common/adminSidebar.jsp" />

		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<jsp:include page="../common/adminSearchbar.jsp" />

				<!-- Begin Page Content -->
				<!-- 여기다가 내용 집어넣는거임. -->
				<div class="container-fluid">
				
					
					 <h1 class="h3 mb-2 text-gray-800">신고 상세보기</h1>
                    <p class="mb-4"><a target="_blank"
                            href="https://datatables.net"></a></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">신고 상세보기</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                             
                            </div>
                        </div>
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        
                                            <th style="width:18%">크리에이터명</th>
                                            <th style="width:44%">프로젝트명</th>        
                                            <th style="width:18%">신청한 날짜</th>
                                            <th style="width:18%">프로젝트금액</th>
                                        </tr>
                                    </thead>
                                
                                    <tbody>                           
                                        <tr>	
                                            <td>${ report.memberNo }</td>
                                            <td>${ report.projectNo }</td>
                                            <td>${ report.reportDate }</td>
                                            <td>${ report.reportStatus }</td>
                                        </tr>
                                        <tr>	
                                            <th height="300" style="display:flix; text-align:center; line-height:17rem;" >신고내용</th>
                                            <td colspan="3">${ report.reportContent }</td> 
                                        </tr>
                                        <tr>	
                                            <th colspan="4">
                                            <div style="display:flex; justify-content:center">
                                            <button type="button" class="btn btn-primary" onclick='history.back();'>뒤로가기</button>
                                            <button type="button" class="btn btn-primary" style="margin:0px 6px 0px 6px">해당 프로젝트로 이동</button>
                                            <button type="button" class="btn btn-secondary">블라인드 처리</button>
                                            </div>
                                            </th>                                         
                                        </tr>
                                    </tbody>
                                </table>
                   			 </div>
		
				</div>
			</div>
		</div>
	</div>
</body>

</body>
</html>