<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link
        href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Source+Sans+Pro:wght@200&display=swap"
        rel="stylesheet">   
    <script src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js?ver=1"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
        integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/projectInsertForm/projectInsertForm.css?ver=1"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 
    <title>Document</title>
</head>

<body>
 
   <jsp:include page="../common/menubar.jsp"/>
 
    <div id="firstlayer_outer">
        <a id="totheTop"></a>
        <form id="insertConroller" enctype="multipart/form-data">

            <div id="button_wrapper">
                <button class="btn btn-primary btn1" type="button" id="previewBtn"><i class="fas fa-file-alt"></i>&nbsp;&nbsp;미리보기</button>
                <button class="btn btn-primary btn2" type="button"><i class="far fa-save"></i>&nbsp;&nbsp;임시저장</button>
                <button class="btn btn-primary btn3" type="button" data-toggle="modal" data-target=".bd-example-modal-lg"><i
                        class="fas fa-upload"></i>&nbsp;&nbsp;불러오기</button>
                <button class="btn btn-primary btn4" type="button"><i
                        class="fas fa-handshake"></i>&nbsp;&nbsp;승인요청하기</button>
            </div>

            <div id="secondlayer_outer">

                <div class="bar upper handler1" id="first_bar">스토리&nbsp;&nbsp;(미완료)</div>
                <div id="story_wrapper" style="display: block;">
                    <div class="title_area">
                        <div class="title-font">스토리</div>
                        <div class="subtitle-font">주요 정보가 담길 멋진 스토리를 담아주세요!</div>
                        <hr class="title_divider">
                    </div>

                    <div class="article_wrapper">
                        <div class="leftarticle_wrapper">
                            <table>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*프로젝트 성공 조건</div>
                                        <div class="input_explanation">
                                            프로젝트 성공 조건을 <br> 선택해 주십시오. <br>
                                        </div>
                                    </td>
                                    <td class="userInputarea">

                                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                            <label class="btn btn-secondary active">
                                                <input type="radio" name="projectGoal" value="Y" id="pro_condition1" checked> 100%
                                                이상
                                            </label>
                                            <label class="btn btn-secondary">
                                                <input type="radio" name="projectGoal" value="N" id="pro_condition2"> 조건 없음
                                            </label>
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*카테고리</div>
                                        <div class="input_explanation">
                                            프로젝트 카테고리를
                                            넣어주세요<br></div>
                                    </td>
                                    <td class="userInputarea">
                                        <div class="form-group">
                                            <select class="form-control" name="proCategoryNo" id="exampleFormControlSelect1" name="projectCategoryName">
                                            <c:forEach var="i" items="${ cList }" varStatus="increase">
                                                <option value="${ increase.count*10 }">${ i.projectCategoryName }</option>     
                                            </c:forEach>    
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*프로젝트 제목</div>
                                        <div class="input_explanation">
                                            자신의 프로젝트를 대변하는<br>
                                            멋진 제목을 작성해 주세요!

                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <input type="text" class="form-control pro_title" placeholder="50자 이내로 작성해 주세요" name="projectTitle"
                                            maxlength="49" style="width:650px;">
                                        <div class="lettercounter lc">0/50</div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*프로젝트 짧은 제목</div>
                                        <div class="input_explanation">검색에 더 많이 노출될 수 있도록<br>
                                            부제목을 넣어주세요!</div>
                                    </td>
                                    <td class="userInputarea">
                                        <input type="text" class="form-control pro_title1" placeholder="200자 이내로 작성해 주세요" name="projectSubtitle"
                                            maxlength="199" style="width:650px;">
                                        <div class="lettercounter lc1">0/200</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*목표 금액</div>
                                        <div class="input_explanation">
                                            마감일 자정 기준 목표금액<br>
                                            미달성시 프로젝트가 자동 <br> 취소됩니다.(최소금액 10만원)
                                        </div>
                                    </td>
                                    <td class="userInputarea"><input type="number" name="projectGoalPrice"
                                            class="form-control pri_amount" placeholder="100,000"></td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*프로젝트 고유주소</div>
                                        <div class="input_explanation">내 프로젝트 주소를 넣어주세요!</div>
                                    </td>
                                    <td class="userInputarea">
                                    	<div  style="display: flex;
                                                                 align-items: center;
                                                                 font-size: 1.2rem;
                                                                 ">
                                          <div>http://localhost:8888/dreamfunding?proUrl=</div>
                                        <input type="text" style="width:200px" class="form-control" 
                                            placeholder="dreamfunding" name="projectURL">
                                          </div>  
                                          <div id="urlCheck"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*진행 기간</div>
                                        <div class="input_explanation">
                                            마감일은 시작일 보다 이전 날짜를<br>
                                            고를수 없으며 100일이상일 경우<br>
                                            프로젝트 등록 반려 사유가 될 수 <br> 있습니다.


                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <div style="border:1px solid lightgray;
                                                padding: 0px 20px 20px 20px;">
                                            <div id="calenderbox" style="margin-top: 20px;">
                                                <input type="date" class="form-control date start" name="projectStartDate">
                                                <div style="line-height: 40px;
                                                font-size: 1.2rem;
                                                margin-right: 10px;
                                                margin-left: 10px;">~</div>
                                                <input type="date" class="form-control date end" name="projectEndDate">
                                            </div>
                                            <div class="datedisplay" style="display: flex;">
                                                <div class="startdate" style="width:280px;
                                                                      font-size: 1.2rem;"></div>
                                                <div class="enddate" style="font-size: 1.2rem; margin-left:65px"></div>
                                            </div>
                                            <div class="totaldate" align="center" style="font-size: 1.5rem;
                                                           margin-top: 10px;">프로젝트 기간</div>
                                            <hr>
                                            <div align="center" id="dateResult" style="font-size: 2rem;
                                                               color:orange">총 0일</div>
                                            <div align="center" id="dateError"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*대표이미지</div>
                                        <div class="input_explanation">
                                            프로젝트 개성과 성격이 한눈에<br>
                                            보여질 사진이 좋습니다!
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <input type="file" name="thumbfile" id="thumbnail_uploader"
                                            style="display: none;">
                                        <div class="userInputarea imagesection" style="margin-top: 80px;">
                                            <span style="font-size: 1.1rem;
                                              margin-bottom: 15px;">아래 이미지를 클릭하여 사진을 업로드 해주세요.</span>
                                            <img src="${pageContext.request.contextPath}/resources/images/캡처.JPG" alt="" width="250px"
                                                height="220px" style="border:1px solid  lightgray;
                                             cursor: pointer;" id="thumbnail_img">
                                            <span style="font-size: 1.1 rem;
                                              margin-top: 10px;    
                                              color:gray">용량 : 15MB 이하의 사진만 업로드가 가능합니다.</span>
                                            <br>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*프로필 이미지</div>
                                        <div class="input_explanation">
                                            프로젝트에 보여질 나의 모습을<br>
                                            담아주세요!
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <input type="file" name="profile" id="profile_uploader" style="display: none;">
                                        <div class="userInputarea imagesection" style="margin-top: 20px;">
                                            <span style="font-size: 1.1rem;
                                              margin-bottom: 15px;">아래 이미지를 클릭하여 사진을 업로드 해주세요.</span>
                                            <img src="${pageContext.request.contextPath}/resources/images/Capture.JPG" alt="" width="80px"
                                                height="80px" style="border:1px solid  lightgray;
                                             cursor: pointer;
                                             border-radius: 50%;" id="profile_img">
                                            <span style="font-size: 1.1 rem;
                                              margin-top: 10px;    
                                              color:gray">용량 : 15MB 이하의 사진만 업로드가 가능합니다.</span>
                                            <br>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">창작자 이름</div>
                                        <div class="input_explanation">
                                            창작자 명을 넣어주세요!<br>
                                            입력사항이 없을 시 회원 닉네임이<br>
                                            창작자 명으로 등록됩니다.
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                    <input type="text" style="width:300px" name="creatorName" class="form-control" maxlength="10" value="${ loginMem.memNick }" placeholder="드림펀딩">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*창작자 짧은 소개</div>
                                        <div class="input_explanation">
                                            이용자의 마음을 살수있는 창작자님의 <br>
                                            짧은 소개를 남겨주세요!<br>
                                            (50자 까지 작성이 가능합니다)
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <input type="text" style="width:600px" class="form-control" id="creater-intro" name="creatorIntro"
                                            maxlength="199" placeholder="소개는 200자 이내로 작성해 주세요!">
                                        <div class="lettercounter lc2">0/200</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">해시태그</div>
                                        <div class="input_explanation">
                                            프로젝트가 더 많은 사람에게 노출 되도록<br>
                                            알맞는 해시태그를 달아주세요!<br>
                                            여러개 입력할시 ,(컴마) 로 구분지어 주세요.<br>
                                            컴마를 제외한 특수문자는 입력하실 수<br>
                                            없습니다.
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <span style="display:flex; align-items: center;">
                                            <span style="font-size: 1.4rem; 
                                                 margin-right:5px;
                                                 color: brown;">#</span>
                                            <input type="text" style="width:350px" class="form-control"
                                                id="hasgtagInput" placeholder="파리파게뜨,건강한빵,유기농">
                                            <button type="button" class="btn btn-outline hashtagBtn" style="height:40px"
                                                id="tagInsertBtn">해시태그 입력</button>
                                        </span>
                                        <div id="hashtagDisplayArea" style="display: none;">

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">유튜브 동영상 url</div>
                                        <div class="input_explanation">
                                            내 프로젝트 페인에 보여질<br>
                                            동영상을 올려주세요!<br>
                                            url 영상이 우선 보여지게 됩니다.
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                    <span style="display:flex; align-items: center;">
                                        <input type="text" style="width:450px" id="videourlInput" class="form-control" name="projectVideoURL"
                                            placeholder="https://www.youtube.com/xVV8Da9d0ig">
                                        <button type="button" class="btn btn-outline hashtagBtn" data-toggle="modal" data-target=".bd-example-modal-lggg" style="height:40px; font-weight:bold;"> 영상 입력방법 보기</button>        
                                        <!-- Youtube Description Modal -->                            
                                     </span>       
                                         <div id="videoAnnouncement" style="margin-top:5px">url 이 입력되지 않았습니다.</div>   
                                     <iframe width="560" 
                                     		 height="315"
                                     		 id="videoIframe" 
                                     		 src="https://www.youtube.com/embed/"
                                     		 style="display:none; margin-bottom:80px;" 
                                     		 frameborder="0" 
                                     		 allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                                     		 allowfullscreen></iframe>  
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*스토리</div>
                                        <div class="input_explanation">
                                            프로젝트를 소개할 수 있는 이야기를 <br>
                                            사진과 함께 업로드 해주세요.
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <div style="color: white; font-size: 0.1px; height: 0.1px; width: 0.1px;">　
                                        </div>
                                        <textarea name="projectContent" id="editor1"></textarea>
                                    </td>
                                </tr>

                            </table>
                        </div>

                    </div>
                </div>

                <div class="bar upper handler2" id="second_bar">리워드&nbsp;&nbsp;(미완료)</div>

                <div id="reward_wrapper" style="display:none">
                    <div class="title_area">
                        <div class="title-font">리워드</div>
                        <div class="subtitle-font">스폰서에게 보내질 상품과 수량을 입력해주세요!</div>
                        <hr class="title_divider">
                    </div>
                    <div class="article_wrapper">
                        <div class="leftarticle_wrapper">
                            <table>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">* 리워드 금액 입력</div>
                                        <div class="input_explanation">
                                            리워드 상품에 맞는 금액일 입력해주세요<br>
                                            알맞지 않는 금액 입력시 프로젝트 기각<br>
                                            사유가 될 수 있습니다.
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <input type="number" class="form-control" style="width: 350px;" id="rewardPrice">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">* 리워드 제공 가능 수</div>
                                        <div class="input_explanation">
                                            리워드 제공 수를 입력하여 주세요 <br>
                                            인지도에 따라 제공가능 수를 알맞게<br>
                                            지정 해주세요!
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                            <label class="btn btn-secondary active">
                                                <input type="radio" name="options" value="N" id="reward_condition1"
                                                    checked> 제한 없음
                                            </label>
                                            <label class="btn btn-secondary">
                                                <input type="radio" name="options" value="Y" id="reward_condition2"> 제한
                                            </label>
                                        </div>
                                        <div id="rewardAmount" style="display: none;">
                                            <input type="number" class="form-control" style="width:80px;"
                                                id="rewardCount" step="1000"><span>&nbsp;&nbsp;개</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">리워드 옵션</div>
                                        <div class="input_explanation">
                                            제공가능 품목 스폰서에게 보내질<br>
                                            상품목록을 작성해주세요!
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <div id="reward_product">
                                            <input type="text" class="form-control" id="reward-options"
                                                style="width:300px" placeholder="메디케어 (x4)....">
                                            <button class="btn btn-outline reward_btn" type="button"
                                                id="rewardInputBtn">옵션등록</button>
                                        </div>
                                        <ul id="reward_list" style="margin-bottom: 20px; list-style:disc">

                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">* 배송지 필요 여부</div>
                                        <div class="input_explanation">
                                            리워드 상품이 존재할경우 스폰서에게<br>
                                            배송지 등록이 필요한지 먼저 알려주세요!<br>
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                            <label class="btn btn-secondary active">
                                                <input type="radio" name="addrCheck" value="Y" id="shipping_condition1">
                                                배송지 필요
                                            </label>
                                            <label class="btn btn-secondary">
                                                <input type="radio" name="addrCheck" value="N" id="shipping_condition2">
                                                배송지 필요없음
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">리워드 리스트</div>
                                        <div class="input_explanation">
                                            작성한 리워드 리스트를 확인하세요!<br>
                                            스폰서에게 보여지는 만큼 꼼꼼한 확인<br>
                                            을 부탁드립니다!
                                        </div>
                                    </td>
                                    <td class="userInputarea" id="reward_result_display">
                                        <div style="font-size: 0.1px; height: 0.1px; color:white">　</div>
                                        <div id=rewardemptyMessage>저장된 리워드가 없습니다. 리워드를 추가 해주세요!</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title"></div>
                                        <div class="input_explanation">
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <button class="btn btn-outline reward_save_btn" type="button"
                                            id=insertRewardBtn>리워드 저장</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="bar upper handler3" id="third_bar">안내사항&nbsp;&nbsp;(미완료)</div>

                <div id="notice_wrapper" style="padding-bottom: 30px; display: none;">
                    <div class="title_area">
                        <div class="title-font">안내사항</div>
                        <div class="subtitle-font">환불 규정 및 연락처를 공유해주세요!</div>
                        <hr class="title_divider">
                    </div>
                    <div class="article_wrapper">
                        <div class="leftarticle_wrapper">
                            <table>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*환불 및 교환정책</div>
                                        <div class="input_explanation">
                                            환불및 교환정책을 입력하여주세요<br>
                                            민감한 사안을 좀더 매끄럽게 해결하기 위해<br>
                                            명확한 표현을 이용하여 작성해주세요<br>
                                        </div>
                                    </td>
                                    <td class="userInputarea">
                                        <div style="font-size: 0.1px; height: 0.1px; color:white">　</div>
                                        <textarea name="projectRefundPolicy" class="form-control" id="editor2"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">문의 가능번호</div>
                                        <div class="input_explanation">
                                            이용자에게 노출될 번호를 정해주세요<br>
                                            노출을 원하지 않으실 경우 반드시 채크박에스<br>
                                            클릭을 해주십시오.          
                                        </div>
                                    </td>
                                    <td class="userInputarea" style="display: flex; margin-top: 50px; align-items: center;">
                                        <input type="text" 
                                               class="form-control" 
                                               value="${ loginMem.phone }"
                                               name="creatorPhone"
                                               style="width:300px"
                                               placeholder="010-1111-2222"> 
                                        <input type="checkbox" 
                                               name="phoneCheck"     
                                               id="revealCheck">
                                        <label for="revealCheck" style="font-size: 1.1rem;">번호 공개</label>    
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title">*문의 이메일</div>
                                        <div class="input_explanation">
                                            이용자에게 노출될 이메일을 올려주세요<br>
                                            이메일은 반드시 노출해야 하며 오타가 없는지<br>
                                            꼼꼼해 체크해주세요!
                                        </div>
                                    </td>
                                    <td class="userInputarea">          
                                        <input type="email" 
                                        name="creatorEmail"
                                        class="form-control" 
                                        style="width:300px;"
                                        placeholder="yhy1011@naver.com">       
                                    </td>
                                </tr>
                                <tr>
                                    <td class="explanation_wrapper">
                                        <div class="inputList_title"></div>
                                        <div class="input_explanation">
                                        </div>
                                    </td>
                                    <td class="userInputarea" style="background-color: lightgray; border-radius: 5px; padding: 3px 5px 3px 5px;">
                                        <div>
                                           <span style="font-size: 1.2rem;">모든 프로젝트 공통</span> <br>
                                            - 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다. <br>
                                            - 예상 전달일로부터 15일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를 제외한 후원금을 환불해 드립니다. <br>
                                            (플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 ) <br>
                                            - 선물 전달을 위한 배송지 및 서베이 답변은  2020년 12월 29일 에 일괄 취합할 예정입니다. <br>
                                            - 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다. <br>    
                                        </div>                 
                                    </td>                      
                                </tr>                              
                            </table>
                        </div>
                    </div>
                </div>

                <div class="bar upper handler4" id="forth_bar">제작자/부가정보&nbsp;&nbsp;(미완료)</div>

                <div id="subinfo_wrapper" style="display: none;">
                    <div class="title_area">
                        <div class="title-font">제작자/부가정보</div>
                        <div class="subtitle-font">스폰서에게 보내질 상품과 수량을 입력해주세요!</div>
                        <hr class="title_divider">
                    </div>
                    <div class="article_wrapper">
                        <div class="leftarticle_wrapper">
                            <table>
                                <tr>
                                <td class="explanation_wrapper">
                                    <div class="inputList_title">*거래은행</div>
                                    <div class="input_explanation">
                                        프로젝트 이용자에게 받은 후원금이 전달될<br>
                                        은행을 적어주세요.            
                                    </div>
                                </td>
                                <td class="userInputarea">
                                    <select name="bankNo" class="form-control" style="width:200px">
                                    <c:forEach var="b" items="${ bList }" varStatus="i">
                                    <c:choose>
                                    	 
                                    	<c:when test="${ i.index == 0 }">               	
                                        <option value="${b.bankNo}" selected>${ b.bankName }</option>
                                        </c:when>
                                        
                                        <c:otherwise>           
                                        <option value="${b.bankNo}">${ b.bankName }</option>
                                        </c:otherwise> 
                                        
                                     </c:choose>                
                                    </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="explanation_wrapper">
                                    <div class="inputList_title">*계좌번호</div>
                                    <div class="input_explanation">
                                     은행에 해당하는 계좌번호를 입력해주세요<br>
                                     옳바른 계좌번호인지 반드시 두번 확인<br>
                                     해주세요.
                                    </div>
                                </td>
                                <td class="userInputarea">
                               <input type="text" name="creatorAccount" class="form-control" name="creatorAccount" placeholder="110-296-109579" style="width: 250px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="explanation_wrapper">
                                    <div class="inputList_title">*예금주 명</div>
                                    <div class="input_explanation">
                                    입력하신 계좌번호에 해당하는 예금주 명을 <br>
                                    옳바르게 입력해주세요.
                                    </div>
                                </td>
                                <td class="userInputarea">
                                    <input type="text" name="accountHolder" class="form-control" placeholder="홍길동" style="width:130px" >
                                </td>
                            </tr>
                            <tr>
                                <td class="explanation_wrapper">
                                    <div class="inputList_title">홈페이지와 SNS 주소</div>
                                    <div class="input_explanation">
                                        나의 프로젝트를 홍보할 수 있는 나만의<br>
                                        웹사이트나 SNS 주소를 업로드 해주세요.
                                    </div>
                                </td>
                                <td class="userInputarea">
                                    <div class="snsInput"><i class="fas fa-globe">

                                    </i><input type="text" name="webURL" class="form-control" placeholder="https://www.ups.com/" style="width:450px"></div>
                                    <div class="snsInput"><i class="fab fa-instagram">

                                    </i><input type="text" name="insta" class="form-control" placeholder="https://www.facebook.com/dkajffkeh" style="width:450px"></div>
                                    <div class="snsInput"><i class="fab fa-facebook-square">

                                    </i><input type="text" name="facebook" class="form-control" placeholder="https://www.instagram.com/yoo_patrick/" style="width:450px"></div>
                                </td>
                            </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="remote_fixedwrapper remote1" style="z-index: 10;">

                    <div class="remoteController">
                        <a href="#totheTop" id="topBtn"><i class="fas fa-angle-up"></i></a>
                        <div class="remote_icon">
                            <i class="fas fa-file-alt" id="projectPreviewBtn"></i>
                            <i class="far fa-save" id="projectSaveBtn"></i>
                            <i class="fas fa-upload"  data-toggle="modal" data-target=".bd-example-modal-lg"></i>
                            <i class="fas fa-handshake" id="projectInsertBtn"></i>
                        </div>
                        <div class="remote_btn remobtn1" id="firstbar_remote">스토리</div>
                        <div class="remote_btn remobtn2" id="secondbar_remote">리워드</div>
                        <div class="remote_btn remobtn3" id="thirdbar_remote">안내사항</div>
                        <div class="remote_btn remobtn4" id="forthbar_remote">제작자/부가정보</div>
                    </div>
                </div>
            </div>
    </div>
    <!-- inputtype hidden -->
    <div id="hiddenInputArea" style="display: none;">
        <input tpye="hidden" name="hashtag" id="hashtags">
        <input tpye="hidden" id="hiddenprojectNo" name="projectNo" value="${proSequence}">
        <input tpye="hidden" name="memberNo" value="${ loginMem.memNo }">
        <input tpye="hidden" name="actionType" value="insert">
        
    </div>
    </form>
    </div>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/> 
   

    <!--Modal projectReload-->

    <div class="modal fade bd-example-modal-lg" tabindex="-1" data-toggle="modal1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content" style="padding: 10px 5px 5px 10px;">
          <h1 style="font-size: 2.0rem;">불러오기</h1>
            <table id="modal_table" style="width:775px; margin-top: 15px;">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>프로젝트 상태</th>
                    <th>프로젝트 제목</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${ pList }">
                <tr>
                    <td>${ p.projectNo }</td>
                	<td>${ p.status}</td>                   
                    <td>${ p.projectTitle }</td>
                    <td>${ p.createDate }</td>
                </tr>
             </c:forEach>    
            </tbody>
            </table>
            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 80px; position: relative; left:88%; margin-top: 15px;">Close</button>
        </div>
      </div>
    </div>
    
	    <div class="modal fade bd-example-modal-lggg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content" style="padding: 10px 10px 10px 10px">
	      <span style="font-size:2rem; font-weight:bold ;">&laquo; 유트브 영상 업로드 방법 &raquo; </span>
	      <img src="${pageContext.request.contextPath}/resources/images/youtubeDescription/youtube1.JPG" style="margin-top:30px; margin-bottom:10px">
	      <span style="font-size:1.4rem; font-weight:bold ;">유튜브 영상 아래 공유 버튼을 클릭해주세요.</span>
	      <img src="${pageContext.request.contextPath}/resources/images/youtubeDescription/youtube2.JPG" style="margin-top:30px; margin-bottom:10px">
	      <span style="font-size:1.4rem; font-weight:bold ;">이후 보여지는 주소를 복사하여 저희 웹사이트 입력란에 붙여넣기 해주세요.</span>
	    </div>
	  </div>
	</div>
	

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/saveProject.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/projectReload.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/forwardingController.js?ver=1"></script>
	<script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/loadProject.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/completeCheck.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/calculatorLettersDate.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/handleScroll.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/previewImage.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/hashTagController.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/rewardControll.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/CKEDITOR.js?ver=1"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/projectInsertForm/iframeController.js?ver=1"></script>
    
   

</body>

</html>