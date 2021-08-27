<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.File" %>
    
<!DOCTYPE html><html>

<head>
	<meta charset="UTF-8">
	<title>우리의 여행은 노래의 한 소절. 우여곡절</title>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb7542ca1e571489fa3dcf37d82cb528&libraries=services,clusterer,drawing"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="resources/js/CourseMaking_Rotate.js"></script>
	
	<link rel= "stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>

	<!-- <div id="White_Mask"><br><br><br><h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유지보수 작업 중입니다. 잠시 기다려주세요.</h1></h1></div>  -->

	<img id="Menu_Icon" src="resources/img/making/Lock.png">

	<header>
		<img class="Icon" src="resources/img/making/Blank.png">&nbsp;
		<img class="Icon" id="Hotel_Icon" src="resources/img/making/Hotel2.png">
		<img class="Icon" id="Food_Icon" src="resources/img/making/Food.png">
		<img class="Icon" id="GP_Icon" src="resources/img/making/GoodPoint.png">
		<img class="Icon" id="Bus_Icon" src="resources/img/making/Bus.png">
		<img class="Icon" id="Map_Icon" src="resources/img/making/Map.png">
		<img class="Icon" id="Heart_Icon" src="resources/img/making/Heart.png">
		<img class="Icon" id="Chat_Icon" src="resources/img/making/Chat.png">
		<img class="Icon" id="Book_Icon" src="resources/img/making/Book2.png">
		<img class="Icon" id="Sticker_Icon" src="resources/img/making/Sticker.png">
		<img class="Icon" id="Pencil_Icon" src="resources/img/making/Pencil.png">
		
		<span id="Select_Area">
		    <select id="Select">
		        <option>숙소</option>
		        <option>음식점</option>  
		        <option>명소/관광지</option>
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
				
		<img id="Alarm_Img" src="resources/img/making/Alarm2.png">
		<img id="PF_Img" src="resources/img/making/PF_Img.gif">
	</header>
	
	<article style="">
	
		<div id="Making_Area">
			<canvas id="canvas"></canvas>
			<img class="Close" id="Making_Close" src="resources/img/making/Close.png">
			<!-- <div id="Q_List"></div> -->
		</div>
		
		<div id="Hotel" class="Search_Area">
			<img class="Close" id="Hotel_Close"  src="resources/img/making/Close.png">
			
			<div class="Hotel_One Detail" id="hotel_1" name="Hotel">
				<img class="Heart_In" src="resources/img/making/Heart_In.png">
				<img class="Hotel_Img Detail_Img" src="resources/img/making/Hotel_Sample3.png"><br><hr>
				<span>숙소 이름 : 그랜드호텔</span><br>
				<span>종류 : 3성급 호텔</span><br>
				<span>주소 : 경기도 경기시 경기동</span><hr>
				<span>평점 : ★ ★ ★ ☆ ☆</span><br>
				<span>연락처 : 010-1234-1234</span><br>
				<span>홈페이지 : 미제공</span>
			</div>
			
			<div class="Hotel_One Detail" id="hotel_2" name="Hotel">
				<img class="Heart_In" src="resources/img/making/Heart_In.png">
				<img class="Hotel_Img Detail_Img" src="resources/img/making/Hotel_Sample4.png"><br><hr>
				<span>숙소 이름 : 싸구려 모텔</span><br>
				<span>종류 : 모텔</span><br>
				<span>주소 : 우주 안 어딘가</span><hr>
				<span>평점 : 미제공</span><br>
				<span>연락처 : 미제공</span><br>
				<span>홈페이지 : 미제공</span>
			</div>
		</div>
		
		<div id="Food" class="Search_Area">
			<img class="Close" id="Food_Close" src="resources/img/making/Close.png">
			
			<div class="Food_One Detail" id="food_1" name="Food">
				<img class="Heart_In" src="resources/img/making/Heart_In.png">
				<img class="Food_Img Detail_Img" src="resources/img/making/Food_Sample3.jpg"><br><hr>
				<span>식당 이름 : 무궁화 포차</span><br>
				<span>종류 : 튀김, 맥주, 소주</span><br>
				<span>주소 : 대한민국 어딘가</span><hr>
				<span>평점 :  ★ ★ ★ ★ ☆</span><br>
				<span>연락처 : 010-5252-5252</span><br>
				<span>홈페이지 : www.naver.com</span>
			</div>
			
			<div class="Food_One Detail" id="food_2" name="Food">
				<img class="Heart_In" src="resources/img/making/Heart_In.png">
				<img class="Food_Img Detail_Img" src="resources/img/making/Food_Sample4.jpg"><br><hr>
				<span>식당 이름 : 대동국수</span><br>
				<span>종류 : 국수, 보쌈, 족발</span><br>
				<span>주소 : 부산시 부산동</span><hr>
				<span>평점 :  ★ ★ ★ ☆ ☆</span><br>
				<span>연락처 : 010-1414-3123</span><br>
				<span>홈페이지 : 미제공</span>
			</div>
		</div>
		
		<div id="GP" class="Search_Area">
			<img class="Close" id="GP_Close"  src="resources/img/making/Close.png">
			
			<div class="GP_One Detail" id="gp_1" name="GP">
				<img class="Heart_In" src="resources/img/making/Heart_In.png">
				<img class="GP_Img Detail_Img" src="resources/img/making/GP_Sample6.png"><br><hr>
				<span>이름 : 유관순열사 사적지</span><br>
				<span>주소 : 충청남도 병천면</span><hr>
				<span>유관순 열사의 정신을 후세에 길이 전하기 위하여 설립된 유관순 열사의 사적지입니다.<br>
				역사를 잊은 민족에게 미래는 없습니다.</span>
			</div>
			
			<div class="GP_One Detail" id="gp_2" name="GP">
				<img class="Heart_In" src="resources/img/making/Heart_In.png">
				<img class="GP_Img Detail_Img" src="resources/img/making/GP_Sample5.png"><br><hr>
				<span>이름 : 독립기념관</span><br>
				<span>주소 : 충청남도 천안시</span><hr>
				<span>"거래의 얼"과 "한국의 빛"이 살아있는 뜨거운 역사의 현장<br>
				독립당시의 상황과 물품들을 볼 수 있습니다 !!</span>
			</div>

		</div>
		
		<div id="Bus" class="Search_Area">
			<img class="Close" id="Bus_Close"  src="resources/img/making/Close.png">
			<img class="Bus_Img" src="resources/img/making/Bus_Sample.png">
		</div>
		
		<div id="Map" class="Search_Area">
			<img class="Close" id="Map_Close"  src="resources/img/making/Close.png">
			
			<div class="map_wrap">
			    <div id="map" style="width:1960px; height:1280px; position:relative;overflow:hidden;"></div>
			
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                   	 키워드 : <input type="text" value="놀이 공원" id="keyword" size="15"> 
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
			<img class="Close" id="Heart_Close"  src="resources/img/making/Close.png">
		</div>
		
		<div id="Sticker" class="Search_Area">
			<img class="Close" id="Sticker_Close" src="resources/img/making/Close.png">
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/making/Station_Point.png">
				<img class="Cycle" name="0" src="resources/img/making/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/making/Arrow1.png">
				<img class="Cycle" name="0" src="resources/img/making/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/making/Arrow2.png">
				<img class="Cycle" name="0" src="resources/img/making/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/making/Arrow3.png">
				<img class="Cycle" name="0" src="resources/img/making/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/making/Arrow4.png">
				<img class="Cycle" name="0" src="resources/img/making/Cycle.png">
			</div>
			
			<div class="Sticker_One"">
				<img class="Sticker" src="resources/img/making/FireCracker.png">
				<img class="Cycle" name="0" src="resources/img/making/Cycle.png">
			</div>
		</div>
		
		<div id="Pencil" class="Pencil_Area">
			<img class="Close" id="Pencil_Close"  src="resources/img/making/Close.png">
			<div class="pen_options">
		        <select id="type">
		            <option value="stroke">실선</option>
		            <option value="square">사각형</option>
		            <option value="eraser">지우개</option>
		        </select>
		        <select id="strokeStyle">
		            <option value="blue">파란색</option>
		            <option value="red">빨간색</option>
		            <option value="pink">분홍색</option>
		            <option value="orange">주황색</option>
		        </select>
		        <select id="lineWidth">
		            <option value="5">5px</option>
		            <option value="10">10px</option>
		            <option value="15">15px</option>
		            <option value="20">20px</option>
		        </select>
		    </div>
		</div>
		
		<div id="Chat">
			<img class="Close" id="Chat_Close" src="resources/img/making/Close.png">
			<div id="Chat_Middle">
				<div class="Chat_One">
					<img class="Your_PF" src="resources/img/making/PF1.jpg"/>
					<div class="Your_Chat Chat_Detail">안녕~ 실험중이야</div>
				</div>
				<div class="Chat_One">
					<img class="My_PF" src="resources/img/making/PF2.jpg"/>
					<div class="My_Chat Chat_Detail">그래 ㅎㅎ 잘작동하면 좋겠네 !</div>
				</div>
				<div class="Chat_One">
					<img class="Your_PF" src="resources/img/making/PF1.jpg"/>
					<div class="Your_Chat Chat_Detail">잘 되는것 같아 !! 난 이만 가볼게</div>
				</div>
				<div class="Chat_One">
				<img class="My_PF" src="resources/img/making/PF2.jpg"/>
					<div class="My_Chat Chat_Detail">잘가 ~</div>
				</div>
				<div class="Chat_One">
					<img class="Your_PF" src="resources/img/making/PF1.jpg"/>
					<div class="Your_Chat Chat_Detail">바이바이</div>
				</div>
				<div class="Chat_One">
				<img class="My_PF" src="resources/img/making/PF2.jpg"/>
					<div class="My_Chat Chat_Detail">아, 맞다. 내일 3시 지각하지 말고 ㅋㅋ</div>
				</div>
			</div>
			<div id="Chat_Bottom">
				<input type="text" id="Chat_Input"placeholder="Type a message..." />
	       		<button type="submit" id="Chat_Button"></button>
			</div>
		</div>
	
	</article>
	
	<footer></footer>
</body>

<link rel= "stylesheet" type="text/css" href="resources/css/CourseMaking.css?ver=152">
<link rel= "stylesheet" type="text/css" href="resources/css/CourseMaking_Map.css">

<script src="resources/js/CourseMaking_Map.js" charset="utf-8"></script>
<script src="resources/js/CourseMaking_Paint.js" charset="utf-8"></script>
<script src="resources/js/CourseMaking.js?ver=156" charset="utf-8"></script>

</html>