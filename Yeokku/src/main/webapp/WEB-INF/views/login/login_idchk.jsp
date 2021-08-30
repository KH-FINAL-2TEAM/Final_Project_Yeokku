<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <link rel="stylesheet" href="<c:url value="/resources/css/login_Qna.css" />">


<script type="text/javascript">
	window.onload=function(){
		var id = opener.document.getElementsByName("user_id")[0].value;
		//팝업을 시킨 화면의 id값을 가져와서  담고
		
		document.getElementsByName("id")[0].value = id;
		//현재화면의 input에 값을 넣기
	}
	
	function confirm(bool){
		if(bool == "true"){
			//아이디 생성 가능
			opener.document.getElementsByName("user_pw")[0].focus();
			opener.document.getElementsByName("user_id")[0].title = "y"; //더이상 중복체크하라는 알림 안 뜸! 
		}else{
			//중복 아이디가 있음
			opener.document.getElementsByName("user_id")[0].focus();
			
		}
		self.close(); //창 닫기
		
	}
</script>
</head>
<body>

<table>
		<tr>
			<td><input type="text" class="intext" name="id" style="border:none; font-weight:bold;"></td>
		</tr>
		<tr>
			
			<td>
			<small>
			<c:choose>
				<c:when test="${idnotused eq true}">
					아이디 사용 가능!
				</c:when>
				<c:otherwise>
					아이디 사용 불가능!<br>중복 아이디가 존재합니다.  
				</c:otherwise>
			</c:choose>
			</small>
			</td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인"  style="width:50px; height:30px; background-color:rgb(36,147,224); color:white; border:rgb(36,147,224); border-radius:7px; font-weight: border;" onclick="confirm('${idnotused}');" >
				</td>
		</tr>
	</table>
</body>
</html>