<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script>
	$j(document).ready(function(){

		$j("#delete").on("click",function(){
			var $frm = $j('body :input');
			var param = $frm.serialize();
			var url = "/board/"+${boardType}+"/"+${boardNum}+"/boardDelete.do";
			
			$j.ajax({
			    url : url,
			    dataType: "json",
			    type: "GET",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					//location.href = "/board/boardList.do?pageNo=${pageNo}";
					location.href = "/board/boardList.do";

					
					
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
<input id="editInput1" type="hidden" name=boardType value="${boardType}"/>
<input id="editInput2" type="hidden" name=baordNum value="${boardNum}"/>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<!--  <a href="/board/${boardType}/${boardNum}/boardDelete.do" id="delete">Delete</a>-->
			<a href="javascript:void(0);" role="button" id="delete">Delete</a>
		</td>
		<td align="right">
			<a href="/board/${boardType}/${boardNum}/boardEdit.do" id="edit">Edit</a>
		</td>
		<td align="right">
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
</table>	
</body>
</html>