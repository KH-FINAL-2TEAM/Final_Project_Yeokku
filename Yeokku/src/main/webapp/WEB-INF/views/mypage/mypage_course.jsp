<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="resources/css/mypage.css">
    <title>Document</title>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
	
    <div class="conta">

        <section class="profile_section breadbox_bg breadbox">
            <div class="profile">
                    <div class="profile_div">
                        <div class="profile_img_div">
                            <img src="1.png" alt="" class="profile_img">
                        </div>
                        <p class="profile_name">닉네임</p>
                    </div>
                    <h1>여행코스</h1>
            </div>
        </section>


        <nav class="nav">
            <div class="navbar">
                <ul>
                    <li><a href="mypage_profile.html">회원정보</a></li>
                    <li><a href="mypage_travel.html">여행지</a></li>
                    <li class="selected_nav"><a href="mypage_course.html">여행코스</a></li>
                    <li><a href="mypage_review.html">리뷰</a></li>
                    <li><a href="mypage_qna.html">문의내역</a></li>
                </ul>
            </div>
        </nav>


        <section class="list_nav">
            <div>
                <ul>
                    <li>작성한 여행코스</li>
                    <li>찜한 여행코스</li>
                </ul>
            </div>
        </section>

        <section class="content">
            <div class="row">

                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_1.png" alt="">
                        <h3> <a href="#">제목 </a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_2.png" alt="">
                        <h3> <a href="#"> Guidence</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_3.png" alt="">
                        <h3> <a href="#"> Accomodation fsdasfas dasdsa ds  sfasfas</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>               

                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
            </div>

            
        </section>





    </div>
    
</body>
</html>