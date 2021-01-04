'use strict'

$(function () {

    let today = new Date();

    let year = today.getFullYear();
    let month = today.getMonth() + 1;
    let date = today.getDate()

    if (month < 10) {
        month = "0" + (today.getMonth() + 1);
    }
    if (date < 10) {
        date = "0" + today.getDate();
    }

    $(".form-control.date.start").attr('min', `${year}-${month}-${date}`);


    let after3days = new Date();

    let after3daysYear = after3days.getFullYear();
    let after3daysMonth = after3days.getMonth() + 1;
    let after3daysDate = after3days.getDate() + 3;

    if (after3daysMonth < 10) {
        after3daysMonth = "0" + (after3days.getMonth() + 1);
    }
    if (after3daysDate < 10) {
        after3daysDate = "0" + (after3days.getDate() + 3);
    }

    $(".form-control.date.end").attr('min', `${after3daysYear}-${after3daysMonth}-${after3daysDate}`);


})

//input letter counters
$(".form-control.pro_title").on('focus keyup change,', function () { $(".lettercounter.lc").text($(this).val().length + "/50"); })
$(".form-control.pro_title1").on('focus keyup change,', function () { $(".lettercounter.lc1").text($(this).val().length + "/200"); })
$("#creater-intro").on('focus keyup change,', function () { $(".lettercounter.lc2").text($(this).val().length + "/200"); })


$(".form-control.date.start").on('change input paste focus', startCal)
function startCal() {

    $(".startdate").text("프로젝트 시작일 : " + $(".form-control.date.start").val());

    if (!$("input[name='projectEndDate']").val() == false) {
        calculateDday($(".form-control.date.start").val(), $("input[name='projectEndDate']").val());
    }
}
$(".form-control.date.end").on('change input paste focus', endCal)

function endCal() {

    $(".enddate").text("프로젝트 종료일 : " + $("input[name='projectEndDate']").val());
    if (!$(".form-control.date.start") == false) {
        calculateDday($("input[name='projectStartDate']").val(), $("input[name='projectEndDate']").val());
    }
}

function calculateDday(start, end) {
    let startArr = start.split('-');
    let endArr = end.split('-');

    let startDate = new Date(startArr[0], startArr[1], startArr[2]);
    let endDate = new Date(endArr[0], endArr[1], endArr[2])

    let diff = endDate - startDate;
    let day = 1000 * 60 * 60 * 24;

    if ((diff / day) == 0) {
        $("#dateError").text('');
        $("#dateResult").text(`총 1일`);

    } else if ((diff / day) > 0) {
        $("#dateError").text('');
        $("#dateResult").text(`총 ${(diff / day) + 1}일`);
    }

    if ((diff / day) < 0) {
        $("#dateResult").text('');
        $("#dateError").text(`기간 설정이 잘못 되었습니다`);
    }
}