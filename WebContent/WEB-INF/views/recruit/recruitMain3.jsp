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
						<option value="졸업">졸업</option>
						<option value="재학">재학</option>
						<option value="중퇴">중퇴</option>
					</select>
				</td>
				<td>
					<input type="text" name="educationVo.schoolName" value="${education.schoolName}"/>
					<select name="educationVo.location" value="${education.location}">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="전라도">전라도</option>
						<option value="경상도">경상도</option>
						<option value="제주도">제주도</option>
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
						<label for="name">이름</label>
					</td>
					<td align="left">
						<input id="name" type="text" name="recruitVo.name"  value="${recruit.name}"/>
					</td>
					<td >
						<label for="birth">생년월일</label>
					</td>
					<td align="left">
						<input id="birth" type="text" name="recruitVo.birth" value="${recruit.birth}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="gender">성별</label>
					</td>
					<td align="left">
						<select name="recruitVo.gender" value="${recruit.gender}">
							<option selected value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</td>
					<td>
						<label for="phone">연락처</label>
					</td>
					<td>
						<input id="phone" type="text" name="recruitVo.phone" value="${recruit.phone}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="email">이메일</label>
					</td>
					<td align="left">
						<input id="email" type="text" name="recruitVo.email" value="${recruit.email}" />
					</td>
					<td>
						<label for="addr">주소</label>
					</td>
					<td>
						<input id="addr" type="text" name="recruitVo.addr" value="${recruit.addr}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="location">희망근무지</label>
					</td>
					<td align="left">
						<select name="recruitVo.location" value="${recruit.location}">
							<option selected value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
						</select>
					</td>
					<td>
						<label for="workType">근무형태</label>
					</td>
					<td align="left">
						<select name="recruitVo.workType" value="${recruit.workType}">
							<option selected value="정규직">정규직</option>
							<option value="계약직">계약직</option>
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
						학력사항
					</td>
					<td align="center" style="font-weight:bold;">
						경력사항
					</td>
					<td align="center" style="font-weight:bold;">
						희망연봉
					</td>
					<td align="center" style="font-weight:bold;">
						희망근무지/근무형태
					</td>
				</tr>
				<tr>
					<td>
						대학교(4년) 졸업
					</td>
					<td>
						경력 3년 8개월
					</td>
					<td>
						회사내규에 따름
					</td>
					<td>
						서울전체<br/>
						정규직
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
			학력
		</td>
	</tr>
	<tr style="border:none;">
		<td align="right" style="border:none;">
			<button type="button" id="educationAdd">추가</button><button type="button" id="educationDelete">삭제</button>
		</td>
	</tr>
	<tr >
		<td style="border:none;">
			<table width="900" align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td align="center" style="font-weight:bold;">
						재학기간
					</td>
					<td align="center" style="font-weight:bold;">
						구분
					</td>
					<td align="center" style="font-weight:bold;">
						학교명(소재지)
					</td>
					<td align="center" style="font-weight:bold;">
						전공
					</td>
					<td align="center" style="font-weight:bold;">
						학점
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
							<option value="졸업">졸업</option>
							<option value="재학">재학</option>
							<option value="중퇴">중퇴</option>
						</select>
					</td>
					<td>
						<input type="text" name="educationVo.schoolName" value="${education.schoolName}"/>
						<select name="educationVo.location" value="${education.location}">
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="강원">강원</option>
							<option value="전라도">전라도</option>
							<option value="경상도">경상도</option>
							<option value="제주도">제주도</option>
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
			경력
		</td>
	</tr>
	<tr>
		<td align="right" style="border:none;">
			<button type="button" id="careerAdd">추가</button><button type="button" id="careerDelete">삭제</button>
		</td>
	</tr>
	<tr>
		<td style="border:none;">
			<table width="900" align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td align="center" style="font-weight:bold;">
						근무기간
					</td>
					<td align="center" style="font-weight:bold;">
						회사명
					</td>
					<td align="center" style="font-weight:bold;">
						부서/직급/직책
					</td>
					<td align="center" style="font-weight:bold;">
						지역
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
			자격증
		</td>
	</tr>
	<tr>
		<td align="right" style="border:none;">
			<button type="button" id="certificateAdd">추가</button><button type="button" id="certificateDelete">삭제</button>
		</td>
	</tr>
	<tr >
		<td style="border:none;">
			<table width="900" align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td align="center" style="font-weight:bold;">
						자격증명
					</td>
					<td align="center" style="font-weight:bold;">
						취득일
					</td>
					<td align="center" style="font-weight:bold;">
						발행처
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
				<button type="button">저장</button><button type="submit">제출</button>		
			</p>
		</td>
	</tr>
	
	
</table>




</form>
</body>
</html>

