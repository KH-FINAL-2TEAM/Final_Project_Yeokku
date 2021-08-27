<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>여꾸</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="resources/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <!-- style CSS -->
    <link rel="stylesheet" href="resources/css/style_dh.css">


<style type="text/css">
.box {
    font-family: "Open Sans", sans-serif;
    width: 1200px;
    padding: 0;
    margin: 0 auto;
    font-size: 14px;
}

h1, h2, h3, h4, h5, h6 {
    color: #0c3e72;
    font-family: "Open Sans", sans-serif;
}

input[type=search] {
    width: 100%;
    border-color: #2493e0;
    border-radius: 0;
    color: #2493e0;
    height: 50px;
    display: flex;
    align-items: center;
}
    
.searchclear {
    position: absolute;
    right: 5px;
    top: 0;
    bottom: 0;
    height: 14px;
    margin: auto;
    font-size: 14px;
    cursor: pointer;
    color: #ccc;
}
    
.btn_1 {
    width: 100%;
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
    
.col-lg-6{
    border: 0 solid transparent;
    border-width: 0 20px 20px 0;
}

.result_content{
    padding: 40px;
}

#result_detail{
    margin-bottom: 15px;
    padding: 20px;
    font-size: 25px;
}

#result_info, #result_price {
    margin-bottom: 10px;
    padding: 10px;
    text-align: center;
    font-size: 20px;
    color: #0c3e72;
}

.pagination {
	display: inline-block;
	text-align: center;
    margin: 50px 0px;
}
	
.pagination li {
	display: inline;
}
	
.pagination a {
	color: black;
    font-size: 15px;
	padding: 10px 40px;
}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".searchclear").click(function(){
            $(".searchinput").val('');
        });


        $("#flight_result, #ship_result, #train_result, #bus_result").hide();

        $("#flight_btn_search").submit(function(){
            $("#flight_result").show();
        });

        $("#ship_btn_search").submit(function(){
            $("#ship_result").show();
        });

        $("#train_btn_search").submit(function(){
            $("#train_result").show();
        });

        $("#bus_btn_search").submit(function(){
            $("#bus_result").show();
        });

    });

</script>
</head>


<!-- header 추가 -->
<%@ include file="../header/header.jsp" %>
<body>

    <!-- banner part start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Transportation</h2>
                            <p>여행을 위한 최적의 교통편을 검색해 보세요.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part end-->

  <div class="box">
    <!-- booking part start-->
    <section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_menu">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <a class="nav-link active" id="flight-tab" data-toggle="tab" href="#flight" role="tab" aria-controls="flight" aria-selected="true">flight</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="ship-tab" data-toggle="tab" href="#ship" role="tab" aria-controls="ship" aria-selected="false">ship</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="train-tab" data-toggle="tab" href="#train" role="tab" aria-controls="train" aria-selected="false">train</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="bus-tab" data-toggle="tab" href="#bus" role="tab" aria-controls="bus" aria-selected="false">bus</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="flight" role="tabpanel" aria-labelledby="flight-tab">
                                <div class="booking_form">
                                    <form action="#" id="flight_btn_search">
                                        <div class="form-row">
                                            <div class="form_colum col-lg-6">
                                                <input type="search" class="form-control searchinput" name="" placeholder="출발지를 입력하세요" >
                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                <input type="search" class="form-control searchinput" name="" placeholder="목적지를 입력하세요">
                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                 <input id="datepicker_1" placeholder="날짜를 선택하세요"> 
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                 <input id="datepicker_2" placeholder="날짜를 선택하세요"> 
                                            </div>
                                            <div class="form_btn col-lg-12">
                                                <input type="submit" class="btn_1 " value="Search" style="border-color: transparent;">
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="container" id="flight_result">
                                    <div class="row">
                                        <div class="result_content col-lg-12">
                                            <div id="result_detail" class="col-lg-12" style="border: 1px solid #2493e0">
                                                <div>출발 정보</div>
                                                <div class="row">
                                                    <div class="col-lg-8" id="result_info">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                                <div id="airlineNm">ASIANA</div>
                                                                <div id="vihicleId">OZ211</div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <div id="depPlandTime">오후 11: 30</div>
                                                                <div id="depAirportNm">SFO</div>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <div><img src="img/icon/right.svg"></div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <div id="arrPlandTime">오전 5:00</div>
                                                                <div id="arrAirportNm">ICN</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4" id="result_price">
                                                        <div id="economyCharge"><span>일반석 운임: </span>100,000</div>
                                                        <div id="prestigeCharge"><span>비즈니스석 운임: </span>1,000,000</div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div>도착 정보</div>
                                                <div class="row">
                                                    <div class="col-lg-8" id="result_info">
                                                        <div class="row">
                                                            <div class="col-lg-3">
                                                                <div id="airlineNm">ASIANA</div>
                                                                <div id="vihicleId">OZ211</div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <div id="depPlandTime">오전 5:00</div>
                                                                <div id="depAirportNm">ICN</div>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <div><img src="img/icon/right.svg"></div>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                <div id="arrPlandTime">오후 11: 30</div>
                                                                <div id="arrAirportNm">SFO</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4" id="result_price">
                                                        <div id="economyCharge"><span>일반석 운임: </span>100,000</div>
                                                        <div id="prestigeCharge"><span>비즈니스석 운임: </span>1,000,000</div>
                                                    </div>
                                                </div>
                                            </div>
                        
                                            <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                                <h3>검색 결과</h3>
                                            </div>
                                            <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                                <h3>검색 결과</h3>
                                            </div>
                                            <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                                <h3>검색 결과</h3>
                                            </div>
                                            <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                                <h3>검색 결과</h3>
                                            </div>
                                            
                                            <div class="row">
                                                <ul class="pagination col-lg-12">
                                                    <li><a href="">&laquo;</a></li>
                                                    <li><a href="">1</a></li>
                                                    <li><a href="">2</a></li>
                                                    <li><a href="">3</a></li>
                                                    <li><a href="">4</a></li>
                                                    <li><a href="">5</a></li>
                                                    <li><a href="">&raquo;</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            
                            <div class="tab-pane fade" id="ship" role="tabpanel" aria-labelledby="ship-tab">
                                <div class="booking_form">
                                    <form action="#" id="ship_btn_search">
                                        <div class="form-row">
                                            <div class="form_colum col-lg-6">
                                                <input type="search" class="form-control searchinput" name="" placeholder="출발지를 입력하세요" >
                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                <input type="search" class="form-control searchinput" name="" placeholder="목적지를 입력하세요">
                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                 <input id="datepicker_3" placeholder="날짜를 선택하세요"> 
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                 <input id="datepicker_4" placeholder="날짜를 선택하세요"> 
                                            </div>
                                            <div class="form_btn col-lg-12">
                                                <input type="submit"  class="btn_1 " value="Search" style="border-color: transparent;">
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="container" id="ship_result">
                                    <div class="row">
                                    <div class="result_content col-lg-12">
                                        <div id="result_detail" class="col-lg-12" style="border: 1px solid #2493e0">
                                            <div>출발 정보</div>
                                            <div class="row">
                                                <div class="col-lg-8" id="result_info">
                                                    <div class="row">
                                                        <div class="col-lg-3">
                                                            <div id="vihicleNm">블루나래호</div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="depPlandTime">오전 09:00</div>
                                                            <div id="depPlaceNm">완도항</div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div><img src="img/icon/right.svg"></div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="arrPlandTime">오전 10:20</div>
                                                            <div id="arrPlaceNm">제주항</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4" id="result_price">
                                                    <div><span>운임: </span>41,400</div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div>도착 정보</div>
                                            <div class="row">
                                                <div class="col-lg-8" id="result_info">
                                                    <div class="row">
                                                        <div class="col-lg-3">
                                                            <div id="vihicleNm">블루나래호</div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="depPlandTime">오후 05:00</div>
                                                            <div id="depPlaceNm">제주항</div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div><img src="img/icon/right.svg"></div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="arrPlandTime">오후 06:20</div>
                                                            <div id="arrPlaceNm">완도항</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4" id="result_price">
                                                    <div id="charge"><span> 운임: </span>50,000</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                            
                                        <div class="row">
                                            <ul class="pagination col-lg-12">
                                                <li><a href="">&laquo;</a></li>
                                                <li><a href="">1</a></li>
                                                <li><a href="">2</a></li>
                                                <li><a href="">3</a></li>
                                                <li><a href="">4</a></li>
                                                <li><a href="">5</a></li>
                                                <li><a href="">&raquo;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    </div>
                                </div>

                            </div>

                            <div class="tab-pane fade" id="train" role="tabpanel" aria-labelledby="train-tab">
                                <div class="booking_form">
                                    <form action="#" id="train_btn_search">
                                        <div class="form-row">
                                            <div class="form_colum col-lg-6">
                                                <input type="search" class="form-control searchinput" name="" placeholder="출발지를 입력하세요" >
                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                <input type="search" class="form-control searchinput" name="" placeholder="목적지를 입력하세요">
                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                 <input id="datepicker_5" placeholder="날짜를 선택하세요"> 
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                 <input id="datepicker_6" placeholder="날짜를 선택하세요"> 
                                            </div>
                                            <div class="form_btn col-lg-12">
                                                <input type="submit" class="btn_1 " value="Search" style="border-color: transparent;">
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="container" id="train_result">
                                    <div class="row">
                                    <div class="result_content col-lg-12">
                                        <div id="result_detail" class="col-lg-12" style="border: 1px solid #2493e0">
                                            <div>출발 정보</div>
                                            <div class="row">
                                                <div class="col-lg-8" id="result_info">
                                                    <div class="row">
                                                        <div class="col-lg-3">
                                                            <div id="traingradename">KTX</div>
                                                            <div id="trainno">101</div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="depplandtime">오전 06:05</div>
                                                            <div id="depplacename">서울</div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div><img src="img/icon/right.svg"></div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="arrplandtime">오전 07:55</div>
                                                            <div id="arrplacename">대전</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4" id="result_price">
                                                    <div id="adultcharge"><span>성인 운임: </span>16,000</div>
                                                    <div id=""><span>유아 운임: </span>8,000</div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div>도착 정보</div>
                                            <div class="row">
                                                <div class="col-lg-8" id="result_info">
                                                    <div class="row">
                                                        <div class="col-lg-3">
                                                            <div id="traingradename">KTX</div>
                                                            <div id="trainno">101</div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="depplandtime">오후 10:55</div>
                                                            <div id="depplacename">대전</div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div><img src="img/icon/right.svg"></div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="arrPlandTime">오후 11:45</div>
                                                            <div id="arrplacename">서울</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4" id="result_price">
                                                    <div id="adultcharge"><span>성인 운임: </span>16,000</div>
                                                    <div id=""><span>유아 운임: </span>8,000</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                            
                                        <div class="row">
                                            <ul class="pagination col-lg-12">
                                                <li><a href="">&laquo;</a></li>
                                                <li><a href="">1</a></li>
                                                <li><a href="">2</a></li>
                                                <li><a href="">3</a></li>
                                                <li><a href="">4</a></li>
                                                <li><a href="">5</a></li>
                                                <li><a href="">&raquo;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    </div>
                                </div>

                            </div>

                            <div class="tab-pane fade" id="bus" role="tabpanel" aria-labelledby="bus-tab">
                                <div class="booking_form">
                                    <form action="#" id="bus_btn_search">
                                        <div class="form-row">
                                            <div class="form_colum col-lg-6">
                                                <input type="search" class="form-control searchinput" name="" placeholder="출발지를 입력하세요" >
                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                <input type="search" class="form-control searchinput" name="" placeholder="목적지를 입력하세요">
                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                 <input id="datepicker_7" placeholder="날짜를 선택하세요"> 
                                            </div>
                                            <div class="form_colum col-lg-6">
                                                 <input id="datepicker_8" placeholder="날짜를 선택하세요"> 
                                            </div>
                                            <div class="form_btn col-lg-12">
                                                <input type="submit" class="btn_1 " value="Search" style="border-color: transparent;">
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="container" id="bus_result">
                                    <div class="row">
                                    <div class="result_content col-lg-12">
                                        <div id="result_detail" class="col-lg-12" style="border: 1px solid #2493e0">
                                            <div>출발 정보</div>
                                            <div class="row">
                                                <div class="col-lg-8" id="result_info">
                                                    <div class="row">
                                                        <div class="col-lg-3">
                                                            <div id="routeId">NAEK010300</div>
                                                            <div id="gradeNm">우등</div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="depPlandTime">오전 06:05</div>
                                                            <div id="depPlaceNm">서울고속터미널</div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div><img src="img/icon/right.svg"></div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="arrPlandTime">오전 07:55</div>
                                                            <div id="arrPlaceNm">대전고속터미널</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4" id="result_price">
                                                    <div id="charge"><span>운임: </span>14,000</div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div>도착 정보</div>
                                            <div class="row">
                                                <div class="col-lg-8" id="result_info">
                                                    <div class="row">
                                                        <div class="col-lg-3">
                                                            <div id="routeId">NAEK010300</div>
                                                            <div id="gradeNm">우등</div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="depPlandTime">오후 10:55</div>
                                                            <div id="depPlaceNm">대전고속터미널</div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div><img src="img/icon/right.svg"></div>
                                                        </div>
                                                        <div class="col-lg-3">
                                                            <div id="arrPlandTime">오후 11:45</div>
                                                            <div id="arrPlaceNm">서울고속터미널</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4" id="result_price">
                                                    <div id="charge"><span>운임: </span>14,000</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                        <div id="result_detail" class="" style="border: 1px solid #2493e0">
                                            <h3>검색 결과</h3>
                                        </div>
                                            
                                        <div class="row">
                                            <ul class="pagination col-lg-12">
                                                <li><a href="">&laquo;</a></li>
                                                <li><a href="">1</a></li>
                                                <li><a href="">2</a></li>
                                                <li><a href="">3</a></li>
                                                <li><a href="">4</a></li>
                                                <li><a href="">5</a></li>
                                                <li><a href="">&raquo;</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- booking part end-->

    
    <!-- jquery plugins here-->
    <script src="resources/js/jquery-1.12.1.min.js"></script>
    <!-- bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- masonry js -->
    <script src="resources/js/gijgo.min.js"></script>
    <!-- custom js -->
    <script src="resources/js/custom.js"></script>
</div>
</body>

</html>