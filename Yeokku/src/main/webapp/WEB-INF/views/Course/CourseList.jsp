<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html><html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course List</title>
    
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style_dh.css">
    <link rel="stylesheet" href="resources/css/Course/CourseList.css">
    <script src="resources/js/Course/CourseList.js" charset="utf-8"></script>
    
</head>


<!-- header 추가 -->
<%@ include file="../header/header.jsp" %>

<body>

    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <b style="color:red; font-size:40px;">W</b>
                            <span style="font-size:25px;">here did you</span>
                            <b style="font-size:40px; color:blue;">G</b>
                            <span style="font-size:25px;">o</span> ?<br>
                            <h1>Course List</h1>
                            <p>다른 사람들의 일정을 살펴볼까요 ?</p>
                            <a href="course_making.do" class="btn_1" style="border:double 3px white;">나만의 계획 짜러가기 !!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <hr>
 
	 <div class="list_area">
	    
	    <section style="margin:auto; width:50%; margin-top: 50px;">
	        <form action="#">
	            <div class="form-inline" style="padding-left: 10%; width:100%;">
	                    <input type="text" class="form-control search_area" placeholder="검색어를 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'" style="width:80%; margin: 5px;">
	                    <button class="btn_1" type="submit" style="border-color: transparent;"> 🔍 </button>
	            </div>
	        </form>
	    </section>
	    
	     <br><br><hr><br><br>
	
	    <section class="top_place">
	    
	        <div class="container">
	            
	            <div class="row">
	            
					<c:forEach items="${list }" var="dto" varStatus="status">
						<c:choose>
							<c:when test="${dto.tc_open == 'Y' }">
								<div class="col-lg-4 col-md-4">
				                	<a href="course_detail.do?room=${dto.tc_no }">
					                    <div class="single_place">
					                        <img src="resources/img/single_place_${status.index%4+1}.png" alt="" class="col-lg-12 col-md-12">
					                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
					                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
					                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>${dto.tc_title } &nbsp; </b></span><br>
					                                <span class="course_detail" id="id"> &nbsp; 👤  ${dto.tc_userid } &nbsp; </span><br>
					                                <span class="course_detail" id="watch"> &nbsp; 👁 &nbsp; ${dto.tc_view } &nbsp; </span><br>
					                                <span class="course_detail" id="heart"> &nbsp; 💗  ${dto.tc_like } &nbsp; </span><br>
					                                <span class="course_tag"id="tag"> &nbsp; ${dto.tc_tag } &nbsp; </span><br>
					                            </div>
					                        </div>
					                    </div>
					                </a>
				                </div> 
							</c:when>
						</c:choose>
					</c:forEach>
	            
	                <br><hr><br>
	            </div>
	        </div>
	    </section>
	    
	    <br><br><hr><br><br>
	    
	</div>
</body>
</html>