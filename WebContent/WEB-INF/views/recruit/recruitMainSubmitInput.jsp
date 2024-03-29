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
		
		$j("select[name=gender]").val("${recruit.gender}").prop("selected",true);
		$j("select[name=recruitVo.location]").val("${recruit.location}").prop("selected",true);
		$j("select[name=workType]").val("${recruit.workType}").prop("selected",true);
		$j("select[name=division]").val("${education.division}").prop("selected",true);
		$j("select[name=educationVo.location]").val("${education.location}").prop("selected",true);

		

	});
</script>
<body>
	<form id="myform" method="POST" accept-charset="UTF-8">
		<table width="1000" align="center" border="2" style="padding: 10px 0;">
			<tr>
				<td align="center" style="border: none;">
					<table align="center" border="2">
						<tr align="center" style="font-weight: bold;">
							<td width="100">
								<label for="name">이름</label>
							</td>
							<td align="left">
								<input readOnly id="name" type="text" name="name" value="${recruit.name}" />
							</td>
							<td>
								<label for="birth">생년월일</label>
							</td>
							<td align="left">
								<input readOnly id="birth" type="text" name="birth" value="${recruit.birth}" />
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td>
								<label for="gender">성별</label>
							</td>
							<td align="left">
								<select	name="gender">
									<option value="남자">남자</option>
									<option  value="여자">여자</option>
								</select>
							</td>
							<td>
								<label for="phone">연락처</label>
							</td>
							<td>
								<input readOnly id="phone" type="text" name="phone" value="${recruit.phone}" />
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td>
								<label for="email">이메일</label>
							</td>
							<td align="left">
								<input readOnly id="email" type="text" name="email" value="${recruit.email}" />
							</td>
							<td>
								<label for="addr">주소</label>
							</td>
							<td>
								<input readOnly id="addr" type="text" name="addr" value="${recruit.addr}" />
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td>
								<label for="location">희망근무지</label>
							</td>
							<td align="left">
								<select name="recruitVo.location">
									<option  value="서울">서울</option>
									<option  value="경기">경기</option>
									<option value="인천">인천</option>
								</select>
							</td>
							<td><label for="workType">근무형태</label></td>
							<td align="left">
								<select name="workType">
									<option value="정규직">정규직</option>
									<option value="계약직">계약직</option>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr style="border: none;">
				<td style="border: none;"><br /></td>
			</tr>
			<c:choose>
   			 <c:when test="${not empty sessionScope.login}">
			<tr>
				<td style="border: none;">
					<table width="900" align="center" border="2">
						<tr>
							<td align="center" style="font-weight: bold;">학력사항</td>
							<td align="center" style="font-weight: bold;">경력사항</td>
							<td align="center" style="font-weight: bold;">희망연봉</td>
							<td align="center" style="font-weight: bold;">희망근무지/근무형태</td>
						</tr>
						<tr>
							<td>대학교(${educationYear}년) ${education.division}</td>
							<td>경력 ${careerYear}년 ${careerRemainingMonths}개월</td>
							<td>회사내규에 따름</td>
							<td>${recruit.location}전체<br /> ${recruit.workType}
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
				<td align="left"
					style="border: none; font-weight: bold; font-size: 18px;">학력</td>
			</tr>
			<tr style="border: none;">
				<td align="right" style="border: none;">
					<button disabled="disabled" type="button" id="educationAdd">추가</button>
					<button disabled="disabled" type="button" id="educationDelete">삭제</button>
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<table id="educationTable" width="900" align="center" border="2">
						<tr>
							<td></td>
							<td align="center" style="font-weight: bold;">재학기간</td>
							<td align="center" style="font-weight: bold;">구분</td>
							<td align="center" style="font-weight: bold;">학교명(소재지)</td>
							<td align="center" style="font-weight: bold;">전공</td>
							<td align="center" style="font-weight: bold;">학점</td>
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
<!-- 											<option value="졸업">졸업</option> -->
<!-- 											<option value="재학">재학</option> -->
<!-- 											<option value="중퇴">중퇴</option> -->
<!-- 										</select> -->
<!-- 									</td> -->
<!-- 									<td><input type="text" name="schoolName" -->
<%-- 										value="${education.schoolName}" /> <select --%>
<%-- 										name="educationVo.location" value="${edu.location}"> --%>
<!-- 											<option value="서울">서울</option> -->
<!-- 											<option value="경기">경기</option> -->
<!-- 											<option value="강원">강원</option> -->
<!-- 											<option value="전라도">전라도</option> -->
<!-- 											<option value="경상도">경상도</option> -->
<!-- 											<option value="제주도">제주도</option> -->
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
									<td align="center">
										<input readOnly type="checkbox" class="educationCheckbox"/>
									</td>
									<td>
										<input readOnly type="text" name="educationVo.startPeriod" value="${education.startPeriod}" /><br /> 
										~<br /> 
										<input readOnly type="text" name="educationVo.endPeriod"	value="${education.endPeriod}" />
									</td>
									<td>
										<select name="division">
											<option value="졸업">졸업</option>
											<option value="재학">재학</option>
											<option value="중퇴">중퇴</option>
										</select>
									</td>
									<td>
										<input type="text" name="schoolName" value="${education.schoolName}" /> 
										<select	name="educationVo.location">
											<option value="서울">서울</option>
											<option value="경기">경기</option>
											<option value="강원">강원</option>
											<option value="전라도">전라도</option>
											<option value="경상도">경상도</option>
											<option value="제주도">제주도</option>
										</select>
									</td>
									<td>
										<input type="text" name="major" value="${education.major}" />
									</td>
									<td>
										<input type="text" name="grade" value="${education.grade}" />
									</td>
								</tr>
<%-- 						</c:otherwise> --%>
<%-- 						</c:choose> --%>
						
					</table>
				</td>
			</tr>




			<tr style="border: none; font-weight: bold; font-size: 18px;">
				<td align="left" style="border: none;">경력</td>
			</tr>
			<tr>
				<td align="right" style="border: none;">
					<button disabled="disabled" type="button" id="careerAdd">추가</button>
					<button disabled="disabled" type="button" id="careerDelete">삭제</button>
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<table id="careerTable" width="900" align="center" border="2">
						<tr>
							<td ></td>
							<td align="center" style="font-weight: bold;">근무기간</td>
							<td align="center" style="font-weight: bold;">회사명</td>
							<td align="center" style="font-weight: bold;">부서/직급/직책</td>
							<td align="center" style="font-weight: bold;">지역</td>
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
									<td><input readOnly type="checkbox" class="careerCheckbox"/></td>
									<td>
										<input readOnly type="text" name="careerVo.startPeriod" value="${career.startPeriod}" />~<br />
									    <input readOnly type="text" name="careerVo.endPeriod" value="${career.endPeriod}" />
									</td>
									<td>
										<input readOnly type="text" name="compName" value="${career.compName}" />
									</td>
									<td>
										<input readOnly type="text" name="task" value="${career.task}" />
									</td>
									<td>
										<input readOnly type="text" name="careerVo.location" value="${career.location}" />
									</td>
								</tr>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
					</table>
				</td>
			</tr>


			<tr>
				<td align="left"
					style="border: none; font-weight: bold; font-size: 18px;">자격증
				</td>
			</tr>
			<tr>
				<td align="right" style="border: none;">
					<button disabled="disabled" type="button" id="certificateAdd">추가</button>
					<button disabled="disabled" type="button" id="certificateDelete">삭제</button>
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<table id="certificateTable" width="900" align="center" border="2">
						<tr>
							<td width="24"></td>
							<td align="center" style="font-weight: bold;">자격증명</td>
							<td align="center" style="font-weight: bold;">취득일</td>
							<td align="center" style="font-weight: bold;">발행처</td>
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
								<td><input readOnly type="checkbox" class="certificateCheckbox" /></td>
								<td>
									<input readOnly type="text" name="qualifiName" value="${certificate.qualifiName}" />
								</td>
								<td>
									<input readOnly type="text" name="acquDate" value="${certificate.acquDate}" />
								</td>
								<td>
									<input readOnly type="text" name="organizeName" value="${certificate.organizeName}" />
								</td>
							</tr>
<%-- 						</c:otherwise> --%>
<%-- 						</c:choose> --%>
					</table>
				</td>
			</tr>


		</table>
		<p style="text-align: center">
			<button disabled="disabled" type="submit" id="saveButton">저장</button>
			<button disabled="disabled" type="submit" id="submitButton">제출</button>
		</p>




	</form>
</body>
</html>

