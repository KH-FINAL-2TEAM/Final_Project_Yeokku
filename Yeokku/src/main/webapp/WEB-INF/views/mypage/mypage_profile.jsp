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
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 	
    <title>Document</title>
    
    <script type="text/javascript">
		  //2. 비밀번호 확인
		    $(function(){
		    	$("#user_pw1").keyup(function(){
		    		$("#chkNotice").html('');
		    	});
		    	
		    	$("#user_pw2").keyup(function(){
		    		
		    		if($("#user_pw1").val() != $("#user_pw2").val()){
		    			$("#chkNotice").html('비밀번호가 일치하지 않습니다.<br>');
		    			$("#chkNotice").attr('color', 'red');
		    			$("#chkNotice").attr('title', 'n');
		    		}else{
		    			$("#chkNotice").html('비밀번호가 일치합니다.<br>');
		    			$("#chkNotice").attr('color', 'blue');
		    			$("#chkNotice").attr('title', 'y');
		    		}
		    		
		    	});
		    	
		    });
		  //3. 주소찾기 
		  //주소찾기 
		  function execPostCode() {
		      new daum.Postcode({
		          oncomplete: function(data) {
		             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		             // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		             var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		             var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		
		             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                 extraRoadAddr += data.bname;
		             }
		             // 건물명이 있고, 공동주택일 경우 추가한다.
		             if(data.buildingName !== '' && data.apartment === 'Y'){
		                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		             }
		             // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		             if(extraRoadAddr !== ''){
		                 extraRoadAddr = ' (' + extraRoadAddr + ')';
		             }
		             // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		             if(fullRoadAddr !== ''){
		                 fullRoadAddr += extraRoadAddr;
		             }
		
		             // 우편번호와 주소 정보를 해당 필드에 넣는다.
		             console.log(data.zonecode);
		             console.log(fullRoadAddr);
		             
		             
		             $("[name=user_postcode]").val(data.zonecode);
		             $("[name=user_address]").val(fullRoadAddr);
		             
		
		         }
		      }).open();
		  }
    </script>
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
                            <label for="inputname" class="form-label" name="user_name">이름</label>
                            <input type="text" class="form-control" id="inputname" readonly="readonly" value="${user.user_name }">
                        </div>
                        <div class="col-12">
                            <label for="user_pw1" class="form-label" name="user_pw">비밀번호</label>
                            <input type="password" class="form-control" id="user_pw1">
                        </div>
                        <div class="col-12">
                            <label for="user_pw2" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" id="user_pw2">
                            <font id="chkNotice" name="chkNotice" size="2" title=""></font>
                        </div>
                        <div class="col-12">
                            <label for="inputenickname" class="form-label" name="user_nickname">벌명</label>
                            <input type="text" class="form-control" id="inputenickname" value="${user.user_nickname }">
                        </div>
                        <div class="col-12">
                            <label for="inputemail" class="form-label" name="user_email">이메일</label>
                            <input type="text" class="form-control" id="inputemail" value="${user.user_email }" readonly="readonly">
                        </div>
                    </div>
                    
                </div>

                <div class="row">
                    <h3>
                       	 주소정보
                    </h3> 
                    <div class="col-12">
                    	<button type="button" class="form-control" onclick="execPostCode();" ><i class="fa fa-search"></i> 우편번호 찾기</button> 
                    </div>
                    <div class="col-3">
                        <label for="zipcode" class="form-label" name="user_postcode">우편번호</label>
                        <input type="text" class="form-control" id="zipcode" value="${user.user_postcode }" readonly="readonly">
                    </div>                  
                    <div class="col-9">
                        <label for="inputAddress" class="form-label">주소</label>
                        <input type="text" class="form-control" id="inputAddress" name="user_address" value="${user.user_address }" readonly="readonly">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress2" class="form-label">상세주소</label>
                        <input type="text" class="form-control" id="inputAddress2" name="user_extraaddress" value="${user.user_extraaddress }">
                    </div>
                </div>
                
                <div class="row">
                    <h3>
                        	가입정보
                    </h3>
                    <div class="col-md-10">
                        <label for="inputdate" class="form-label">가입일자</label>
                        <input type="text" class="form-control" id="inputdate" disabled="disabled" value="${user.user_reg_date }" name="user_reg_date">
                    </div>
                    <div class="btns col-md-2">
                        <input type="submit" class="btn btn-primary" value="수정" onclick="user_info_update();">
                        <button type="button" class="btn btn-primary" onclick="location.href='resign.do'">회원탈퇴</button>
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
		
		
		function user_info_update(){
			var pwchk = document.getElementsByName("chkNotice")[0].title; 
			if(pwchk=="n"){
				alert("비밀번호 확인을 해주세요.");
			}else{
				$.ajax({
					url : 'user_info_update.do',
					data : { 
						user_no : '${user.user_no}',
						user_pw: $('#user_pw1').val(),
						user_nickname : $('#inputenickname').val(),
						user_postcode : $('#zipcode').val(),
						user_address : $('#inputAddress').val(),
						user_extraaddress : $('#inputAddress2').val(),
					},
					type : 'POST',
					success : function(msg) {
						alert(msg);
						window.location.reload();
					},
					error : function(){
						alert("비동기 전송 실패");
					}
		
				});
			}
		} 
		
	
	</script>
	
</body>
</html>