<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
    <!-- animate CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css" />">
    <!-- style CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/header.css" />">
    <!--폰트어썸-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

</head>

<body>
    <!--::header part start::-->
    <header class="main_menu">
            
            <div class="main_menu_iner">
                <div class="container">
                    <div class="row align-items-center ">
                        <div class="col-lg-12">
                            <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                                <a class="navbar-brand" href="index.html"> <img src="<c:url value="/resources/img/logo.png" />" alt="logo"> </a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
    
                                <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                    id="navbarSupportedContent">
                                    <ul class="navbar-nav">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">홈</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">여행지</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">여행코스</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">교통</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">관리자</a>
                                        </li>
                                    </ul>
                                </div>

                                <a class="nav-link mypage" href="#" >로그인</a>
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown mypage">
                                        <a class="nav-link" href="#" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <div class="profile_img_div">
                                                <img src="1.png" alt="" class="profile_img">
                                            </div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="#">정보 수정</a>
                                            <a class="dropdown-item" href="#">여행지</a>
                                            <a class="dropdown-item" href="#">여행코스</a>
                                            <a class="dropdown-item" href="#">리뷰</a>
                                            <a class="dropdown-item" href="#">문의</a>
                                            <a class="dropdown-item" href="#">로그아웃</a>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown alarm">
                                        <a class="nav-link" href="#" id="alarmDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <div class="profile_img_div">
                                                <i class="fas fa-bell fa-3x"></i>
                                            </div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="alarmDropdown">
                                            <ul style="padding: 0;">
                                                <li class="dropdown-item" >알림 내용asfsafasfasdfsadsadasdasdsadfs</li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header part end-->


    <!-- jquery plugins here-->
    <script src="<c:url value="/resources/js/jquery-1.12.1.min.js" />"></script>
    <!-- bootstrap js -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <!-- custom js -->
    <script src="<c:url value="/resources/js/header.js" />"></script>
</body>

</html>