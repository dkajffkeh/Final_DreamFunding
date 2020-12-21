<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form action="" name="orderInsertForm">
        <h3 align="center" style="">프로젝트 후원하기</h3>
        <br><br>
        <h3>리워드</h3>
        <hr>
           <h4> 책 책갈피 세트 ${ p.projectTitle } </h4>
            <ul>
                <li>책 ${ content } </li>
                <li>스페셜 책갈피</li>
            </ul>
            <br> 
            <h4 align="center">가격 : ${ rewardPri }  원</h4>
        <hr>
            <h4> 추가후원금 </h4>
            후원금 : 
            <input type="number" name="supportPrice" onkeyup="verifySum()"> 원
            <br><br>
            <h4 align="center">총합 :  35,000원</h4>
            <input type=hidden name=hiddentotal value=0>
			<input type=hidden name=hiddenpriorradio value=0>
			<input type="number" name="total" readonly>
        
      <script>
      		function verifyTotal(){
      			
      			
      		}
      
      		function verifySum (){
      			
      			

    		}
      		
      		function verifyInput(){
      			
      			verfiy = new verifyTotal();
      			verfiy.rePri = ${ rewardPri };
      			verfiy.subPri = document.orderInsertForm.supportPrice;
      			verfiy.result_id = "";
      			verfiy.total_html = "";
      			
      		}
      		
      		addloadEvent(function(){
      				verfiyInput();
      		})
      		
			function CheckChoice(whichbox) {
				with (whichbox.form) {
					if (whichbox.type == "radio") {
						hiddentotal.value = eval(hiddentotal.value) - eval(hiddenpriorradio.value);
						hiddenpriorradio.value = eval(whichbox.price);
						hiddentotal.value = eval(hiddentotal.value) + eval(whichbox.price);
					}
					else {
						if (whichbox.checked == false) {
							hiddentotal.value = eval(hiddentotal.value) - eval(whichbox.value);
						}
						else {
							hiddentotal.value = eval(hiddentotal.value) + eval(whichbox.value);
						}
					}
					if (hiddentotal.value < 0) {
						InitForm();
					}
					return(formatCurrency(hiddentotal.value));
			   }
			}
			function formatCurrency(num) {
				num = num.toString().replace(/\$|\,/g,'');
					if(isNaN(num)) num = "0";
						cents = Math.floor((num*100+0.5)%100);
						num = Math.floor((num*100+0.5)/100).toString();
					if(cents < 10) cents = "0" + cents;
						for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
							num = num.substring(0,num.length-(4*i+3))+','+num.substring(num.length-(4*i+3));
						return (num + "원");
						}
			
			function InitForm() {
				document.myform.total.value='0원';
				document.myform.hiddentotal.value=0;
				document.myform.hiddenpriorradio.value=0;
			
				for (xx=0; xx < document.myform.elements.length; xx++) {
					if (document.myform.elements[xx].type == 'checkbox' | document.myform.elements[xx].type == 'radio') {
						document.myform.elements[xx].checked = false;
				   }
				}
			}
			</script>
        
            <h3> 배송지 선택  </h3>
            <hr>
            <div id="delivery">
                <input type="radio" id="basicDev" name="basicDev">
                <label for name="basicDev">기본 배송지</label>
                <br>
                <input type="radio" id="newDev" name="newDev">
                <label for name="newDev">새로운 배송지</label>
                <br><br>

                <table id="dev_table" align="center" width="1000">
                    <tr>
                        <td colspan="2">이름</td>
                        <td colspan="2">전화번호</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text" style="width:250px"></td>
                        <td colspan="2"><input type="text" style="width:450px" placeholder="(-)생략 작성"></td>
                    </tr>
                    <tr>
                        <td colspan="4">주소</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width:600px"><input type="text" style="width:550px"></td>
                        <td align="center"><input type="text"></td>
                        <td><button class="btn btn-primary">우편번호 찾기</button></td>
                    </tr>
                    <tr>
                        <td colspan="4">상세주소</td>
                    </tr>
                    <tr>
                        <td colspan="4"><input type="text" style="width:100%"></td>
                    </tr>
                    <tr>
                        <td colspan="4">배송시 전달사항</td>
                    </tr>
                    <tr>
                        <td colspan="4"><input type="text" style="width:100%"></td>
                    </tr>
                    <tr>
                        <td colspan="4">*요청사항은 배송에 관련된 상황만 적어주세요.</td>
                    </tr>
                </table>
                <br><br>
            <h3>결제정보</h3>
            <hr>
            <h4>기본 결제수단</h4>
                <table id="cardSel">
                    <tr>
                        <td><input type="radio" name="paymentSel">&nbsp;&nbsp;</td>
                        <td>
                            <div>
                                <p>기본카드</p>
                                <p> ************1928</p>
                            </div>
                        </td>
                        <td>&nbsp;&nbsp;<input type="radio" name="paymentSel">&nbsp;&nbsp;</td>
                        <td>
                            <div>
                                <p>대비용카드</p>
                                <p> ************1478</p>
                            </div>
                        </td>
                        <td>&nbsp;&nbsp;<input type="radio" name="paymentSel">&nbsp;&nbsp;</td>
                        <td>
                            <div>
                                <p>업무용카드</p>
                                <p> ************1781</p>
                            </div>
                        </td>
                        <td>&nbsp;&nbsp;<input type="radio" name="paymentSel">&nbsp;&nbsp;</td>
                        <td>
                            <div>
                                <p>국민카드</p>
                                <p> ************1928</p>
                            </div>
                        </td>
                    </tr>
                    
                </table>
                <br>
            <input type="radio" name="paymentSel"> 
            <label for ="paymentSel"><h4>새로운 결제수단</h4></label>

            <div id="paymentMain">
                <div id="paymentIns">
                    <table  style="width:90%">
                        <tr>
                            <td colspan="4"><b style="font-size:18px">카드번호</b></td>
                        </tr>
                        <tr>
                            <td><input type="text" style="width:120px"></td>
                            <td><input type="text" style="width:120px"></td>
                            <td><input type="text" style="width:120px"></td>
                            <td><input type="text" style="width:120px"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><b style="font-size:18px">유효기간</b></td>
                            <td colspan="2"><b style="font-size:18px">카드 비밀번호</b></td>
                        </tr>
                        <tr>
                            <td><input type="listbox" style="width:120px"></td>
                            <td><input type="text" placeholder="mm" style="width:130px"></td>
                            <td><input type="text" placeholder="앞 2자리" style="width:130px"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <b style="font-size:18px">생년월일 (주민번호 앞 6자리)</b><br>
                                무기명 법인카드는 사업자등록번호 10자리를 입력하세요                        
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><input type="text" style="width:520px"></td>
                        </tr>
                    </table>
                </div>
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
            <input type="checkbox" name="mainAgree" value="agree">
            <label for ="mainAgree"><b>전체 동의하기</b></label>
            <br>
            <input type="checkbox" name="subAgree1" value="agree">
            <label for ="subAgree">제 3자에 대한 개인정보 제공 동의하기</label>
            <br>
            <input type="checkbox" name="subAgree2" value="agree">
            <label for ="subAgree">책임 규정에 대한 동의하기</label>

            <br><br>
            <div style="text-align:center">
                <input class="btn btn-primary" type="submit" value="결제하기"></input>
                <input class="btn btn-secondary" type="reset" value="취소하기"></input>
            </div>    
        </form>



    </div>


	<jsp:include page="../common/footer.jsp"/>


</body>
</html>