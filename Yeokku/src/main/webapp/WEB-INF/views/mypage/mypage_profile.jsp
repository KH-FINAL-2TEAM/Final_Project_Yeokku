<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<link href="resources/css/mypage.css" rel="stylesheet">
 	<script src="resources/js/cropper.js"></script>
 	
    <title>Document</title>
</head>
	
	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
<body>
    <div class="conta">

        <section class="profile_section breadbox_bg breadbox">
            <div class="profile">
                    <div class="profile_div">
                        <div class="profile_img_div">
                            <img src="uploadfile/${profile.pf_name}${profile.pf_type}" onerror="this.src='resources/img/none_profile.png'" class="profile_img" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        </div>
                        <p class="profile_name">${user.user_nickname }</p>
                    </div>
                    <h1>회원정보</h1>
            </div>
        </section>


        <nav class="nav">
            <div class="navbar">
                <ul>
                    <li class="selected_nav"><a href="mypage_profile.html">회원정보</a></li>
                    <li><a href="mypage_travel.html">여행지</a></li>
                    <li><a href="mypage_course.html">여행코스</a></li>
                    <li><a href="mypage_review.html">리뷰</a></li>
                    <li><a href="mypage_qna.html">문의내역</a></li>
                </ul>
            </div>
        </nav>


        <section class="list_nav">
            <div>
                <ul>
                </ul>
            </div>
        </section>

        <section class="content">
            

            <form class="info row g-3">

                <div class="row">
                    <h3>
                        기본정보
                    </h3>
                    <div class="row">
                        <div class="col-12">
                            <label for="inputname" class="form-label">이름</label>
                            <input type="text" class="form-control" id="inputname" readonly="readonly" value="${user.user_name }">
                        </div>
                        <div class="col-12">
                            <label for="inputepassword" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="inputepassword">
                        </div>
                        <div class="col-12">
                            <label for="inputenickname" class="form-label">벌명</label>
                            <input type="text" class="form-control" id="inputenickname" value="${user.user_nickname }">
                        </div>
                        <div class="col-12">
                            <label for="inputemail" class="form-label">이메일</label>
                            <input type="text" class="form-control" id="inputemail" value="${user.user_email }" >
                        </div>
                    </div>
                    
                </div>

                <div class="row">
                    <h3>
                       	 주소정보
                    </h3> 
                    <div class="col-3">
                        <label for="zipcode" class="form-label">우편번호</label>
                        <input type="text" class="form-control" id="zipcode" value="${user.user_postcode }">
                    </div>
                    <div class="col-9">
                        <label for="inputAddress" class="form-label">주소</label>
                        <input type="text" class="form-control" id="inputAddress" value="${user.user_address }">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress2" class="form-label">상세주소</label>
                        <input type="text" class="form-control" id="inputAddress2" value="${user.user_extraaddress }">
                    </div>
                </div>
                
                <div class="row">
                    <h3>
                        	가입정보
                    </h3>
                    <div class="col-md-10">
                        <label for="inputdate" class="form-label">가입일자</label>
                        <input type="text" class="form-control" id="inputdate" readonly="readonly" value="${user.user_reg_date }">
                    </div>
                    <div class="btns col-md-2">
                        <input type="submit" class="btn btn-primary" value="수정">
                        <button class="btn btn-primary">회원탈퇴</button>
                    </div>
                </div>
            </form>



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