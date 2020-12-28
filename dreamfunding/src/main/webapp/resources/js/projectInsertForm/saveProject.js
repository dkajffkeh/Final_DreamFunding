'use strict'

$(".btn.btn-primary.btn2 , #projectSaveBtn").click(function () {

    const formData = new FormData(document.getElementById("insertConroller"));
    formData.append("status", "T");
    formData.delete('projectContent');
    formData.delete('projectRefundPolicy');
    formData.append('projectContent', CKEDITOR.instances['editor1'].getData());
    formData.append('projectRefundPolicy', CKEDITOR.instances['editor2'].getData())

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    })

    swalWithBootstrapButtons.fire({
        title: '저장 하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '저장',
        cancelButtonText: '취소',
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                url: "projectmiddleSave.pi.hy",
                type: "post",
                data: formData,
                enctype: "multipart/form-data",
                processData: false,
                contentType: false,
                success: function (result) {

                    if (result > 0) {
                        swal("저장 되었습니다", "", "success");
                        $("input[name='actionType']").remove('value');
                        $("input[name='actionType']").attr('value', 'Reload');

                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '저장에 실패 하였습니다'

                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        icon: 'error',
                        title: '저장에 실패 하였습니다'

                    })
                }
            })


        } else if (result.dismiss === Swal.DismissReason.cancel) {

            Swal.fire({
                icon: 'error',
                title: '취소되었습니다'
            })

        }
    })

})

/*
swalWithBootstrapButtons.fire(
                '저장을 완료 하였습니다',
            )
*/