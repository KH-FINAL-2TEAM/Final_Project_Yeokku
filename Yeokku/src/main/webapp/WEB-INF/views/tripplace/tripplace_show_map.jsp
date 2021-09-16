<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
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

    <style type="text/css">
        .star_rating {font-size:0; letter-spacing:-4px;}

        .star_rating a {
            font-size:22px;
            letter-spacing:0;
            display:inline-block;
            margin-left:5px;
            color:#ccc;
            text-decoration:none;
        }
        .star_rating a:first-child {margin-left:0;}
        .star_rating a.on {color:#777;}

         
        .detail_a{
           
            color: white;
            text-decoration: none;
            background-color: #150072;
            padding: 10px; 
            margin: 0px;
            float: right;
            display: inline-block; 
            
            width: 150px;
            text-align: center;
            
            
	    } 
	
        .detail_a:hover{
            background-color: #6353aa;
            text-decoration: none;
            
        }
        
        #overview {
         	background-color: #e6ffff;
			display: -webkit-box;
			white-space: normal;
			line-height: 30px;
			height: 210px;
			word-wrap: break-word;
			-webkit-line-clamp: 7;
			-webkit-box-orient: vertical;
			overflow: hidden;
		}
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../header/header.jsp" %> 
	
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>지도로 보기</h2>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">
			<div class="d-none d-sm-block mb-5 pb-4">
				<script>
					function initMap() {
						var uluru = {
						    lat: -25.363,
						    lng: 131.044
						};
						var grayStyles = [{
						    featureType: "all",
						    stylers: [{
						        saturation: -90
						    }, {
						        lightness: 50
						    }]
						}, {
						    elementType: 'labels.text.fill',
						    stylers: [{
						        color: '#ccdee9'
						    }]
						}];
					}
              </script>
              
              <!--카카오맵-->
              <div id="map" style="width:100%;height:480px; margin-bottom:20px"></div>
              <p><button onclick="setBounds()" class="btn btn-warning">검색 결과 위치로 이동</button></p>
              <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=724b81fc00a64486288dc0698b9a4edd"></script>
              <script type="text/javascript">
              var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
              
              
              mapOption = { 
                  center: new kakao.maps.LatLng(37.5546004596746, 126.97063750463796), // 지도의 중심좌표
                  level: 11 // 지도의 확대 레벨
              };
              
              var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
              
           		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
              var mapTypeControl = new kakao.maps.MapTypeControl();

              // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
              // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
              map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

              // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
              var zoomControl = new kakao.maps.ZoomControl();
              map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
              
				// 마커를 표시할 위치와 title 객체 배열입니다 
              var positions = [
            	  <c:forEach items="${list }" var="dto">
            	  {
                      content: '<div class="content" style="padding:5px;">${dto.title }</div>',
                      latlng: new kakao.maps.LatLng(${dto.mapy }, ${dto.mapx }),
                      contentid: ${dto.contentid }
                  },
	  	          </c:forEach>
              ];
				
	           // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	           var bounds = new kakao.maps.LatLngBounds();    
	           
              
              for (var i = 0; i < positions.length; i ++) {
            	    // 마커를 생성합니다
            	    var marker = new kakao.maps.Marker({
            	        map: map, // 마커를 표시할 지도
            	        position: positions[i].latlng // 마커의 위치
            	    });
					
	              	marker.setClickable(true);
	              	marker.id = positions[i].contentid; // object extension
	              	
            	    // 마커에 표시할 인포윈도우를 생성합니다 
            	    var infowindow = new kakao.maps.InfoWindow({
            	        content: positions[i].content // 인포윈도우에 표시할 내용
            	    });
            	    
            	 	// LatLngBounds 객체에 좌표를 추가합니다
            	    bounds.extend(positions[i].latlng);
            	    
            	    
            	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
            	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
            	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
            	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

            	    kakao.maps.event.addListener(marker, 'click', function() { 
            	    	$.ajax({
            	    		url: "tripplace_marker_click.do",
            	    		method: "POST",
            	    		data: "contentid="+this.id,
            	    		dataType: "json",
            	    		success: function(data){
            	    			console.log(data.title);
            	    			var info = "<h2>"+data.title+"</h2>"
            	    						+"<p id='overview'>"+data.overview+"</p>"
			                                +"<a href='tripplace_detail_form.do?contentid="+data.contentid+"' class='btn btn-primary float-right'>자세히보기</a>"
			                                
            	    			$(".img_div *").remove();
            	    			$(".info_div *").remove();
            	    			$(".img_div").append("<img src='"+data.firstimage+"'>");
			                    $(".info_div").append(info); 		
            	    		},
            	    		error: function(){
            	    			alert("통신실패");
            	    		}
            	    	});
            	    });
            	    
            	}
            	// 인포윈도우 표시 
            	 function makeOverListener(map, marker, infowindow) {
            	    return function() {
            	        infowindow.open(map, marker);
            	    };
            	}
            	// 인포윈도우 닫기
            	function makeOutListener(infowindow) {
            	    return function() {
            	        infowindow.close();
            	    };
            	} 
            	//지도범위 재설정
            	function setBounds() {
            	    map.setBounds(bounds);
            	}
              </script>
            </div>

            <div class="row">
                <div class="col-12">
                    <h2 class="contact-title">희망하는 장소를 클릭해주세요</h2>
                </div>
                 
                <!--추가-->
                <div class="map_div" style="width: 100%; height: 300px; padding: 20px">
                    <div class="img_div" style="width:40%; height: 100%; float: left;"></div>
                    <div class="info_div" style="width: 60%; height: 100%; float: right; padding-left: 20px"></div>
                 </div>        
            </div>
        </div>
    </section>
    
    
    
    

    <!-- footer part start-->
    <footer class="footer-area">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6 col-md-5">
                    <div class="single-footer-widget">
                        <h4>Discover Destination</h4>
                        <ul>
                            <li><a href="#">Miami, USA</a></li>
                            <li><a href="#">California, USA</a></li>
                            <li><a href="#">London, UK</a></li>
                            <li><a href="#">Saintmartine, Bangladesh</a></li>
                            <li><a href="#">Mount Everast, India</a></li>
                            <li><a href="#">Sidney, Australia</a></li>
                            <li><a href="#">Miami, USA</a></li>
                            <li><a href="#">California, USA</a></li>
                            <li><a href="#">London, UK</a></li>
                            <li><a href="#">Saintmartine, Bangladesh</a></li>
                            <li><a href="#">Mount Everast, India</a></li>
                            <li><a href="#">Sidney, Australia</a></li>
                        </ul>

                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="single-footer-widget">
                        <h4>Subscribe Newsletter</h4>
                        <div class="form-wrap" id="mc_embed_signup">
                            <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">
                                <input class="form-control" name="EMAIL" placeholder="Your Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" required="" type="email">
                                <button class="click-btn btn btn-default text-uppercase"> <i class="far fa-paper-plane"></i>
                                </button>
                                <div style="position: absolute; left: -5000px;">
                                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                                </div>

                                <div class="info"></div>
                            </form>
                        </div>
                        <p>Subscribe our newsletter to get update news and offers</p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="single-footer-widget footer_icon">
                        <h4>Contact Us</h4>
                        <p>4156, New garden, New York, USA +880 362 352 783</p>
                        <span>contact@martine.com</span>
                        <div class="social-icons">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                            <a href="#"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer part end-->

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

</html>