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
	#mail_check_input_box_false{
	    background-color:rgb(233,236,239);
	}
	 
	#mail_check_input_box_true{
	    background-color:white;
	}
	
	.correct{
    color : blue;
	}
	
	.incorrect{
	    color : red;
	}
	
	.mail_input, .mail_check_input{
	  width: 330px;
	  height: 44px;
	  padding: 0 14px;
	  border: 1px solid #ccc;
	  font-size: 14px;
	  color: #333;
	  line-height: 20px;
	  border-radius: 3px;
	  background: #fff;
	  outline: none;
	  vertical-align: top;
	}
	
	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

//1. 아이디 중복확인
function idChk(){
	var doc = document.getElementsByName("user_id")[0];
	if(doc.value.trim()=="" || doc.value==null){
		//아무것도 안입력하고 버튼누른경우
		alert("아이디를 입력해주세요");
	}else{
		//팝업창 띄우기
		var target = "idchk.do?user_id="+doc.value.trim();
		
		open(target,"","width=200,height=200");
	}
}



//2. 비밀번호 확인
$(function(){
	$("#user_pw1").keyup(function(){
		$("#chkNotice").html('');
	});
	
	$("#user_pw2").keyup(function(){
		
		if($("#user_pw1").val() != $("#user_pw2").val()){
			$("#chkNotice").html('비밀번호가 일치하지 않습니다.<br>');
			$("#chkNotice").attr('color', 'red');
			$("#chkNotice").attr('title', 'n');
		}else{
			$("#chkNotice").html('비밀번호가 일치합니다.<br>');
			$("#chkNotice").attr('color', 'blue');
			$("#chkNotice").attr('title', 'y');
		}
		
	});
	
});



//3. 주소찾기 
//주소찾기 
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=user_postcode]").val(data.zonecode);
           $("[name=user_address]").val(fullRoadAddr);
           

       }
    }).open();
}



//4. 이메일 인증 

var code = "";//이메일전송 인증번호 저장위한 코드



//4-1. 인증번호 이메일 전송
function mailCheckBtn(){
	//입력한 이메일 
	var email = $(".mail_input").val();
	console.log(email);
	
    var cehckBox = $(".mail_check_input"); // 인증번호 입력란
    
    var warnMsg = $(".mail_input_box_warn");// 이메일 입력 경고글
    
    /* 이메일 형식 유효성 검사 */
    if(mailFormCheck(email)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    }    
	
	
	
	$.ajax({
		type:"GET",
		url:"mailCheck.do?email="+email,
		success:function(data){
			 console.log("data: "+data);
			 cehckBox.attr("disabled",false);
			 cehckBox.attr("id", "mail_check_input_box_true");
			 code = data;
		}
	});

  
}


//4-2. 이메일 인증번호 확인 
function numCheck(){
	
	 var warnMsg = $(".mail_input_box_warn");// 이메일 입력 경고글
	 warnMsg.hide();
	
	 var inputCode = $(".mail_check_input").val();        // 입력코드    
	 var checkResult = $("#mail_check_input_box_warn");    // 비교 결과   
	 
	 if($(".mail_input").val() == null || $(".mail_input").val() ==""){
		 alert("이메일을 입력해주세요.");
		 
	 }else if(inputCode == null || inputCode == ""){
		 alert("인증번호를 입력해주세요.");
		 
	 }else{
		 
		 if(inputCode == code){                            // 일치할 경우
		        
			 	checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");
		        
		        
		 } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		 }    
	 }
	
}


//5. 아이디 중복확인, 비밀번호 일치확인 검사 
function idChkConfirm(){
	
	//아이디 중복확인 체크
	var idchk = document.getElementsByName("user_id")[0].title; 
	if(idchk=="n"){
		alert("아이디 중복체크를 해주세요.");
		document.getElementsByName("user_id")[0].focus(); 
		
	}
	
	//비밀번호 일치확인 체크
	var pwchk = document.getElementsByName("chkNotice")[0].title; 
	if(pwchk=="n"){
		alert("비밀번호 확인을 해주세요.");
		
		
	} 
	
	
}

//6. 입력 이메일 형식 유효성 검사
function mailFormCheck(email){
	 var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 return form.test(email);

}



</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


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
                                
                                    <form action="insertuser.do" method="post">
                                        <table class="regi_tool">
                                            <tr>
                                                <th>아이디</th>
                                                <td><input type="text" name="user_id" id="user_id" required="required" title="n" class="intext"  placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
                                                	<input type="button" value=중복확인 id="id_chk_btn" class="finalbox" title="n" onclick="idChk();">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호</th>
                                                <td><input type="password" name="user_pw" id="user_pw1" required="required" class="intext" placeholder="비밀번호를 입력해주세요" onclick="idChkConfirm();"></td>
                                            </tr>
                                            <tr>
                                                <th>비밀번호확인</th>
                                                <td><input type="password" name="user_pw_chk" id="user_pw2" required="required" class="intext" placeholder="비밀번호를 다시 입력해주세요" onclick="idChkConfirm();"><br>
                                                	<font id="chkNotice" name="chkNotice" size="2" title=""></font>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <th>이름</th>
                                                <td><input type="text" name="user_name"  required="required" class="intext" placeholder="이름을 입력해주세요" onclick="idChkConfirm();"></td>
                                            </tr>
                                            <tr>
                                                <th>이메일</th>
                                                <td>
													<input type="text" name="user_email" class="mail_input" placeholder="이메일을 입력해주세요" required="required" onclick="idChkConfirm();">
													<input type="button" class="finalbox" value="인증번호전송" onclick="mailCheckBtn();" >
													
													<br>
													
													<!-- 인증번호 입력란--> <input type="text" class="mail_check_input" id="mail_check_input_box_false" disabled="disabled" placeholder="인증번호를 입력해주세요" required="required" onclick="idChkConfirm();">
													<input type="button" class="finalbox" value="인증번호 확인" onclick="numCheck();" ><br>
													<font id="mail_check_input_box_warn" size="2"> </font>
													<font class="mail_input_box_warn" size="2"></font>
													
												</td>
                                            </tr>
                                            <tr>
                                                <th>닉네임</th>
                                                <td><input type="text" name="user_nickname"  required="required" class="intext" placeholder="닉네임을 입력해주세요" onclick="idChkConfirm();"></td>
                                            </tr>
                                            <tr>
                                                <th>주소</th>
                                                <td>
	                                                <div>
													<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="user_postcode" id="addr1" type="text" readonly="readonly" required="required">
												    <button type="button" class="btn btn-default" onclick="execPostCode();" ><i class="fa fa-search"></i> 우편번호 찾기</button>                               
													</div>
													<div class="form-group">
													    <input class="form-control" style="width: 73%; top: 5px;" placeholder="도로명 주소" name="user_address" id="addr2" type="text" readonly="readonly" required="required"/>
													</div>
													<div class="form-group">
													    <input class="form-control" style="width: 73%;" placeholder="상세주소" name="user_extraaddress" id="addr3" type="text" required="required" onclick="idChkConfirm();"/>
													</div>
                                               	 	<!--  <input type="button" value="&#xf002; 주소찾기" class="finalbox2">-->
                                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;"><input type="submit" class="finalsub" value="가입하기"></td>
                                            </tr>
                                            <tr>
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