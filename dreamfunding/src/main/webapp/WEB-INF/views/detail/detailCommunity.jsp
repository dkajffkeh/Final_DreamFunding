<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dream Funding</title>
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="resources/css/detail/detail.css" />
  </head>

<body>

	<jsp:include page="detailHeader.jsp"/>
 
        <div class="content__wrapper">
          <!-- 커뮤니티 영역(댓글, 대댓글) -->
          <div class="section-left" id="story-section">
            <div class="community-label">응원 · 의견 · 리뷰</div>
            <div class="content-box">
              <section class="comments_section">
                <form class="add-comment">
                  <textarea
                    id="comment-input-area"
                    placeholder="로그인 사용자만 글 작성이 가능합니다."
                  ></textarea>
                   <c:if test="${!empty loginMem }">
	                  <div class="comment_options">
	                    <button class="btn btn--main submit" type="button" onclick="addReply()">작성하기</button>
	                  </div>
                   </c:if>
                   
                  <c:if test="${ empty loginMem }">
	                  <div class="comment_options">
	                    <button class="btn btn--main submit" type="button" onclick="alert('로그인해주세요.')">작성하기</button>
	                  </div>
                   </c:if>
                </form>
                
				<!-- 댓글조회 -->
                <ul class="comment_list">
                <c:forEach var="r" items="${ rl }">           		
                  <li class="citem${r.replyNo}">
                    <div
                      class="comment_card"
                      id="comment-1"
                      data-depth="0"
                      style="margin-left: 0rem"
                    >
                      <div class="profile_wrapper">
        					<c:if test="${ !empty r.memberSystemName }">
                                <img
                                  class="image"
                                  src="resources/images/profile/${r.memberSystemName}"
                                  alt=""
                                />
                              </c:if>  
							<c:if test="${ empty r.memberSystemName }">
                   	    		<span class="material-icons">account_circle</span>
                     		</c:if>
                        <div class="profile_caption">
                          <h5 class="name">${ r.memberNickname }</h5>
                          <p class="date">${ r.replyDate }</p>
                        </div>
                      </div>
                      <article class="comment_text c-content${r.replyNo}">${ r.replyContent }</article>
                      <div class="comment_options">
                        <c:if test="${ r.memberNo eq loginMem.memNo }">
	                        <button
	                          data-action="isEditing"
	                          class="edit-btn"
	                          style="pointer-events: auto; opacity: 1"
	                        >
	                          Edit
	                        </button>
	                        <button
	                          data-action="isDelete"
	                          class="delete-btn"
	                          style="pointer-events: auto; opacity: 1"
	                          onclick="deleteReply(${r.replyNo}, 0)"
	                        >
	                          Delete
	                        </button>
                        </c:if>
	                        <button
	                          class="rereply-btn"
	                          data-action="isCommenting"
	                          style="pointer-events: auto; opacity: 1"
	                        >
	                          Comment
	                        </button>
	                        <button class="comment-open-btn" data-action="show_all">
	                          Comments
	                        </button>
                      </div>
					
                    <!-- 댓글수정 -->
                    <c:if test="${ r.memberNo eq loginMem.memNo }">
	                      <div class="comment_edit is_not_active edit-comment">
	                        <textarea
	                          name="comment_edit"
	                          id="comment_edit"
	                          class="comment_edit_textarea cet${r.replyNo}"
	                          cols="0"
	                          rows="0"    
	                        >${ r.replyContent }</textarea>
	                        <div class="comment_edit_options">
	                          <button type="button" data-action="submit" onclick="updateReply(${r.replyNo}, 0)">Submit</button>
	                          <button type="button" data-action="cancle" class="edit-cancel-btn">
	                            Cancle
	                          </button>
	                        </div>
	                      </div>
                     </c:if>

                      <!-- 대댓글 작성 -->
                      <div class="comment_edit is_not_active add-rereply addr${r.replyNo}">
                        <textarea
                          name="comment_edit"
                          id="recomment_edit${r.replyNo}"
                          class="comment_edit_textarea"
                          cols="0"
                          rows="0"
                          placeholder="댓글작성"
                        ></textarea>
                        <div class="comment_edit_options">
                          <button data-action="submit" onclick="addSubReply(${r.replyNo})">Submit</button>
                          <button
                            data-action="cancle"
                            class="rereply-cancel-btn"
                          >
                            Cancle
                          </button>
                        </div>
                      </div>

					<!-- 대댓글 조회 -->	
                      <div id="rereply-list" class="comments reply_not_active">
                        <ul class="comment_list rereply_list" id="recom-list${r.replyNo}">
                          
                         <c:forEach var="s" items="${ r.subReply }"> 
                          <li class="rcitem${s.subReAnsNo}">
                            <div
                              class="comment_card"
                              id="comment-8"
                              data-depth="1"
                              style="margin-left: 4rem"
                            >
                              <div class="profile_wrapper">
                              
                              <c:if test="${ !empty s.memberSystemName }">
                                <img
                                  class="image"
                                  src="resources/images/profile/${s.memberSystemName}"
                                  alt=""
                                />
                              </c:if>  
							<c:if test="${ empty s.memberSystemName }">
                   	    		<span class="material-icons">account_circle</span>
                     		</c:if>
                                <div class="profile_caption">
                                  <h5 class="name">${ s.memberNickname }</h5>
                                  <p class="date">${ s.subReDate }</p>
                                </div>
                              </div>
                              <article class="comment_text">
                    		   <span class="ces${s.subReAnsNo}">${s.subReContent}</span> 	
                    			<textarea class="cet cetna rcet${s.subReAnsNo}" 
                    			cols="0"
	                          	rows="0"
	                          	name="recomment_edit"
	                          >${s.subReContent}</textarea>
                              </article>

                            <!-- 대댓글 수정 -->
                            <div class="recomment_options reco-opt${s.subReAnsNo}">
		                        <c:if test="${ s.memberNo eq loginMem.memNo }">
			                        <button
			                          data-action="isEditing"
			                          class="reedit-btn"
			                          style="pointer-events: auto; opacity: 1"
			                          onclick="openSubRe(${s.subReAnsNo})"
			                        >
			                          Edit
			                        </button>
			                        <button
			                          data-action="isEditing"
			                          class="resubmit-btn"
			                          style="pointer-events: auto; opacity: 1; display:none"
			                          onclick="updateReply(${s.subReAnsNo}, 1)"
			                        >
			                         Submit
			                        </button>
			                        <button
			                          data-action="isEditing"
			                          class="recancel-btn"
			                          style="pointer-events: auto; opacity: 1; display:none"
			                          onclick="closeSubRe(${s.subReAnsNo})"
			                        >
			                          Cancel
			                        </button>
			                        <button
			                          data-action="isDelete"
			                          class="redelete-btn"
			                          style="pointer-events: auto; opacity: 1"
			                            onclick="deleteReply(${s.subReAnsNo}, 1)"
			                        >
			                          Delete
			                        </button>
		                        </c:if>   
                            </div>                        
						  </li>
						</c:forEach>
                        </ul>
                      </div>
                    </div>
                  </li>
                  </c:forEach>
                </ul>
              </section>
            </div>
          </div>
          
          
            <div class="section-left disable-section" id="policy-section">
            <div class="policy-label">교환 및 환불 정책</div>
            <div class="content-box">
              <div class="detail-policy-label">
                크리에이터 교환 및 환불 정책
              </div>
              <p class="detail-policy">
                ${ d.projectRefundPolicy }
              </p>
              <div class="detail-policy-label">드림펀딩 교환 및 환불 정책</div>
              <p class="detail-policy dream">
                - 펀딩 취소는 프로젝트 종료 전까지만 마이페이지의 펀딩한
                프로젝트에서 할 수 있으며, 드림펀딩의 특성상 프로젝트 종료 이후
                단순 변심에 의한 펀딩 취소가 불가능합니다.<br />
                - 프로젝트 종료 이후의 AS, 교환 및 환불에 관한 문의는 진행자의
                교환 및 환불 정책을 따르거나 진행자의 연락처로 문의해야
                합니다.<br />
              </p>
            </div>
            <div class="content-box report">
              <div class="policy-label report">프로젝트 신고하기</div>
              <div class="detail-policy report-Info">
                해당 프로젝트에 허위사실 및 지적재산권 침해, 기타 드림펀딩의
                정책을 위반하는 내용이 있다면 신고해주세요
              </div>
              <c:choose>
              <c:when test="${ !empty loginMem }">
              <button class="btn btn--main report" onClick="reportModalOpen()">신고하기</button>
              </c:when>
              <c:otherwise>
              <button class="btn btn--main report" onClick="reportModalOpen()" disabled>신고하기</button>
              </c:otherwise>
              </c:choose>	
           	</div>
          </div>
          
		   <jsp:include page="detailReward.jsp"/>
          
		</div>
      </div>
    </main>
    
    
    <script defer>
 
    
    const goPolicy = () => {
	    document
	      .querySelector("#story-section")
	      .classList.add("disable-section");
	    document
	      .querySelector("#policy-section")
	      .classList.remove("disable-section");
	  };
    
    
      let subReNumber = 0;
	  let editIndex = 0; 
    
      const commentBtn = document.querySelectorAll(".comment-open-btn");
      // console.log(commentBtn);
      // 대댓글 리스트 조회 버튼

      const editInput = document.querySelectorAll(".edit-comment");
      // edit 입력
      const editBtn = document.querySelectorAll(".edit-btn");
      // edit 수정 버튼
      const editCancelBtn = document.querySelectorAll(".edit-cancel-btn");
      // edit 취소 버튼

      const rereplyInput = document.querySelectorAll(".add-rereply");
      // 대댓글 입력
      const rereplyBtn = document.querySelectorAll(".rereply-btn");
      // 대댓글 버튼
      const rereplyCancelBtn = document.querySelectorAll(".rereply-cancel-btn");
      // 대댓글 취소 버튼

      const rereplyList = document.querySelectorAll(".rereply_list");

      
    
      
      function validReply() {
        rereplyList.forEach((v, i) => {
          if (v.innerHTML === "") {
            commentBtn[i].innerText = "No Comment!";
          }
        });
      }

      commentBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
          if (v.innerText === "Comments") {
            v.innerText = "Hide Comments";
          } else if (rereplyList[i].innerHTML === "") {
            commentBtn[i].innerText = "No Comment!";
          } else {
            v.innerText = "Comments";
          }
          document
            .querySelectorAll(".comments")
            [i].classList.toggle("reply_active");
        });
      });

      
     // editInput의 타입이 객체 형태로 반환되면 실행 
   	 editBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
	       	  rereplyInput[i].classList.add("is_not_active");
	       	if(editInput[i]){ 
				editIndex = i	       	  
	       		editInput[i].classList.toggle("is_not_active");
	       	}
        });
      });
	 		
      editCancelBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
          editInput[i].classList.toggle("is_not_active");
        });
      });

   	  rereplyBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
        	
        	const cbtn = document.querySelectorAll(".comment-open-btn")[i];
        	
        	 if (cbtn.innerText === "Comments") {
                 cbtn.innerText = "Hide Comments";
               } else if (rereplyList[i].innerHTML === "") {
                 commentBtn[i].innerText = "No Comment!";
               } else {
                 cbtn.innerText = "Comments";
               }
               document
                 .querySelectorAll(".comments")
                 [i].classList.toggle("reply_active");	

	       	if(editInput[i]){ 
	          editInput[i].classList.add("is_not_active");
	        }
	          rereplyInput[i].classList.toggle("is_not_active");
	       	});
	          
      });

      rereplyCancelBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
          rereplyInput[i].classList.toggle("is_not_active");
        });
      });

      validReply();
      
      const openSubRe=(reno)=>{
    	  subReNumber = reno
    	  document.querySelector(".ces"+reno).classList.toggle("cetna");
    	  document.querySelector(".rcet"+reno).classList.toggle("cetna");
    	  document.querySelector(".rcet"+reno).value=document.querySelector(".ces"+reno).innerText
    	  
	      const btnBox = document.querySelector(".reco-opt"+reno);
	      btnBox.querySelector(".recancel-btn").style.display="initial";      
	      btnBox.querySelector(".resubmit-btn").style.display="initial";
	      btnBox.querySelector(".reedit-btn").style.display="none";	            	  	
      }
      
      const closeSubRe=(reno)=>{
    	  subReNumber = reno
    	  document.querySelector(".ces"+reno).classList.toggle("cetna");
    	  document.querySelector(".rcet"+reno).classList.toggle("cetna");
	      const btnBox = document.querySelector(".reco-opt"+reno);
	      btnBox.querySelector(".recancel-btn").style.display="none";
	      btnBox.querySelector(".resubmit-btn").style.display="none";
	      btnBox.querySelector(".reedit-btn").style.display="initial";      
      }
      
 
      // 댓글 등록 
      const addReply =()=>{

    	  location.href="insertReply.de?pno=${d.projectNo}&replyContent="+document.querySelector('#comment-input-area').value
      }
      
      
      
    // 대댓글 
    const createReplyTag=(v)=>{
      console.log(v);
      const loginNo = '${loginMem.memNo}'
      
    const listItem = document.createElement('li');
      listItem.className = 'rcitem'+v.subReAnsNo;
    
    const commentCard = document.createElement('div');
      commentCard.className ='comment_card';
      commentCard.id='comment-8';
      commentCard.style.marginLeft='4rem';
      
       const profileWrapper = document.createElement('div');
          profileWrapper.className = 'profile_wrapper';
          
      
        let profileImg 
        	
        if(v.memberSystemName){
            profileImg = document.createElement('img');
            profileImg.src='resources/images/profile'+v.memberSystemName;
            profileImg.className='image';
        }else{
        	profileImg = document.createElement('span');
        	profileImg.className='material-icons';
        	profileImg.innerText='account_circle';
        }  
        
        const profileCaption = document.createElement('div');
            profileCaption.className = 'profile_caption';
          const profileName = document.createElement('h5');
            profileName.className = 'name';
            profileName.innerText = v.memberNickname;
          const profileDate = document.createElement('p');
            profileDate.className = 'date';
            profileDate.innerText = v.subReDate;

          profileCaption.appendChild(profileName);
          profileCaption.appendChild(profileDate);

          profileWrapper.appendChild(profileImg);
          profileWrapper.appendChild(profileCaption);

      const commentText = document.createElement('article')
        commentText.className = 'comment_text';
        const ces = document.createElement('span');
          ces.className='ces'+v.subReAnsNo;
          ces.innerText=v.subReContent;
        const cet=document.createElement('textArea');
          cet.className="cet cetna rcet"+v.subReAnsNo;
          cet.name='recomment_eddit';
          cet.innnerText=v.subReContent;   
          
          commentText.appendChild(ces);
          commentText.appendChild(cet);
      
      commentCard.appendChild(profileWrapper);      
      commentCard.appendChild(commentText);

      const recoBtnWrapper = document.createElement('div');
        recoBtnWrapper.className='recomment_options reco-opt'+v.subReAnsNo;
        if(v.memberNo === parseInt(loginNo)){
          const reEditBtn = document.createElement('button');
            reEditBtn.className='reedit-btn';
            reEditBtn.style.pointerEvents='auto';
            reEditBtn.style.opacity='1';
            reEditBtn.onclick=function(){openSubRe(v.subReAnsNo)};
            reEditBtn.innerText='Edit';

          const reSubmitBtn = document.createElement('button');
            reSubmitBtn.className='resubmit-btn';
            reSubmitBtn.style.pointerEvents='auto';
            reSubmitBtn.style.opacity='1';
            reSubmitBtn.style.display='none';
            reSubmitBtn.onclick=function(){updateReply(v.subReAnsNo, 1)};
            reSubmitBtn.innerText='Submit';  
          
          const reCancelBtn = document.createElement('button');
            reCancelBtn.className='recancel-btn';
            reCancelBtn.style.pointerEvents='auto';
            reCancelBtn.style.opacity='1';
            reCancelBtn.style.display='none';
            reCancelBtn.onclick=function(){closeSubRe(v.subReAnsNo)};
            reCancelBtn.innerText='Cancel'; 

          const reDeleteBtn = document.createElement('button');
            reDeleteBtn.className='redelete-btn';
            reDeleteBtn.style.pointerEvents='auto';
            reDeleteBtn.style.opacity='1';
            reDeleteBtn.onclick=function(){deleteReply(v.subReAnsNo, 1)};
            reDeleteBtn.innerText='Delete';

          recoBtnWrapper.appendChild(reEditBtn); 
          recoBtnWrapper.appendChild(reSubmitBtn);
          recoBtnWrapper.appendChild(reCancelBtn);
          recoBtnWrapper.appendChild(reDeleteBtn); 
        }  


      commentCard.appendChild(recoBtnWrapper);
      listItem.appendChild(commentCard);
      document.querySelector('#recom-list'+v.replyNo).prepend(listItem);

  }
     
      // 대댓글 등록 
      const addSubReply =(rno)=>{
    	  axios.get('insertSubReply.de',{
    		  params:{
	    			  rno:rno,
	    			  replyContent:document.querySelector('#recomment_edit'+rno).value
	    		     }
    	  })
    	  .then((res)=>{
    		  if(res.data){
    			  const data=res.data[0]
    			  createReplyTag(data);
    			  document.querySelector('.addr'+data.replyNo).classList.toggle("is_not_active");
    		  }else{
    			  alert('실패');
    		  }
    	  })
      }
      
      // 댓글 수정 
      const updateReply=(rno, isSub)=>{
    	  if(isSub===0){
    		//  console.log(document.querySelector(".cet"+rno), document.querySelector(".cet"+rno).value)
    		  axios.get('updateReply.de',{
        		  params:{
        			  rno:rno,
        			  replyContent:document.querySelector(".cet"+rno).value
        		  }
        	  }).then(res=>{
        		//  console.log(res.data);
        		  if(res.data==='success'){
        			  document.querySelector(".c-content"+rno).innerText=document.querySelector(".cet"+rno).value
        			  editInput[editIndex].classList.toggle("is_not_active")
        		  }else{
        			  alert('댓글삭제실패');
        		  }
        	  })
          // 대댓글 수정   
	    	  }else if(isSub===1){
	    		//  console.log(document.querySelector(".rcet"+rno))
	    		  axios.get('updateSubReply.de',{
	        		  params:{
	        			  rno:rno,
	        			  subReplyContent:document.querySelector(".rcet"+rno).value
	        		  }
	        	  }).then(res=>{
	        		//  console.log(res.data);
	        		  if(res.data==='success'){
	        			  document.querySelector(".ces"+rno).innerText=document.querySelector(".rcet"+rno).value
	        			  closeSubRe(rno)
	        		  }else{
	        			  alert('댓글삭제실패')
	        		  }
	        	  })
	    	  }
    	  
      }
    	  
      
      // 댓글 삭제
      const deleteReply=(rno, isSub)=>{
    	//  console.log(rno)
    	  if(isSub===0){
    		//  console.log(document.querySelector(".cet"+rno), document.querySelector(".cet"+rno).value)
    		  axios.get('deleteReply.de',{
        		  params:{
        			  rno:rno
        		  }
        	  }).then(res=>{
        		//  console.log(res.data);
        		  if(res.data==='success'){
        			  document.querySelector(".citem"+rno).remove()
        		  }else{
        			  alert('대댓글삭제실패')
        		  }
        	  }) 
          // 대댓글 삭제 
    	  }else if(isSub===1){ 
    		  axios.get('deleteSubReply.de',{
        		  params:{
        			  sno:rno
        		  }
        	  }).then(res=>{
        		  if(res.data==='success'){
        			  document.querySelector(".rcitem"+rno).remove()
        		  }else{
        			  alert('대댓글삭제실패')
        		  }
        	  })
    	  }
    	  
      }
      
      
    </script>
</body>
</html>