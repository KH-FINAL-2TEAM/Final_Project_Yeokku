<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html><html lang="en">

<head>
   
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>여꾸</title>

    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/gijgo.min.css">
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
		
		.pagination_wrap {
			padding: 20px;
			margin: 0px auto;
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
	
		////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////
	    
		$(function(){
	        $(".searchclear").click(function(){ $(".searchinput").val(''); });
	
	        $("#flight_result, #ship_result, #train_result, #bus_result").hide();

	        $("#flight_btn_search").submit(function(){ $("#flight_result").show(); });
	        $("#ship_btn_search").submit(function(){ $("#ship_result").show(); });
	        $("#train_btn_search").submit(function(){ $("#train_result").show(); });
	        $("#bus_btn_search").submit(function(){ $("#bus_result").show(); });
	    });
		
		////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////
	    
		function search_do(type) {
    	
	    	if(type == "air") {
	    		
	    		var loc_start = $("#air_loc_start").val().trim();
	    		var loc_goal = $("#air_loc_goal").val().trim();
	    		var date_start = $("#datepicker_1").val().trim();
	    		var date_return = $("#datepicker_2").val().trim();
	    		
	    		var today = new Date();   
	    		var now = today.getFullYear()*10000 + (today.getMonth()*1+1*1)*100 + today.getDate()*1;
	    		
	    		var date_check_start = date_start.split("/");
	    		var date_check_return = date_return.split("/");
	    		
	    		var dcs = date_check_start[2]*10000 + date_check_start[0]*100 + date_check_start[1]*1;
	    		var dcr = date_check_return[2]*10000 + date_check_return[0]*100 + date_check_return[1]*1;
	    		
	    		if(parseInt(now) > parseInt(dcs)) { alert("타임머신은 아직 없어요.\n현재 : " + now + " / 출발 : " + dcs ); return; }
	    		if(parseInt(dcs) > parseInt(dcr)) { alert("타임머신은 아직 없어요.\n출발 : " + dcs + " / 복귀 : " + dcr ); return; }
	    		
				var search_val = {
						"start_loc" : loc_start,
			    		"goal_loc" : loc_goal,
			    		"start_time" : dcs,
			    		"return_time" : dcr
				}
						
				if( loc_start == null || loc_start == "" || loc_goal == "" || loc_goal == null) { alert("출발지와 목적지를 입력해주세요."); }
				else if ( date_start == null || date_start == "" || date_return == "" || date_return == null) { alert("출발 날짜와 돌아오는 날짜를 입력해주세요."); }
				else {
					$.ajax({
						type:"POST",
						url:"air_search.do",
						data:search_val,
						success:function(list) {
							if(list.length == 0) { alert("해당 조건에 맞는 결과가 없습니다."); }
							else { list_update(list, "air"); }
						},
						error:function() {}
					});
				}
	    	}
	    	
			////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////////////////////////
			
	    	else if(type == "ship") {
	    		
	    		var loc_start = $("#ship_loc_start").val().trim();
	    		var loc_goal = $("#ship_loc_goal").val().trim();
	    		var date_start = $("#datepicker_3").val().trim();
	    		var date_return = $("#datepicker_4").val().trim();
	    		
	    		var today = new Date();   
	    		var now = today.getFullYear()*10000 + (today.getMonth()*1+1*1)*100 + today.getDate()*1;
	    		
	    		var date_check_start = date_start.split("/");
	    		var date_check_return = date_return.split("/");
	    		
	    		var dcs = date_check_start[2]*10000 + date_check_start[0]*100 + date_check_start[1]*1;
	    		var dcr = date_check_return[2]*10000 + date_check_return[0]*100 + date_check_return[1]*1;
	    		
	    		if(parseInt(now) > parseInt(dcs)) { alert("타임머신은 아직 없어요.\n현재 : " + now + " / 출발 : " + dcs ); return; }
	    		if(parseInt(dcs) > parseInt(dcr)) { alert("타임머신은 아직 없어요.\n출발 : " + dcs + " / 복귀 : " + dcr ); return; }
	    		
				var search_val = {
						"start_loc" : loc_start,
			    		"goal_loc" : loc_goal,
			    		"start_time" : dcs,
			    		"return_time" : dcr
				}
						
				if( loc_start == null || loc_start == "" || loc_goal == "" || loc_goal == null) { alert("출발지와 목적지를 입력해주세요."); }
				else if ( date_start == null || date_start == "" || date_return == "" || date_return == null) { alert("출발 날짜와 돌아오는 날짜를 입력해주세요."); }
				else {
					$.ajax({
						type:"POST",
						url:"ship_search.do",
						data:search_val,
						success:function(list) {
							if(list.length == 0) { alert("해당 조건에 맞는 결과가 없습니다."); }
							else { list_update(list, "ship"); }
						},
						error:function() {}
					});
				}
	    	}
	    	
			////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////////////////////////
			
			else if(type == "train") {
	    		
	    		var loc_start = $("#train_loc_start").val().trim();
	    		var loc_goal = $("#train_loc_goal").val().trim();
	    		var date_start = $("#datepicker_5").val().trim();
	    		var date_return = $("#datepicker_6").val().trim();
	    		
	    		var today = new Date();   
	    		var now = today.getFullYear()*10000 + (today.getMonth()*1+1*1)*100 + today.getDate()*1;
	    		
	    		var date_check_start = date_start.split("/");
	    		var date_check_return = date_return.split("/");
	    		
	    		var dcs = date_check_start[2]*10000 + date_check_start[0]*100 + date_check_start[1]*1;
	    		var dcr = date_check_return[2]*10000 + date_check_return[0]*100 + date_check_return[1]*1;
	    		
	    		if(parseInt(now) > parseInt(dcs)) { alert("타임머신은 아직 없어요.\n현재 : " + now + " / 출발 : " + dcs ); return; }
	    		if(parseInt(dcs) > parseInt(dcr)) { alert("타임머신은 아직 없어요.\n출발 : " + dcs + " / 복귀 : " + dcr ); return; }
	    		
				var search_val = {
						"start_loc" : loc_start,
			    		"goal_loc" : loc_goal,
			    		"start_time" : dcs,
			    		"return_time" : dcr
				}
						
				if( loc_start == null || loc_start == "" || loc_goal == "" || loc_goal == null) { alert("출발지와 목적지를 입력해주세요."); }
				else if ( date_start == null || date_start == "" || date_return == "" || date_return == null) { alert("출발 날짜와 돌아오는 날짜를 입력해주세요."); }
				else {
					$.ajax({
						type:"POST",
						url:"train_search.do",
						data:search_val,
						success:function(list) {
							if(list.length == 0) { alert("해당 조건에 맞는 결과가 없습니다."); }
							else { list_update(list, "train"); }
						},
						error:function() {}
					});
				}
	    	}
	    	
			////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////////////////////////
	
			else if(type == "bus") {
	    		
	    		var loc_start = $("#bus_loc_start").val().trim();
	    		var loc_goal = $("#bus_loc_goal").val().trim();
	    		var date_start = $("#datepicker_7").val().trim();
	    		var date_return = $("#datepicker_8").val().trim();
	    		
	    		var today = new Date();   
	    		var now = today.getFullYear()*10000 + (today.getMonth()*1+1*1)*100 + today.getDate()*1;
	    		
	    		var date_check_start = date_start.split("/");
	    		var date_check_return = date_return.split("/");
	    		
	    		var dcs = date_check_start[2]*10000 + date_check_start[0]*100 + date_check_start[1]*1;
	    		var dcr = date_check_return[2]*10000 + date_check_return[0]*100 + date_check_return[1]*1;
	    		
	    		if(parseInt(now) > parseInt(dcs)) { alert("타임머신은 아직 없어요.\n현재 : " + now + " / 출발 : " + dcs ); return; }
	    		if(parseInt(dcs) > parseInt(dcr)) { alert("타임머신은 아직 없어요.\n출발 : " + dcs + " / 복귀 : " + dcr ); return; }
	    		
				var search_val = {
						"start_loc" : loc_start,
			    		"goal_loc" : loc_goal,
			    		"start_time" : dcs,
			    		"return_time" : dcr
				}
						
				if( loc_start == null || loc_start == "" || loc_goal == "" || loc_goal == null) { alert("출발지와 목적지를 입력해주세요."); }
				else if ( date_start == null || date_start == "" || date_return == "" || date_return == null) { alert("출발 날짜와 돌아오는 날짜를 입력해주세요."); }
				else {
					$.ajax({
						type:"POST",
						url:"bus_search.do",
						data:search_val,
						success:function(list) {
							if(list.length == 0) { alert("해당 조건에 맞는 결과가 없습니다."); }
							else { list_update(list, "bus"); }
						},
						error:function() {}
					});
				}
	    	}
		}
		
		////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////
		
		function list_update(list, type) {
			
			if(type=="air") {
				
				for(var i=0; i<list.length; i++) {				
					
					var all = "<div id='result_detail' class='col-lg-12' style='border: 1px solid #2493e0'>" +
					"<div>출발 정보</div><div class='row'>" +
					"<div class='col-lg-8' id='result_info'><div class='row'><div class='col-lg-3'>" +
					"<div id='airlineNm'>" + list[i].airlineNm + "</div>" +
					"<div id='vihicleId'>" + list[i].vihicleId + "</div></div><div class='col-lg-3'>" +
					"<div id='depPlandTime'>" + list[i].depPlandTime + "</div>" +
					"<div id='depAirportNm'>" + list[i].depAirportNm + "</div></div>" +
					"<div class='col-lg-2'><div><img src='img/icon/right.svg'></div></div><div class='col-lg-3'>" +
					"<div id='arrPlandTime'>" + list[i].arrPlandTime + "</div>" +
					"<div id='arrAirportNm'>" + list[i].arrAirportNm + "</div></div></div></div>" +
					"<div class='col-lg-4' id='result_price'><div id='economyCharge'><span>일반석 운임: </span>" + list[i].economyCharge + "</div>" +
					"<div id='prestigeCharge'><span>비즈니스석 운임: </span>" + list[i].prestigeCharge + "</div>" +
					"</div></div><hr><div>도착 정보</div><div class='row'><div class='col-lg-8' id='result_info'>" +
					"<div class='row'><div class='col-lg-3'><div id='airlineNm'>" + list[i].airlineNm + "</div>" +
					"<div id='vihicleId'>" + list[i].vihicleId + "</div></div><div class='col-lg-3'>" +
					"<div id='depPlandTime'>" + list[i].depPlandTime + "</div>" +
					"<div id='depAirportNm'>" + list[i].depAirportNm + "</div></div><div class='col-lg-2'>" +
					"<div><img src='img/icon/right.svg'></div></div><div class='col-lg-3'>" +
					"<div id='arrPlandTime'>" + list[i].arrPlandTime + "</div>" +
					"<div id='arrAirportNm'>" + list[i].arrAirportNm + "</div></div></div>" +
					"</div><div class='col-lg-4' id='result_price'><div id='economyCharge'><span>일반석 운임: </span>" + list[i].economyCharge + "</div>" +
					"<div id='prestigeCharge'><span>비즈니스석 운임: </span>" + list[i].prestigeCharge + "</div></div></div></div>";
					
					$("#air_result_area").append(all);
					$("#flight_result").show();
				}

			}
			
			////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////////////////////////
			
			else if(type=="ship"){
				
				for(var i=0; i<list.length; i++) {
					
					var all = "<div id='result_detail' class='col-lg-12' style='border: 1px solid #2493e0'>" +
					"<div>출발 정보</div><div class='row'><div class='col-lg-8' id='result_info'><div class='row'><div class='col-lg-3'>" +
					"<div id='vihicleNm'>" + list[i].vihicleNm + "</div></div><div class='col-lg-3'>" +
					"<div id='depPlandTime'>" + list[i].depPlandTime + "</div>" +
					"<div id='depPlaceNm'>" + list[i].depPlaceNm + "</div></div><div class='col-lg-2'><div><img src='img/icon/right.svg'></div></div><div class='col-lg-3'>" +
					"<div id='arrPlandTime'>" + list[i].arrPlandTime + "</div>" +
					"<div id='arrPlaceNm'>" + list[i].arrPlaceNm + "</div></div></div></div><div class='col-lg-4' id='result_price'>" +
					"<div><span>운임: </span>" + list[i].charge + "</div></div></div><hr><div>도착 정보</div><div class='row'>" +
					"<div class='col-lg-8' id='result_info'><div class='row'><div class='col-lg-3'>" +
					"<div id='vihicleNm'>" + list[i].vihicleNm + "</div></div><div class='col-lg-3'>" +
					"<div id='depPlandTime'>" + list[i].depPlandTime + "</div>" +
					"<div id='depPlaceNm'>" + list[i].depPlaceNm + "</div></div><div class='col-lg-2'><div><img src='img/icon/right.svg'></div></div><div class='col-lg-3'>" +
					"<div id='arrPlandTime'>" + list[i].arrPlandTime + "</div>" +
					"<div id='arrPlaceNm'>" + list[i].arrPlaceNm + "</div></div></div></div><div class='col-lg-4' id='result_price'>" +
					"<div id='charge'><span> 운임: </span>" + list[i].charge + "</div></div></div></div>";
					
					$("#ship_result_area").append(all);
					$("#ship_result").show();
				}

			}
			
			////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////////////////////////
			
			else if(type=="train"){
				
				for(var i=0; i<list.length; i++) {
					
					var all = "<div id='result_detail' class='col-lg-12' style='border: 1px solid #2493e0'>" +
					"<div>출발 정보</div><div class='row'><div class='col-lg-8' id='result_info'><div class='row'><div class='col-lg-3'>" +
					"<div id='traingradename'>" + list[i].traingradename + "</div>" +
					"<div id='trainno'>" + list[i].trainno + "</div></div><div class='col-lg-3'>" +
					"<div id='depplandtime'>" + list[i].depplandtime + "</div>" +
					"<div id='depplacename'>" + list[i].depplacename + "</div></div><div class='col-lg-2'><div><img src='img/icon/right.svg'></div></div><div class='col-lg-3'>" +
					"<div id='arrplandtime'>" + list[i].arrplandtime + "</div>" +
					"<div id='arrplacename'>" + list[i].arrplacename + "</div></div></div></div><div class='col-lg-4' id='result_price'>" +
					"<div id='adultcharge'><span>요금 : </span>" + list[i].adultcharge + "</div></div></div><hr>" +
					"<div>도착 정보</div><div class='row'><div class='col-lg-8' id='result_info'><div class='row'><div class='col-lg-3'>" +
					"<div id='traingradename'>" + list[i].traingradename + "</div>" +
					"<div id='trainno'>" + list[i].trainno + "</div></div><div class='col-lg-3'>" +
					"<div id='depplandtime'>" + list[i].depplandtime + "</div>" +
					"<div id='depplacename'>" + list[i].depplacename + "</div></div><div class='col-lg-2'><div><img src='img/icon/right.svg'></div></div><div class='col-lg-3'>" +
					"<div id='arrplandtime'>" + list[i].arrplandtime + "</div>" +
					"<div id='arrplacename'>" + list[i].arrplacename + "</div></div></div></div><div class='col-lg-4' id='result_price'>" +
					"<div id='adultcharge'><span>요금 : </span>" + list[i].adultcharge + "</div></div></div></div>";
					
					$("#train_result_area").append(all);
					$("#train_result").show();
				}
				
				console.log(list[0]);
			}
			
			////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////////////////////////
			
			else if(type=="bus"){
				
				for(var i=0; i<list.length; i++) {
					
					var all = "<div id='result_detail' class='col-lg-12' style='border: 1px solid #2493e0'>" +
					"<div>출발 정보</div><div class='row'><div class='col-lg-8' id='result_info'><div class='row'><div class='col-lg-3'>" +
					"<div id='gradeNm'>" + list[i].gradeNm + "</div></div><div class='col-lg-3'>" +
					"<div id='depPlandTime'>" + list[i].depPlandTime + "</div>" +
					"<div id='depPlaceNm'>" + list[i].depPlaceNm + "</div></div><div class='col-lg-2'><div><img src='img/icon/right.svg'></div></div><div class='col-lg-3'>" +
					"<div id='arrPlandTime'>" + list[i].arrPlandTime + "</div>" +
					"<div id='arrPlaceNm'>" + list[i].arrPlaceNm + "</div></div></div></div><div class='col-lg-4' id='result_price'>" +
					"<div id='charge'><span>요금 : </span>" + list[i].charge + "</div></div></div><hr>" +
					"<div>도착 정보</div><div class='row'><div class='col-lg-8' id='result_info'><div class='row'><div class='col-lg-3'>" +
					"<div id='gradeNm'>" + list[i].gradeNm + "</div></div><div class='col-lg-3'>" +
					"<div id='depPlandTime'>" + list[i].depPlandTime + "</div>" +
					"<div id='depPlaceNm'>" + list[i].depPlaceNm + "</div></div><div class='col-lg-2'><div><img src='img/icon/right.svg'></div></div><div class='col-lg-3'>" +
					"<div id='arrPlandTime'>" + list[i].arrPlandTime + "</div>" +
					"<div id='arrPlaceNm'>" + list[i].arrPlaceNm + "</div></div></div></div><div class='col-lg-4' id='result_price'>" +
					"<div id='charge'><span>요금 : </span>" + list[i].charge + "</div></div></div></div>";
					
					$("#bus_result_area").append(all);
					$("#bus_result").show();
				}
				console.log(list[0]);
			}
			
			////////////////////////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////////////////////////
		}	
		
	</script>
	
</head>

<%@ include file="../header/header.jsp" %>

<body>

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

  <div class="box">
	    <section class="booking_part">
	        <div class="container">
	            <div class="row">
	            
	            	<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            	<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            
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
	                
	                <!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            	<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	                
	                <div class="col-lg-12">
	                    <div class="booking_content">
	                        <div class="tab-content" id="myTabContent">
	                        
	                       		<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            				<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	                        
	                            <div class="tab-pane fade show active" id="flight" role="tabpanel" aria-labelledby="flight-tab">
	                               
	                                <div class="booking_form">
	                                    <form action="#" id="flight_btn_search">
	                                        <div class="form-row">
	                                            <div class="form_colum col-lg-6">
	                                                <input id="air_loc_start" type="search" class="form-control searchinput" name="" placeholder="출발지를 입력하세요" >
	                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                <input id="air_loc_goal" type="search" class="form-control searchinput" name="" placeholder="목적지를 입력하세요">
	                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                 <input id="datepicker_1" placeholder="날짜를 선택하세요"> 
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                 <input id="datepicker_2" placeholder="날짜를 선택하세요"> 
	                                            </div>
	                                            <div class="form_btn col-lg-12">
	                                                <input type="button" class="btn_1 " onclick="search_do('air');" value="Search" style="border-color: transparent;">
	                                            </div>
	                                        </div>
	                                    </form>
	                                </div>
	
	                                <div class="container" id="flight_result">
	                                    <div class="row">
	                                        <div id="air_result_area" class="result_content col-lg-12">
  
	                                        </div>
	                                    </div>
	                                </div>
	
	                            </div>
	                            
	                            <!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            				<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	                            
	                            <div class="tab-pane fade" id="ship" role="tabpanel" aria-labelledby="ship-tab">
	                            
	                            	<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            					<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	                                
	                                <div class="booking_form">
	                                    <form action="ship_search.do" id="ship_btn_search">
	                                        <div class="form-row">
	                                            <div class="form_colum col-lg-6">
	                                                <input type="search" class="form-control searchinput" id="ship_loc_start" placeholder="출발지를 입력하세요" >
	                                                <span id="ship_loc_start" class="glyphicon glyphicon-remove-circle searchclear"></span>
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                <input type="search" class="form-control searchinput" id="ship_loc_goal" placeholder="목적지를 입력하세요">
	                                                <span id="ship_loc_goal" class="glyphicon glyphicon-remove-circle searchclear"></span>
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                 <input id="datepicker_3" id="ship_date_start" placeholder="날짜를 선택하세요"> 
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                 <input id="datepicker_4" id="ship_date_return" placeholder="날짜를 선택하세요"> 
	                                            </div>
	                                            <div class="form_btn col-lg-12">
	                                                <input type="button"  class="btn_1 " onclick="search_do('ship');" value="Search" style="border-color: transparent;">
	                                            </div>
	                                        </div>
	                                    </form>
	                                </div>
	                                
	                                <!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            					<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	
	                                <div class="container" id="ship_result">
	                                    <div class="row">
		                                    <div id="ship_result_area" class="result_content col-lg-12">

		                                    </div>
	                                    </div>
	                                </div>
	
	                            </div>
	
								<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            				<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	
	                            <div class="tab-pane fade" id="train" role="tabpanel" aria-labelledby="train-tab">
	                                <div class="booking_form">
	                                    <form action="#" id="train_btn_search">
	                                        <div class="form-row">
	                                            <div class="form_colum col-lg-6">
	                                                <input type="search" id="train_loc_start" class="form-control searchinput" name="" placeholder="출발지를 입력하세요" >
	                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                <input type="search" id="train_loc_goal" class="form-control searchinput" name="" placeholder="목적지를 입력하세요">
	                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                 <input id="datepicker_5" placeholder="날짜를 선택하세요"> 
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                 <input id="datepicker_6" placeholder="날짜를 선택하세요"> 
	                                            </div>
	                                            <div class="form_btn col-lg-12">
	                                                <input type="button" onclick="search_do('train');" class="btn_1 " value="Search" style="border-color: transparent;">
	                                            </div>
	                                        </div>
	                                    </form>
	                                </div>
	
	                                <div class="container" id="train_result">
	                                    <div class="row">
		                                    <div id="train_result_area" class="result_content col-lg-12">
		                                    </div>
	                                    </div>
	                                </div>
	
	                            </div>
	
								<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            				<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	
	                            <div class="tab-pane fade" id="bus" role="tabpanel" aria-labelledby="bus-tab">
	                                <div class="booking_form">
	                                    <form action="#" id="bus_btn_search">
	                                        <div class="form-row">
	                                            <div class="form_colum col-lg-6">
	                                                <input type="search" id="bus_loc_start" class="form-control searchinput" name="" placeholder="출발지를 입력하세요" >
	                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                <input type="search" id="bus_loc_goal" class="form-control searchinput" name="" placeholder="목적지를 입력하세요">
	                                                <span class="glyphicon glyphicon-remove-circle searchclear"></span>
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                 <input id="datepicker_7" placeholder="날짜를 선택하세요"> 
	                                            </div>
	                                            <div class="form_colum col-lg-6">
	                                                 <input id="datepicker_8" placeholder="날짜를 선택하세요"> 
	                                            </div>
	                                            <div class="form_btn col-lg-12">
	                                                <input type="button" onclick="search_do('bus');" class="btn_1 " value="Search" style="border-color: transparent;">
	                                            </div>
	                                        </div>
	                                    </form>
	                                </div>
	
	                                <div class="container" id="bus_result">
	                                    <div class="row">
		                                    <div id="bus_result_area" class="result_content col-lg-12">                              
		                                    </div>
	                                    </div>
	                                </div>
	
	                            </div>
	                        
	                        	<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            				<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	                        
	                        </div>
	                    </div>
	                </div>
	                
	                <!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	            	<!-- ///////////////////////////////////////////////////////////////////////////////////// -->
	                
	            </div>
	        </div>
	    </section>
	</div>
	
	<script src="resources/js/jquery-1.12.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/gijgo.min.js"></script>
	<script src="resources/js/custom.js"></script>

</body>


</html>









<!-- ////////////////////////////////////////////////////////////////////////////////////////
				/*
				if(air_loc_start.includes("인천") || air_loc_start.includes("dlscjs") ) {
					air_loc_start = "ICN";
				} else if(air_loc_start.includes("김포") || air_loc_start.includes("rlavh") ) {
					air_loc_start = "GMP";
				} else if(air_loc_start.includes("김해") || air_loc_start.includes("rlago") ) {
					air_loc_start = "PUS";
				} else if(air_loc_start.includes("제주") || air_loc_start.includes("wpwn") ) {
					air_loc_start = "CJU";
				} else if(air_loc_start.includes("대구") || air_loc_start.includes("eorn") ) {
					air_loc_start = "TAE";
				} else if(air_loc_start.includes("청주") || air_loc_start.includes("cjdwn") ) {
					air_loc_start = "CJJ";
				} else if(air_loc_start.includes("포항") || air_loc_start.includes("vhgkd") ) {
					air_loc_start = "KPO";
				} else if(air_loc_start.includes("울산") || air_loc_start.includes("dnftks") ) {
					air_loc_start = "USN";
				} else if(air_loc_start.includes("여수") || air_loc_start.includes("dutn") ) {
					air_loc_start = "RSU";
				} else {
					alert("출발지를 확인해주세요 ! 해당 도시는 공항이 없습니다 !")
					return;
				}
				
				if(air_loc_goal.includes("인천") || air_loc_goal.includes("dlscjs") ) {
					air_loc_goal = "ICN";
				} else if(air_loc_goal.includes("김포") || air_loc_goal.includes("rlavh") ) {
					air_loc_goal = "GMP";
				} else if(air_loc_goal.includes("김해") || air_loc_goal.includes("rlago") ) {
					air_loc_goal = "PUS";
				} else if(air_loc_goal.includes("제주") || air_loc_goal.includes("wpwn") ) {
					air_loc_goal = "CJU";
				} else if(air_loc_goal.includes("대구") || air_loc_goal.includes("eorn") ) {
					air_loc_goal = "TAE";
				} else if(air_loc_goal.includes("청주") || air_loc_goal.includes("cjdwn") ) {
					air_loc_goal = "CJJ";
				} else if(air_loc_goal.includes("포항") || air_loc_goal.includes("vhgkd") ) {
					air_loc_goal = "KPO";
				} else if(air_loc_goal.includes("울산") || air_loc_goal.includes("dnftks") ) {
					air_loc_goal = "USN";
				} else if(air_loc_goal.includes("여수") || air_loc_goal.includes("dutn") ) {
					air_loc_goal = "RSU";
				} else {
					alert("도착지를 확인해주세요 ! 해당 도시는 공항이 없습니다 !");
					return;
				}*/

				//////////////////////////////////////////////////////////////////////////////////////// -->