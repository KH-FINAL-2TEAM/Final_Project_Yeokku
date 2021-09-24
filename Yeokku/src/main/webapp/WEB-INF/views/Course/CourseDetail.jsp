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
    
    	<div id="review_input_area"> 
    		<textarea class="input_content" name="content"></textarea> &nbsp;
    		<input type="button" id="input_button" value="작성">
    	</div>
    	
    	<div class="review_one" id="review_1">
    		<div class="pf_img"><img class="pf_img" src="resources/img/Course/PF1.jpg"></div>
    		<div class="review_detail">
    			<span class="user_id"><b>커피는커</b></span> &nbsp;&nbsp; <span class="date">(2021-08-30)</span><br>
	    		<div class="content">그대로 따라갔다가 여친한테 등짝맞았습니다.<br>글쓴이는 커플들을 헤어지게 하려고 이런 글을 쓴 첩자가 분명합니다.<br>일주일동안 저 식당 밥만 먹여야해요. 진짜로.</div>
    		</div>
    		<div class="review_icon">
    			<img src="resources/img/Course/Pencil.png" class="review_update" style="width:20px; height:20px;">
    			<img src="resources/img/Course/Alert.png" class="review_alert" style="width:20px; height:20px;">
    			<img src="resources/img/Course/Close.png" class="review_close" style="width:20px; height:20px;">
    		</div>
    	</div>
    	
    	<div class="review_one" id="review_2">
    		<div class="pf_img"><img class="pf_img" src="resources/img/Course/PF2.jpg"></div>
    		<div class="review_detail">
    			<span class="user_id"><b>사냥꾼</b></span> &nbsp;&nbsp; <span class="date">(2021-07-21)</span><br>
	    		<div class="content">글쓴이를 산채로 잡아오는 사람에게 포상금을 내리겠다.<br>구경하는 장소는 좋았으나 이 글 쓴놈은 저 식당 주인이 틀림없다.</div>
    		</div>
    		<div class="review_icon">
    			<img src="resources/img/Course/Pencil.png" class="review_update" style="width:20px; height:20px;">
    			<img src="resources/img/Course/Alert.png" class="review_alert" style="width:20px; height:20px;">
    			<img src="resources/img/Course/Close.png" class="review_close" style="width:20px; height:20px;">
    		</div>
    	</div>
    	
    	<div class="review_one" id="review_3">
    		<div class="pf_img"><img class="pf_img" src="resources/img/Course/PF1.jpg"></div>
    		<div class="review_detail">
    			<span class="user_id"><b>여우비</b></span> &nbsp;&nbsp; <span class="date">(2021-06-11)</span><br>
	    		<div class="content">재미있게 다녀왔습니다. 좋은 코스네요.</div>
    		</div>
    		<div class="review_icon">
    			<img src="resources/img/Course/Pencil.png" class="review_update" style="width:20px; height:20px;">
    			<img src="resources/img/Course/Alert.png" class="review_alert" style="width:20px; height:20px;">
    			<img src="resources/img/Course/Close.png" class="review_close" style="width:20px; height:20px;">
    		</div>
    	</div>
    	
    	<div class="review_one" id="review_4">
    		<div class="pf_img"><img class="pf_img" src="resources/img/Course/PF_Img.gif"></div>
    		<div class="review_detail">
    			<span class="user_id"><b>강낭콩</b></span> &nbsp;&nbsp; <span class="date">(2020-09-11)</span><br>
	    		<div class="content">다음주에 여행가는데 참고할게요 ~ 감사합니다 ㅎㅎ</div>
    		</div>
    		<div class="review_icon">
    			<img src="resources/img/Course/Pencil.png" class="review_update" style="width:20px; height:20px;">
    			<img src="resources/img/Course/Alert.png" class="review_alert" style="width:20px; height:20px;">
    			<img src="resources/img/Course/Close.png" class="review_close" style="width:20px; height:20px;">
    		</div>
    	</div>
    	
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