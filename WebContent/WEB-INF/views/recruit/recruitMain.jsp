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
		/* var url = "/recruit/Login";
		$j.ajax({
		    url : url,
		    dataType: "json",
		    type: "GET",
		    data : param,
	 	    success: function(data, textStatus, jqXHR)
		    {
				alert("����");
				
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {

		    	alert("����");
		    } 
		    
		}); */
		
		

	
	
		
	});

</script>
<body>
<form action="/recruit/main" method="POST">
<table id="borderTable" align="center" border="2">
	<tr align="center">
		<td align="center">
			<table align="center" border="2">
				<tr align="center" style="font-weight:bold;">
					<td width="1000">
						<label for="name">�̸�</label>
					</td>
					<td align="left">
						<input id="name" type="text" name="name"  value="${login.name}"/>
					</td>
					<td width="1000">
						<label for="birth">�������</label>
					</td>
					<td align="left">
						<input id="birth" type="text" name="birth" value="${login.birth}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="gender">����</label>
					</td>
					<td align="left">
						<select name="gender">
							<option selected value="����">����</option>
							<option value="����">����</option>
						</select>
					</td>
					<td>
						<label for="phone">����ó</label>
					</td>
					<td>
						<input id="phone" type="text" name="phone" value="${login.phone}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="email">�̸���</label>
					</td>
					<td align="left">
						<input id="email" type="text" name="email" value="${login.email}" />
					</td>
					<td>
						<label for="addr">�ּ�</label>
					</td>
					<td>
						<input id="addr" type="text" name="addr" value="${login.addr}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="location">����ٹ���</label>
					</td>
					<td align="left">
						<select name="location">
							<option selected value="����">����</option>
							<option value="���">���</option>
							<option value="��õ">��õ</option>
						</select>
					</td>
					<td>
						<label for="workType">�ٹ�����</label>
					</td>
					<td align="left">
						<select name="workType">
							<option selected value="������">������</option>
							<option value="�����">�����</option>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td align="left" border="0">
			�з�
		</td>
	</tr>
	<tr>
		<td align="right" border="none">
			<button>�߰�</button><button>����</button>
		</td>
	</tr>
	<tr>
		<td>
			<table align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td>
						���бⰣ
					</td>
					<td>
						����
					</td>
					<td>
						�б���(������)
					</td>
					<td>
						����
					</td>
					<td>
						����
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" />
					</td>
					<td>
						<input type="text" /><br/>
						~
						<br/><input type="text" />
					</td>
					<td>
						<select>
							<option value="����">����</option>
							<option value="����">����</option>
							<option value="����">����</option>
						</select>
					</td>
					<td>
						<input type="text" />
						<select>
							<option value="����">����</option>
							<option value="���">���</option>
							<option value="����">����</option>
							<option value="����">����</option>
							<option value="���">���</option>
							<option value="���ֵ�">���ֵ�</option>
						</select>
					</td>
					<td>
						<input type="text" />
					</td>
					<td>
						<input type="text" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	
	
	<tr>
		<td align="left" border="0">
			���
		</td>
	</tr>
	<tr>
		<td align="right" border="none">
			<button>�߰�</button><button>����</button>
		</td>
	</tr>
	<tr>
		<td>
			<table align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td>
						�ٹ��Ⱓ
					</td>
					<td>
						ȸ���
					</td>
					<td>
						�μ�/����/��å
					</td>
					<td>
						����
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" />
					</td>
					<td>
						<input type="text" />~<br/>
						<input type="text" />
					</td>
					<td>
						<input type="text" />
					</td>
					<td>
						<input type="text" />
					</td>
					<td>
						<input type="text" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td align="left" border="0">
			�ڰ���
		</td>
	</tr>
	<tr>
		<td align="right" border="none">
			<button>�߰�</button><button>����</button>
		</td>
	</tr>
	<tr>
		<td>
			<table align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td>
						�ٹ��Ⱓ
					</td>
					<td>
						ȸ���
					</td>
					<td>
						�μ�/����/��å
					</td>
					<td>
						����
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" />
					</td>
					<td>
						<input type="text" />~<br/>
						<input type="text" />
					</td>
					<td>
						<input type="text" />
					</td>
					<td>
						<input type="text" />
					</td>
					<td>
						<input type="text" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	
	
</table>
<button>����</button><button>����</button>


</form>
</body>
</html>

