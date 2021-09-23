<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
/*일반 로그인 했을 때*/ 
$(document).ready(function() {

    alert("${msg }");
    $("#form").submit();
	
  });
    

</script>
</head>
<body>
<form action="tripplace_detail_form.do" method="post" id="form">
<input type="hidden" name="contentid" value="${contentid }">
<input type="hidden" name="userno" value="${user.user_no }">
<input type="hidden" name="title" value="${title }">
</form>

</body>
</html>