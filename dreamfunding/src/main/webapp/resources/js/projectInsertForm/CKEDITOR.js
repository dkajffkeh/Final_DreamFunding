'use strict'

CKEDITOR.replace('editor1', {
    filebrowserUploadUrl: "fileupload.bo"
})

CKEDITOR.replace('editor2');


$("#previewBtn").on('click', function () {


    location.href = "aaaabbbb.pi.hy?pno=" + $("input[name='projectNo'").val();

})