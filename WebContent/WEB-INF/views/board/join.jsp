<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Join</title>
</head>
<script>
		$j(document).ready(function(){
		
			
		});
</script>
<body>
	<table align="center">
		<tr>
			<td>
				<a href="/board/boardList.do" title="list">List</a>
			</td>
		</tr>
		<tr>
			<td align="center">
				<table id="boardTable" border="1">
					<tr>
						<td width="80" align="center">
							<label for="userId">id</label>
						</td>
						<td width="300">
							<input type="text" id="userId" name="userId" placeholder="id" />
							<button>중복확인</button>
						</td>
					</tr>
					<tr>
						<td align="center">
							<label for="userPw">pw</label>
						</td>
						<td>
							<input type="text" id="userPw" name="userPw" placeholder="pw" />
						</td>
					</tr>
					<tr>
						<td align="center">
							<label for="userPw2">pw check</label>
						</td>
						<td>
							<input type="text" id="userPw2" name="userPw2" placeholder="pw2" />
						</td>
					</tr>
					<tr>
						<td align="center">
							<label for="userName">name</label>
						</td>
						<td>
							<input type="text" id="userName" name="userName" placeholder="name" />
						</td>
					</tr>
					<tr>
						<td align="center">
							phone
						</td>
						<td>
							<select id="userPhone1" title="userPhone1" name="userPhone1">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> -
							<input type="text" style="width:30px;" id="userPhone2" name="userPhone2" title="userPhone2"/> - 
							<input type="text" style="width:30px;" id="userPhone3" name="userPhone3" title="userPhone3"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<label for="userAdd1">postNo</label>
						</td>
						<td>
							<input type="text" id="userAdd1" name="userAdd1" placeholder="xxx-xxx" />
						</td>
					</tr>
					<tr>
						<td align="center">
							<label for="userAdd2">address</label>
						</td>
						<td>
							<input type="text" id="userAdd2" name="userAdd2" placeholder="address" />
						</td>
					</tr>
					<tr>
						<td align="center">
							<label for="userCompany">company</label>
						</td>
						<td>
							<input type="text" id="userCompany" name="userCompany" placeholder="company" />
						</td>
					</tr>					
				</table>
			</td>

		</tr>
		<tr>
			<td align="right">
				<button style="border:none; background-color:white;">join</button>
			</td>
		</tr>
		

	
	</table>
</body>
</html>