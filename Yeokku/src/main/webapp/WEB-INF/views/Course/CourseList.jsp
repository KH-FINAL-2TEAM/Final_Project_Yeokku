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

     <!-- 배너 start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Course List</h2>
                            <p>다른 사람들의 일정을 살펴볼까요 ?</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 배너 end-->
     <section   style="margin:auto; width:50%; margin-top: 50px;">
	        <div class="contatiner text-center">
		        <form action="#">
		            <div class="form-inline" style="padding-left: 10%; width:100%;">
		                    <input type="text" class="form-control search_area" placeholder="검색어를 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'" style="width:80%; margin: 5px;">
		                    <button class="btn_1" type="submit" style="border-color: transparent;"> 🔍 </button>
		            </div>
		        </form>
		    	<a href="course_making.do" class="btn_1" style="border:double 3px white; margin-top:24px;">나만의 계획 짜러가기 !!</a>
	    	</div>
	 </section>
	    
	 <div class="list_area">
	    
	   
	    
	     <br><br><hr><br><br>
	
	    <section class="top_place">
	    
	        <div class="container">
	            
	            <div class="row">
	            
					<c:forEach items="${list }" var="dto" varStatus="status">
						<c:choose>
							<c:when test="${dto.tc_open == 'Y' }">
								<div class="col-lg-4 col-md-4">
				                	<a href="course_detail.do?room=${dto.tc_no }">
					                    <div class="single_place" style="height: 200px;">
					                        <img src="${dto.tc_content}" alt="" class="col-lg-12 col-md-12" style="height: 100%;">
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