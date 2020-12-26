'use strict'

$(".btn-primary.btn4").click(function () {

    $("#insertConroller").attr('method', 'post');
    $("#insertConroller").attr('action', "projectRequest.pi.hy?status=R").submit();

})

$("#previewBtn").on('click', function () {

    const formData = new FormData(document.getElementById("insertConroller"));
    formData.append("status", "T");
    formData.append('projectContent', CKEDITOR.instances['editor1'].getData());
    formData.append('projectRefundPolicy', CKEDITOR.instances['editor2'].getData())


    $.ajax({
        url: "projectmiddleSave.pi.hy",
        type: "post",
        data: formData,
        enctype: "multipart/form-data",
        processData: false,
        contentType: false,
        success: function (result) {




        }
    })



})