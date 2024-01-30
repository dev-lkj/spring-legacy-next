<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			//var boardType = $("#editInput1").value;
			//var boardNum = $("#editInput2").value;
			var url = "/board/"+${boardType}+"/"+${boardNum}+"/boardEdit.do";
			
			$j.ajax({
			    url : url,
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					//location.href = "/board/boardList.do?pageNo=${pageNo}";
					location.href = "/board/boardList.do?pageNo=${pageNo}";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("param::",param);
			    	//alert("boardtype::",boardType);
			    	//alert("boardnum::",boardNum);
			    	alert("실패");
			    }
			});
		});
	});
	

</script>
<body>

<form class="boardWrite">
	<input id="editInput1" type="hidden" name=boardType value="${boardType}"/>
	<input id="editInput2" type="hidden" name=baordNum value="${boardNum}"/>
	<table align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="수정완료">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  type="text" rows="20" cols="55">${board.boardComment}</textarea>
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
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>