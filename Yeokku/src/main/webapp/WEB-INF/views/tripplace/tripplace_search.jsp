<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
   <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
    <link rel="icon" href="<c:url value="/resources/img/favicon.png"/>">
    <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
    <!-- animate CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css" />">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="<c:url value= "/resources/css/owl.carousel.min.css" />">
    <!-- themify CSS -->
    <link rel="stylesheet" href="<c:url value= "/resources/css/themify-icons.css" />">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="<c:url value= "/resources/css/flaticon.css" />">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="<c:url value= "/resources/css/fontawesome/css/all.min.css" />">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="<c:url value= "/resources/css/magnific-popup.css" />">
    <link rel="stylesheet" href="<c:url value= "/resources/css/gijgo.min.css" />">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/nice-select.css" />">
    <!-- slick CSS -->
    <link rel="stylesheet" href="<c:url value= "/resources/css/slick.css" />">
    <!-- style CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
	    
	
    
  //지역 설정
    $.ajax({
  	  url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=ZQscfOiocZrQpK8kXr9QPPdHPfyhCNoAZ8fMA%2BO83K3x1rrMn8AL%2FP%2FvKnQghMb8XezP4cqE%2Fpree8FPMqfdwQ%3D%3D&numOfRows=17&MobileOS=ETC&MobileApp=AppTest&_type=json",
  	  method: "GET",
  	  success: function(msg){
  		  $("#sido").append("<option value=''>시/도 선택</option>")
  		  
            var mySido = msg.response.body.items.item;
  		  	console.log(mySido);
  		  	$("#sido").append("<option value=''>전체</option");
            for(var i=0; i<mySido.length; i++){
            	$("#sido").append("<option value='"+mySido[i].code+"'>"+ mySido[i].name + "</option>");
            }
            
            $("#sido").next().append("<option value=''>구/군 선택</option>");
            
            $("#sido").change(function(){
            	
			    var areaCode = $("#sido").val();
			    
            	$.ajax({
            		url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=ZQscfOiocZrQpK8kXr9QPPdHPfyhCNoAZ8fMA%2BO83K3x1rrMn8AL%2FP%2FvKnQghMb8XezP4cqE%2Fpree8FPMqfdwQ%3D%3D&numOfRows=50&areaCode="+areaCode+"&MobileOS=ETC&MobileApp=AppTest&_type=json",
            		method: "GET",
            		dataType: "json",
            		success: function(obj){
            			console.log(obj);
            			var myGugun = obj.response.body.items.item;
            			
            			if(areaCode == 0){
            				$("#gugun option").remove();
            				$("#gugun").append("<option value='' selected>구/군 선택</option>");
            			} else if(areaCode == 8){
            				$("#gugun option").remove();
            				$("#gugun").append("<option value='"+myGugun.code+"'>" + myGugun.name + "</option>");	
            			} else{
	            			$("#gugun option").remove();
	            			$("#gugun").append("<option value=''>전체</option");
	            			for(var j=0; j<myGugun.length; j++){
	            				$("#gugun").append("<option value='"+myGugun[j].code+"'>" + myGugun[j].name + "</option>");
	            			}
            			}
            		}
            	});
            });
  	  }	  
  	});
	  	
	  	
	  	
    	
   		
    </script>
   
    <style type="text/css">
      
	.search_part, .top_place {
		margin-top: 30px;
		padding: 20px 0px;
	}
      
    #sido, #gugun {
            width: 100%;
            padding: .8em .5em;
            border: 1px solid cornflowerblue;
            font-family: inherit;
            background: url('arrow.jpg') no-repeat 95% 50%;
            border-radius: 0px;
            
            }
           
    .kind_select{
            width: 100%;
            padding: .8em .5em;
            border: 1px solid cornflowerblue;
            font-family: inherit;
            background: url('arrow.jpg') no-repeat 95% 50%;
            border-radius: 0px;
    }     
    
    .keyword{
            width: 100%;
            padding: .8em .5em;
            border: 1px solid cornflowerblue;
            font-family: inherit;
            background: url('arrow.jpg') no-repeat 95% 50%;
            border-radius: 0px;
    }       

    .btn_1{
        border: 0px;
        width: 100%;
        margin-top: 20px;
    }
  
    .btn_1:hover{
        border: #38A4FF;
        color: white;
        background-color: #38A4FF;
    }
    
   	.single_place img {
		width: 100%;
		max-height: 350px;
	}

    
    </style>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 

    <!-- 배너 start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>여행지</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 배너 end-->
    
        
    <!-- 검색 start-->
    <section class="search_part">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle">
	                        <form action="tripplace_result_form.do" method="post" onsubmit="return check();" accept-charset="utf-8">
	                        
	                            <b>분류</b><br>
	                            <select name="contentTypeId" id="contentTypeId" class="kind_select">
	                                <option value="">전체</option>
	                                <option value="12">관광지</option>
	                                <option value="14">문화시설</option>
	                                <option value="15">행사/공연/축제</option>
	                                <option value="28">레포츠</option>
	                                <option value="32">숙박</option>
	                                <option value="38">쇼핑</option>
	                                <option value="39">음식점</option>
	                            </select>
	
	                            <br><br>
	                            <b>지역</b><br>
	                            <select name="areaCode" id="sido" ></select>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <select name="sigunguCode" id="gugun" ></select>
	
	                            <br><br>
	                            <input type="submit" value="Search" class="btn_1">
	                        </form>
                    </div>
                </div>
			</div>
		</div>
	</section>

            
            
	<!-- 인기장소 start -->
	<section class="top_place">
		<div class="container text-center">
			<div class="section_tittle text-center">
            	<h2>여꾸 인기장소</h2>
            	<p>Best Place </p><!--index.html에서 선택한 지역이름 나타내주기-->
            </div>
            <div class="row">
	            		<c:forEach items="${list }" var="dto">
	            			<div class="col-lg-6 col-md-6">
			                    <div class="single_place">
			                    	<c:choose>
			                    		<c:when test="${empty dto.firstimage }">
			                    			<img src="resources/img/nullImage.png">
			                    			<div class="hover_Text d-flex align-items-end justify-content-between">
				                            	<div class="hover_text_iner">
				                            	<form action="tripplace_detail_form.do" method="post">
							                            <input type="hidden" name="contentid" value="${dto.contentid }">
							                            <input type="hidden" name="userno" value="${user.user_no }">
							                            <input type="hidden" name="title" value="${dto.title }">
							                            <input type="submit" class="place_btn" style="border:0px" value="자세히 보기">
					                            	</form>
				                    				<h3>${dto.title }</h3>
				                    				<p>${dto.addr1 }</p>
			                    				</div>
			                    			</div>
			                    		</c:when>
			                    		<c:otherwise>
			                    			<img src="${dto.firstimage }">
			                    			<div class="hover_Text d-flex align-items-end justify-content-between">
					                            <div class="hover_text_iner">
					                            	<form action="tripplace_detail_form.do" method="post">
							                            <input type="hidden" name="contentid" value="${dto.contentid }">
							                            <input type="hidden" name="userno" value="${user.user_no }">
							                            <input type="hidden" name="title" value="${dto.title }">
							                            <input type="submit" class="place_btn" style="border:0px" value="자세히 보기">
					                            	</form>
					                                <h3>${dto.title }</h3>
					                                <p>${dto.addr1 }</p>
					                            </div>
					                        </div>
			                    		</c:otherwise>
			                    	</c:choose>
			                    </div>
			                </div>
	            		</c:forEach>
            </div>
        </div>
    </section>
    <!-- 인기장소 end -->




<!-- jquery plugins here-->
    <script src="../../resources/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="../../resources/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="../../resources/js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="../../resources/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="../../resources/js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="../../resources/js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="../../resources/js/jquery.nice-select.min.js"></script>
    <script src="../../resources/js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="../../resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="../../resources/js/jquery.form.js"></script>
    <script src="../../resources/js/jquery.validate.min.js"></script>
    <script src="../../resources/js/mail-script.js"></script>
    <script src="../../resources/js/contact.js"></script>
    <!-- custom js -->
    <script src="../../resources/js/custom.js"></script>
</body>
	<!-- footer 추가 -->
	<%@ include file="../footer/footer.jsp" %>
</html>