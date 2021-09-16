<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>    
    
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
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote-lite.css">	

    <script src="${pageContext.request.contextPath}/resources/js/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
 	<script>
 		$("textarea.autosize").on('keydown keyup', function () {
		  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
		});
		
	</script>
	<style>
		textarea.autosize { min-height: 500px; }
		textarea:focus {
    		outline: none;
		}
	</style>
    
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
                            <a class="contact_a" href="">자주묻는질문</a>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="">온라인 문의</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8">
                    <h2 class="contact-title">공지사항</h2>
                    <table class="notice">
                        <colgroup>
                            <col width="450px"/>
                            <col width="300px"/>
                        </colgroup>
                        <tr>
                            <th colspan="2" align="center"><h4>${noticedto.notice_title}</h4></th>
                        </tr>
                        <tr>
                        	<td></td>
                        	<td align="left"><fmt:formatDate value="${noticedto.notice_reg_date}" pattern="yyyy-MM-dd (HH:mm)"/>  |  ${noticedto.notice_reg_view}</td>
                        </tr>
                        <tr>
                        	<td colspan="2" align="center"><textarea id="summernote" readonly="readonly" rows="8" style="width:90%; resize: none; border: none">${noticedto.notice_content}</textarea></td>
                        </tr>
                        <tr>
                        	<td colspan="2" align="right">
                        		<c:if test="${user.user_role eq 'ADMIN' }">
                        			<input type="button" value="글수정" onclick="location.href='updateNoticeform.do?notice_no=${dto.notice_no}'">
                        			<input type="button" value="글삭제" onclick="location.href='deleteNotice.do?notice_no=${dto.notice_no}'">
                        		</c:if>
                        		<input type="button" value="목록" onclick="location.href='qna_notice_form.do'">
                        	</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!-- Header part end-->


    
</body>
</html>