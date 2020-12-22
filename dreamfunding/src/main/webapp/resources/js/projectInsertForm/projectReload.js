'use strict'
$("#modal_table > tbody > tr").click(function () {

    if (confirm($(this).children().eq(2).text() + " 를 불러오시겠습니까?")) {

        function projectReload() {
            return new Promise(function (resolve, reject) {

                $.ajax({
                    url: "projectReload.pi.hy",
                    data: { pno: $("#modal_table > tbody > tr").children().eq(0).text },
                    success: function (pList) {

                    },
                });

            });
        }

        function rewardReload() {
            return new Promise(function (resolve, reject) {

                $.ajax({
                    url: "rewardReload.pi.hy",
                    data: { pno: $("#modal_table > tbody > tr").children().eq(0).text },
                    success: function (rList) {


                    }

                })

            })

        }







    }


})

