<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	            
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_1.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>
	                
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_2.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>
	                
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_3.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>
	                
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_4.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>
	                
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_1.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>
	                
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_2.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>
	                
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_3.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>
	                
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_4.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>
	                
	                <div class="col-lg-4 col-md-4">
	                	<a href="detail.do?id=000">
		                    <div class="single_place">
		                        <img src="resources/img/single_place_1.png" alt="" class="col-lg-12 col-md-12">
		                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
		                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
		                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>여자친구랑 부산 2박 3일 여행 !</b></span><br>
		                                <span class="course_detail" id="id"> 👤 최대아이디는몇글자일 </span><br>
		                                <span class="course_detail" id="watch"> 👁 14,231 </span><br>
		                                <span class="course_detail" id="heart"> 💗 32 </span><br>
		                                <span class="course_tag"id="tag">#해운대, #서면밀면, #바다, #기차, #오버플로우 테스트용 따라서 길게 적어야함 으앙아아</span><br>
		                            </div>
		                        </div>
		                    </div>
		                </a>
	                </div>    
	                
	                <br><hr><br>
	                
	                <a href="#" class="page"><b>&lt;&lt; &nbsp;&nbsp; &lt; &nbsp;&nbsp; 1 &nbsp;&nbsp; 2 &nbsp;&nbsp; 3 &nbsp;&nbsp; 4 &nbsp;&nbsp; 5 &nbsp;&nbsp; &gt; &nbsp;&nbsp; &gt;&gt;</b></a>
	            
	            </div>
	        </div>
	    </section>
	    
	    <br><br><hr><br><br>
	    
	</div>
</body>
</html>