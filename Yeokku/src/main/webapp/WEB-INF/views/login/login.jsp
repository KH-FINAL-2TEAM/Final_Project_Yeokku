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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script><!-- 네이버 로그인 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
Kakao.init('a177aa45bc680af73e036ef7d91922f0'); 

  //카카오 로그인 
  function kakaoLogin() {

    $.ajax({
        url: 'getKakaoAuthUrl.do',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {
	  $(".success_login_total").hide();
	  
	  //로그인 하면 로그인창 안보이도록 
	  if('<c:out value="${user.getUser_name()}"/>' !=""
			  || window.sessionStorage.getItem("kakao_id") !=null 
			  ||window.sessionStorage.getItem("naver_name") !=null){
		  
		  
		$("#login_title").text("WELCOME TO YEOKKU");  
	  	$("#login_form").hide();
	  	$(".sociallogin").hide();
	  	$(".success_login_total").show();
	  	
	  	
	  	var user = '<c:out value="${user.getUser_name()}"/>';
	  	var kakaouser = window.sessionStorage.getItem("kakao_name"); 
	  	var naveruser = window.sessionStorage.getItem("naver_name"); 
	  	
	  	
	  
	  	if(kakaouser!=null){
		  	
		  	
		  	$("#name").text(kakaouser);
		  	$("#email").text(window.sessionStorage.getItem("kakao_email"));
		  	
		  
	  	}
	  	if(naveruser!=null){
		  	
		  	
		  	$("#name").text(naveruser);
		  	$("#email").text(window.sessionStorage.getItem("naver_email"));
		  	
	  	
	  	}
	  }
	  
	  
	  

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']);
      }
  });  

  
  //카카오 로그아웃   
  function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }


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
						location.href="test.do";
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
	
	
	//로그인 유지 
	$(document).ready(function() {
		
		//일반 로그인
		console.log("name :"+'<c:out value="${user.getUser_name()}"/>');
		//카카오 로그인시 세션에 담겼는지 확인 *** 
		console.log("kakao id :"+sessionStorage.getItem("kakao_id"));
		console.log("kakao email :"+sessionStorage.getItem("kakao_email"));
		console.log("kakao name :"+sessionStorage.getItem("kakao_name"));
		//네이버 로그인시 세션에 담겼는지 확인 *** 
		console.log("naver id :"+sessionStorage.getItem("naver_id"));
		console.log("naver email :"+sessionStorage.getItem("naver_email"));
		console.log("naver name :"+sessionStorage.getItem("naver_name"));
		
		
	    var userInputId = getCookie("userInputId");
	    var setCookieYN = getCookie("setCookieYN");
	    
	    if(setCookieYN == 'Y') {
	        $("#idSaveCheck").prop("checked", true);
	    } else {
	        $("#idSaveCheck").prop("checked", false);
	    }
	    
	    $("#user_id").val(userInputId); 
	    
	    //로그인 버튼 클릭
	    $('#loginbtn').click(function() {
	        if($("#idSaveCheck").is(":checked")){ 
	            var userInputId = $("#user_id").val();
	            setCookie("userInputId", userInputId, 60); 
	            setCookie("setCookieYN", "Y", 60);
	        } else {
	            deleteCookie("userInputId");
	            deleteCookie("setCookieYN");
	        }
	        
	        document.fform.submit();
	    });
	});
	
	//쿠키값 Set
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + 
	    exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	
	//쿠키값 Delete
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	
	//쿠키값 가져오기
	function getCookie(cookie_name) {
	    var x, y;
	    var val = document.cookie.split(';');
	    
	    for (var i = 0; i < val.length; i++) {
	        x = val[i].substr(0, val[i].indexOf('='));
	        y = val[i].substr(val[i].indexOf('=') + 1);
	        x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
	        
	        if (x == cookie_name) {
	          return unescape(y); // unescape로 디코딩 후 값 리턴
	        }
	    }
	}
	

	//로그아웃
	function logout(){
		
		
		if('<c:out value="${user.getUser_name()}"/>' !=""){
			//일반 로그아웃 
			location.href="logout.do";
			
		}else if(window.sessionStorage.getItem("kakao_id") !=null){
			//카카오 로그아웃
			if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        	sessionStorage.removeItem("kakao_id"); // 삭제
		        	sessionStorage.removeItem("kakao_email"); // 삭제
		        	sessionStorage.removeItem("kakao_name"); // 삭제
		        	location.reload();//새로고침


		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
			
		}else if(window.sessionStorage.getItem("naver_name") !=null){
			//네이버 로그아웃 
			sessionStorage.removeItem("naver_id"); // 삭제
		    sessionStorage.removeItem("naver_email"); // 삭제
		    sessionStorage.removeItem("naver_name"); // 삭제
		    location.reload();//새로고침
			
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
                            <h1 id="login_title">로그인</h1>
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
                                                    <div class="loginmaintain"><input type="checkbox" name="loginCookie" id="idSaveCheck"> 로그인 유지 </div>                                                 
                                                   
                                                    <div class="loginfindbox"><a href="idfind.do">아이디찾기</a>|<a href="pwfind.do">비밀번호찾기</a></div>
                                                	
                                                </td>
                                            </tr>     
                                                
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <input type="button" class="finalsub" value="로그인" onclick="loginBtn();" id="loginbtn"><br>
                                                    <input type="button" class="finalsub2" value="회원가입" onclick="location.href='signup.do'">
                                                </td>
                                            </tr>
                                        </table>
                                      
                                    </form>
                                    <div class="sociallogin">
                                    	
                                        <ul>
                                            <li><a href="${url}" class="googlesub" style="background-color:rgb(0,195,0);"><img src="<c:url value="/resources/img/login_naver_icon.PNG" />" width="35px" height="33px"><span>네이버로그인</span></a></li>
                                            <li onclick="kakaoLogin();"><a href="javascript:void(0)" class="kakaosub"><img src="<c:url value="/resources/img/login_kakao_icon.gif" />" width="37px" height="37px"><span>&nbsp;카카오로그인</span></a></li>
                                        </ul>

                                    </div>
                                    <!-- 혜인 추가 -->
                                      <div class="success_login_total" style="width: 40%; height: 200px; border: 1px solid #9acdf1;">
			                              <div class="success_login_image" style="width:40%; height: 100%; border: 1px solid #9acdf1; float: left; margin: 0;">
			                                 <img src="<c:url value="/resources/img/profile.PNG" />" width="100%" height="100%">
			                              </div>
			                              
			                              <div class="success_login_info" style="width: 60%; height: 100%; border: 1px solid #9acdf1; float: right; margin: 0; padding: 10px;">
			                                 <b id="name" style="color:black;">${user.getUser_id()}</b><g style="color: darkgrey;">님 환영합니다.</g> <br>
			                                   <g id="email" style="color: darkgrey;">${user.getUser_email()}</g> <br>
			                           
			                                   <a href="mypage.do" style="text-decoration:none;" >마이페이지</a> | <a href="#"  style="text-decoration:none;">내 정보</a>
			                                   <br><br><br><br>
			                                   <button onclick="logout();" style="float:right;">로그아웃</button>
			                              </div>

                                    </div>
                                    <!--  -->
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












