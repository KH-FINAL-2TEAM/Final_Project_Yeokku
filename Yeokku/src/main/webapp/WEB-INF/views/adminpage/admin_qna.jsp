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
    <script src="resources/js/jquery.dataTables.min.js" defer></script>
    <script src="resources/js/dataTables.semanticui.min.js" defer></script>
    <script src="resources/js/semantic.min.js" defer></script>
    <link rel="stylesheet" href="resources/css/semantic.min.css">
    <link rel="stylesheet" href="resources/css/dataTables.semanticui.min.css">
    <link rel="stylesheet" href="resources/css/adminpage.css">
    <title>Document</title>
    <script>
        $(document).ready(function() {
            $('#example').DataTable({
                "language": {
                    "emptyTable": "데이터가 없어요.",
                    "lengthMenu": "페이지당 _MENU_ 개씩 보기",
                    "info": "현재 _START_ - _END_ / _TOTAL_건",
                    "infoEmpty": "데이터 없음",
                    "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                    "search": "검색: ",
                    "zeroRecords": "일치하는 데이터가 없어요.",
                    "loadingRecords": "로딩중...",
                    "processing":     "잠시만 기다려 주세요...",
                    "paginate": {
                        "next": "다음",
                        "previous": "이전"
                    }
                },
            });
        } );
    </script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
	
    <div class="adminpage">
        <div class="left">
            <h1>ADMIN</h1>
            <ul>
                <li><a href="admin_user.html">회원 관리</a></li>
                <li><a href="admin_report.html">신고 관리</a></li>
                <li><a href="admin_qna.html">문의 관리</a></li>
            </ul>
        </div>
        
        <div class="table-div">
            <h2>문의 관리</h2>

            <table id="example" class="ui celled table" style="width:100%">
                <colgroup>
                    <col width="60">
                </colgroup>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>문의내용</th>
                        <th>문의자</th>
                        <th>이메일</th>
                        <th>문의일자</th>
                        <th>처리상태</th>
                        <th>처리일자</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr>


 <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr> <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>문의내용</td>
                        <td>문의자</td>
                        <td>이메일</td>
                        <td>문의일자</td>
                        <td>처리상태</td>
                        <td>21/08/17</td>
                        <td width="80" style="padding: 2px;"><button class="genric-btn primary-border">처리</button></td>

                    </tr>



                </tbody>
                <tfoot>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>문의내용</th>
                        <th>문의자</th>
                        <th>이메일</th>
                        <th>문의일자</th>
                        <th>처리상태</th>
                        <th>처리일자</th>
                        <th></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</body>
</html>