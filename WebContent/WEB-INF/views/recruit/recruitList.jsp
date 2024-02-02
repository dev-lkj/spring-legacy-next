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
		
		$j.ajax({
		    url : url,
		    dataType: "json",
		    type: "GET",
		    data : param,
	 	    success: function(data, textStatus, jqXHR)
		    {
				alert("성공");
				
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {

		    	alert("실패");
		    } 
		    
		});
		
		

	
	
		
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
	
	<tr>
		<td align="right">
			<c:forEach var="pageNumber" begin="${startPage}" end="${endPage}" step="1">
			    <c:choose>
			        <c:when test="${pageNumber == currentPage}">
			            <b>${pageNumber}</b>&nbsp;&nbsp;
			        </c:when>
			        <c:otherwise>
			            <a href="/board/boardList.do?pageNo=${pageNumber}" title="page">${pageNumber}</a>&nbsp;&nbsp;
			        </c:otherwise>
			    </c:choose>
			</c:forEach>
		</td>
	</tr>
</table>
</body>
</html>