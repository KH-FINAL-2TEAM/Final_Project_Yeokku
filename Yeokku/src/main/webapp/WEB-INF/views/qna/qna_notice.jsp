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
                </div>
                
                <div class="col-lg-8">
                    <h2 class="contact-title">공지사항</h2>
                    <table class="notice">
                        <colgroup>
                            <col width="450px"/>
                            <col width="150px"/>
                            <col width="150px"/>
                        </colgroup>
                        <tr>
                            <th>제목</th>
                            <th>등록일</th>
                            <th>조회수</th>
                        </tr>
                        <c:choose>
                        	<c:when test="${empty list }">
                        		<tr>
                        			<td colspan="3" align="center">
                        				<p>-----작성된 공지사항이 없습니다-----</p>
                        			</td>
                        		</tr>
                        	</c:when>
                        	<c:otherwise>
                        		<c:forEach items="${list}" var="dto">
                        			<tr>
                            			<td><a href="qna_notice_detail.do?notice_no=${dto.notice_no}">${dto.notice_title }</a></td>
                            			<td><fmt:formatDate value="${dto.notice_reg_date}" pattern="yyyy-MM-dd"/></td>
                            			<td>${dto.notice_reg_view}</td>
                        			</tr>
                        		</c:forEach>                        	
                        	</c:otherwise>
                        </c:choose>
                        <tr>
                        	<td colspan="3" align="right">
                        		<c:if test="${user.user_role eq 'ADMIN' }">
                        			<input type="button" value="글작성" onclick="location.href='qna_notice_insert.do'">
                        		</c:if>
                        		<input type="button" value="목록" onclick="qna_notice_form.do">
                        	</td>
                        </tr>
                        <tr>
                        	<td colspan="3">
                        			<div style="display: block; text-align: center;">		
									<c:if test="${paging.startPage != 1 }">
										<a href="qna_notice_form.do?nowPage=${paging.startPage - 1 }">&lt;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a href="qna_notice_form.do?nowPage=${p }">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${paging.endPage != paging.lastPage}">
										<a href="qna_notice_form.do?nowPage=${paging.endPage+1 }">&gt;</a>
									</c:if>
								</div>
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