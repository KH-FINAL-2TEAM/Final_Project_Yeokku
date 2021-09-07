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
    
<style type="text/css">    
    
	.login_warn{
	    margin-top: 30px;
	    text-align: center;
	    color : red;
	}
 
</style>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script><!-- 카카오 로그인 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".login_warn").hide();
});


//로그인 버튼 클릭 
function loginBtn(){
	var user_id = $("#user_id").val().trim();
	var user_pw = $("#user_pw").val().trim();
	
	var loginVal = {
		"user_id":user_id,
		"user_pw":user_pw
	};
	
	if(user_id == null || user_id=="" || user_pw == null || user_pw == ""){
		alert("아이디와 비밀번호를 확인해주세요.");
	}else{
		
		
		
		$.ajax({
			type:"post",
			url:"login.do",
			data:JSON.stringify(loginVal),
			contentType:"application/json",
			dataType:"json",
			success:function(msg){
				if(msg.check == true){
					//제대로 로그인 성공해서 회원 정보 담김
					location.href="main_form.do";
				}else{
					$(".login_warn").show();
				}
			},
			error:function(){
				alert("통신 실패");
			}
		});
	
	}
	
}






</script>   



    
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
                                    <form action="" method="POST" id="login_form" name="login_frm">
                                        <table class="regi_tool">
                                            <tr>
                                                <th>아이디</th>
                                                <td><input type="text" name="user_id" id="user_id" required="required" class="intext" placeholder="아이디를 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호</th>
                                                <td>
                                                	<input type="text" name="user_pw" id="user_pw" required="required" class="intext" placeholder="비밀번호를 입력해주세요"><br>
                                                	<div class = "login_warn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="loginmaintain"><input type="checkbox" name="loginCookie"> 로그인 유지 </div>                                                 
                                                   
                                                    <div class="loginfindbox"><a href="idfind.do">아이디찾기</a>|<a href="pwfind.do">비밀번호찾기</a></div>
                                                	
                                                </td>
                                            </tr>     
                                                
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <input type="button" class="finalsub" value="로그인" onclick="loginBtn();"><br>
                                                    <input type="button" class="finalsub2" value="회원가입" onclick="location.href='signup.do'">
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