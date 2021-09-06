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
	    	var table = $('#example').DataTable({
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
	            'columnDefs': [
	                {
	                   'targets': 0,
	                   'checkboxes': {
	                      'selectRow': true
	                   }
	                }
	             ],
	             'select': {
	                'style': 'multi'
	             },
	             'order': [[1, 'asc']]
	          });
            /* Column별 검색박스 추가 */
            $('#example_filter').prepend('<select id="select" style="display: inline-block; width : auto;"></select> 에서 ');
            $('#example > thead > tr').children().each(function (indexInArray, valueOfElement) { 
                $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
            });
            
            /* Column별 검색기능 추가 */
            $('.dataTables_filter input').unbind().bind('keyup', function () {
                var colIndex = document.querySelector('#select').selectedIndex;
                table.column(colIndex).search(this.value).draw();
            });
            
            

            /* Column 삭제버튼 추가 */
            $('#example_length').append('<button id="delete_btn" class="btn btn-outline-secondary" style="margin-left : 20px;">선택 삭제</button>')
            .append('<button id="all_delete_btn" class="btn btn-outline-secondary" style="margin-left : 20px;">전체 삭제</button>');
         
            
            // 체크한 항목 삭제
            $('#delete_btn').on('click', function(e){
            	var selected_list = [];
            	 $(".dt-checkboxes:checked").each(function () {
            		 selected_no = table.row($(this).parents()).data();
					selected_list.push(selected_no[1]);
            	 });
				$.ajax({
		        	url:"report_selected_delete.do",
		        	type:"post",
		        	data:  {
		                selected : selected_list
		            },
		        	success:function(msg){
		        		if(msg == "true"){
		        			alert("삭제 처리 성공")
		        		}else{
		        			alert("삭제 처리 실패")
		        		}
		        	},
		        	error : function() {
		        		alert("처리 실패")
					},
					complete : function() {
						refreshList();
					}
		        });
            });
            
         // 전체 항목 삭제
            $('#all_delete_btn').on('click', function(e){
            	   	 
				$.ajax({
		        	url:"report_all_delete.do",
		        	type:"post",		        	
		        	success:function(msg){
		        		if(msg == "true"){
		        			alert("전체 삭제 성공")
		        		}else{
		        			alert("전체 삭제 실패")
		        		}
		        	},
		        	error : function() {
		        		alert("처리 실패")
					},
					complete : function() {
						refreshList();
					}
		        });
            });
            
        });
        
        function refreshList(){
    		location.reload();
    	}
        function reportConfirm(index){
	        $.ajax({
	        	url:"report_confirm.do",
	        	type:"post",
	        	data:{
	        		report_no : index
	        	},
	        	success:function(msg){
	        		if(msg == "true"){
	        			alert("신고 처리 성공")
	        		}else{
	        			alert("신고 처리 실패")
	        		}
	        	},
	        	error : function() {
					alert("처리 실패");
				},
				complete : function() {
					 refreshList();
				}
	        });
	       
        }
        
        function reportBanConfirm(index,userno){
	        $.ajax({
	        	url:"report_ban_confirm.do",
	        	type:"post",
	        	data:{
	        		report_no : index,
	        		report_target_userno : userno
	        	},
	        	success:function(msg){
	        		if(msg == "true"){
	        			alert("정지 처리 성공")
	        		}else{
	        			alert("정지 처리 실패")
	        		}
	        	},
	        	error : function() {
					alert("처리 실패");
				},
				complete : function() {
					 refreshList();
				}
	        });	     
        }
        
        function reportUnBanConfirm(index,userno){
	        $.ajax({
	        	url:"report_unban_confirm.do",
	        	type:"post",
	        	data:{
	        		report_no : index,
	        		report_target_userno : userno
	        	},
	        	success:function(msg){
	        		if(msg == "true"){
	        			alert("해제 처리 성공")
	        		}else{
	        			alert("해제 처리 실패")
	        		}
	        	},
	        	error : function() {
					alert("처리 실패");
				},
				complete : function() {
					 refreshList();
				}
	        });	     
        }
    </script>
</head>
<body>

	<!-- header 추가 -->
	<%@ include file="../header/header.jsp" %> 
	
    <div class="adminpage">
        <div class="left">
            <h1>ADMIN</h1>
            <ul>
                <li><a href="admin_user.do">회원 관리</a></li>
                <li><a href="admin_report.do">신고 관리</a></li>
                <li><a href="admin_qna.do">문의 관리</a></li>
            </ul>
        </div>
        
        <div class="table-div">
            <h2>신고관리</h2>

            <table id="example" class="ui celled table" style="width:100%">
                <thead>
                    <tr>
                    	<th></th>
                        <th>번호</th>
                        <th>사유</th>
                        <th>내용</th>
                        <th>신고자</th>
                        <th>신고대상자</th>
                        <th>신고일자</th>
                        <th>신고처리일자</th>
                        <th>신고처리상태</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                	<c:choose>
	                	<c:when test="${empty list }"></c:when>
	                	<c:otherwise>
	                		<c:forEach items="${list }" var="report_dto">
	                			<tr>
	                				<td></td>
		                			<td>${report_dto.report_no }</td>
			                        <td>${report_dto.report_reason }</td>
			                        <td>${report_dto.report_content }</td>
			                        <td>${report_dto.report_user_id }</td>
			                        <td>${report_dto.user_dto.user_id }</td>
			                        <td>${report_dto.report_date }</td>
			                        <td>${report_dto.report_done_date }</td>
			                        <td>
			                        	<c:choose>
				                        	<c:when test="${report_dto.report_confirm  eq 'Y' }">
				                        		처리 완료
				                        	</c:when>
				                        	<c:when test="${report_dto.report_confirm  eq 'B' }">
				                        		정지 처리
				                        	</c:when>
				                        	<c:otherwise>
					                        	처리 대기
				                        	</c:otherwise>
			                        	</c:choose>
			                        </td>
			                        <c:choose>
				                        <c:when test="${report_dto.report_confirm  eq 'Y'}">
					                        <td  style="padding: 2px;"><button class="genric-btn" disabled="disabled">완료</button></td>
				                        </c:when>
				                        <c:when test="${report_dto.report_confirm  eq 'B'}">
				                        	<td  style="padding: 2px;">
						                        <button style="float:left; width: 50%;" class="genric-btn " disabled="disabled">완료</button>
						                        <button style=" width: 50%;" class="genric-btn primary-border" onclick="reportUnBanConfirm(${report_dto.report_no},${report_dto.report_target_userno });">해제</button>
					                        </td>
				                        </c:when>
				                        <c:otherwise>
					                        <td  style="padding: 2px;">
						                        <button style="float:left; width: 50%;" class="genric-btn primary-border" onclick="reportConfirm(${report_dto.report_no});">보류</button>
						                        <button style=" width: 50%;" class="genric-btn primary-border" onclick="reportBanConfirm(${report_dto.report_no},${report_dto.report_target_userno });">정지</button>
					                        </td>
				                        </c:otherwise>
			                        </c:choose>
		                        </tr>
	                		</c:forEach>
	                	</c:otherwise>
                	</c:choose>
                	
                </tbody>
                
                <tfoot>
                    <tr>
                    	<th></th>
                        <th>번호</th>
                        <th>사유</th>
                        <th>내용</th>
                        <th>신고자</th>
                        <th>신고대상자</th>
                        <th>신고일자</th>
                        <th>신고처리상태</th>
                        <th>신고처리일자</th>
                        <th></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</body>
</html>