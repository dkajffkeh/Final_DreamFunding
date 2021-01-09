'use strict'

$(function () {

    memberReload();

})

function memberReload() {

    $.ajax({
        url: "memberReload",
        success: function (memArr) {

            let str = "";
            console.log(memArr);

            for (let i = 0; i < memArr.length; i++) {

                str += `
                <tr>
                <td>${memArr[i].memNo}</td>
                <td>${memArr[i].memNick}</td>
                <td>${memArr[i].memCreate}</td>
                `
                if (memArr[i].memStatus == '일반') {
                    str += `<td style="font-weight:bold; color:green">${memArr[i].memStatus}</td>`
                } else {
                    str += `<td style="font-weight:bold; color:red">${memArr[i].memStatus}</td>`
                }

                str += `<td>`
                if (memArr[i].memStatus == '일반') {
                    str += `<button class="btn btn-danger"  onclick="blackFun(this)">블랙</button>`
                } else if ((memArr[i].memStatus == '블랙리스트')) {
                    str += `<button class="btn btn-success" onclick="recoverFun(this)">해제</button>`
                }
                str += `</td>                                           
            </tr>
                `

            }

            $("#dataTable > tbody").html(str);

        }


    })

}


function blackFun(event) {
    console.log(event.parentNode.parentNode.childNodes[1].innerHTML);

    if (confirm("계속 진행 하시겠습니까?")) {

        $.ajax({
            url: "userBlack.ub",
            type: "post",
            data: { mno: event.parentNode.parentNode.childNodes[1].innerHTML },
            success: function (num) {

                if (num > 0) {
                    alert("처리 완료되었습니다.");
                    memberReload()
                }

            }

        })

    }
}

function recoverFun(event) {
    console.log(event.parentNode.parentNode.childNodes[1].innerHTML);

    if (confirm("블랙리스트를 해제 하시겠습니까?")) {

        $.ajax({
            url: "userRecover.ur",
            type: "post",
            data: { mno: event.parentNode.parentNode.childNodes[1].innerHTML },
            success: function (num) {

                if (num > 0) {
                    console.log("실행");
                    alert("처리 완료되었습니다.");
                    memberReload();
                }

            }

        })

    }
}




