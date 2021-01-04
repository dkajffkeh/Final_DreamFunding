'use strict'
/*
window.onbeforeunload = function (e) {

    return "임시저장을 이용하지 않을경우 페이지 이동시 작성하신 정보는 저장되지 않습니다.";
}
*/
$(function () {

    $(".btn-primary.btn4").attr('disabled', true);
    $("#projectInsertBtn").css('display', 'none');

})

$("#story_wrapper input").on('onpaste focus keyup change instanceCreated', storyCompleteCheck);

function storyCompleteCheck() {

    const projectCondition = $("input[name='projectGoal']:checked").val() != "";
    const categoryCheck = $("#exampleFormControlSelect1").val() != "";
    const titleCheck = $("input[name='projectTitle']").val() != "";
    const subTitleCheck = $("input[name='projectSubtitle']").val() != "";
    const projectGoalCheck = $("input[name='projectGoalPrice']").val() > 0;
    const urlCheck = $("input[name='projectURL']").val().length > 5;

    let startArr = $("input[name='projectStartDate']").val().split('-');
    let endArr = $("input[name='projectEndDate']").val().split('-');
    let urlcolorCheck = $("#urlCheck").css('color') == 'rgb(0, 128, 0)';
    let startDate = new Date(startArr[0], startArr[1], startArr[2]);
    let endDate = new Date(endArr[0], endArr[1], endArr[2])

    let diff = endDate - startDate;
    let day = 1000 * 60 * 60 * 24;

    const dateCheck = (diff / day) > 0;
    const thumbnailFile = $("input[name='thumbfile']").val() != "" || $("#thumbnail_img").attr('src') != '/dreamfunding/resources/images/캡처.JPG';
    const profileCheck = $("input[name='profile']").val() != "" || $("#profile_img").attr('src') != '/dreamfunding/resources/images/Capture.JPG';
    const introCheck = $("input[name='creatorIntro']").val() != "";
    const contentCehck = CKEDITOR.instances['editor1'].getData() != "";

    if (projectCondition
        && categoryCheck
        && titleCheck
        && subTitleCheck
        && projectGoalCheck
        && urlCheck
        && urlcolorCheck
        && dateCheck
        && thumbnailFile
        && profileCheck
        && introCheck
        && contentCehck
    ) {

        $("#first_bar").css('background-color', '#8c2a2a');
        $("#first_bar").css('color', '#ffffffff');
        $("#first_bar").text('스토리  (작성완료)');


    } else {

        $("#first_bar").css('background-color', ' #c6a36e');
        $("#first_bar").css('color', '#ffffffff');
        $("#first_bar").text('스토리  (미완료)');

    }

}
$("#notice_wrapper input").on('keyup focus', noticeCompleteCheck);

function noticeCompleteCheck() {

    const policyCehck1 = CKEDITOR.instances['editor2'].getData() != "";
    const phoneCheck = $("input[name='creatorEmail']").val() != "";


    if (policyCehck1 && phoneCheck
    ) {

        $("#third_bar").css('background-color', '#8c2a2a');
        $("#third_bar").css('color', '#ffffffff');
        $("#third_bar").text('안내사항  (작성완료)');

    } else {

        $("#third_bar").css('background-color', ' #c6a36e');
        $("#third_bar").css('color', '#ffffffff');
        $("#third_bar").text('안내사항  (미완료)');

    }
}
$("#subinfo_wrapper input").on('keyup focus', subinfoCompleteCheck);
function subinfoCompleteCheck() {

    const bankCheck = $("input[name='bankNo']").val() != "";
    const bankAccountCheck = $("input[name='creatorAccount']").val() != "";
    const holderCheck = $("input[name='accountHolder']").val() != "";

    if (bankCheck && bankAccountCheck && holderCheck) {

        $("#forth_bar").css('background-color', '#8c2a2a');
        $("#forth_bar").css('color', '#ffffffff');
        $("#forth_bar").text('제작자/부가정보  (작성완료)');

    } else {

        $("#forth_bar").css('background-color', ' #c6a36e');
        $("#forth_bar").css('color', '#ffffffff');
        $("#forth_bar").text('제작자/부가정보   (미완료)');

    }

}
$("input").on('focus keyup change', completeSectionCheck);
function completeSectionCheck() {
    const barColor = $(".bar.upper");
    let result = 0;


    for (let i = 0; i < barColor.length; i++) {

        if (barColor[i].style.backgroundColor == 'rgb(140, 42, 42)') {
            result++;
        }
    }


    if (result == 4) {

        $("#projectInsertBtn").css('display', 'block');
        $(".btn-primary.btn4").attr('disabled', false);
    } else {
        $("#projectInsertBtn").css('display', 'none');
        $(".btn-primary.btn4").attr('disabled', true);

    }

}
//url ajax;
$("input[name='projectURL']").on('keyup focus', urlAjax);
function urlAjax() {

    if ($("input[name='projectURL']").val().length > 5 && $("input[name=actionType]").val() == 'insert') {



        $.ajax({
            url: "projectUrlCheck.pi.hy",
            data: { urlInput: $("input[name='projectURL']").val() },
            success: function (resultNum) {

                $("#urlCheck").css('display', 'block');

                if (resultNum == 0) {

                    $("#urlCheck").css('color', 'green');
                    $("#urlCheck").text('사용가능한url입니다.')
                    storyCompleteCheck();

                } else {

                    $("#urlCheck").css('color', 'red');
                    $("#urlCheck").text('이미 사용중인 url 입니다.')
                    storyCompleteCheck();
                }
            },

        })

    } else if ($("input[name='projectURL']").val().length > 5 && $("input[name=actionType]").val() == 'Reload') {

        $.ajax({
            url: "ReloadProjectUrlCheck.pi.hy",
            data: {
                urlInput: $("input[name='projectURL']").val()
                , pno: $("input[name='projectNo']").val()
            },
            success: function (resultNum) {

                $("#urlCheck").css('display', 'block');

                if (resultNum == 0) {

                    $("#urlCheck").css('color', 'green');
                    $("#urlCheck").text('사용가능한url입니다.')
                    storyCompleteCheck();

                } else {

                    $("#urlCheck").css('color', 'red');
                    $("#urlCheck").text('이미 사용중인 url 입니다.')
                    storyCompleteCheck();
                }
            }
        })
    } else {

        $("#urlCheck").css('display', 'none');

    }

}


