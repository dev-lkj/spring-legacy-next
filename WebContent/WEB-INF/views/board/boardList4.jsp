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
					alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					alert("�޼���pageNo:"+data.pageNo);
					
					/* location.href = "/board/boardList.do"; */

					
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {

			    	alert("����");
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
									�Ϲ�
								</c:when>
								<c:when test="${list.boardType eq 'a02'}">
									Q&amp;A
								</c:when>
								<c:when test="${list.boardType eq 'a03'}">
									�͸�
								</c:when>
								<c:when test="${list.boardType eq 'a04'}">
									����
								</c:when>
								<c:otherwise>
									��Ÿ
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
			<a href ="/board/boardWrite.do">�۾���</a>
		</td>
	</tr>
	<tr>
		<td id="find">
			<input id="findAll" type="checkbox" name="boardType" value="" /><label for="findAll">��ü</label>
			<input id="normal" type="checkbox" name="boardType" value="a01" /><label for="normal">�Ϲ�</label>
			<input id="qna" type="checkbox" name="boardType" value="a02" /><label for="qna">Q&amp;A</label>
			<input id="anonymous" type="checkbox" name="boardType" value="a03" /><label for="anonymous">�͸�</label>
			<input id="free" type="checkbox" name="boardType" value="a04" /><label for="free">����</label>
			<input type="hidden" name="pageNo" value="${pageNo}" />
			<button id="findButton">��ȸ</button>
		</td>	
	</tr>
</table>	
</body>
</html>