<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style_dh.css">
<style>
.box {
    font-family: "Open Sans", sans-serif;
    width: 1200px;
    padding: 0;
    margin: 0 auto;
    font-size: 14px;
}

.search_part {
	margin-top: 50px;
}

.btn_1 {
  display: inline-block;
  padding: 13px 30px;
  border-radius: 0;
  font-size: 16px;
  color: #fff;
  text-transform: capitalize;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  background-color: #fe5c24;
  font-weight: 500;
}

.btn_1:hover {
  color: #fff;
  background-color: #2493e0;
}

</style>
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
                            <h1> Do It Yourself </h1>
                            <p>당신만의 여행 꾸미기! 지금 여꾸와 함께 시작하세요.</p>
                            <a href="#" class="btn_1">Plan your trip</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 
 <div class="box">
    
    <section class="search_part">
        <form action="#">
            <div class="form-inline" style="padding-left: 10%;">
                    <input type="text" class="form-control w-75" placeholder="Search Keyword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'"
                    style="margin: 5px;">
                    <input class="btn_1" type="submit" style="border-color: transparent;" value="Search">
            </div>
        </form>
    </section>

    <section class="top_place">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2 style="padding-top: 50px;">추천 명소</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_1.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3 style="padding-bottom: 5px;">명소 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_2.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3 style="padding-bottom: 5px;">명소 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_3.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3 style="padding-bottom: 5px;">명소 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_4.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3 style="padding-bottom: 5px;">명소 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_1.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3 style="padding-bottom: 5px;">명소 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_2.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3 style="padding-bottom: 5px;">명소 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <a href="#" class="btn_1 text-cnter">더 보기</a>
            </div>
        </div>
    </section>
    <hr>
    <section class="top_place">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2 style="padding-top: 50px;">추천 일정</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_1.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3>일정 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_2.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3>일정 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_3.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3>일정 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_4.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3>일정 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_1.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3>일정 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_place">
                        <img src="resources/img/single_place_2.png" alt="" class="col-lg-12 col-md-12">
                        <div class="hover_Text d-flex align-items-end justify-content-between"  style="padding-bottom: 15px;">
                            <div class="hover_text_iner">
                                <h3>일정 이름</h3>
                                <a href="#" class="place_btn">자세히 보기</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <a href="#" class="btn_1 text-cnter">더 보기</a>
            </div>
        </div>
    </section>


</div>
</body>
</html>