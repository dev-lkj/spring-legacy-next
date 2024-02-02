<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		
		
		
		$j("#findAll").on("click",function(){
			var checked = $j("#findAll").is(":checked");			
			
			if(checked){
				$j("input[name=boardType]").prop('checked',true);
			}else{
				$j("input[name=boardType]").prop('checked',false);
			}
		});
		
		$j("input[name=boardType]").on("click", function(){
			var checkedCount = $j("input[name=boardType]:checked").length;
	        var totalCount = $j("input[name=boardType]").length;

	        if (checkedCount === totalCount) {
	            $j("#findAll").prop('checked', true);
	        }   
	        else {
	            $j("#findAll").prop('checked', false);
	        }
	    });
		
		
		

		$j("#findButton").on("click",function(){
			var checkedCount = $j("input[name=boardType]:checked").length;
			var $frm;
			var param; 
			var url = "/board/boardTypeList2.do";
			if(checkedCount > 0){
				var $frm = $j('#find :input');
				var param = $frm.serialize(); 

				 $j.ajax({
				    url : url,
				    dataType: "html",
				    type: "GET",
				    data : param,
			 	    success: function(data, textStatus, jqXHR)
				    {
						$j("#table").html(data);
						
						
						
						 //handleData(data); 
						
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {

				    	alert("실패");
				    } 
				    
				});
			} 
			/* else{
				return;
			} */ 
			
			
				
		}); 
	
	
		// 데이터 가공 함수
		function handleData(data) {
			var html = "";
				html += "<table id='boardTable' border = '1'>";
				html += "<tr>";
				html += "<td width='80' align='center'>Type</td>";
				html += "<td width='40' align='center'>No</td>";
				html += "<td width='300' align='center'>Title</td>";
				html += "</tr>";

				$j("#boardTable").html(html);
				for (var i = 0; i < data.boardList.length; i++) {
					var board = data.boardList[i];
					/* var codeName = data.boardType[i].codeName; */
					console.log(board);
					console.log("data",data);
					

	 
					html += "<tr>";
					html += "<td width='80' align='center'>" + board.codeName + "</td>";
					html += "<td width='40' align='center'>" + board.boardNum + "</td>";
					html += "<td width='300'><a href='/board/" + board.boardType + "/" + board.boardNum + "/boardView.do?pageNo=" + data.pageNo + "'>" + board.boardTitle + "</a></td>";
					html += "</tr>";
					
				}
				
				$j("#boardTable").html(html);
				
				$j("#totalCnt").text("total : " + data.totalCnt);
			}
		
	});

</script>
<body>
<table id="table" align="center">
	<tr>
		<td>
			<table>
				<tr>
					<td width="80" align="left">
						<a href="/board/login.do" title="login">login</a>
						<a href="/board/join.do" title="join">join</a>
					</td>
					<td width="40">
					</td>
					<td width="300" align="right" id="totalCnt">
						total : ${totalCnt}
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list" varStatus="status">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td align="center">
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
			<br/>
		</td>
	</tr>
	
	<tr>
		<td id="find">
			<input id="findAll" type="checkbox" name="boardTypeAll" value="all" /><label for="findAll">전체</label>
			<c:forEach var="board" items="${comcodeList}">
				<input id="${board.codeId}" type="checkbox" name="boardType" value="${board.codeId}" /> <label for="${board.codeId}">${board.codeName}</label>
			</c:forEach>
			<input type="hidden" name="pageNo" value="${pageNo}" /> 
			<button id="findButton">조회</button>
		</td>	
	</tr>
</table>
</body>
</html>