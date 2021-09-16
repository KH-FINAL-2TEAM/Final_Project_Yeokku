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


    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
  //검색설정
	function check(){
			var keyword = $("#keyword").val().trim();
			
			if(keyword=='' || keyword==null || keyword.length<2){
				alert("검색어를 두글자 이상 입력해주세요.");
				
				return false;
			}//여기에 ajax로 url=endpoint해서 성공하면 json/xml값을 컨트롤러로 return해주는 방법 생각해볼것 
	}

	//지역 설정
    $.ajax({
  	  url: "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=ZQscfOiocZrQpK8kXr9QPPdHPfyhCNoAZ8fMA%2BO83K3x1rrMn8AL%2FP%2FvKnQghMb8XezP4cqE%2Fpree8FPMqfdwQ%3D%3D&numOfRows=17&MobileOS=ETC&MobileApp=AppTest&_type=json",
  	  method: "GET",
  	  success: function(msg){
  		  $("#sido").append("<option value=''>시/도 선택</option>")
  		  
            var mySido = msg.response.body.items.item;
  		  
            for(var i=0; i<mySido.length; i++){
            	$("#sido").append("<option value='"+mySido[i].code+"'>"+ mySido[i].name + "</option>");
            }
            
            $("#sido").next().append("<option value='''>구/군 선택</option>");
            
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
            				$("#gugun").append("<option value=''>구/군 선택</option>");
            			} else if(areaCode == 8){
            				$("#gugun option").remove();
            				$("#gugun").append("<option value='"+myGugun.code+"'>" + myGugun.name + "</option>");	
            			} else{
	            			$("#gugun option").remove();
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
    
    .btn_2 {
    	text-align: center;
    }   

    .btn_1, .btn_2 {
        border: 0px;
        width: 100%;
        margin-top: 20px;
    }
  
    .btn_1:hover, .btn_2:hover{
        border: #38A4FF;
        color: white;
        background-color: #38A4FF;
        text-decoration: none;
    }
    
    .result_option {
    	padding: 30px 0px;
    	font-size: 25px;
    	text-align: left;
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
	
	.single_place img {
		width: 100%;
		max-height: 350px;
	}
	
	
    </style>
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
	
	<!-- 배너 -->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>여행지</h2>
                            <p>경기도 가평시</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
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
	                            <b>검색어</b><br>
	                            <input type="text" name="keyword" class="keyword" id="keyword">
	                            <input type="submit" value="Search" class="btn_1">
	                        </form>
                    </div>
                </div>
			</div>
		</div>
	</section>
	<!-- 검색 end -->
	
	
	
	
	<!-- 검색 결과 start -->
	<section class="top_place">
		<div class="container text-center">
			<div class="result_option">
				<form method="post">
					<input type="hidden" name="contentTypeId" value="${dto.contentTypeId }">
					<input type="hidden" name="areaCode" value="${dto.areaCode }">
					<input type="hidden" name="sigunguCode" value="${dto.sigunguCode }">
					<input type="hidden" name="keyword" value="${dto.keyword }">
					<input type="submit" value="이름순" formaction="tripplace_result_form.do?arrange=A" class="btn btn-link">
					<input type="submit" value="인기순" formaction="tripplace_result_form.do?arrange=B" class="btn btn-link">
					<input type="submit" value="최신순" formaction="tripplace_result_form.do?arrange=C" class="btn btn-link">
					<input type="submit" value="지도로 보기" formaction="tripplace_map_form.do" class="btn btn-primary">
				</form>
            </div>
            <div class="row">
	            <c:choose>
	            	<c:when test="${empty list }">
			                <div class="col-lg-6 col-md-6">
			                    <div class="single_place">
			                        <h3>검색결과가 없습니다.</h3>
	                            </div>
	                        </div>
	            	</c:when>
	            	<c:otherwise>
	            		<c:forEach items="${list }" var="dto">
	            			<div class="col-lg-6 col-md-6">
			                    <div class="single_place">
			                    	<c:choose>
			                    		<c:when test="${empty dto.firstimage }">
			                    			<img src="resources/img/nullImage.png">
			                    			<div class="hover_Text d-flex align-items-end justify-content-between">
				                            	<div class="hover_text_iner">
				                                <a href="tripplace_detail_form.do?contentid=${dto.contentid }" class="place_btn">자세히 보기</a>
				                    				<h3>${dto.title }</h3>
				                    				<p>${dto.addr1 }</p>
			                    				</div>
			                    			</div>
			                    		</c:when>
			                    		<c:otherwise>
			                    			<img src="${dto.firstimage }">
			                    			<div class="hover_Text d-flex align-items-end justify-content-between">
					                            <div class="hover_text_iner">
					                                <a href="tripplace_detail_form.do?contentid=${dto.contentid }" class="place_btn">자세히 보기</a>
					                                <h3>${dto.title }</h3>
					                                <p>${dto.addr1 }</p>
					                            </div>
					                        </div>
			                    		</c:otherwise>
			                    	</c:choose>
			                    </div>
			                </div>
	            		</c:forEach>
	            	</c:otherwise>
	            </c:choose>
            </div>
            
            
		<%-- <div class="container">
			<div class="row">
				<div class="col">
					<ul class="pagination">
					
					<%	int totalPage = (int)request.getAttribute("totalPage");
						int startPage = (int)request.getAttribute("startPage");
						int endPage = (int)request.getAttribute("endPage");
						int currentPage = (int)request.getAttribute("currentPage"); 
						System.out.println("\njsp 파라미터: "+totalPage+", "+startPage+","+endPage+","+currentPage);%>
					
						<c:if test="${not empty list }">
						<%if(startPage>10){%>
								<li class="page-item"><a class="page-link" href="result.jsp?page=<%=startPage-10%>">Previous</a></li>
							<%	
							}
							if(endPage > totalPage){ endPage=totalPage; }
							System.out.println("endPage: "+endPage);
							for(int i=startPage; i<=endPage; i++){%>
								<li class="page-item"><a class="page-link" href="result_form.do?page=<%=i%>"><%=i %></a></li>
							<%
							}
							
							if(endPage<totalPage){%>
								<li class="page-item"><a class="page-link" href="result.jsp?page=<%=startPage+10%>">Next</a></li>
								
							<%
							} %>
							</c:if>
					
					
					</ul>
				</div>
			</div>
		</div> --%>
                
        </div>
    </section>
    <!-- 검색결과 end -->
    
    
    
    
    
    

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
                            <form target="_blank"
                                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                method="get" class="form-inline">
                                <input class="form-control" name="EMAIL" placeholder="Your Email Address"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '"
                                    required="" type="email">
                                <button class="click-btn btn btn-default text-uppercase"> <i class="far fa-paper-plane"></i>
                                </button>
                                <div style="position: absolute; left: -5000px;">
                                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value=""
                                        type="text">
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
                        <p>4156, New garden, New York, USA
                                +880 362 352 783</p>
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