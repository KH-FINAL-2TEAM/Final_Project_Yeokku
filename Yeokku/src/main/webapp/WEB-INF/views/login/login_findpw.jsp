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
                            <h1>비밀번호찾기</h1>
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
                                                <td colspan="2" style="text-align: center;">
                                                    <span>가입하실때 등록한 메일 주소로 임시비밀번호를 알려드립니다.</span><br>
                                                    <span>비밀번호를 찾으시려는 아이디, 이름, 메일 주소를 입력해주세요.</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>아이디</th>
                                                <td><input type="text" name="user_name"  required="required" class="intext" placeholder="아이디를 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>이름</th>
                                                <td><input type="text" name="user_name"  required="required" class="intext" placeholder="이름을 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>이메일</th>
                                                <td><input type="text" name="user_email"  required="required" class="intext" placeholder="가입하신 이메일을 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;"><input type="submit" class="finalsub" value="발송"></td>
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