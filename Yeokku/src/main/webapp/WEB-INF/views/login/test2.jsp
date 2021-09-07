<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 카카오 스크립트 -->
 <body>
  <ul>
      <li onclick="kakaoLogin();">
        <a href="javascript:void(0)">
            <span>카카오 로그인</span>
        </a>
      </li>
  </ul>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
  //카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: 'getKakaoAuthUrl.do',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']);
      }
  });  

  </script>
</body>
</html>