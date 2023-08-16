<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>

        <meta name="description" content="운동강사와 회원의 매칭서비스" />
        <meta name="keywords" content="matching service" />
        <meta
            name="viewport"
            content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
        />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <script src="https://kit.fontawesome.com/43c3dfddba.js" crossorigin="anonymous"></script>
        <link href="//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="/resources/css/style_teacher.css" />
        <!-- 부트스트랩 css-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous"
        />
        <link rel="stylesheet" href="../resources/css/style_teacher.css?after" />
    </head>
    <body>

            <%@ include file="../common/header.jsp" %>

            <section>
                <div class="inner">
                    <div class="inner-container">
                        <div class="side-menu">
                            <div class="side-menu-container">
                                <div class="user-logo">
                                    <img
                                        class="user-logo-img"
                                        src="../resources/images/icon/teacher.png"
                                        alt=""
                                    />
                                </div>
                                <!-- onclick 속성 수정 -->
                                <div class="myInformation"><a onclick="showContent('info')">내 정보</a></div>
                                <div class="scrap"><a onclick="showContent('register')">등록 강의 목록</a></div>
                                <div class="checkReservation">
                                    <a onclick="showContent('reservation')">예약 확인</a>
                                </div>
                                <div class="history"><a onclick="showContent('prev')">이전 예약 내역</a></div>
                            </div>
                        </div>

                        <div class="content">
                            <!-- 이전 예약 내역 -->
                            <div class="content-prev-container">
                                <div class="content-prev">
                                    <div class="content-prev-title"><a>하루 10분! 힐링요가</a></div>
                                    <div class="content-prev-info">
                                        <div class="content-prev-date">2023.07.24 (월) ｜ 오후 7:00</div>
                                        <div class="content-prev-member">김건우 회원님 ｜ 010-1234-5678</div>
                                    </div>
                                    <div class="content-prev-review">
                                        <button type="button" class="btn btn-primary">리뷰 확인</button>
                                    </div>
                                </div>
                                
                            </div>

                            <!-- 예약 확인 -->
                            
	                        <div class="content-reservation-container">
	                            
	                           		<div class="content-reservation">
	                                    <div class="content-reservation-title"><a>하루 10분! 힐링요가</a></div>
	                                    <div class="content-reservation-info">
	                                        <div class="content-reservation-date">2023.07.24 (월) ｜ 오후 7:00</div>
	                                        <div class="content-reservation-member">김건우 회원님 ｜ 010-1234-5678</div>
	                                    </div>
	                                    <div class="content-reservation-cancel">
	                                        <button type="button" class="btn btn-primary">예약취소</button>
	                                    </div>
	                                </div>
	
	                         
	                         </div>

                            <!-- 등록강의목록 -->
                            <div class="content-register-container">
                                <ul class="register-list">
                                	<c:forEach items="${registerList }" var="registerVo">
	                                    <li class="register-card">
	                                		<img class="register-img" alt="필라테스" 
	                                		src='<c:url value="/display">
												 	<c:param name="fileName" value="${registerVo.class_attach}"/>
												</c:url>'>
	                                        <div class="register-info-container">
	                                        
	                                            <div class="register-title"><a href="/class/read?class_no=${registerVo.class_no}">${registerVo.class_title}</a></div>
	                                            <div class="register-lecture-info">
	                                                <div class="register-teacher">${registerVo.nickname}</div>
	                                             
	                                                
	                                            </div>
	                                            <div class="register-address">${registerVo.address}</div>
	                                        </div>
	                                    </li>
	                                 </c:forEach>

                                   
                                </ul>
                            </div>

                            <!-- 내 정보 -->
                            <div class="content-info">
								<div class="info-container info-container1">
						            <div class="info-title">개인정보</div>
						            <form method="post">
							            <table class="info-table">
							                <tr>
							                    <th>이름</th>
							                    <td>${memberVO.member_name}</td>
							                </tr>
							                 <tr>
							                    <th>닉네임</th>
							                    <td>${memberVO.nickname}</td>
							                </tr>	
							                 <tr>
							                    <th>구분</th>
							                    <td>강사</td>
							                </tr>		
							            </table>
							        	<div class="btn-container">
							        		
							        	</div>	
							        	<input type="hidden" name="member_no" value="${member_no }">
							        	<input type="hidden" name="teacheryn" value="Y">
							       
						       		</form>
						        </div>
                            
                            	<div class="info-container info-container1">
						            <div class="info-title">휴대전화</div>
						            <form method="post" action="/mypage/phonenumberEdit" onsubmit="return myPhonenumberValidate()">
							            <table class="info-table">
							                <tr>
							                    <th>휴대폰</th>
							                    <td>
							                    	<input type="text" class='phonenumber-input' id="phonenumber" name="phonenumber"  value="${memberVO.phonenumber }" readonly><button id="phonenumber-Check-Btn">본인인증</button>
							                    	<div class="phonenumber-check-box">
														<input class="phonenumber-check-input" disabled="disabled" maxlength="6">
														<button class="phonenumber-check-button">인증확인</button>
														<span id="phonenumber-check-warn"></span>
													</div>
													
							                    </td>
							                </tr>	
							            </table>
							        	<div class="btn-container">
							        		<button id="phoneEdit" type="button" class="btn btn-primary">변경하기</button>
							        		<input id='phonenumberEdit' class="btn btn-primary" type="submit" value="수정" />
	                                        <input id='phonenumberCancle' class="btn btn-primary btnCancle" onclick="location.href='/mypage/teacher?member_no=${member_no}'" type="button" value="취소" />
							        	</div>
							        	<input type="hidden" name="member_no" value="${member_no }">
							        	<input type="hidden" name="teacheryn" value="Y">
							       
						       		</form>
						        </div>
                            
                                <div class="info-container info-container1">
						         	<div class="info-title">이메일</div>
						            <form method="post" action="/mypage/emailEdit" onsubmit="return myEmailValidate()">
							            <table class="info-table">
							                <tr>
							                    <th>이메일</th>
							                    <td>
							                    	<input type="text" class="info-input" id="userEmail" name="email"  value="${memberVO.email }" readonly><button id="mail-Check-Btn">본인인증</button>
							                    	<div class="mail-check-box">
														<input class="mail-check-input" disabled="disabled" maxlength="6">
														<button class="mail-check-button">인증확인</button>
						
													</div>
													<span id="mail-check-warn"></span>
							                    </td>
							                </tr>	
							            </table>
							        	<div class="btn-container">
							        		<button id='btnInfoEdit' type="button" class="btn btn-primary">변경하기</button>
							        		<input id='btnGoEdit' class="btn btn-primary goEdit" type="submit" value="수정" />
	                                        <input id='btnCancle' class="btn btn-primary btnCancle" onclick="location.href='/mypage/teacher?member_no=${member_no}'" type="button" value="취소" />
							        	</div>
							        	<input type="hidden" name="member_no" value="${member_no }">
							            <input type="hidden" name="teacheryn" value="Y">
						       		</form>
						        </div>
						
						        <div class="info-container info-container2">
						            <div class="info-title">비밀번호 변경</div>
						            <form method="post" action="/mypage/passwordEdit" onsubmit="return myPasswordValidate()">
							            <table class="info-table">
							                <tr>
							                    <th>비밀번호 입력</th>
							                    <td><input type="password" id="password" name="member_pw" onkeyup="myPasswordValidate()" readonly><div id="passwordError"></div></td>
							                </tr>
							                <tr>
							                    <th>비밀번호 확인</th>
							                    <td><input type="password" id="passwordCheck" onkeyup="myPasswordValidate()" readonly><div id="passwordCheckError"></div></td>
							                </tr>
							                
							            </table>
							            
							            <div class="btn-container">
							            	<button id='btnPwEdit' type="submit" class="btn btn-primary" >변경하기</button>
							            	<input id='btnGoPwEdit' class="btn btn-primary btnGoEdit" type="submit" onclick="submitForm()" value="수정" />
	                                        <input id='btnPwCancle' class="btn btn-primary btnCancle" onclick="location.href='/mypage/teacher?member_no=${member_no}'" type="button" value="취소" />
							            </div>
							            <input type="hidden" id="member_no" name="member_no" value="${member_no }">	
							            <input type="hidden" name="teacheryn" value="Y">
						            </form>
						            
						        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
			
			
			<!-- 비밀번호 확인 모달창 -->       
		     <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 확인</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form method="post" action="/mypage/passwordCheck">
			          <div class="">
			            <label for="password-input-box" class="col-form-label">비밀번호 입력해주세요.</label>
			            <input type="password" class="form-control" id="password-input-box">
			          </div>		         
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" id="pwCheckBtn" class="btn btn-primary">비밀번호 확인</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 일반 모달창 -->
			<div class="modal" tabindex="-1" id="myModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="myModal-title">제목</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p class="myModal-body-text">내용</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary myModalBtn-secondary" data-bs-dismiss="modal">취소</button>
			      	<button type="button" class="btn btn-primary myModalBtn-primary">확인</button>
			      </div>
			    </div>
			  </div>
			</div>            
            
            
            
            
     
        <!--  
        <footer>
            <div class="inner">
                <div class="footer-container">
                    <div class="footer-box1">
                        <div class="footer-logo"><img src="/resources/images/logo/logo_footer.png" alt="하단로고" /></div>
                        <div class="footer-slogan">
				                            건강한 삶을 위한<br />
				                            새로운 트랜드를 선도하는<br />
				                            당신의 운동 파트너
				                        </div>
                    </div>

                    <div class="footer-box2">
                        <div class="footer-proposal">문의 및 건의 사항 :</div>

                        <div><img src="/resources/images/icon/footer/icon_mail.png" alt="mail" /></div>
                        <div><img src="/resources/images/icon/footer/icon_facebook.png" alt="facebook" /></div>
                        <div><img src="/resources/images/icon/footer/icon_twitter.png" alt="twitter" /></div>
                        <div><img src="/resources/images/icon/footer/icon_instagram.png" alt="instagram" /></div>
                    </div>
                </div>
            </div>
        </footer>
        -->
        
        <%@ include file="../common/footer.jsp" %>
        <script src="../resources/js/mypage_teacher.js?after"></script>
        <!-- 부트스트랩js-->

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
    