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
          <div class="section-left">
            <div class="community-label">응원 · 의견 · 리뷰</div>
            <div class="content-box">
              <section class="comments_section">
                <form class="add-comment">
                  <textarea
                    placeholder="로그인 사용자만 글 작성이 가능합니다."
                  ></textarea>
                  <div class="comment_options">
                    <button class="btn btn--main submit">작성하기</button>
                  </div>
                </form>

                <ul class="comment_list">
                  <li>
                    <div
                      class="comment_card"
                      id="comment-1"
                      data-depth="0"
                      style="margin-left: 0rem"
                    >
                      <div class="profile_wrapper">
                        <img
                          class="image"
                          src="resources/images/book7.jpg"
                          alt="유저 프로필 이미지"
                        />
                        <div class="profile_caption">
                          <h5 class="name">김이오</h5>
                          <p class="date">2020-12-15</p>
                        </div>
                      </div>
                      <article class="comment_text">
                        드림리뷰오브북스 응원합니다
                      </article>
                      <div class="comment_options">
                        <button
                          data-action="isEditing"
                          class="edit-btn"
                          style="pointer-events: auto; opacity: 1"
                        >
                          Edit
                        </button>
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
                      <div class="comment_edit is_not_active edit-comment">
                        <textarea
                          name="comment_edit"
                          id="comment_edit"
                          class="comment_edit_textarea"
                          cols="0"
                          rows="0"
                          placeholder="드림리뷰오브북스 응원합니다(기존 댓글 출력)"
                        ></textarea>
                        <div class="comment_edit_options">
                          <button data-action="submit">Submit</button>
                          <button data-action="cancle" class="edit-cancel-btn">
                            Cancle
                          </button>
                        </div>
                      </div>

                      <!-- 대댓글작성 -->
                      <div class="comment_edit is_not_active add-rereply">
                        <textarea
                          name="comment_edit"
                          id="comment_edit"
                          class="comment_edit_textarea"
                          cols="0"
                          rows="0"
                          placeholder="답글을 작성하세요."
                        ></textarea>
                        <div class="comment_edit_options">
                          <button data-action="submit">Submit</button>
                          <button
                            data-action="cancle"
                            class="rereply-cancel-btn"
                          >
                            Cancle
                          </button>
                        </div>
                      </div>
                      <div id="rereply-list" class="comments">
                        <ul class="comment_list rereply_list"></ul>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div
                      class="comment_card"
                      id="comment-1"
                      data-depth="0"
                      style="margin-left: 0rem"
                    >
                      <div class="profile_wrapper">
                        <img
                          class="image"
                          src="resources/images/book15.jpg"
                          alt="유저 프로필 이미지"
                        />
                        <div class="profile_caption">
                          <h5 class="name">김이사</h5>
                          <p class="date">2020-12-14</p>
                        </div>
                      </div>
                      <article class="comment_text">
                        프로젝트 기대하고 있습니다!
                      </article>
                      <div class="comment_options">
                        <button
                          data-action="isEditing"
                          class="edit-btn"
                          style="pointer-events: auto; opacity: 1"
                        >
                          Edit
                        </button>
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
                      <div class="comment_edit is_not_active edit-comment">
                        <textarea
                          name="comment_edit"
                          id="comment_edit"
                          class="comment_edit_textarea"
                          cols="0"
                          rows="0"
                          placeholder="프로젝트 기대하고 있습니다!(기존 댓글 출력)"
                        ></textarea>
                        <div class="comment_edit_options">
                          <button data-action="submit">Submit</button>
                          <button data-action="cancle" class="edit-cancel-btn">
                            Cancle
                          </button>
                        </div>
                      </div>

                      <!-- 대댓글작성 -->
                      <div class="comment_edit is_not_active add-rereply">
                        <textarea
                          name="comment_edit"
                          id="comment_edit"
                          class="comment_edit_textarea"
                          cols="0"
                          rows="0"
                          placeholder="답글을 작성하세요."
                        ></textarea>
                        <div class="comment_edit_options">
                          <button data-action="submit">Submit</button>
                          <button
                            data-action="cancle"
                            class="rereply-cancel-btn"
                          >
                            Cancle
                          </button>
                        </div>
                      </div>

                      <div id="rereply-list" class="comments reply_not_active">
                        <ul class="comment_list rereply_list">
                          <li>
                            <div
                              class="comment_card"
                              id="comment-8"
                              data-depth="1"
                              style="margin-left: 4rem"
                            >
                              <div class="profile_wrapper">
                                <img
                                  class="image"
                                  src="resources/images/dream.jpg"
                                  alt=""
                                />
                                <div class="profile_caption">
                                  <h5 class="name">드림리뷰오브북스</h5>
                                  <p class="date">2020-12-14</p>
                                </div>
                              </div>
                              <article class="comment_text">
                                펀딩 응원 감사드립니다😀
                              </article>
                            </div>

                            <div
                              class="comment_card"
                              id="comment-9"
                              data-depth="1"
                              style="margin-left: 4rem"
                            >
                              <div class="profile_wrapper">
                                <img
                                  class="image"
                                  src="resources/images/cat.jpg"
                                  alt=""
                                />
                                <div class="profile_caption">
                                  <h5 class="name">고양이좋아</h5>
                                  <p class="date">2020-12-15</p>
                                </div>
                              </div>
                              <article class="comment_text">
                                펀딩 목표 금액 달성 짱짱!
                              </article>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div
                      class="comment_card"
                      id="comment-1"
                      data-depth="0"
                      style="margin-left: 0rem"
                    >
                      <div class="profile_wrapper">
                        <img
                          class="image"
                          src="resources/images/book13.jpg"
                          alt="유저 프로필 이미지"
                        />
                        <div class="profile_caption">
                          <h5 class="name">김이름</h5>
                          <p class="date">2020-12-13</p>
                        </div>
                      </div>
                      <article class="comment_text">펀딩 완료했어요🖐</article>
                      <div class="comment_options">
                        <button
                          data-action="isEditing"
                          class="edit-btn"
                          style="pointer-events: auto; opacity: 1"
                        >
                          Edit
                        </button>
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
                      <div class="comment_edit is_not_active edit-comment">
                        <textarea
                          name="comment_edit"
                          id="comment_edit"
                          class="comment_edit_textarea"
                          cols="0"
                          rows="0"
                          placeholder="펀딩 완료했어요🖐"
                        ></textarea>
                        <div class="comment_edit_options">
                          <button data-action="submit">Submit</button>
                          <button data-action="cancle" class="edit-cancel-btn">
                            Cancle
                          </button>
                        </div>
                      </div>

                      <!-- 대댓글작성 -->
                      <div class="comment_edit is_not_active add-rereply">
                        <textarea
                          name="comment_edit"
                          id="comment_edit"
                          class="comment_edit_textarea"
                          cols="0"
                          rows="0"
                          placeholder="댓글작성"
                        ></textarea>
                        <div class="comment_edit_options">
                          <button data-action="submit">Submit</button>
                          <button
                            data-action="cancle"
                            class="rereply-cancel-btn"
                          >
                            Cancle
                          </button>
                        </div>
                      </div>

                      <div id="rereply-list" class="comments reply_not_active">
                        <ul class="comment_list rereply_list">
                          <li>
                            <div
                              class="comment_card"
                              id="comment-8"
                              data-depth="1"
                              style="margin-left: 4rem"
                            >
                              <div class="profile_wrapper">
                                <img
                                  class="image"
                                  src="resources/images/dream.jpg"
                                  alt=""
                                />
                                <div class="profile_caption">
                                  <h5 class="name">드림리뷰오브북스</h5>
                                  <p class="date">2020-12-14</p>
                                </div>
                              </div>
                              <article class="comment_text">
                                펀딩 응원 감사드립니다😀
                              </article>
                            </div>
						  </li>
						  <li>	
                            <div
                              class="comment_card"
                              id="comment-9"
                              data-depth="1"
                              style="margin-left: 4rem"
                            >
                              <div class="profile_wrapper">
                                <img
                                  class="image"
                                  src="resources/images/cat.jpg"
                                  alt=""
                                />
                                <div class="profile_caption">
                                  <h5 class="name">고양이좋아</h5>
                                  <p class="date">2020-12-15</p>
                                </div>
                              </div>
                              <article class="comment_text">
                                펀딩 목표 금액 달성 짱짱!
                              </article>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </li>
                </ul>
              </section>
            </div>
          </div>
          
		   <jsp:include page="detailReward.jsp"/>
          
		</div>
      </div>
    </main>
    
    
    <script defer>
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
      // console.log(rereplyList);

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

      editBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
          rereplyInput[i].classList.add("is_not_active");
          editInput[i].classList.toggle("is_not_active");
        });
      });

      editCancelBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
          editInput[i].classList.toggle("is_not_active");
        });
      });

      rereplyBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
          editInput[i].classList.add("is_not_active");
          rereplyInput[i].classList.toggle("is_not_active");
        });
      });

      rereplyCancelBtn.forEach((v, i) => {
        v.addEventListener("click", () => {
          rereplyInput[i].classList.toggle("is_not_active");
        });
      });

      validReply();
    </script>
</body>
</html>