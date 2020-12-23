'use strict'
$("#modal_table > tbody > tr").click(function () {

    if (confirm($(this).children().eq(2).text() + " 를 불러오시겠습니까?")) {

        const promise = new Promise((resolve, reject) => {

            $.ajax({

                url: "projectReload.pi.hy",
                data: { pno: $(this).children().eq(0).text() },
                success: function (pList) {
                    console.log(pList);
                    resolve();
                    //projectGoal 불러오기
                    if (pList.projectGoal == 'Y') {

                        $("input[name='projectGoal']:radio[value='N']").parent().removeClass('active')
                        $("input[name='projectGoal']:radio[value='N']").attr("checked", false);
                        $("input[name='projectGoal']:radio[value='Y']").attr("checked", true);
                        $("input[name='projectGoal']:radio[value='Y']").parent().addClass('active')


                    } else {
                        $("input[name='projectGoal']:radio[value='Y']").parent().removeClass('active')
                        $("input[name='projectGoal']:radio[value='Y']").attr("checked", false);
                        $("input[name='projectGoal']:radio[value='N']").attr("checked", true);
                        $("input[name='projectGoal']:radio[value='N']").parent().addClass('active')
                    }

                    $("#exampleFormControlSelect1").val(pList.proCategoryNo);
                    $("input[name='projectTitle']").val(pList.projectTitle);
                    $("input[name='projectSubtitle']").val(pList.projectSubtitle);
                    $("input[name='projectGoalPrice']").val(pList.projectGoalPrice);
                    $("input[name='projectURL']").val(pList.projectURL);
                    $("input[name='projectStartDate']").val(pList.projectStartDate);
                    $("input[name='projectEndDate']").val(pList.projectEndDate);
                    $("#thumbnail_img").attr('src', "/dreamfunding/resources/images/projectThumbnail/" + pList.projectFileName);
                    $("#profile_img").attr('src', "/dreamfunding/resources/images/creatorThumbnail/" + pList.creatorProfile);
                    $("inpput[name='creatorName']").val(pList.creatorName);
                    $("input[name='creatorIntro']").val(pList.creatorIntro);
                    $("input[name='hashtag']").val(pList.hashtag);

                    let hashArr = pList.hashtag.split(' ');
                    let hashresult = "";
                    for (let i = 0; i < hashArr.length; i++) {
                        hashresult += `<div class=hashtag>${hashArr[i]}</div>`;
                    }
                    $("#hashtagDisplayArea").css('display', 'block');
                    $("#hashtagDisplayArea").html(hashresult);
                    $("input[name='projectVideoURL']").val(pList.projectVideoURL);

                    CKEDITOR.instances.editor1.setData(pList.projectContent);
                    CKEDITOR.instances.editor2.setData(pList.projectRefundPolicy);
                    $("input[name='creatorPhone']").val(pList.creatorPhone);
                    if (pList.phoneCheck == 'Y') {
                        $("input[name='phoneCheck']").attr('checked', true);
                    } else {
                        $("input[name='phoneCheck']").attr('checked', false);
                    }

                    $("input[name='creatorEmail']").val(pList.creatorEmail);
                    $("select[name='bankNo']").val(pList.bankNo);
                    $("input[name='creatorAccount']").val(pList.creatorAccount);
                    $("input[name='accountHolder']").val(pList.accountHolder);

                    $("input[name='webURL']").val(pList.webURL);
                    $("input[name='insta']").val(pList.insta);
                    $("input[name='facebook']").val(pList.facebook);


                }

            })

        })
        promise.then((pList) => {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: "rewardReload.pi.hy",
                    data: { pno: $(this).children().eq(0).text() },
                    success: function (rList) {
                        console.log(rList);
                        resolve(rList);

                    }
                })
            })

        }).then((rList) => {

            const rListNum = new Array();
            for (let i = 0; i < rList.length; i++) {
                rListNum.push(rList[i].rewardNo);
            }


            $.ajax({
                url: "optionReload.pi.hy",
                data: { 'rList': rListNum },
                success: function (oList) {

                    console.log(oList);

                }
            })

        })

    }




})
