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
    
    
    <script type="text/javascript">
    	function emailchk() {
    		if($.trim($("#message").val())==""){
    			alert("문의사항을 입력하세요!");
    			$("#message").val("").focus();
    			return false;
    		} else if($.trim($("#name").val())==""){
    			alert("이름을 입력하세요!");
    			$("#name").val("").focus();
    			return false;
    		} else if($.trim($("#email").val())==""){
    			alert("이메일주소를 입력하세요!");
    			$("#email").val("").focus();
    			return false;
    		} else {
    			alert("접수되었습니다. 작성하신 메일로 최대한 빠르게 답변을 드리도록 하겠습니다.");
    			return true;
    		}

		}
    
    </script>    
    
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
    <!-- banner part start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>고객센터</h2>
                            <p>home . contact</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- ================ contact section start ================= -->
    <section class="contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-home"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="qna_notice_form.do">공지사항</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="Qnaform.do">자주묻는질문</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="Qaform.do">온라인 문의</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="traffic.do">오시는 길</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8">
                    <h2 class="contact-title">온라인 문의</h2>
                    <form class="form-contact contact_form" action="insertQa.do" method="post" id="contactForm" novalidate="novalidate" onsubmit="return emailchk()">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <select name="qa_title" id="sel_contact">
                                        <option value="계정관련문의">계정관련 문의</option>
                                        <option value="사용관련문의">사용관련 문의</option>
                                        <option value="기타문의">기타 문의</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <textarea class="form-control w-100" name="qa_content" id="message" cols="30" rows="9" placeholder='문의 내용을 작성해주세요' required="required"></textarea>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control" name="qa_name" id="name" type="text"  placeholder='이름을 입력해주세요' required="required" value="${user.user_name}">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control" name="qa_email" id="email" type="email" placeholder='답변받으실 메일주소를 입력해주세요' required="required" value="${user.user_email}">
                                </div>
                            </div>                            
                        </div>
                        <div class="form-group mt-3">
                            <button type="submit" class="button button-contactForm btn_1" id="email_sub" >문의하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Header part end-->

	<!-- footer 추가 -->
	<%@ include file="../footer/footer.jsp" %>
    
</body>
</html>