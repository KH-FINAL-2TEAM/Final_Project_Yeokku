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
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <br><br><br><br><br>
                            <h1> 회원가입</h1>
                            <p>Let’s start your journey with us, your dream will come true</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!-- booking part start-->
    <section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                    <form action="#" method="POST">
                                        <table class="regi_tool">
                                            <tr>
                                                <th>아이디</th>
                                                <td><input type="text" name="user_id"  required="required" class="intext" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"></td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호</th>
                                                <td><input type="text" name="user_pw"  required="required" class="intext" placeholder="비밀번호를 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호확인</th>
                                                <td><input type="text" name="user_pw"  required="required" class="intext" placeholder="비밀번호를 다시 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>이름</th>
                                                <td><input type="text" name="user_name"  required="required" class="intext" placeholder="이름을 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>이메일</th>
                                                <td><input type="text" name="user_email"  required="required" class="intext" placeholder="이메일을 입력해주세요">
                                                    <input type="button" value="메일인증" class="finalbox">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>닉네임</th>
                                                <td><input type="text" name="user_nickname"  required="required" class="intext" placeholder="닉네임을 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>주소</th>
                                                <td><input type="button" value="&#xf002; 주소찾기" class="finalbox2"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;"><input type="submit" class="finalsub" value="가입하기"></td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Header part end-->



    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    
</body>
</html>