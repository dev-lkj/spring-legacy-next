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
		
		alert("main check");
		// 날짜 입력 필드에 대한 유효성 검사를 수행합니다.
	    $j(".dateInput").on("input", function() {
	        var input = $j(this).val();

	        // 입력 값이 숫자인지 확인합니다.
	        if (!/^\d*$/.test(input)) {
	            alert("숫자만 입력하세요. yy.MM.dd 으로 자동으로 작성됩니다.");
	            // 현재 입력 값을 비웁니다.
	            $j(this).val("");
	            return;
	        }

	        // 입력 값이 6자리 이상인지 확인합니다.
	        if (input.length >= 6) {
	            // 6자리 이상일 경우 yy.MM.dd 형식으로 변환합니다.
	            var formattedDate = input.replace(/^(\d{2})(\d{2})(\d{2})$/, "$1.$2.$3");
	            // 변환된 값을 입력 필드에 설정합니다.
	            $j(this).val(formattedDate);
	        }
	    });
		
	    $j(".required").on("change", function() {
	        var value = $j(this).val();
	        var isValid = true;

	        // 입력값이 비어있는지 확인
	        if (value === null || value.trim() === "") {
	            isValid = false;
	        }

	        // 알림을 표시
	        if (!isValid) {
	            var labelText = $j(this).siblings("label").text(); // 해당 input 또는 select 요소의 레이블 텍스트 가져오기
	            alert(labelText + "값을 입력해주세요. 공백은 허용하지 않습니다.");
	        }
	    });
		
	    $j(".name").on("input", function() {
			var inputValue = $j(this).val();
		    var filteredValue = inputValue.replace(/[^\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F\uAC01-\uD7A3\s]/g, ''); // 한글 및 공백만 허용
		    
		    // 한글이 입력되지 않았을 때 알림을 표시
		    if (inputValue !== filteredValue) {
		        alert("이름은 한글로 입력해주세요.");
		    }
		    
		    $j(this).val(filteredValue);
		    
		});
		
	    $j(".phone").on("input keyup", function() {
	        var input = $j(this).val();

	        // 입력 값이 숫자가 아닌 경우 또는 숫자가 11자리를 초과하는 경우
	        if (!/^\d+$/.test(input) || input.length > 11) {
	            alert("올바른 전화번호 형식이 아닙니다. 숫자로만 입력해주세요.");
	            $j(this).val(""); // 입력 필드 초기화
	            return;
	        }

	        // 입력 값에서 숫자만 추출합니다.
	        var digits = input.replace(/\D/g, "");

	        // 숫자만 추출한 결과가 11자리 이상인 경우에만 처리합니다.
	        if (digits.length >= 11) {
	            // 전화번호 형식에 맞게 변환합니다.
	            var formattedNumber;
	            if (digits.length === 11) {
	                formattedNumber = digits.replace(/(\d{3})(\d{4})(\d{4})/, "0$1-$2-$3");
	            } else {
	                formattedNumber = digits.replace(/(\d{3})(\d{3,4})(\d{4})/, "0$1-$2-$3");
	            }
	            // 변환된 값을 입력 필드에 설정합니다.
	            $j(this).val(formattedNumber);
	        }
	    });
	    
	    $j(".educationStartDate, .educationEndDate").on("keyup", function() {
	        var startDateInput = $j(".educationStartDate").val();
	        var endDateInput = $j(".educationEndDate").val();

	        // 시작일과 종료일이 둘 다 입력된 경우에만 검증합니다.
	        if (startDateInput && endDateInput) {
	            // yy.MM.dd 형식을 yyyy-MM-dd 형식으로 변환
	            var startDateArray = startDateInput.split(".");
	            var endDateArray = endDateInput.split(".");
	            var startDate = "20" + startDateArray[0] + "-" + startDateArray[1] + "-" + startDateArray[2];
	            var endDate = "20" + endDateArray[0] + "-" + endDateArray[1] + "-" + endDateArray[2];

	            // 시작일과 종료일을 Date 객체로 변환
	            startDate = new Date(startDate);
	            endDate = new Date(endDate);

	            // 시작일이 종료일보다 늦은 경우 경고 메시지를 표시합니다.
	            if (startDate > endDate) {
	                alert("시작일은 종료일보다 늦을 수 없습니다.");
	                // 입력 필드 초기화 혹은 수정
	                /* $j(".educationStartDate").val("");
	                $j(".educationEndDate").val(""); */
	            }
	        }
	    });
	    
	    $j(".careerStartDate, .careerEndDate").on("keyup", function() {
	        var startDateInput = $j(".careerStartDate").val();
	        var endDateInput = $j(".careerEndDate").val();

	        // 시작일과 종료일이 둘 다 입력된 경우에만 검증합니다.
	        if (startDateInput && endDateInput) {
	            // yy.MM.dd 형식을 yyyy-MM-dd 형식으로 변환
	            var startDateArray = startDateInput.split(".");
	            var endDateArray = endDateInput.split(".");
	            var startDate = "20" + startDateArray[0] + "-" + startDateArray[1] + "-" + startDateArray[2];
	            var endDate = "20" + endDateArray[0] + "-" + endDateArray[1] + "-" + endDateArray[2];

	            // 시작일과 종료일을 Date 객체로 변환
	            startDate = new Date(startDate);
	            endDate = new Date(endDate);

	            // 시작일이 종료일보다 늦은 경우 경고 메시지를 표시합니다.
	            if (startDate > endDate) {
	                alert("시작일은 종료일보다 늦을 수 없습니다.");
	                // 입력 필드 초기화 혹은 수정
	               /*  $j(".careerStartDate").val("");
	                $j(".careerEndDate").val(""); */
	            }
	        }
	    });
	    
	    
		
		
		$j("select[name=gender]").val("${recruit.gender}").prop("selected",true);
		$j("select[name=recruitVoLocation]").val("${recruit.location}").prop("selected",true);
		$j("select[name=workType]").val("${recruit.workType}").prop("selected",true);
		$j("select[name=division]").val("${education.division}").prop("selected",true);
		$j("select[name=educationVoLocation]").val("${education.location}").prop("selected",true);
		
	
		$j("#educationAdd").on("click", function() {
			 var newRow = $j("#educationTable .educationRow:first").clone();
			// 클론된 행에서 input과 select 요소를 찾아서 값을 초기화
		    newRow.find('input[type="text"]').val('');
		    newRow.find('select:first').val('졸업');
		    newRow.find('select:last').val('서울');
		    
			$j("#educationTable").append(newRow);
			
		});

		$j("#careerAdd").on("click", function() {
			var newRow = $j("#careerTable .careerRow:first").clone();
		    newRow.find('input[type="text"]').val('');		    
			$j("#careerTable").append(newRow);
		});

		$j("#certificateAdd").on("click", function() {
			var newRow = $j("#certificateTable .certificateRow:first").clone();
			newRow.find('input[type="text"]').val('');		    
			$j("#certificateTable").append(newRow);
		});

		$j("#educationDelete").on("click", function() {
			var educationRows = $j("#educationTable .educationRow");
		    var checkedRows = educationRows.has(".educationCheckbox:checked");
		    
		    if (educationRows.length > 1 && checkedRows.length > 0) {
		        checkedRows.remove();
		    } else {
		        alert("최소한 한 행은 남겨주세요.");
		    }
		});

		$j("#careerDelete").on("click", function() {
			
			var careerRows = $j("#careerTable .careerRow");
		    var checkedRows = careerRows.has(".careerCheckbox:checked");
		    
		    if (careerRows.length > 1 && checkedRows.length > 0) {
		        checkedRows.remove();
		    } else {
		        alert("최소한 한 행은 남겨주세요.");
		    }
		});

		$j("#certificateDelete").on("click", function() {
			
			var certificateRows = $j("#certificateTable .certificateRow");
		    var checkedRows = certificateRows.has(".certificateCheckbox:checked");
		    
		    if (certificateRows.length > 1 && checkedRows.length > 0) {
		        checkedRows.remove();
		    } else {
		        alert("최소한 한 행은 남겨주세요.");
		    }
			
		});

		
		$j("#saveButton").on("click",function(){
			 
		        var value = $j(".required").val();
		        var isValid = true;

		        // 입력값이 비어있는지 확인
		        if (value === null || value.trim() === "") {
		            isValid = false;
		        }

		        // 알림을 표시
		        if (!isValid) {
		            var labelText = $j(this).siblings("label").text(); // 해당 input 또는 select 요소의 레이블 텍스트 가져오기
		            alert(labelText + "값을 입력해주세요. 공백은 허용하지 않습니다.");
		        }else{
		        	$j("#myform").attr("action","/recruit/main/save");
					$j("#myform").submit();
		 			alert("save");
		        }
		 	
				
		});
		
		$j("#submitButton").on("click",function(){
			var value = $j(".required").val();
	        var isValid = true;

	        // 입력값이 비어있는지 확인
	        if (value === null || value.trim() === "") {
	            isValid = false;
	        }

	        // 알림을 표시
	        if (!isValid) {
	            var labelText = $j(this).siblings("label").text(); // 해당 input 또는 select 요소의 레이블 텍스트 가져오기
	            alert(labelText + "값을 입력해주세요. 공백은 허용하지 않습니다.");
	        }else {
	        	$j("#myform").attr("action","/recruit/main/submit");
				$j("#myform").submit();
				alert("submit");	
	        }
			
		});

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
							<td width="100"><label for="name">이름</label></td>
							<td align="left">
								<input id="name" type="text" name="name" value="${recruit.name}" class="name required" required placeholder="ex) test"/>
							</td>
							<td><label for="birth">생년월일</label></td>
							<td align="left">
								<input id="birth" type="text" name="birth" value="${recruit.birth}" required class="dateInput required" placeholder="ex) yy.MM.dd"/>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td><label for="gender">성별</label></td>
							<td align="left">
								<select	name="gender" class="required" required>
									<option selected value="남자">남자</option>
									<option value="여자">여자</option>
								</select>
							</td>
							<td><label for="phone">연락처</label></td>
							<td>
								<input id="phone" type="text" name="phone" value="${recruit.phone}" class="phone required" required placeholder="ex) 010-1234-4567"/>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td>
								<label for="email">이메일</label>
							</td>
							<td align="left">
								<input id="email" type="text" name="email" value="${recruit.email}" class="required" required placeholder="ex) abc@abc.com"/>
							</td>
							<td>
								<label for="addr">주소</label>
							</td>
							<td>
								<input id="addr" type="text" name="addr" value="${recruit.addr}" class="required" required placeholder="ex) 서울시 강남구"/>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td><label for="recruitLocation">희망근무지</label></td>
							<td align="left">
								<select id="recruitLocation" name="recruitVo.location" class="required" required >
									<option value="서울">서울</option>
									<option value="경기">경기</option>
									<option value="인천">인천</option>
								</select>
							</td>
							<td><label for="workType">근무형태</label></td>
							<td align="left">
								<select id="workType" name="workType" class="required" required>
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
   			 <c:when test="${not empty education and not empty sessionScope.login}">
			
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
				<td style="border: none;"><br /></td>
			</tr>

			<tr style="border: none;">
				<td style="border: none;"><br />
				</td>
			</tr>

			<tr>
				<td align="left" style="border: none; font-weight: bold; font-size: 18px;">학력</td>
			</tr>
			<tr style="border: none;">
				<td align="right" style="border: none;">
					<button type="button" id="educationAdd">추가</button>
					<button type="button" id="educationDelete">삭제</button>
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
										<input type="checkbox" class="educationCheckbox"/>
									</td>
									<td>
										<input type="text" name="educationVoStartPeriod" value="${education.startPeriod}" required class="dateInput educationStartDate required" placeholder="ex) yy.MM.dd"/><br /> 
										~<br /> 
										<input type="text" name="educationVoEndPeriod"	value="${education.endPeriod}" required class="dateInput educationEndDate required" placeholder="ex) yy.MM.dd"/>
									</td>
									<td>
										<select name="division">
											<option value="졸업">졸업</option>
											<option value="재학">재학</option>
											<option value="중퇴">중퇴</option>
										</select>
									</td>
									<td>
										<input type="text" name="schoolName" value="${education.schoolName}" required class="required" placeholder="OO대학교"/> 
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
										<input type="text" name="major" value="${education.major}" class="required" required placeholder="ex) 기계공학"/>
									</td>
									<td>
										<input type="text" name="grade" value="${education.grade}" class="required" required placeholder="ex) 3.5"/>
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
					<button type="button" id="careerAdd">추가</button>
					<button type="button" id="careerDelete">삭제</button>
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
									<td><input type="checkbox" class="careerCheckbox"/></td>
									<td>
										<input type="text" name="careerVoStartPeriod" value="${career.startPeriod}" required class="dateInput careerStartDate required" placeholder="ex) yy.MM.dd" />~<br />
									    <input type="text" name="careerVoEndPeriod" value="${career.endPeriod}" required class="dateInput careerEndDate required" placeholder="ex) yy.MM.dd"/>
									</td>
									<td>
										<input type="text" name="compName" value="${career.compName}" placeholder="ex) 네이버"/>
									</td>
									<td>
										<input type="text" name="task" value="${career.task}" placeholder="ex) 사원"/>
									</td>
									<td>
										<input type="text" name="careerVoLocation" value="${career.location}" placeholder="ex) 서울시 강남구"/>
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
					<button type="button" id="certificateAdd">추가</button>
					<button type="button" id="certificateDelete">삭제</button>
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
								<td><input type="checkbox" class="certificateCheckbox" /></td>
								<td>
									<input type="text" name="qualifiName" value="${certificate.qualifiName}" placeholder="ex) 정보처리기사" />
								</td>
								<td>
									<input type="text" name="acquDate" value="${certificate.acquDate}" class="dateInput" placeholder="ex) yy.MM.dd" />
								</td>
								<td>
									<input type="text" name="organizeName" value="${certificate.organizeName}" placeholder="한국산업인력공단" />
								</td>
							</tr>
<%-- 						</c:otherwise> --%>
<%-- 						</c:choose> --%>
					</table>
				</td>
			</tr>


		</table>
		<p style="text-align: center">
			<button type="submit" id="saveButton">저장</button>
			<button type="submit" id="submitButton">제출</button>
		</p>




	</form>
</body>
</html>

