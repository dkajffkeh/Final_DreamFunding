'use strict'

$("#videourlInput").on('click focus keyup onpaste', videoURLCheck);

function videoURLCheck() {

    if ($("#videourlInput").val().length > 5) {

        $("#videoAnnouncement").css('display', 'none');

        $("#videoIframe").remove('src');
        $("#videoIframe").attr('src', "https://www.youtube.com/embed/" + $("#videourlInput").val().substring($("#videourlInput").val().lastIndexOf("/") + 1));
        $("#videoIframe").css('display', 'block');


    } else {
        $("#videoIframe").css('display', 'none');
        $("#videoAnnouncement").css('display', 'block');
    }



}