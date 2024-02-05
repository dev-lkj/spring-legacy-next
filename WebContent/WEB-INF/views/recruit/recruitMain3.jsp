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
		$j("#education").on("click",function(){
			/* var inputs = $j("#education").closest("tr").find("input:text");
			var inputJson = inputs.serialize();
			alert(inputJson);
			// Loop through each input element and print its name
		    inputs.each(function() {
		        alert($j(this).prop("name"));
		        alert();
		    }); */
		    
			var inputs = $("#education").closest("tr").find("input:text");
            var inputArray = [];

            // Loop through each input element and push its value to the array
            inputs.each(function() {
                inputArray.push({
                    name: $(this).prop("name"),
                    value: $(this).val()
                });
            });

            // Convert the array to JSON
            var inputJson = JSON.stringify(inputArray);
            alert(inputJson);
			
			
		});
		
		$j("#educationAdd").on("click",function(){
			/* $j("#education").closest("tr")
			.html("""
					<td align="center">
					<input type="checkbox" id="education"/>
				</td>
				<td>
					<input type="text" name="educationVo.startPeriod" value="${education.startPeriod}"/><br/>
					~<br/>
					<input type="text" name="educationVo.endPeriod" value="${education.endPeriod}" />
				</td>
				<td>
					<select name="educationVo.division" value="${education.division}">
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="����">����</option>
					</select>
				</td>
				<td>
					<input type="text" name="educationVo.schoolName" value="${education.schoolName}"/>
					<select name="educationVo.location" value="${education.location}">
						<option value="����">����</option>
						<option value="���">���</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="���">���</option>
						<option value="���ֵ�">���ֵ�</option>
					</select>
				</td>
				<td>
					<input type="text" name="educationVo.major" value="${education.major}"/>
				</td>
				<td>
					<input type="text" name="educationVo.grade" value="${education.grade}"/>
				</td>

			""") */
			
		});
		
		$j("#careerAdd").on("click",function(){
			
			
		});
		
		
		$j("#certificateAdd").on("click",function(){
			
			
		});
		
		$j("#educationDelete").on("click",function(){
			
			
		});
		
		$j("#careerDelete").on("click",function(){
			
			
		});
		
		
		$j("#certificateDelete").on("click",function(){
			
			
		});
		
		

	
	
		
	});

</script>
<body>
<form action="/recruit/main" method="POST">
<table width="1000" align="center" border="2" style="padding:10px 0;">
	<tr>
		<td align="center" style="border:none;">
			<table align="center" border="2">
				<tr align="center" style="font-weight:bold;">
					<td width="100">
						<label for="name">�̸�</label>
					</td>
					<td align="left">
						<input id="name" type="text" name="recruitVo.name"  value="${recruit.name}"/>
					</td>
					<td >
						<label for="birth">�������</label>
					</td>
					<td align="left">
						<input id="birth" type="text" name="recruitVo.birth" value="${recruit.birth}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="gender">����</label>
					</td>
					<td align="left">
						<select name="recruitVo.gender" value="${recruit.gender}">
							<option selected value="����">����</option>
							<option value="����">����</option>
						</select>
					</td>
					<td>
						<label for="phone">����ó</label>
					</td>
					<td>
						<input id="phone" type="text" name="recruitVo.phone" value="${recruit.phone}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="email">�̸���</label>
					</td>
					<td align="left">
						<input id="email" type="text" name="recruitVo.email" value="${recruit.email}" />
					</td>
					<td>
						<label for="addr">�ּ�</label>
					</td>
					<td>
						<input id="addr" type="text" name="recruitVo.addr" value="${recruit.addr}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="location">����ٹ���</label>
					</td>
					<td align="left">
						<select name="recruitVo.location" value="${recruit.location}">
							<option selected value="����">����</option>
							<option value="���">���</option>
							<option value="��õ">��õ</option>
						</select>
					</td>
					<td>
						<label for="workType">�ٹ�����</label>
					</td>
					<td align="left">
						<select name="recruitVo.workType" value="${recruit.workType}">
							<option selected value="������">������</option>
							<option value="�����">�����</option>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr style="border:none;">
		<td style="border:none;">
			<br/>
		</td>
	</tr>
	
	<tr>
		<td style="border:none;">
			<table width="900" align="center" border="2" >
				<tr>
					<td align="center" style="font-weight:bold;">
						�з»���
					</td>
					<td align="center" style="font-weight:bold;">
						��»���
					</td>
					<td align="center" style="font-weight:bold;">
						�������
					</td>
					<td align="center" style="font-weight:bold;">
						����ٹ���/�ٹ�����
					</td>
				</tr>
				<tr>
					<td>
						���б�(4��) ����
					</td>
					<td>
						��� 3�� 8����
					</td>
					<td>
						ȸ�系�Կ� ����
					</td>
					<td>
						������ü<br/>
						������
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr style="border:none;">
		<td style="border:none;">
			<br/>
		</td>
	</tr>
	
	<tr>
		<td align="left" style="border:none; font-weight:bold; font-size:18px;">
			�з�
		</td>
	</tr>
	<tr style="border:none;">
		<td align="right" style="border:none;">
			<button type="button" id="educationAdd">�߰�</button><button type="button" id="educationDelete">����</button>
		</td>
	</tr>
	<tr >
		<td style="border:none;">
			<table width="900" align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td align="center" style="font-weight:bold;">
						���бⰣ
					</td>
					<td align="center" style="font-weight:bold;">
						����
					</td>
					<td align="center" style="font-weight:bold;">
						�б���(������)
					</td>
					<td align="center" style="font-weight:bold;">
						����
					</td>
					<td align="center" style="font-weight:bold;">
						����
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="checkbox" id="education"/>
					</td>
					<td>
						<input type="text" name="educationVo.startPeriod" value="${education.startPeriod}"/><br/>
						~<br/>
						<input type="text" name="educationVo.endPeriod" value="${education.endPeriod}" />
					</td>
					<td>
						<select name="educationVo.division" value="${education.division}">
							<option value="����">����</option>
							<option value="����">����</option>
							<option value="����">����</option>
						</select>
					</td>
					<td>
						<input type="text" name="educationVo.schoolName" value="${education.schoolName}"/>
						<select name="educationVo.location" value="${education.location}">
							<option value="����">����</option>
							<option value="���">���</option>
							<option value="����">����</option>
							<option value="����">����</option>
							<option value="���">���</option>
							<option value="���ֵ�">���ֵ�</option>
						</select>
					</td>
					<td>
						<input type="text" name="educationVo.major" value="${education.major}"/>
					</td>
					<td>
						<input type="text" name="educationVo.grade" value="${education.grade}"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	
	
	<tr style="border:none; font-weight:bold; font-size:18px;">
		<td align="left" style="border:none;">
			���
		</td>
	</tr>
	<tr>
		<td align="right" style="border:none;">
			<button type="button" id="careerAdd">�߰�</button><button type="button" id="careerDelete">����</button>
		</td>
	</tr>
	<tr>
		<td style="border:none;">
			<table width="900" align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td align="center" style="font-weight:bold;">
						�ٹ��Ⱓ
					</td>
					<td align="center" style="font-weight:bold;">
						ȸ���
					</td>
					<td align="center" style="font-weight:bold;">
						�μ�/����/��å
					</td>
					<td align="center" style="font-weight:bold;">
						����
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" id="career"/>
					</td>
					<td>
						<input type="text" name="careerVo.startPeriod" value="${career.startPeriod}"/>~<br/>
						<input type="text" name="careerVo.endPeriod" value="${career.endPeriod}"/>
					</td>
					<td>
						<input type="text" name="careerVo.compName" value="${career.compName}"/>
					</td>
					<td>
						<input type="text" name="careerVo.task" value="${career.task}"/>
					</td>
					<td>
						<input type="text" name="careerVo.location" value="${career.location}"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td align="left" style="border:none; font-weight:bold; font-size:18px;">
			�ڰ���
		</td>
	</tr>
	<tr>
		<td align="right" style="border:none;">
			<button type="button" id="certificateAdd">�߰�</button><button type="button" id="certificateDelete">����</button>
		</td>
	</tr>
	<tr >
		<td style="border:none;">
			<table width="900" align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td align="center" style="font-weight:bold;">
						�ڰ�����
					</td>
					<td align="center" style="font-weight:bold;">
						�����
					</td>
					<td align="center" style="font-weight:bold;">
						����ó
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" id="certificate"/>
					</td>
					<td>
						<input type="text" name="certificateVo.qualifiName" value="${certificate.qualifiName}" />
					</td>
					<td>
						<input type="text" name="certificateVo.acquDate" value="${certificate.acquDate}" />
					</td>
					<td>
						<input type="text" name="certificateVo.organizeName" value="${certificate.organizeName}" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td>
			<p style="text-align:center">
				<button type="button">����</button><button type="submit">����</button>		
			</p>
		</td>
	</tr>
	
	
</table>




</form>
</body>
</html>

