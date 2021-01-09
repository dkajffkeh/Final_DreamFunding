'use strict'

$(".btn-primary.btn4 , #projectInsertBtn").click(function () {

    $("#insertConroller").attr('method', 'post');
    $("#insertConroller").attr('action', "projectRequest.pi.hy?status=R").submit();

})


$("#previewBtn , #projectPreviewBtn").on('click', function () {

    const formData = new FormData(document.getElementById("insertConroller"));
    formData.append("status", "T");
    formData.delete('projectContent');
    formData.delete('projectRefundPolicy');
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



            if (result > 0) {

                $("input[name='actionType']").remove('value');
                $("input[name='actionType']").attr('value', 'Reload');

                const previewfrm = document.getElementById("insertConroller");
                window.open("", "preview");
                previewfrm.method = "post";
                previewfrm.target = "preview";
                previewfrm.action = "gotoPreview"
                previewfrm.submit();

            }
        }
    })



})
