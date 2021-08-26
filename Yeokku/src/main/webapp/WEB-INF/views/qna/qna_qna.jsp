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
    		$('dt').click(function() {
                var ddclass = $(this).next().attr('class');
                if(ddclass == 'hidden'){
                    $('dd').addClass('hidden');
                    $(this).next().removeClass('hidden');
                } else {
                    $('dd').addClass('hidden');
                }                
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
                            <a class="contact_a" href="">공지사항</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="">자주묻는질문</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="">온라인 문의</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8">
                    <h2 class="contact-title">자주 묻는 질문</h2>
                    <dl>
                        <dt class="qna_dt"><a class="contact_a" href="#">1.이거 어떻게 하나요?</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>이렇게저렇게 해보세요.</span>
                            </div>
                        </dd>
                        <dt class="qna_dt"><a class="contact_a" href="#">2.탈퇴하고 싶어요</a></dt>
                        <dd class="hidden">
                            <div class="qnadd_box">
                                <span>안돼 돌아가.</span>
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
    
    
    
</body>
</html>