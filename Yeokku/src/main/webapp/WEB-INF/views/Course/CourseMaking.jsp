<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.File" %>
<%@ page import="com.kh.yeokku.model.dto.RoomDto" %>
<% String roomNo = session.getAttribute("roomNo").toString();%>

<script>
	var detail_count = "${dto.tc_dc}";
	if(detail_count<1) { detail_count=1;}
	var tc_q = '${dto.tc_q}';
	var png = "data:image/png;base64," + '${png}';
</script>
    
<!DOCTYPE html><html>

<head>
	<meta charset="UTF-8">
	<title>우리의 여행은 노래의 한 소절. 우여곡절</title>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb7542ca1e571489fa3dcf37d82cb528&libraries=services,clusterer,drawing"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="resources/js/Course/CourseMaking_Rotate.js"></script>
	
	<link rel= "stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>

	<div id="Start_Area"></div>

	<img id="Menu_Icon" src="resources/img/Course/Lock.png">

	<header>
		<img class="Icon" src="resources/img/Course/Blank.png">&nbsp;
		<img class="Icon" id="Hotel_Icon" src="resources/img/Course/Hotel2.png">
		<img class="Icon" id="Food_Icon" src="resources/img/Course/Food.png">
		<img class="Icon" id="GP_Icon" src="resources/img/Course/GoodPoint.png">
		<img class="Icon" id="Bus_Icon" src="resources/img/Course/Bus.png">
		<img class="Icon" id="Map_Icon" src="resources/img/Course/Map.png">
		<img class="Icon" id="Heart_Icon" src="resources/img/Course/Heart.png">
		<img class="Icon" id="Chat_Icon" src="resources/img/Course/Chat.png">
		<img class="Icon" id="Making_Icon" src="resources/img/Course/Book2.png">
		<img class="Icon" id="Sticker_Icon" src="resources/img/Course/Sticker.png">
		<img class="Icon" id="Pencil_Icon" src="resources/img/Course/Pencil.png">
		<img class="Icon" id="Save_Icon" src="resources/img/Course/Save.png">
		
		<span id="Select_Area">
		    <select id="Select">
		        <option value="32">숙소</option>
		        <option value="39">음식점</option>  
		        <option value="12">명소/관광지</option>
		        <option>교통</option>
		        <option>지도</option>
		        <option>즐겨찾기</option>
		    </select>
		</span>
		
		<div id="Search_Wrap">
		   <div id="Search_Area">
		      <input type="text" id="Search_Input" placeholder=" Search !!!">
		      <button type="submit" id="Search_Icon">🔍</button>
		   </div>
		</div>
				
		<img id="Alarm_Img" src="resources/img/Course/Alarm.png">
		<img id="PF_Img" src="resources/img/Course/PF_Img.gif">
	</header>
	
	<article style="">
	
		<div id="Alarm_Area"></div>
	
		<div id="Making_Area">
			<canvas id="canvas" width="1960px" height="1280px"></canvas>
			<img class="Close" id="Making_Close" src="resources/img/Course/Close.png">
			${dto.tc_content }
		</div>
		<div id="Queue_All">
			<img id="Queue_Size" src='resources/img/Course/Minus.png'>
		</div>
		
		<div id="Hotel" class="Search_Area">
			<img class="Close" id="Hotel_Close"  src="resources/img/Course/Close.png">
			
			<div class="Hotel_One Detail" id="hotel_1" name="Hotel">
			<!--<div class='Index_Num'><b>0</b></div> -->
				<img class="Heart_In" src="resources/img/Course/Heart_In.png">
				<img class="Hotel_Img Detail_Img" src="resources/img/Course/Hotel_Sample3.png"><br><hr>
				<span><b>:: 그랜드호텔  ::</b></span><br>
				<span class="Detail_Reduce">종류 : 3성급 호텔</span><br>
				<span class="Detail_Reduce">주소 : 경기도 경기시 경기동</span><hr>
				<span class="Detail_Reduce">평점 : ★ ★ ★ ☆ ☆</span><br>
				<span class="Detail_Reduce">연락처 : 010-1234-1234</span><br>
				<span class="Detail_Reduce">홈페이지 : 미제공</span>
			</div>
			
			<div class="Hotel_One Detail" id="hotel_2" name="Hotel">
				<img class="Heart_In" src="resources/img/Course/Heart_In.png">
				<img class="Hotel_Img Detail_Img" src="resources/img/Course/Hotel_Sample4.png"><br><hr>
				<span><b>:: 싸구려 모텔 ::</b></span><br>
				<span class="Detail_Reduce">종류 : 모텔</span><br>
				<span class="Detail_Reduce">주소 : 우주 안 어딘가</span><hr>
				<span class="Detail_Reduce">평점 : ${roomNo}</span><br>
				<span class="Detail_Reduce">연락처 : 미제공</span><br>
				<span class="Detail_Reduce">홈페이지 : 미제공</span>
			</div>
		</div>
		
		<div id="Food" class="Search_Area">
			<img class="Close" id="Food_Close" src="resources/img/Course/Close.png">
			
			<div class="Food_One Detail" id="food_1" name="Food">
				<img class="Heart_In" src="resources/img/Course/Heart_In.png">
				<img class="Food_Img Detail_Img" src="resources/img/Course/Food_Sample3.jpg"><br><hr>
				<span><b>:: 무궁화 포차 ::</b></span><br>
				<span class="Detail_Reduce">종류 : 튀김, 맥주, 소주</span><br>
				<span class="Detail_Reduce">주소 : 대한민국 어딘가</span><hr>
				<span class="Detail_Reduce">평점 :  ★ ★ ★ ★ ☆</span><br>
				<span class="Detail_Reduce">연락처 : 010-5252-5252</span><br>
				<span class="Detail_Reduce">홈페이지 : www.naver.com</span>
			</div>
			
			<div class="Food_One Detail" id="food_2" name="Food">
				<img class="Heart_In" src="resources/img/Course/Heart_In.png">
				<img class="Food_Img Detail_Img" src="resources/img/Course/Food_Sample4.jpg"><br><hr>
				<span><b>:: 대동국수 ::</b></span><br>
				<span class="Detail_Reduce">종류 : 국수, 보쌈, 족발</span><br>
				<span class="Detail_Reduce">주소 : 부산시 부산동</span><hr>
				<span class="Detail_Reduce">평점 :  ★ ★ ★ ☆ ☆</span><br>
				<span class="Detail_Reduce">연락처 : 010-1414-3123</span><br>
				<span class="Detail_Reduce">홈페이지 : 미제공</span>
			</div>
		</div>
		
		<div id="GP" class="Search_Area">
			<img class="Close" id="GP_Close"  src="resources/img/Course/Close.png">
			
			<div class="GP_One Detail" id="gp_1" name="GP">
				<img class="Heart_In" src="resources/img/Course/Heart_In.png">
				<img class="GP_Img Detail_Img" src="resources/img/Course/GP_Sample6.png"><br><hr>
				<span><b>:: 유관순열사 사적지 ::</b></span><br>
				<span class="Detail_Reduce">주소 : 충청남도 병천면</span><hr>
				<span class="Detail_Reduce">유관순 열사의 정신을 후세에 길이 전하기 위하여 설립된 유관순 열사의 사적지입니다.<br>
				역사를 잊은 민족에게 미래는 없습니다.</span>
			</div>
			
			<div class="GP_One Detail" id="gp_2" name="GP">
				<img class="Heart_In" src="resources/img/Course/Heart_In.png">
				<img class="GP_Img Detail_Img" src="resources/img/Course/GP_Sample5.png"><br><hr>
				<span><b>:: 독립기념관 ::</b></span><br>
				<span class="Detail_Reduce">주소 : 충청남도 천안시</span><hr>
				<span class="Detail_Reduce">"거래의 얼"과 "한국의 빛"이 살아있는 뜨거운 역사의 현장<br>
				독립당시의 상황과 물품들을 볼 수 있습니다 !!</span>
			</div>

		</div>
		
		<div id="Bus" class="Search_Area">
			<img class="Close" id="Bus_Close"  src="resources/img/Course/Close.png">
			<img class="Bus_Img" src="resources/img/Course/Bus_Sample.png">
		</div>
		
		<div id="Map" class="Search_Area">
			<img class="Close" id="Map_Close"  src="resources/img/Course/Close.png">
			
			<div class="map_wrap">
			    <div id="map" style="width:1960px; height:1280px; position:relative;overflow:hidden;"></div>
			
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                   	 검색 : <input type="text" value="놀이 공원" id="keyword" size="15"> 
			                    <button type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
		</div>
		
		<div id="Heart" class="Search_Area">
			<img class="Close" id="Heart_Close"  src="resources/img/Course/Close.png">
		</div>
		
		<div id="Sticker" class="Search_Area">
			<img class="Close" id="Sticker_Close" src="resources/img/Course/Close.png">
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/Course/Station_Point.png">
				<img class="Cycle" name="0" src="resources/img/Course/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/Course/Arrow1.png">
				<img class="Cycle" name="0" src="resources/img/Course/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/Course/Arrow2.png">
				<img class="Cycle" name="0" src="resources/img/Course/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/Course/Arrow3.png">
				<img class="Cycle" name="0" src="resources/img/Course/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/Course/Arrow4.png">
				<img class="Cycle" name="0" src="resources/img/Course/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/Course/FireCracker.png">
				<img class="Cycle" name="0" src="resources/img/Course/Cycle.png">
			</div>
		</div>
		
		<div id="Pencil" class="Pencil_Area">
			<img class="Close" id="Pencil_Close"  src="resources/img/Course/Close.png">
			<div id="Color_Box_All" class="Color_box"><div id="Pallet_Box" class="pallet_box"></div></div>
		    <div class="Pencil_In" id="Pencil_Pencil"> <img src="resources/img/Course/Pencil2.png"> </div>
		    <div class="Pencil_In" id="Pencil_Eraser"> <img src="resources/img/Course/Eraser.png"> </div>
		    <div class="seek-bar"> <div class="circle" id="Pencil_Size"> <span>1</span></div></div>
		</div>
		
		<div id="Chat">
			<img class="Close" id="Chat_Close" src="resources/img/Course/Close.png">
			<div id="Chat_Middle"></div>
			<div id="Chat_Bottom">
				<input type="text" id="Chat_Input" placeholder="Type a message..." />
	       		<button type="submit" id="Chat_Button"></button>
			</div>
		</div>
	
		<div id="Black_Mask"></div>
	
		<div id="Save_Area"><br>
			<b>코스 제목</b> <br>
			<input type="text" id="Content_Title"><br><br>
			
			<b>설명 & 태그</b> <br>
			<textarea id="Content_Tag" rows="5" cols="30"></textarea><br><br>
			
			<input type="radio" id="open_y" name="open_check" value="Y">
			<label for="contactChoice1">공개</label>
		    <input type="radio" id="open_n" name="open_check" value="N" checked>
		    <label for="contactChoice2">미공개</label><br><br>
		    
			<input type="button" value="저장" class="Btn" onclick="save();"> &nbsp;&nbsp;
			<input type="button" value="취소" class="Btn" onclick='Icon_Switch[9] = 1; $("#Save_Area").hide(); $("#Black_Mask").hide(); $("#Save_Icon").attr("src","resources/img/Course/Save.png");'>
			
			<br><hr><span style="font-size:15px" id="redirect_url">http://localhost:8787/yeokku/course_remake.do?room=${link }</span>
		
		</div>
		
	</article>
	
	<footer></footer>
</body>

<link rel= "stylesheet" type="text/css" href="resources/css/Course/CourseMaking.css?ver=190">
<link rel= "stylesheet" type="text/css" href="resources/css/Course/CourseMaking_Map.css">

<script src="resources/js/Course/CourseMaking_Paint.js?ver=1" charset="utf-8"></script>
<script src="resources/js/Course/CourseMaking.js?ver=195" charset="utf-8"></script>
<script src="resources/js/Course/CourseMaking_Map.js" charset="utf-8"></script>
<script src="resources/js/Course/CourseMaking_Chat.js?ver=14" charset="utf-8"></script>
<script src="resources/js/Course/CourseMakingTour.js" charset="utf-8"></script>
<script>var ws = new WebSocket("ws://" + root  +"/chat?room=<%=roomNo%>");  connect();</script>

</html>