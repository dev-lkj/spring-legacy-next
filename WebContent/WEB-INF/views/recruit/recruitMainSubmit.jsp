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
	$j(document).ready(function() {
		
		

	});
</script>
<body>
	<form id="myform" method="POST" accept-charset="UTF-8">
		<input type="hidden" name="seq" value="${recruit.seq}"/>
		<table width="1000" align="center" border="2" style="padding: 10px 0;">
			<tr>
				<td align="center" style="border: none;">
					<table align="center" border="2">
						<tr align="center" style="font-weight: bold;">
							<td width="100">
								�̸�
							</td>
							<td align="left">
								<span>${recruit.name}</span>
							</td>
							<td>
								�������
							</td>
							<td align="left">
								<span>${recruit.birth}</span>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td>
								����
							</td>
							<td align="left">
								<span>${recruit.gender}</span>
							</td>
							<td>
								����ó
							</td>
							<td>
								<span>${recruit.phone}</span>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td>
								�̸���
							</td>
							<td align="left">
								<span>${recruit.email}</span>
							</td>
							<td>
								�ּ�
							</td>
							<td align="left">
								<span>${recruit.addr}</span>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td>
								����ٹ���
							</td>
							<td align="left">
								<span>${recruit.location}</span>
							</td>
							<td><label for="workType">�ٹ�����</label></td>
							<td align="left">
								<span>${recruit.workType}</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr style="border: none;">
				<td style="border: none;"><br /></td>
			</tr>
			<c:choose>
   			 <c:when test="${not empty education}">
			<tr>
				<td style="border: none;">
					<table width="900" align="center" border="2">
						<tr>
							<td align="center" style="font-weight: bold;">�з»���</td>
							<td align="center" style="font-weight: bold;">��»���</td>
							<td align="center" style="font-weight: bold;">�������</td>
							<td align="center" style="font-weight: bold;">����ٹ���/�ٹ�����</td>
						</tr>
						<tr>
							<td>���б�(${educationYear}��) ${education.division}</td>
							<td>��� ${careerYear}�� ${careerRemainingMonths}����</td>
							<td>ȸ�系�Կ� ����</td>
							<td>${recruit.location}��ü<br /> ${recruit.workType}
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</c:when>
			</c:choose>

			<tr style="border: none;">
				<td style="border: none;"><br />
				</td>
			</tr>

			<tr>
				<td align="left" style="border: none; font-weight: bold; font-size: 18px;">�з�</td>
			</tr>
			<tr style="border: none;">
			
			</tr>
			<tr>
				<td style="border: none;">
					<table id="educationTable" width="900" align="center" border="2">
						<tr>
							<td align="center" style="font-weight: bold;">���бⰣ</td>
							<td align="center" style="font-weight: bold;">����</td>
							<td align="center" style="font-weight: bold;">�б���(������)</td>
							<td align="center" style="font-weight: bold;">����</td>
							<td align="center" style="font-weight: bold;">����</td>
						</tr>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${not empty education}"> --%>
<%-- 							<c:forEach var ="edu" items="${education}"> --%>
<!-- 								<tr class="educationRow"> -->
<!-- 									<td align="center"> -->
<!-- 										<input type="checkbox" class="educationCheckbox"/> -->
<!-- 									</td> -->
<!-- 									<td> -->
<%-- 										<input type="text" name="educationVo.startPeriod" value="${edu.startPeriod}" /><br />  --%>
<!-- 										~<br />  -->
<%-- 										<input type="text" name="educationVo.endPeriod"	value="${edu.endPeriod}" /> --%>
<!-- 									</td> -->
<!-- 									<td> -->
<%-- 										<select name="division"	value="${edu.division}"> --%>
<!-- 											<option value="����">����</option> -->
<!-- 											<option value="����">����</option> -->
<!-- 											<option value="����">����</option> -->
<!-- 										</select> -->
<!-- 									</td> -->
<!-- 									<td><input type="text" name="schoolName" -->
<%-- 										value="${education.schoolName}" /> <select --%>
<%-- 										name="educationVo.location" value="${edu.location}"> --%>
<!-- 											<option value="����">����</option> -->
<!-- 											<option value="���">���</option> -->
<!-- 											<option value="����">����</option> -->
<!-- 											<option value="����">����</option> -->
<!-- 											<option value="���">���</option> -->
<!-- 											<option value="���ֵ�">���ֵ�</option> -->
<!-- 									</select></td> -->
<!-- 									<td> -->
<%-- 										<input type="text" name="major"	value="${edu.major}" /> --%>
<!-- 									</td> -->
<!-- 									<td> -->
<%-- 										<input type="text" name="grade" value="${edu.grade}" /> --%>
<!-- 									</td> -->
<!-- 								</tr> -->
<%-- 						</c:forEach> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
							<tr class="educationRow">
									<td>
										<span>${education.startPeriod}</span><br/> 
										~<br /> 
										<span>${education.endPeriod}</span>
									</td>
									<td>
										<span>${education.division}</span>
									</td>
									<td>
										<span>${education.schoolName}</span><br/>
										<span>${education.location}</span> 										
									</td>
									<td>
										<span>${education.major}</span>
									</td>
									<td>
										<span>${education.grade}</span>
									</td>
								</tr>
<%-- 						</c:otherwise> --%>
<%-- 						</c:choose> --%>
						
					</table>
				</td>
			</tr>




			<tr style="border: none; font-weight: bold; font-size: 18px;">
				<td align="left" style="border: none;">���</td>
			</tr>
			<tr>
				<td align="right" style="border: none;">
					
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<table id="careerTable" width="900" align="center" border="2">
						<tr>
							<td align="center" style="font-weight: bold;">�ٹ��Ⱓ</td>
							<td align="center" style="font-weight: bold;">ȸ���</td>
							<td align="center" style="font-weight: bold;">�μ�/����/��å</td>
							<td align="center" style="font-weight: bold;">����</td>
						</tr>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${not empty career}"> --%>
							
<%-- 							<c:forEach var ="care" items="${career}"> --%>
<!-- 								<tr class="careerRow"> -->
<!-- 									<td> -->
<!-- 										<input type="checkbox" class="careerCheckbox"/> -->
<!-- 									</td> -->
<!-- 									<td> -->
<%-- 										<input type="text" name="careerVo.startPeriod" value="${care.startPeriod}" />~<br /> --%>
<%-- 										<input type="text" name="careerVo.endPeriod" value="${care.endPeriod}" /> --%>
<!-- 									</td> -->
<!-- 									<td> -->
<%-- 										<input type="text" name="compName" value="${care.compName}" /> --%>
<!-- 									</td> -->
<!-- 									<td> -->
<%-- 										<input type="text" name="task" value="${care.task}" /> --%>
<!-- 									</td> -->
<!-- 									<td> -->
<%-- 										<input type="text" name="careerVo.location" value="${care.location}" /> --%>
<!-- 									</td> -->
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
								<tr class="careerRow">
									<td>
										<span>${career.startPeriod}</span>~<br />
									    <span>${career.endPeriod}</span>
									</td>
									<td>
										<span>${career.compName}</span>
									</td>
									<td>
										<span>${career.task}</span>
									</td>
									<td>
										<span>${career.location}</span>
									</td>
								</tr>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
					</table>
				</td>
			</tr>


			<tr>
				<td align="left"
					style="border: none; font-weight: bold; font-size: 18px;">�ڰ���
				</td>
			</tr>
			<tr>
				<td align="right" style="border: none;">
					
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<table id="certificateTable" width="900" align="center" border="2">
						<tr>
							<td align="center" style="font-weight: bold;">�ڰ�����</td>
							<td align="center" style="font-weight: bold;">�����</td>
							<td align="center" style="font-weight: bold;">����ó</td>
						</tr>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${not empty certificate}"> --%>
<%-- 						<c:forEach var ="cert" items="${certificate}"> --%>
<!-- 							<tr class="certificateRow"> -->
<!-- 								<td> -->
<!-- 									<input type="checkbox" class="certificateCheckbox" /> -->
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<input type="text" name="qualifiName" value="${cert.qualifiName}" /> --%>
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<input type="text" name="acquDate" value="${cert.acquDate}" /> --%>
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<input type="text" name="organizeName" value="${cert.organizeName}" /> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
							<tr class="certificateRow">
								<td>
									<span>${certificate.qualifiName}</span>
								</td>
								<td>
									<span>${certificate.acquDate}</span>
								</td>
								<td>
									<span>${certificate.organizeName}</span>
								</td>
							</tr>
<%-- 						</c:otherwise> --%>
<%-- 						</c:choose> --%>
					</table>
				</td>
			</tr>


		</table>

	</form>
</body>
</html>

