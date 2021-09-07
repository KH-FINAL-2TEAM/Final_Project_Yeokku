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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


function pwFindBtn(){
	var user_id = $("#user_id").val();//입력한 아이디 
	var user_name = $("#user_name").val(); //입력한 이름 
	var user_email = $("#user_email").val(); //입력한 이메일 
	
	//console.log(user_id, user_name, user_email);
	
	var warnMsg = $(".mail_input_box_warn");// 이메일 입력 경고글
	
	
	
	/* 이메일 형식 유효성 검사 */
	
	
		
	
	if(user_id==""||user_name==""||user_email==""){
		alert("모두 입력해주세요.");
	}else{
		
		if(mailFormCheck(user_email)){
			   warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
			   warnMsg.css("display", "inline-block");
	    } else {
			   warnMsg.html("올바르지 못한 이메일 형식입니다.");
			   warnMsg.css("display", "inline-block");
			   warnMsg.css("color", "red");
			   return false;
		}    
	 
	}	
	
	 $.ajax({
			type:"GET",
			url:"pwFind.do?user_email="+user_email+"&user_name="+user_name+"&user_id="+user_id,
			success:function(data){
				 console.log("data: "+data);
			}
		});
	
	
	 
	 
}
//이메일 유효성 검사
function mailFormCheck(user_email){
	 var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 return form.test(user_email);

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
                                                <td><input type="text" name="user_id" id="user_id"  required="required" class="intext" placeholder="아이디를 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>이름</th>
                                                <td><input type="text" name="user_name" id="user_name" required="required" class="intext" placeholder="이름을 입력해주세요"></td>
                                            </tr>
                                            <tr>
                                                <th>이메일</th>
                                                <td>
                                                	<input type="text" name="user_email" id="user_email" required="required" class="intext" placeholder="가입하신 이메일을 입력해주세요"><br>
                                                	<font class="mail_input_box_warn" size="2"></font>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;"><input type="button" class="finalsub" value="발송" onclick="pwFindBtn();"></td>
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