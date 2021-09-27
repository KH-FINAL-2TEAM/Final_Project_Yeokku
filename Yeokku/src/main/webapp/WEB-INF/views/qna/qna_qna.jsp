<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>여꾸</title>
    <!-- style CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
    <!-- animate CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css" />">
    
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
    
    <link rel="stylesheet" href="<c:url value="/resources/css/login_Qna.css" />">
    
    <!-- jquery plugins here-->
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>﻿
    
    <!-- contact js -->
    <script src="<c:url value="/resources/css/js/contact.js" />"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('dt').click(function(e) {
                var ddclass = $(this).next().attr('class');
                if(ddclass == 'hidden'){
                    $('dd').addClass('hidden');
                    $(this).next().removeClass('hidden');
                } else {
                    $('dd').addClass('hidden');
                }
                e.preventDefault(); 
            });
		});
    
    </script>
    
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
    <!-- banner part start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>고객센터</h2>
                            <p>home . contact</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- ================ contact section start ================= -->
    <section class="contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-home"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="qna_notice_form.do">공지사항</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="Qnaform.do">자주묻는질문</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="Qaform.do">온라인 문의</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="traffic.do">오시는 길</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8">
                    <h2 class="contact-title">자주 묻는 질문</h2>
                    <dl>
                    	<dt class="qna_dt"><a class="contact_a" href="#">1.로그인이 되지 않아요</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>사용자 ID 또는 비밀번호를 잘못 입력하셨습니다. 라는 문구가 뜨는지 확인해보세요<br>
                                	계속해서 로그인이 되지 않는다면 <a href="idfind.do">아이디찾기</a>|<a href="pwfind.do">비밀번호찾기</a>를 사용해보세요 </span>
                            </div>
                        </dd>
                        <dt class="qna_dt"><a class="contact_a" href="#">2.회원 정보를 수정하고싶어요</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>마이페이지 - 정보수정에서 수정을 진행해보세요.<br>가입하실 당시 이름과 메일주소는 변경이 불가능합니다.</span>
                            </div>
                        </dd>
                        <dt class="qna_dt"><a class="contact_a" href="#">3.회원 탈퇴는 어디서하나요?</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>마이페이지 - 정보수정 - 회원탈퇴란 에서 진행하시면됩니다.<br>다만 회원정보가 삭제되더라도 작성된글은 삭제되지 않으니 주의하세요 </span>
                            </div>
                        </dd>
                        <dt class="qna_dt"><a class="contact_a" href="#">4.탈퇴했는데 게시글을 삭제하고싶어요</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>온라인 문의를 이용해주세요<br>가입하실 당시 이름, 메일주소, 삭제하고 싶은 게시물을 작성해주시면 확인 후 진행해드리도록 하겠습니다. </span>
                            </div>
                        </dd>
                        <dt class="qna_dt"><a class="contact_a" href="#">5.작성중이던 여행코스페이지를 못찾겠어요</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>마이페이지 - 여행코스에서 작성중이신 여행코스 확인해보세요<br>진행중이시던 여행 짜기 계획을 이어나갈수 있습니다.</span>
                            </div>
                        </dd>
                        <dt class="qna_dt"><a class="contact_a" href="#">6.친구와 함께 일정을 짜고싶어요</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>마이페이지 - 여행코스에서 작성중이신 여행코스 정보를 공유해보세요.<br>주소 공유를 통해 가족, 친구, 지인들과 함께 여행 계획을 세울수 있습니다.</span>
                            </div>
                        </dd>
                        <dt class="qna_dt"><a class="contact_a" href="#">7.사이트를 이용중 문제가 발생했어요</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>온라인 문의를 이용해주세요. <a href="Qaform.do">온라인문의</a><br>문의하신 내용을 검토후 메일로 답변해드리도록 하겠습니다.</span>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </section>
    <!-- Header part end-->



    <!-- jquery plugins here-->
    <script src="<c:url value="/resources/js/jquery-1.12.1.min.js" />"></script>
    
    <!-- contact js -->
    <script src="<c:url value="/resources/css/js/contact.js" />"></script>
    
    <!-- footer 추가 -->
	<%@ include file="../footer/footer.jsp" %>
    
</body>
</html>