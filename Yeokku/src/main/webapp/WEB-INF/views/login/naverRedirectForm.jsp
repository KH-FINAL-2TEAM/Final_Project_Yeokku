<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
/*네이버 로그인 했을 때*/ 
$(document).ready(function() {
	
	
    var name = ${result}.response.name;
    var email = ${result}.response.email;
    //var token = ${result};
  
    
    
    //세션에 아이디, 이메일, 이름 담기 
	sessionStorage.setItem("naver_id", email);
	sessionStorage.setItem("naver_email", email);
	sessionStorage.setItem("naver_name", name);
	//sessionStorage.setItem("naver_token", token);
	
	console.log(sessionStorage.getItem("naver_id"));
	console.log(sessionStorage.getItem("naver_email"));
	console.log(sessionStorage.getItem("naver_name"));
	//console.log(sessionStorage.getItem("naver_token"));
	
    alert("네이버 로그인 성공");
    location.href="loginpage.do";
	
  });
    
    
    
</script>
</head>
<body>


 
</body>
</html>