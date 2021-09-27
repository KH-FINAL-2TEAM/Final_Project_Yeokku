
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session = request.getSession();


	


	


%>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	Kakao.init("a177aa45bc680af73e036ef7d91922f0");
	
	Kakao.Auth.login({
		success: function(authObj){
			Kakao.API.request({
				url:'/v2/user/me',
				success:function(res){
					console.log(res);
					
					var id = res.id;
					var email = res.kakao_account.email;
					var name = res.properties.nickname;
					
					
					
					//세션에 아이디, 이메일, 이름 담기 
					sessionStorage.setItem("kakao_id", id);
					sessionStorage.setItem("kakao_email", email);
					sessionStorage.setItem("kakao_name", name);
					
					console.log(sessionStorage.getItem("kakao_id"));
					console.log(sessionStorage.getItem("kakao_email"));
					console.log(sessionStorage.getItem("kakao_name"));
					
					//alert("카카오 로그인 성공");
					
					//0923
					var kakaoInfo = {
							"user_id":id,
							"user_pw":id,
							"user_name":name,
							"user_email":email
					};		
					
					$.ajax({
						type:"GET",
						url:"kakao_login_insert.do?user_id="+id+"&user_pw="+id+"&user_name="+name+"&user_email="+email+"&user_nickname="+name,
						
						success:function(){
							alert("카카오 로그인 성공");
							location.href="login_form.do";
							
						}
						
					});
					
				    //location.href="login_form.do";
					
				}
				
			})
			
			console.log(authObj);
			var token = authObj.access_token;
			
			
			
			
		},
		fail: function(err){
			alert(JSON.stringify(err));
		}
		
	});


</script>
<p>

 </p>
</body>
</html>