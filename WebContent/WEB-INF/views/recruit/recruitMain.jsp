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
		var url = "/recruit/Login";
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
<form action="/recruit/main" method="POST">
<table id="boardTable" align="center" border="2">
	<tr align="center" style="font-weight:bold;">
		<td>
			<label for="name">이름</label>
		</td>
		<td>
			<input id="name" type="text" name="name"  value="${login.name}"/>
		</td>
		<td>
			<label for="birth">생년월일</label>
		</td>
		<td>
			<input id="birth" type="text" name="birth"/>
		</td>
	</tr>
	<tr align="center" style="font-weight:bold;">
		<td>
			<label for="gender">성별</label>
		</td>
		<td>
			<select name="gender">
				<option selected value="남자">남자</option>
				<option selected value="여자">여자</option>
			</select>
		</td>
		<td>
			<label for="phone">연락처</label>
		</td>
		<td>
			<input id="phone" type="text" name="phone" value="${login.phone}" />
		</td>
	</tr>
	<tr >
		<td colspan="4" align="center">
			<button>저장</button><button>제출</button>
		</td>
	</tr>
	<tr >
		<td colspan="4" align="center">
			<button>저장</button><button>제출</button>
		</td>
	</tr>
	<tr >
		<td colspan="4" align="center">
			<button>저장</button><button>제출</button>
		</td>
	</tr>
	<tr >
		<td colspan="4" align="center">
			<button>저장</button><button>제출</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>