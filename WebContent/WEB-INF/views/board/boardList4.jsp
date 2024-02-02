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
		
		$j("#findButton").on("click",function(){
			var $frm = $j('#find :input');
			var param = $frm.serialize();
			var url = "/board/boardtypeList.do";
			
			$j.ajax({
			    url : url,
			    dataType: "json",
			    type: "GET",
			    data : param,
		 	    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					alert("메세지pageNo:"+data.pageNo);
					
					/* location.href = "/board/boardList.do"; */

					
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {

			    	alert("실패");
			    } 
			});
		}); 
		
	});

</script>
<body>
<table  align="center">
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
					<td width="300" align="right">
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
						Type2
					</td>
					<td width="40" align="center">
						No2
					</td>
					<td width="300" align="center">
						Title2
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							<c:choose>
								<c:when test="${list.boardType eq 'a01'}">
									일반
								</c:when>
								<c:when test="${list.boardType eq 'a02'}">
									Q&amp;A
								</c:when>
								<c:when test="${list.boardType eq 'a03'}">
									익명
								</c:when>
								<c:when test="${list.boardType eq 'a04'}">
									자유
								</c:when>
								<c:otherwise>
									기타
								</c:otherwise>
							</c:choose>
							<%-- ${list.boardType}  --%>
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
		</td>
	</tr>
	<tr>
		<td id="find">
			<input id="findAll" type="checkbox" name="boardType" value="" /><label for="findAll">전체</label>
			<input id="normal" type="checkbox" name="boardType" value="a01" /><label for="normal">일반</label>
			<input id="qna" type="checkbox" name="boardType" value="a02" /><label for="qna">Q&amp;A</label>
			<input id="anonymous" type="checkbox" name="boardType" value="a03" /><label for="anonymous">익명</label>
			<input id="free" type="checkbox" name="boardType" value="a04" /><label for="free">자유</label>
			<input type="hidden" name="pageNo" value="${pageNo}" />
			<button id="findButton">조회</button>
		</td>	
	</tr>
</table>	
</body>
</html>