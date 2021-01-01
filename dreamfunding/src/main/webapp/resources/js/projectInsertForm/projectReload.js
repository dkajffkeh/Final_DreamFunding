'use strict'

$("#modal_table > tbody > tr").click(function () {

    if (confirm($(this).children().eq(2).text() + " 를 불러오시겠습니까?")) {

        const promise = new Promise((resolve, reject) => {

            $.ajax({

                url: "projectReload.pi.hy",
                data: { pno: $(this).children().eq(0).text() },
                success: function (pList) {

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
                    if (pList.projectFileName != null) {
                        $("#thumbnail_img").attr('src', "/dreamfunding/resources/images/projectThumbnail/" + pList.projectFileName);
                    } else {
                        $("#thumbnail_img").attr('src', "/dreamfunding/resources/images/캡처.JPG");
                    }
                    if (pList.creatorProfile != null) {
                        $("#profile_img").attr('src', "/dreamfunding/resources/images/creatorThumbnail/" + pList.creatorProfile);
                    } else {
                        $("#profile_img").attr('src', "/dreamfunding/resources/images/Capture.JPG");
                    }
                    $("inpput[name='creatorName']").val(pList.creatorName);
                    $("input[name='creatorIntro']").val(pList.creatorIntro);
                    $("input[name='hashtag']").val(pList.hashtag);

                    if (pList.hashtag != null) {
                        let hashArr = pList.hashtag.split(' ');
                        let hashresult = "";
                        for (let i = 0; i < hashArr.length; i++) {
                            hashresult += `<div class=hashtag>${hashArr[i]}</div>`;
                        }

                        $("#hashtagDisplayArea").css('display', 'block');
                        $("#hashtagDisplayArea").html(hashresult);
                    }

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

                    $("input[name='projectNo']").remove('value');
                    $("input[name='projectNo']").attr('value', pList.projectNo);

                    $("input[name='actionType']").remove('value');
                    $("input[name='actionType']").attr('value', 'Reload');

                    startCal();
                    endCal();
                    storyCompleteCheck()
                    noticeCompleteCheck()
                    subinfoCompleteCheck()
                    urlAjax();

                    videoURLCheck()
                }

            })

        })
        promise.then((pList) => {
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: "rewardReload.pi.hy",
                    data: { pno: $(this).children().eq(0).text() },
                    success: function (rList) {

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
                    $("#reward_result_display").children().remove();
                    if (oList != 'empty') {
                        let rewardResult = "";
                        let listCount = 0;
                        const displayResult = $("#reward_result_display");

                        //리워드 리스트 만큼 for문 돌아감.
                        for (let i = 0; i < rList.length; i++) {

                            rewardResult += `<div class="rewardContaioner">
                        <div class="rewardTitleWrapper">
                        <div class="reward-font">${rList[i].rewardPrice}원 리워드</div>`

                            if (rList[i].rewardStatus == 'N') {
                                rewardResult += `<div class="reward-font">제공수:무제한</div>
                                            </div>
                                            <ul class="rewardOptionLists">       
                                            `
                            } else {
                                rewardResult += `<div class="reward-font">제공수:${rList[i].rewardNumber}</div>
                                            </div>
                                        <ul class="rewardOptionLists">`
                            }

                            for (let j = 0; j < oList.length; j++) {

                                if (rList[i].rewardNo == oList[j].rewardNo) {

                                    rewardResult += `<li>${oList[j].rewardContent}</li>`
                                    listCount++;

                                }

                            }
                            if (listCount == 0) {
                                rewardResult += `<li>옵션이 없는 리워드 입니다.</li>`
                            }

                            rewardResult += `
                                </ul>
                                <div class="rewardTitleWrapper">
                                <div class="reward-font">배송지 필요여부 : '${rList[i].rewardShCheck}'</div>
                                <i class="fas fa-trash-alt deleteReward" onclick=removeReward(this)></i>
                                <div style="display:none">${rList[i].rewardPrice}원</div>
                                </div>
                                <input type="hidden" class="rewardArrCehck" name="rewardList[${i}].rewardPrice" value="${rList[i].rewardPrice}">
                                <input type="hidden" name="rewardList[${i}].rewardNumber" value=" ${rList[i].rewardNumber}">
                                <input type="hidden" name="rewardList[${i}].rewardAmount" value="${listCount}">
                                <input type="hidden" name="rewardList[${i}].rewardStatus" value="${rList[i].rewardStatus}">                
                                <input type="hidden" name="rewardList[${i}].rewardShCheck" value="${rList[i].rewardShCheck}">
                                `
                            for (let l = 0; l < oList.length; l++) {

                                if (rList[i].rewardNo == oList[l].rewardNo)

                                    rewardResult += `<input type="hidden" class="optionArrCheck" name="optionList[${l}].rewardContent" value="${oList[l].rewardContent}">`

                            }
                            rewardResult += `
                                        </div>
                                        `
                            listCount = 0;
                        }

                        $("#rewardemptyMessage").css('display', 'none');
                        //입력갑 초기화 하는 함수
                        clearValues();
                        //입력값 있는지 없는지 확인
                        displayResult.append(rewardResult);
                        completeCheck();

                        function clearValues() {

                            $("#rewardPrice").val('');
                            $("#rewardCount").val('');
                            $("#reward-options").val('');
                            $("#reward_list > li").remove();

                        }
                    }

                    $("input[name='actionType']").remove('value');
                    $("input[name='actionType']").attr('value', 'Reload');
                    console.log("실행!");

                    completeSectionCheck();

                    swal("불러오기가 완료되었습니다.", "변경사항을 꼼꼼히 체크해주세요", "success");
                }
            })

        })

    }




})
