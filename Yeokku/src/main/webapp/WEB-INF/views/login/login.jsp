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
                            <h1>로그인</h1>
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
                                                <td><input type="text" name="user_id"  required="required" class="intext" placeholder="아이디를 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호</th>
                                                <td><input type="text" name="user_pw"  required="required" class="intext" placeholder="비밀번호를 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="loginmaintain"><input type="checkbox" name="loginCookie"> 로그인 유지 </div>                                                 
                                                    <div class="loginfindbox"><a href="">아이디찾기</a>|<a href="">비밀번호찾기</a></div>
                                                </td>
                                            </tr>                                          
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <input type="submit" class="finalsub" value="로그인"><br>
                                                    <input type="button" class="finalsub2" value="회원가입">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                    <div class="sociallogin">
                                        <ul>
                                            <li><a href="" class="googlesub"><img src="<c:url value="/resources/img/login_google_icon.gif" />" width="37px" height="37px"><span>구글 로그인</span></a></li>
                                            <li><a href="" class="kakaosub"><img src="<c:url value="/resources/img/login_kakao_icon.gif" />" width="37px" height="37px"><span>카카오로그인</span></a></li>
                                        </ul>
                                    </div>
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