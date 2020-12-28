'use strict'

$(".borderLeftRight.funding").click(function () {

    $(".story-content").css('display', 'none');
    $(".hashtag-box").css('display', 'none');
    $(".section-left.belowleft").css('display', 'block');

})

$(".borderLeftRight.story").click(function () {

    $(".story-content").css('display', 'block');
    $(".hashtag-box").css('display', 'block');
    $(".section-left.belowleft").css('display', 'none');

})
$(function () {

    const query = document.getElementsByClassName("reward-option")


    for (let i = 0; i < query.length; i++) {

        if (query[i].innerHTML.trim(' ').length == 0) {
            query[i].innerHTML = "<li>조건 없이 밀어주기만 합니다.</li>"
        }

    }

})
