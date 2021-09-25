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
    
    <style type="text/css">
    	.traffic_tb{
  			font-size: 16px;
  			border: 1px solid #bbdefb;
  			margin-top: 10px; 
		}
		
		.traffic_tb tr{
			height: 50px;
			border-bottom: 1px solid #bbdefb;
		}
		
    	.traffic_tb th{
    		text-align: center;
  			background-color: #e3f2fd;
		}
    	.traffic_tb td{
  			padding-left: 30px;
		}
		
    </style>
    
    
    
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
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <a class="contact_a" href="traffic.do">오시는 길</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-8">
                    <h2 class="contact-title">찾아오시는 길</h2>
					<div id="map" style="width:100%;height:350px;"></div>
					<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=724b81fc00a64486288dc0698b9a4edd"></script>
					<script type="text/javascript">
						var mapContainer = document.getElementById('map'), 
    						
						mapOption = {
								center: new kakao.maps.LatLng(37.49898970067072, 127.03284078311904), 
								level: 3
						};  

						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						var markerPosition  = new kakao.maps.LatLng(37.49898970067072, 127.03284078311904); 
			            var marker = new kakao.maps.Marker({
			                position: markerPosition
			            });
						marker.setMap(map);
					</script>
					<table class="traffic_tb">
						<colgroup>
                            <col width="200px"/>
                            <col width="550px"/>
                        </colgroup>
						<tr>
							<th>주소</th>
							<td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F <br>(T: 1544-9970 / F: 02-562-2378)</td>
						</tr>
						<tr>
							<th>지하철</th>
							<td>지하철 2호선 역삼역 3번출구 100m</td>
						</tr>
						<tr>
							<th>버스</th>
							<td>
								역삼역.포스코P&S타워 정류장<br>
								<img alt="지선" src="<c:url value="/resources/img/sub01_06_busB.jpg" />">
								 146 / 740 / 341 / 360 &nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="간선" src="<c:url value="/resources/img/sub01_06_busR.jpg" />">
								 1100 / 1700 / 2000 / 7007 / 8001 
							</td>
						</tr>
					</table>
                    <div></div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Header part end-->
	<!-- footer 추가 -->
	<%@ include file="../footer/footer.jsp" %>

    
</body>
</html>