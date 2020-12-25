'use strict'

//리워드 제공 가능수 옵션 클릭했을때 수량을 입력받는 input 보여줄지 말지.
$("#reward_condition1").click(function () {
    $("#rewardAmount").css('display', 'none');
})
$("#reward_condition2").click(function () {
    $("#rewardAmount").css('display', 'flex');
})

//리워드 옵션 선택자  20201211 여기부터 진행 해야함.
$("#rewardInputBtn").click(function () {

    let optionValues = $("#reward-options").val();
    let createLi = document.createElement('li');
    let createInput = document.createElement('input')
    createInput.setAttribute('type', 'hidden')
    createInput.setAttribute('name', 'tempName');
    createLi.setAttribute('onclick', 'deleteList(this)');

    if (optionValues.trim().length != 0) { //뭔가가 입력 된 경우

        if ($("#reward_list > li").length > 5) {//li 가 5보다 크면 넣을수 없음 0 1 2 3 4 까지 실행.
            alert("최대 6개의 옵션만 추가가 가능합니다");
        } else {
            createLi.innerHTML = optionValues;
            createInput.setAttribute("value", optionValues);
            $("#reward_list").append(createLi); //리스트에 추가됨.
            $("#reward-options").val('');
        }
    } else {
        alert("입력값이 없습니다.")
    }
});

function deleteList(event) {
    let rewardOption = event.innerHTML;

    //이거 input none=options 요소도 나중에 반드시 삭제하는 로직 만들어야함
    if (confirm(rewardOption + "항목을 삭제 하시겠습니까?")) {
        event.remove();
    }

}

$("#insertRewardBtn").click(function () {

    const rewardPrice_check = $("#rewardPrice").val().trim().length == 0; //리워드 금액 null 아님 뭐라도 적으면 true;
    const rewardCondition = $("input[name='options']:checked").val(); //리워드 제공옵션(제공가능 . 제한) 가져옴.
    const addrCheck = $("input[name='addrCheck']:checked").val(); //Y 필요 N 불필요.
    const rewardCount = $("#rewardCount").val().trim().length == 0;
    const rewardList = $("#reward_list > li");
    const displayResult = $("#reward_result_display");
    let rewardResult = "";

    let rewardArrCheck = $(".rewardArrCehck");

    if (rewardArrCheck.length == 0) {
        rewardArrCheck = 0;
    } else {
        rewardArrCheck = parseInt($(".rewardArrCehck:last").attr('name').substring($(".rewardArrCehck:last").attr('name').indexOf("[") + 1, $(".rewardArrCehck:last").attr('name').indexOf("[") + 2)) + 1;
    }
    let optionArrCheck = $(".optionArrCheck");

    if (optionArrCheck.length == 0) {
        optionArrCheck = 0;
    } else {
        optionArrCheck = parseInt($(".optionArrCheck:last").attr('name').substring($(".optionArrCheck").attr('name').indexOf("[") + 1, $(".optionArrCheck").attr('name').indexOf("[") + 2)) + 1;
    }


    // Y 로 넘어오면 제한 없음
    // N 로 넘어오면 input 받아야함.


    if (!rewardPrice_check && rewardCondition != null && addrCheck != null) { //전부 입력이 되었을경우

        //입력 되었지만 리워드 제공수
        if (rewardCondition == 'N') { //무제한 이면서 빈칸이 모두 채워진 케이스

            rewardResult += `<div class="rewardContaioner">
                                    <div class="rewardTitleWrapper">
                                    <div class="reward-font">${$("#rewardPrice").val()}원 리워드</div> 
                                    <div class="reward-font">제공수:무제한</div>
                                </div>
                                <ul class="rewardOptionLists">       
                                `
            if (rewardList.length == 0) {
                rewardResult += `<li>옵션이 없는 리워드 입니다.</li>`
            } else {

                for (let j = 0; j < rewardList.length; j++) {

                    rewardResult += `<li>${rewardList[j].innerHTML}</li>`
                }
            }
            rewardResult += `
                                </ul>
                                <div class="rewardTitleWrapper">
                                <div class="reward-font">배송지 필요여부 : '${addrCheck}'</div>
                                <i class="fas fa-trash-alt deleteReward" onclick=removeReward(this)></i>
                                <div style="display:none">${$("#rewardPrice").val()}원</div>
                                </div>
                                <input type="hidden" class="rewardArrCehck" name="rewardList[${(rewardArrCheck)}].rewardPrice" value="${$("#rewardPrice").val()}">                   
                                <input type="hidden" name="rewardList[${rewardArrCheck}].rewardAmount" value="${rewardList.length}">
                                <input type="hidden" name="rewardList[${rewardArrCheck}].rewardStatus" value="${rewardCondition}">        
                                    <input type="hidden" name="rewardList[${rewardArrCheck}].rewardShCheck" value="${addrCheck}">`
            for (let i = 0; i < rewardList.length; i++) {
                rewardResult += `<input type="hidden" class="optionArrCheck" name="optionList[${optionArrCheck + i}].rewardContent" value="${rewardList[i].innerHTML}">`
            }


            rewardResult += `
                                    </div>
                                    `
            $("#rewardemptyMessage").css('display', 'none');
            //입력값을 초기화.
            clearValues();
            //입력값 있는지 없는지 확인.
            displayResult.append(rewardResult);
            completeCheck();

        } else { //유제한

            if (rewardCount) { //유제한 빈칸 입력 안됨.
                $("#rewardCount").focus();
                alert("리워드 제공 수를 입력해주세요!");
            } else {//유제한 이면서 빈칸이 모두 채워진 케이스

                rewardResult += `<div class="rewardContaioner">
                                        <div class="rewardTitleWrapper">
                                        <div class="reward-font">${$("#rewardPrice").val()}원 리워드</div> 
                                        <div class="reward-font">제공수:${$("#rewardCount").val()}</div>
                                        </div>
                                    <ul class="rewardOptionLists">       
                                    `
                if (rewardList.length == 0) {
                    rewardResult += `<li>옵션이 없는 리워드 입니다.</li>`
                } else {

                    for (let j = 0; j < rewardList.length; j++) {

                        rewardResult += `<li>${rewardList[j].innerHTML}</li>`
                    }
                }
                rewardResult += `
                                </ul>
                                <div class="rewardTitleWrapper">
                                <div class="reward-font">배송지 필요여부 : '${addrCheck}'</div>
                                <i class="fas fa-trash-alt deleteReward" onclick=removeReward(this)></i>
                                <div style="display:none">${$("#rewardPrice").val()}원</div>
                                </div>
                                <input type="hidden" class="rewardArrCehck" name="rewardList[${rewardArrCheck}].rewardPrice" value="${$("#rewardPrice").val()}">
                                <input type="hidden" name="rewardList[${rewardArrCheck}].rewardNumber" value="${$("#rewardCount").val()}">
                                <input type="hidden" name="rewardList[${rewardArrCheck}].rewardAmount" value="${rewardList.length}">
                                <input type="hidden" name="rewardList[${rewardArrCheck}].rewardStatus" value="${rewardCondition}">                
                                <input type="hidden" name="rewardList[${rewardArrCheck}].rewardShCheck" value="${addrCheck}">
                                `
                for (let i = 0; i < rewardList.length; i++) {
                    rewardResult += `<input type="hidden" class="optionArrCheck" name="optionList[${optionArrCheck + i}].rewardContent" value="${rewardList[i].innerHTML}">`
                }

                rewardResult += `
                                </div>
                                `
                $("#rewardemptyMessage").css('display', 'none');
                //입력갑 초기화 하는 함수
                clearValues();
                //입력값 있는지 없는지 확인
                displayResult.append(rewardResult);
                completeCheck();

            }
        }

    } else {
        alert("필수항목을 모두 입력해주세요!")
    }

})
//버튼 클릭후 입력 칸 비워줌.
function clearValues() {

    $("#rewardPrice").val('');
    $("#rewardCount").val('');
    $("#reward-options").val('');
    $("#reward_list > li").remove();

}

function removeReward(event) {

    if (confirm(event.nextElementSibling.innerHTML + " 리워드를 삭제 하시겠습니까?")) {
        event.parentNode.parentNode.remove();

        if ($("#reward_result_display > div").length == 2) {
            $("#rewardemptyMessage").css('display', 'block');

            completeCheck();
        }
    }

}
//작업 완료도를 체크할 수 있음.
function completeCheck() {

    if ($("#reward_result_display > div").length > 0) {

        $("#second_bar").css('background-color', '#8c2a2a');
        $("#second_bar").css('color', '#ffffffff');
        $("#second_bar").text('리워드  (작성완료)');


    } else {

        $("#second_bar").css('background-color', ' #c6a36e');
        $("#second_bar").css('color', '#ffffffff');
        $("#second_bar").text('리워드  (미완료)');

    }

}
