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
<script type="text/javascript">
	//리뷰 작성
	function reviewWrite(){
		var user = $("#userno").val();
		if(user==null){
			alert("리뷰작성은 로그인 후 이용할 수 있습니다.");
			return false;
		} else if($("#tr_content").val()==null || $("#tr_content").val()==""){
			alert("리뷰를 작성해 주세요.")
			return false;
		}
	}
	//리뷰 수정
	function reviewUpdate(){
		if($("#updateContent").val()==null || $("#updateContent").val()==""){
			alert("리뷰를 작성해 주세요.")
			return false;
		}
	}
	//리뷰 삭제
	function reviewDelete(form, url){
		form.action = url;
		form.submit();
	}
	//리뷰 수정시 텍스트박스/완료버튼
	$(function(){
		$(".updateBtn").click(function(){
			var tr_content = $(this).parent().parent().next().children().text();
			$(this).parent().parent().next().children().replaceWith("<textarea class='form-control w-100' cols='30' rows='9' name='tr_content' id='updateContent'>"+tr_content+"</textarea>");
			$(this).replaceWith("<input type='submit' class='btn btn-sm btn-outline-primary' value='완료' formaction='tripplace_review_update.do'>");	
		});
	});
	
	//여행지 좋아요 클릭
	function likeInfo(){
		var user = $("#userno").val();
		var contentid = $("#tr_contentid").val();
		var lt_title = $("#contentTitle").text();
		var lt_firstimage = $("#contentImage").attr("src");
		var like = {
				"lt_contentid" : contentid,
				"lt_userno" : user,
				"lt_title" : lt_title,
				"lt_firstimage" : lt_firstimage
				}
		if(user==null){
			
			alert("좋아요는 로그인 후 이용할 수 있습니다.");
			return false;
			
		}else if($("#iconA").children().attr("class")=="far fa-heart fa-lg") {
			
			$.ajax({
				url: "tripplace_like.do",
				method: "POST",
				data: JSON.stringify(like),
				contentType: "application/json",
				dataType: "json",
				success: function(data){
					if(data.msg1 != null){
						$("#iconA").next().text(" 좋아요"+ data.likeCount+"개");
						$("#iconA").replaceWith(data.msg1);
					}else {
						alert(data.msg2);
					}
				},
				error: function(){
					alert("통신 실패");
				}
			});
			
		} else if( $("#iconB").children("i").attr("class")=="fas fa-heart fa-lg" ){
			$.ajax({
				url: "tripplace_like_cancel.do",
				method: "POST",
				data: JSON.stringify(like),
				contentType: "application/json",
				dataType: "json",
				success: function(data){
					if(data.msg1 != null){
						$("#iconB").next().text(" 좋아요"+ data.likeCount+"개");
						$("#iconB").replaceWith(data.msg1);
					}else {
						alert(data.msg2);
					}
				},
				error: function(){
					alert("통신 실패");
				}
			});
			
		}
		
	}
	
</script>


</head>

<body>
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 

    <section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 posts-list">
                    <div class="single-post">
                        <div class="feature-img">
                        	<c:choose>
                        		<c:when test="${empty dto.firstimage }">
                        			<img src="resources/img/nullImage.png">
                        		</c:when>
	                        	<c:otherwise>
	                            	<img class="img-fluid" id="contentImage" src="${dto.firstimage }" alt="장소사진">                       	
	                        	</c:otherwise>
                        	</c:choose>
                        </div>
                        <div class="blog_details">
	                        <div style="position:absolute">
	                            <h2 id="contentTitle">${dto.title }</h2>
	                        </div>
	                        <div style="float:right; position:relative; padding-right:25px;">
	                            <a href="#reviewArea"><i class="far fa-comments fa-lg"></i><span style="font-size:15px; margin-right:10px;">&nbsp ${reviewCount }개의 리뷰</span></a>
	                            <c:choose>
	                            	<c:when test="${empty user }">
			                            <a href="#" onclick="return likeInfo();" style="cursor:hand;" class="like-info"><i class="far fa-heart fa-lg"></i></a><span style="font-size: 15px;">&nbsp 좋아요 ${likeCount }개</span>
	                            	</c:when>
	                            	<c:when test="${empty likeUser }">
			                            <a href="#" onclick="return likeInfo();" style="cursor:hand;" class="like-info" id="iconA"><i class="far fa-heart fa-lg"></i></a><span style="font-size: 15px;">&nbsp 좋아요 ${likeCount }개</span>
	                            	</c:when>
	                            	<c:when test="${not empty likeUser }">
			                            <a href="#" onclick="return likeInfo();" style="cursor:hand;" class="like-info" id="iconB"><i class="fas fa-heart fa-lg"></i></a><span style="font-size: 15px;">&nbsp 좋아요 ${likeCount }개</span>
	                                </c:when>
	                            </c:choose>
	                        </div>
	                        <br><br>
                            <p>주소: (${dto.zipcode }) ${dto.addr1 } ${dto.addr2 }</p>
                            <p>전화번호: ${dto.tel }</p>
                            <p>홈페이지: ${dto.homepage }</p>
                            <p><strong>-분류</strong>&nbsp; &nbsp;${dto.cat1 } > ${dto.cat2 } > ${dto.cat3 }</p>
         					
                            <div class="quote-wrapper">
                                <div class="quotes">
                                   		${dto.overview }
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr style="margin: 50px 0px">
                    <div>
                    	<h5>블로그 후기</h5>
	                    <c:forEach items="${blog }" var="dto">
		                    <div class="blog-author" style="margin-top: 20px;">
		                        <div class="media align-items-center">
		                            <div class="media-body">
		                                <a href="${dto.link }">
		                                    <h4>${dto.title }</h4>
		                                </a>
		                                <p>${dto.description }</p>
		                            </div>
		                        </div>
		                    </div>
	                    </c:forEach>
                    </div>
                    <div class="comments-area" id="reviewArea">
                        <h4>사용자 후기</h4>
                        <div class="comment-list">
                           	<c:choose>
                           		<c:when test="${empty review }">
	                            	<div class="single-comment justify-content-between d-flex">
	                            		<div class="user justify-content-between d-flex">
	                                    	<div class="desc">
		                                        <p class="comment"> 등록된 리뷰가 없습니다.</p>
		                                    </div>
	                                	</div>
                                	</div>
                            	</c:when>
                            	<c:otherwise>
	            					<c:forEach items="${review }" var="list">
										<form method="post" onsubmit="return reviewUpdate()">
		            						<div class="container">  
										        <div class="row">
										            <div class="col-lg-2">
										                <div class="profile">
										                    <img src="uploadfile/${list.profile_dto.pf_name}${list.profile_dto.pf_type}" onerror="this.src='resources/img/none_profile.png'"alt="" style="width: 70px; height: 70px;">
										                </div>
										            </div>
										            <div class="col-lg-10">
										            	<div class="row">
												            <div class="col-lg-8">
												                <div class="user">
												                    <span style="color:gray">${list.user_dto.user_name } </span> ·
												                    <span style="color:gray" id="tr_date">${list.tr_date }</span>
												                </div>
												            </div>
												            <c:if test="${user.user_no eq list.tr_userno }">
													            <div class="col-lg-4">
													                <div class="user_button" style="text-align:right;">
													                	<input type="hidden" name="tr_contentid" value=${dto.contentid }>
													                	<input type="hidden" name="tr_no" value="${list.tr_no }">
													                	<input type="hidden" name="title" value="${dto.title }">
													                	<input type="button" class="btn btn-sm btn-outline-primary updateBtn" value="수정">
													                	<input type="button" class="btn btn-sm btn-outline-danger" value="삭제"  onclick="reviewDelete(this.form, 'tripplace_review_delete.do');">
													            	</div>
												            	</div>
												            </c:if>
												            <div class="col-lg-12" style="padding: 15px;">
												            	<p>${list.tr_content }</p>
												            </div>
											        	</div>
											        </div>
										        </div>
										    </div>
										</form>
	                            	</c:forEach>
                            	</c:otherwise>
                           	</c:choose>
						</div>
                    </div>
                    <div class="comment-form">
                        <h4>리뷰쓰기</h4>
                        <form action="tripplace_review_form.do" method="post" onsubmit="return reviewWrite();">
                        	<div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                    	<input type="hidden" name="tr_contentid" id="tr_contentid" value=${dto.contentid }>
                                    	<input type="hidden" name="title" value="${dto.title }">
                                    	<input type="hidden" name="tr_userno" value=${user.user_no } id="userno">
                                        <textarea class="form-control w-100" name="tr_content" id="tr_content" cols="30" rows="9" placeholder="리뷰를 작성해 주세요."></textarea>
                                        <input type="submit" class="button button-contactForm btn_1" value="작성" style="margin-top: 20px; float: right;">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar" >
                        <aside class="single_sidebar_widget search_widget">
               				<div id="map" style="width:100%; height:200px;"></div>
               				<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=724b81fc00a64486288dc0698b9a4edd"></script>
				            <script type="text/javascript">
				            var mapContainer = document.getElementById('map'),
				              
				            mapOption = { 
				                center: new kakao.maps.LatLng(${dto.mapy }, ${dto.mapx }),
				                level: 8
				            };
				              
				            var map = new kakao.maps.Map(mapContainer, mapOption);
				              
				            var mapTypeControl = new kakao.maps.MapTypeControl();
				
				            map.addControl(mapTypeControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
				              
				            var markerPosition  = new kakao.maps.LatLng(${dto.mapy }, ${dto.mapx }); 
				            var marker = new kakao.maps.Marker({
				                position: markerPosition
				            });
				            marker.setMap(map);
				            
				            var iwContent = '<div style="padding:5px; text-align:center;"><b>${dto.title }</b><br>'
				              		+'<a href="https://map.kakao.com/link/map/${dto.title },${dto.mapy },${dto.mapx }" target="_blank">'
				              		+'<span style="color:blue;">큰지도보기</span></a>'
				              		+'<a href="https://map.kakao.com/link/to/${dto.title },${dto.mapy },${dto.mapx }" target="_blank">'
				              		+' <span style="color:blue;">길찾기</span></a></div>',
				              	iwPosition = new kakao.maps.LatLng(${dto.mapy }, ${dto.mapx });

					        var infowindow = new kakao.maps.InfoWindow({
					            position : iwPosition, 
					            content : iwContent 
					        });
					        
					        infowindow.open(map, marker);
							</script>
                        </aside>
                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">더보기</h4>
                            <ul class="list cat-list">
                                <li><a href="tripplace_close_place.do?type=32&mapx=${dto.mapx }&mapy=${dto.mapy }" class="d-flex"><p>주변 호텔</p></a></li>
                                <li><a href="tripplace_close_place.do?type=39&mapx=${dto.mapx }&mapy=${dto.mapy }" class="d-flex"><p>주변 음식점</p></a></li>
                                <li><a href="tripplace_close_place.do?type=28&mapx=${dto.mapx }&mapy=${dto.mapy }" class="d-flex"><p>주변 레포츠</p></a></li>
                            </ul>
                        </aside>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    
    <!-- jquery plugins here-->

    <script src="resources/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="resources/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="resources/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="resources/js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="resources/js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="resources/js/jquery.form.js"></script>
    <script src="resources/js/jquery.validate.min.js"></script>
    <script src="resources/js/mail-script.js"></script>
    <script src="resources/js/contact.js"></script>
    <!-- custom js -->
    <script src="resources/js/custom.js"></script>
</body>

</html>