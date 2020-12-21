<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.2.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/enrollForm.css" />
</head>
<body>
    <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                
                <h5 class="card-title text-center">�ݹ泡���� ȸ������.</h5>
                <hr class="my-4">
                
                    <div class="join_inner_float">
                        <div class="input_line">
                            <h3 class="join_minisub">�������</h3>
                        </div>


                            <div class="check_line check_all">
                                <!-- onclick�� �̺�Ʈ �ڵ鷯�̹Ƿ� javascript_:�� �ʿ���� -->
                                <input name="chkAll" type="checkbox" id="allCheck" class="fakebox" />
                                <!-- label�� for�� id�� 1:1 ��Ī -->
                                <label for="allCheck" class="">��ü����</label>
                            </div>

                            <div class="check_line">
                                <!-- ��ü���Ǹ� ������ üũ�ڽ��� check��� Ŭ������ �߰� -->
                                <input type="checkbox" name="check_01" id="check_01" class="fakebox check">
                                <label for="check_01" class="labelbox">
                                    ȸ�� �̿� ��� (�ʼ�)
                                    
                                </label>
                            </div>

                            <div class="check_line">
                                <input type="checkbox" id="check_02" class="fakebox check">
                                <label for="check_02" class="labelbox">
                                    �������� ó����ħ (�ʼ�)
                                    
                                </label>
                            </div>
                            
                            <div class="check_line">
                                <input type="checkbox" id="check_03" class="fakebox check">
                                <label for="check_03" class="labelbox">
                                    �������� ���� �� �̿� (�ʼ�) 
                                </label>
                            </div>

                    </div>

    
                  <hr class="my-4">
                    <p>�޴��� ������ ���� ������ �ּ���.</p>
                <form class="form-signin" >
                    <table>
                        <tr>
                            <td>
                                �޴�����ȣ �Է�
                            </td>
                        </tr>
                    
                        <tr>

                            <td>
                                <input type="text" class="form-control form-phone ">
                            </td>
                            <td>
                                <button type="button" class="form-control btn-request">������ȣ ��û</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ������ȣ �Է�
                            </td>
                        </tr>
                        <tr>

                            <td colspan="2">
                                <input type="text" class="form-control form-phone">
                            </td>
                            
                        </tr>
                    </table>
                    <br>
                    <button class="btn btn-lg btn-login btn-block text-uppercase" type="submit">����</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <script type="text/javascript">
        $(document).on("click", "#allCheck", function(e) {
            // ���� ��ü üũ�ڽ��� üũ�� �Ǹ�
            if ($(this).is(":checked")) {
                // ��� üũ�ڽ��� üũ
                $(":checkbox.check").prop("checked", true);
            } else {
                // �ƴϸ� ��� üũ�ڽ��� ����
                $(":checkbox.check").removeAttr("checked");
            }
        });
    
        $(document).on("click", ":checkbox.check", function(e) {
            var length = $(":checkbox.check").length;
            var checkLen = $(":checkbox.check:checked").length;
            // ���� ��� üũ�ڽ��� üũ�� ������ ��
            if (length == checkLen) {
                // ��ü���Ǹ� üũ���ش�
                $(":checkbox#allCheck").prop("checked", true);
            } else {
                // ���� �ϳ��� ������ �Ǿ��ٸ�? ��ü���� üũ ����
                $("#allCheck").removeAttr("checked");
            }
        });
        </script>
</body>
</html>