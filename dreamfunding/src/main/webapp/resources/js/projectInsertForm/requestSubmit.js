'user strict'

$(".btn-primary.btn4").click(function () {

    $("#insertConroller").attr('method', 'post');
    $("#insertConroller").attr('action', "projectRequest.pi.hy?status=Y").submit();

})