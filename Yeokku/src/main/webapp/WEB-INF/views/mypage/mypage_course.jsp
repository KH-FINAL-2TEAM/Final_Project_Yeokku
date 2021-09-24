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
                    <li><a href="mypage_profile.html">회원정보</a></li>
                    <li><a href="mypage_travel.html">여행지</a></li>
                    <li class="selected_nav"><a href="mypage_course.html">여행코스</a></li>
                    <li><a href="mypage_review_form.do">리뷰</a></li>
                    <li><a href="mypage_qna.html">문의내역</a></li>
                </ul>
            </div>
        </nav>


        <section class="list_nav">
            <div>
                <ul>
                    <li>작성한 여행코스</li>
                    <li>찜한 여행코스</li>
                </ul>
            </div>
        </section>

        <section class="content">
            <div class="row">

                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_1.png" alt="">
                        <h3> <a href="#">제목 </a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_2.png" alt="">
                        <h3> <a href="#"> Guidence</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_3.png" alt="">
                        <h3> <a href="#"> Accomodation fsdasfas dasdsa ds  sfasfas</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>               

                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
                <div class="col-lg-3 col-sm-6">
                    <div class="course_list">
                        <img src="img/services_4.png" alt="">
                        <h3> <a href="#"> Discover world</a></h3>
                        <div>
                            <p>여행지역(여행일수)</p>
                            <p>작성자</p>
                        </div>
                    </div>
                </div>   
            </div>

            
        </section>





    </div>
    
    
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
    
</body>
</html>