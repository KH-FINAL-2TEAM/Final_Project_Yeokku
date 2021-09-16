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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="resources/css/animate.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="resources/css/header.css">
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
                                            <a class="nav-link" href="main_form.do">홈</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="tripplace_main_form.do">여행지</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="course_list.do">여행코스</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="transportation_form.do">교통</a>
                                        </li>
                                        <c:if test="${user.user_role eq 'ADMIN' }">
	                                        <li class="nav-item">
	                                            <a class="nav-link" href="admin_user.do">관리자</a>
	                                        </li>                                        
                                        </c:if>
                                    </ul>
                                </div>
                               
								<c:choose>
									<c:when test="${empty user }">
		                                <a class="nav-link mypage" href="login_form.do" >로그인</a>
									</c:when>
									<c:otherwise>
		                                <ul class="navbar-nav">
		                                    <li class="nav-item dropdown mypage">
		                                        <a class="nav-link" href="#" id="navbarDropdown"
		                                            role="button" data-toggle="dropdown" aria-haspopup="true"
		                                            aria-expanded="false">
		                                            <div class="profile_img_div">
		                                                <img src="uploadfile/${profile.pf_name}${profile.pf_type}" onerror="this.src='resources/img/none_profile.png'" alt="" class="profile_img">
		                                            </div>
		                                        </a>
		                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
		                                            <a class="dropdown-item" href="mypage_profile_form.do">정보 수정</a>
		                                            <a class="dropdown-item" href="mypage_travel_form.do">여행지</a>
		                                            <a class="dropdown-item" href="mypage_course_form.do">여행코스</a>
		                                            <a class="dropdown-item" href="mypage_review_form.do">리뷰</a>
		                                            <a class="dropdown-item" href="mypage_qna.do">문의</a>
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
									</c:otherwise>
								</c:choose>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header part end-->


    <!-- bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- custom js -->
    <script src="resources/js/header.js"></script>
</body>

</html>