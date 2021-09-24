<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.yeokku.model.dto.RoomDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>var tc_q = '${dto.tc_q}'; var tc_room = '${dto.tc_no}'; var like_count = ' ${dto.tc_like }';</script>
    
<!DOCTYPE html><html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Detail</title>
    
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style_dh.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <link rel="stylesheet" href="resources/css/Course/CourseMaking.css?ver=11">
    <link rel="stylesheet" href="resources/css/Course/CourseDetail.css?ver=15">
    <script src="resources/js/Course/CourseDetail.js?ver=1" charset="utf-8"></script>
</head>

<%@ include file="../header/header.jsp" %>

<body>

	 <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2 id="course_title">${dto.tc_title }</h2>
                            <span id="course_writer">👤 ${dto.tc_userid} </span> &nbsp; <span id="course_watch">👁 ${dto.tc_view} </span> &nbsp; <span id="course_heart">💗 ${dto.tc_like }</span><br><br>
                            <span id="course_tag">${dto.tc_tag }</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <br><hr><br>
    
    <div id="q_list_detail">
    	
    </div>
    
    <br><hr><br>

    <div id="detail_area">
    	<img id="canvasimg" src="data:image/png;base64,${jpg }">
    	${dto.tc_content}
    </div>
    
    <div id="review">
		<c:if test="${!empty user }">   
    	<div id="review_input_area"> 
    		<textarea id="tcr_content" class="input_content" name="content"></textarea> &nbsp;
    		<input type="button" id="input_button" value="작성" onclick="writeReview(${dto.tc_no},${user.user_no});">
    	</div>
    	</c:if> 
    	
    	<c:choose>
    		<c:when test="${empty review_list }">
    			리뷰가 없습니다.
    		</c:when>
    		<c:otherwise>
    			<c:forEach items="${review_list }" var="list" varStatus="status">
    				<div class="review_one" id="${list.tcr_no }">
			    		<div class="pf_img"><img class="pf_img" src="uploadfile/${list.profile_dto.pf_name }${list.profile_dto.pf_type}"></div>
			    		<div class="review_detail">
			    			<span class="user_id"><b>${list.user_dto.user_nickname }</b></span> &nbsp;&nbsp; <span class="date">(2021-08-30)</span><br>
				    		<div class="content">${list.tcr_content }</div>
			    		</div>
			    		<c:if test="${list.tcr_userno eq user.user_no}">
				    		<div class="review_icon">
				    			<img src="resources/img/Course/Pencil.png" class="review_update" style="width:20px; height:20px;">
				    			<img src="resources/img/Course/Close.png" class="review_close" style="width:20px; height:20px;">
				    		</div>
			    		</c:if>
			    		<c:if test="${list.tcr_userno ne user.user_no and !empty user}">
			    			<div class="review_icon">
				    			<img src="resources/img/Course/Alert.png" class="review_alert" style="width:20px; height:20px;" onclick="report(${list.tcr_no },${list.tcr_userno},${user.user_no },'${list.tcr_content }');">
			    			</div>
			    		</c:if>
			    	</div>
    			</c:forEach>
    		</c:otherwise>
    	</c:choose>
    	
    	<div style="height:70px;"></div>
    </div>

</body>

<style>
	body {
		font-family:'Goyang', Goyang;
		line-height:1.2;
	}
	
	hr{
		margin-top:0.5rem;
		margin-bottom:0.5rem;
	}
	canvasimg {
		position:absolute;
	}
	
	img {
		max-width:3000px;
	}
</style>

</html>