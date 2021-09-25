<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="resources/css/mypage.css">
    <script src="resources/js/cropper.js"></script>
    <title>Document</title>
    
<script>
	$(function(){
		$(".url-copy").click(function(){
			$(this).next().attr("type","text");
			$(this).next().select();
			var success = document.execCommand("copy");
			$(this).next().attr("type","hidden");
			if(success){
				alert("링크가 복사되었습니다. 함께하고 여행가고 싶은사람과 공유해보세요.");
			}
		});
	});


</script>    
    
<style type="text/css">
	.course-content{
		margin-top: 50px;
		padding: 100px;
		align-items: center;
		justify-content: center;
	}
	.mycourse{
		width: 750px;
	}
	.url-copy{
		border: 1px solid white;
		background-color: #2493e0;
		color: white;
		border-radius: 5px;
	}
	.c_url{
		text-decoration: none;
		color: #2493e0;
		font-size: 20px;
		font-weight: 500;	
	}
	.mycourse th{
  		text-align: center;
  		font-size: 16px;
  		border-bottom: 1px solid black;
	}
	
	.mycourse tr{
  		height: 35px;
	}

	.mycourse td{
  		border-bottom: 1px solid #f0e9ff;
	}

	.mycourse td:nth-child(1) a{
  		margin-left: 30px;
  		text-decoration: none;
  		color: #2493e0;
	}
	.mycourse td:nth-child(2){
		padding-left: 40px;
	}

	.mycourse td:nth-child(3){
  		text-align: center;
	}
	
</style>


    
</head>
<body>
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
	
    <div class="conta">

        <section class="profile_section breadbox_bg breadbox">
            <div class="profile">
                    <div class="profile_div">
                        <div class="profile_img_div">
                            <img src="uploadfile/${profile.pf_name}${profile.pf_type}" onerror="this.src='resources/img/none_profile.png'" class="profile_img" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        </div>
                        <p class="profile_name">닉네임</p>
                    </div>
                    <h1>여행코스</h1>
            </div>
        </section>

	
        <nav class="nav">
            <div class="navbar">
                <ul>
                    <li><a href="mypage_profile_form.do">회원정보</a></li>
                    <li><a href="mypage_travel_form.do">여행지</a></li>
                    <li class="selected_nav"><a href="mycourseform.do?nowPage=1">여행코스</a></li>
                    <li><a href="mypage_review_form.do">리뷰</a></li>
                    <li><a href="mypage_qna.do">문의내역</a></li>
                </ul>
            </div>
        </nav>


        <section class="list_nav">
            <div class="course-content">
            	<h3 style="padding-left: 32px;">나만의 여행코스</h3>
				<table class="mycourse" style="margin-left: 250px; margin-top: 20px;">
                        <colgroup>
                            <col width="200px"/>
                            <col width="450px"/>
                            <col width="100px"/>
                        </colgroup>
                        <tr>
                            <th>제목</th>
                            <th>설명 & 태그</th>
                            <th>공유하기</th>
                        </tr>
                        <c:choose>
                        	<c:when test="${empty list }">
                        		<tr>
                        			<td colspan="3" align="center">
                        				<p>-----작성하신 여행코스가 없습니다-----</p>
                        			</td>
                        		</tr>
                        	</c:when>
                        	<c:otherwise>
                        		<c:forEach items="${list}" var="dto">
                        			<tr>
                            			<td><a class="c_url" href="http://localhost:8787/yeokku/course_remake.do?room=${dto.tc_pw}">${dto.tc_title }</a></td>
                            			<td>${dto.tc_tag }</td>
                            			<td style="text-align: center;">
                            				<button class="url-copy">링크공유</button>
                            				<input type="hidden" class="myc_url" value="http://localhost:8787/yeokku/course_remake.do?room=${dto.tc_pw}">
                            			</td>
                        			</tr>
                        		</c:forEach>                        	
                        	</c:otherwise>
                        </c:choose>
                        <tr>
                        	<td colspan="3">
                        		<div style="display: block; text-align: center;">		
									<c:if test="${paging.startPage != 1 }">
										<a href="mycourseform.do?nowPage=${paging.startPage - 1 }">&lt;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a href="mycourseform.do?nowPage=${p }">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${paging.endPage != paging.lastPage}">
										<a href="mycourseform.do?nowPage=${paging.endPage+1 }">&gt;</a>
									</c:if>
								</div>
                        	</td>
                        </tr>
            	</table>
            	
            	<br><br><br><br>
            	<h3 style="padding-left: 32px;">찜한 여행코스</h3>
            	<c:forEach items="${clist }" var="cdto" varStatus="status">
						<c:choose>
							<c:when test="${cdto.tc_open == 'Y' }">
								<div class="col-lg-4 col-md-4">
				                	<a href="course_detail.do?room=${cdto.tc_no }">
					                    <div class="single_place" style="height: 200px;">
					                        <img src="${cdto.tc_content}" alt="" class="col-lg-12 col-md-12" style="height: 100%;">
					                        <div class="hover_Text d-flex align-items-end justify-content-between" style="padding-bottom: 15px;">
					                            <div class="hover_text_iner" style="color:white; background-color:rgba(0, 0, 0, 0.7);">
					                                <span class="course_title" style="padding-bottom: 5px; color:white;"> <b>${cdto.tc_title } &nbsp; </b></span><br>
					                                <span class="course_detail" id="id"> &nbsp; 👤  ${cdto.tc_userid } &nbsp; </span><br>
					                                <span class="course_detail" id="watch"> &nbsp; 👁 &nbsp; ${cdto.tc_view } &nbsp; </span><br>
					                                <span class="course_detail" id="heart"> &nbsp; 💗  ${cdto.tc_like } &nbsp; </span><br>
					                                <span class="course_tag"id="tag"> &nbsp; ${cdto.tc_tag } &nbsp; </span><br>
					                            </div>
					                        </div>
					                    </div>
					                </a>
				                </div> 
							</c:when>
						</c:choose>
				</c:forEach>
        	</div>
        	<br>
        	<br>
        </section>

        

 

    
    
    <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width:100%;">
		<div class="modal-dialog">
	    	<div class="modal-content" >
		    	<form:form method="post" enctype="multipart/form-data" action="upload" modelAttribute="uploadFile">
		      		<div class="modal-header" >
		        		<h5 class="modal-title" id="exampleModalLabel">프로필 사진</h5>
		        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      		</div>
				    <div class="modal-body" style="">
				    	<canvas id="testCanvas" width="466" height="466" style="margin: 0 auto;">
						  귀하의 브라우저는 캔버스를 지원하지 않습니다.
						</canvas>
				    	<input class="btn btn-outline-secondary cropp" type="button" onclick="cropper.startCropping()" value="수정 시작" />
						<input class="btn btn-outline-secondary cropp" type="button" onclick="cropper.getCroppedImageSrc()" value="자르기" />
						<input class="btn btn-outline-secondary cropp" type="button" onclick="cropper.restore()" value="수정 취소" />
				    	<input class="form-control" type="file" name="file" id="fileInput"  onchange="handleFileSelect()" style="margin-top : 2px;" >
				    </div>
				    <div class="modal-footer" style="padding:8px;">
				    	<button type="button" id="submit" class="btn btn-primary" style="width:100%" onclick="profile_submit();">프로필 수정</button>
				    </div>
	    		</form:form>
	    	</div>
	  	</div>
	</div>
	<script type="text/javascript">
		// initialize cropper by providing it with a target canvas and a XY ratio (height = width * ratio)
		cropper.start(document.getElementById("testCanvas"), 1); 
		
		      
		function handleFileSelect() {
		  // this function will be called when the file input below is changed
		  var file = document.getElementById("fileInput").files[0];  // get a reference to the selected file
		  
		  var reader = new FileReader(); // create a file reader
		  // set an onload function to show the image in cropper once it has been loaded
		  reader.onload = function(event) {
		    var data = event.target.result; // the "data url" of the image
		    cropper.showImage(data); // hand this to cropper, it will be displayed
		  };
		  
		  // this loads the file as a data url calling the function above once done
		  reader.readAsDataURL(file); 
		  
		}
		
		
	
		
		var myModal = document.getElementById('exampleModal');
		var canvas = document.getElementById('testCanvas');
		
		myModal.addEventListener('hidden.bs.modal', function () {
			$(this).find('form')[0].reset();
			canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
			window.location.reload();
		});
		
		
		function profile_submit(){ //이미지를 서버에 전송
			var canvImgStr = canvas.toDataURL('image/png', 1.0);  // canvas.toDataURL()을 이용하여 base64 img string 으로 변경

			$.ajax({
				url : 'profile_upload.do',
				data : { 
					strImg: canvImgStr,
				},
				type : 'POST',
				success : function(msg) {
					alert(msg);
					window.location.reload();
					},
				error : function(a, b, c){
					alert("비동기 전송 실패");
				}
	
				});
	
				return;
			}
		
	</script>
    </div>
    
    <!-- footer 추가 -->
	<%@ include file="../footer/footer.jsp" %>
    
</body>
</html>