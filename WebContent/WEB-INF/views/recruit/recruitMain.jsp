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
		// ��¥ �Է� �ʵ忡 ���� ��ȿ�� �˻縦 �����մϴ�.
	    $j(".dateInput").on("input", function() {
	        var input = $j(this).val();

	        // �Է� ���� �������� Ȯ���մϴ�.
	        if (!/^\d*$/.test(input)) {
	            alert("���ڸ� �Է��ϼ���. yy.MM.dd ���� �ڵ����� �ۼ��˴ϴ�.");
	            // ���� �Է� ���� ���ϴ�.
	            $j(this).val("");
	            return;
	        }

	        // �Է� ���� 6�ڸ� �̻����� Ȯ���մϴ�.
	        if (input.length >= 6) {
	            // 6�ڸ� �̻��� ��� yy.MM.dd �������� ��ȯ�մϴ�.
	            var formattedDate = input.replace(/^(\d{2})(\d{2})(\d{2})$/, "$1.$2.$3");
	            // ��ȯ�� ���� �Է� �ʵ忡 �����մϴ�.
	            $j(this).val(formattedDate);
	        }
	    });
		
	    $j(".required").on("change", function() {
	        var value = $j(this).val();
	        var isValid = true;

	        // �Է°��� ����ִ��� Ȯ��
	        if (value === null || value.trim() === "") {
	            isValid = false;
	        }

	        // �˸��� ǥ��
	        if (!isValid) {
	            var labelText = $j(this).siblings("label").text(); // �ش� input �Ǵ� select ����� ���̺� �ؽ�Ʈ ��������
	            alert(labelText + "���� �Է����ּ���. ������ ������� �ʽ��ϴ�.");
	        }
	    });
		
	    $j(".name").on("input", function() {
			var inputValue = $j(this).val();
		    var filteredValue = inputValue.replace(/[^\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F\uAC01-\uD7A3\s]/g, ''); // �ѱ� �� ���鸸 ���
		    
		    // �ѱ��� �Էµ��� �ʾ��� �� �˸��� ǥ��
		    if (inputValue !== filteredValue) {
		        alert("�̸��� �ѱ۷� �Է����ּ���.");
		    }
		    
		    $j(this).val(filteredValue);
		    
		});
		
	    $j(".phone").on("input keyup", function() {
	        var input = $j(this).val();

	        // �Է� ���� ���ڰ� �ƴ� ��� �Ǵ� ���ڰ� 11�ڸ��� �ʰ��ϴ� ���
	        if (!/^\d+$/.test(input) || input.length > 11) {
	            alert("�ùٸ� ��ȭ��ȣ ������ �ƴմϴ�. ���ڷθ� �Է����ּ���.");
	            $j(this).val(""); // �Է� �ʵ� �ʱ�ȭ
	            return;
	        }

	        // �Է� ������ ���ڸ� �����մϴ�.
	        var digits = input.replace(/\D/g, "");

	        // ���ڸ� ������ ����� 11�ڸ� �̻��� ��쿡�� ó���մϴ�.
	        if (digits.length >= 11) {
	            // ��ȭ��ȣ ���Ŀ� �°� ��ȯ�մϴ�.
	            var formattedNumber;
	            if (digits.length === 11) {
	                formattedNumber = digits.replace(/(\d{3})(\d{4})(\d{4})/, "0$1-$2-$3");
	            } else {
	                formattedNumber = digits.replace(/(\d{3})(\d{3,4})(\d{4})/, "0$1-$2-$3");
	            }
	            // ��ȯ�� ���� �Է� �ʵ忡 �����մϴ�.
	            $j(this).val(formattedNumber);
	        }
	    });
	    
	    $j(".educationStartDate, .educationEndDate").on("keyup", function() {
	        var startDateInput = $j(".educationStartDate").val();
	        var endDateInput = $j(".educationEndDate").val();

	        // �����ϰ� �������� �� �� �Էµ� ��쿡�� �����մϴ�.
	        if (startDateInput && endDateInput) {
	            // yy.MM.dd ������ yyyy-MM-dd �������� ��ȯ
	            var startDateArray = startDateInput.split(".");
	            var endDateArray = endDateInput.split(".");
	            var startDate = "20" + startDateArray[0] + "-" + startDateArray[1] + "-" + startDateArray[2];
	            var endDate = "20" + endDateArray[0] + "-" + endDateArray[1] + "-" + endDateArray[2];

	            // �����ϰ� �������� Date ��ü�� ��ȯ
	            startDate = new Date(startDate);
	            endDate = new Date(endDate);

	            // �������� �����Ϻ��� ���� ��� ��� �޽����� ǥ���մϴ�.
	            if (startDate > endDate) {
	                alert("�������� �����Ϻ��� ���� �� �����ϴ�.");
	                // �Է� �ʵ� �ʱ�ȭ Ȥ�� ����
	                /* $j(".educationStartDate").val("");
	                $j(".educationEndDate").val(""); */
	            }
	        }
	    });
	    
	    $j(".careerStartDate, .careerEndDate").on("keyup", function() {
	        var startDateInput = $j(".careerStartDate").val();
	        var endDateInput = $j(".careerEndDate").val();

	        // �����ϰ� �������� �� �� �Էµ� ��쿡�� �����մϴ�.
	        if (startDateInput && endDateInput) {
	            // yy.MM.dd ������ yyyy-MM-dd �������� ��ȯ
	            var startDateArray = startDateInput.split(".");
	            var endDateArray = endDateInput.split(".");
	            var startDate = "20" + startDateArray[0] + "-" + startDateArray[1] + "-" + startDateArray[2];
	            var endDate = "20" + endDateArray[0] + "-" + endDateArray[1] + "-" + endDateArray[2];

	            // �����ϰ� �������� Date ��ü�� ��ȯ
	            startDate = new Date(startDate);
	            endDate = new Date(endDate);

	            // �������� �����Ϻ��� ���� ��� ��� �޽����� ǥ���մϴ�.
	            if (startDate > endDate) {
	                alert("�������� �����Ϻ��� ���� �� �����ϴ�.");
	                // �Է� �ʵ� �ʱ�ȭ Ȥ�� ����
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
			// Ŭ�е� �࿡�� input�� select ��Ҹ� ã�Ƽ� ���� �ʱ�ȭ
		    newRow.find('input[type="text"]').val('');
		    newRow.find('select:first').val('����');
		    newRow.find('select:last').val('����');
		    
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
		        alert("�ּ��� �� ���� �����ּ���.");
		    }
		});

		$j("#careerDelete").on("click", function() {
			
			var careerRows = $j("#careerTable .careerRow");
		    var checkedRows = careerRows.has(".careerCheckbox:checked");
		    
		    if (careerRows.length > 1 && checkedRows.length > 0) {
		        checkedRows.remove();
		    } else {
		        alert("�ּ��� �� ���� �����ּ���.");
		    }
		});

		$j("#certificateDelete").on("click", function() {
			
			var certificateRows = $j("#certificateTable .certificateRow");
		    var checkedRows = certificateRows.has(".certificateCheckbox:checked");
		    
		    if (certificateRows.length > 1 && checkedRows.length > 0) {
		        checkedRows.remove();
		    } else {
		        alert("�ּ��� �� ���� �����ּ���.");
		    }
			
		});

		
		$j("#saveButton").on("click",function(){
			 
		        var value = $j(".required").val();
		        var isValid = true;

		        // �Է°��� ����ִ��� Ȯ��
		        if (value === null || value.trim() === "") {
		            isValid = false;
		        }

		        // �˸��� ǥ��
		        if (!isValid) {
		            var labelText = $j(this).siblings("label").text(); // �ش� input �Ǵ� select ����� ���̺� �ؽ�Ʈ ��������
		            alert(labelText + "���� �Է����ּ���. ������ ������� �ʽ��ϴ�.");
		        }else{
		        	$j("#myform").attr("action","/recruit/main/save");
					$j("#myform").submit();
		 			alert("save");
		        }
		 	
				
		});
		
		$j("#submitButton").on("click",function(){
			var value = $j(".required").val();
	        var isValid = true;

	        // �Է°��� ����ִ��� Ȯ��
	        if (value === null || value.trim() === "") {
	            isValid = false;
	        }

	        // �˸��� ǥ��
	        if (!isValid) {
	            var labelText = $j(this).siblings("label").text(); // �ش� input �Ǵ� select ����� ���̺� �ؽ�Ʈ ��������
	            alert(labelText + "���� �Է����ּ���. ������ ������� �ʽ��ϴ�.");
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
							<td width="100"><label for="name">�̸�</label></td>
							<td align="left">
								<input id="name" type="text" name="name" value="${recruit.name}" class="name required" required placeholder="ex) test"/>
							</td>
							<td><label for="birth">�������</label></td>
							<td align="left">
								<input id="birth" type="text" name="birth" value="${recruit.birth}" required class="dateInput required" placeholder="ex) yy.MM.dd"/>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td><label for="gender">����</label></td>
							<td align="left">
								<select	name="gender" class="required" required>
									<option selected value="����">����</option>
									<option value="����">����</option>
								</select>
							</td>
							<td><label for="phone">����ó</label></td>
							<td>
								<input id="phone" type="text" name="phone" value="${recruit.phone}" class="phone required" required placeholder="ex) 010-1234-4567"/>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td>
								<label for="email">�̸���</label>
							</td>
							<td align="left">
								<input id="email" type="text" name="email" value="${recruit.email}" class="required" required placeholder="ex) abc@abc.com"/>
							</td>
							<td>
								<label for="addr">�ּ�</label>
							</td>
							<td>
								<input id="addr" type="text" name="addr" value="${recruit.addr}" class="required" required placeholder="ex) ����� ������"/>
							</td>
						</tr>
						<tr align="center" style="font-weight: bold;">
							<td><label for="recruitLocation">����ٹ���</label></td>
							<td align="left">
								<select id="recruitLocation" name="recruitVo.location" class="required" required >
									<option value="����">����</option>
									<option value="���">���</option>
									<option value="��õ">��õ</option>
								</select>
							</td>
							<td><label for="workType">�ٹ�����</label></td>
							<td align="left">
								<select id="workType" name="workType" class="required" required>
									<option value="������">������</option>
									<option value="�����">�����</option>
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
				<td style="border: none;"><br /></td>
			</tr>

			<tr style="border: none;">
				<td style="border: none;"><br />
				</td>
			</tr>

			<tr>
				<td align="left" style="border: none; font-weight: bold; font-size: 18px;">�з�</td>
			</tr>
			<tr style="border: none;">
				<td align="right" style="border: none;">
					<button type="button" id="educationAdd">�߰�</button>
					<button type="button" id="educationDelete">����</button>
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<table id="educationTable" width="900" align="center" border="2">
						<tr>
							<td></td>
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
											<option value="����">����</option>
											<option value="����">����</option>
											<option value="����">����</option>
										</select>
									</td>
									<td>
										<input type="text" name="schoolName" value="${education.schoolName}" required class="required" placeholder="OO���б�"/> 
										<select	name="educationVo.location">
											<option value="����">����</option>
											<option value="���">���</option>
											<option value="����">����</option>
											<option value="����">����</option>
											<option value="���">���</option>
											<option value="���ֵ�">���ֵ�</option>
										</select>
									</td>
									<td>
										<input type="text" name="major" value="${education.major}" class="required" required placeholder="ex) ������"/>
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
				<td align="left" style="border: none;">���</td>
			</tr>
			<tr>
				<td align="right" style="border: none;">
					<button type="button" id="careerAdd">�߰�</button>
					<button type="button" id="careerDelete">����</button>
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<table id="careerTable" width="900" align="center" border="2">
						<tr>
							<td ></td>
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
									<td><input type="checkbox" class="careerCheckbox"/></td>
									<td>
										<input type="text" name="careerVoStartPeriod" value="${career.startPeriod}" required class="dateInput careerStartDate required" placeholder="ex) yy.MM.dd" />~<br />
									    <input type="text" name="careerVoEndPeriod" value="${career.endPeriod}" required class="dateInput careerEndDate required" placeholder="ex) yy.MM.dd"/>
									</td>
									<td>
										<input type="text" name="compName" value="${career.compName}" placeholder="ex) ���̹�"/>
									</td>
									<td>
										<input type="text" name="task" value="${career.task}" placeholder="ex) ���"/>
									</td>
									<td>
										<input type="text" name="careerVoLocation" value="${career.location}" placeholder="ex) ����� ������"/>
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
					<button type="button" id="certificateAdd">�߰�</button>
					<button type="button" id="certificateDelete">����</button>
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<table id="certificateTable" width="900" align="center" border="2">
						<tr>
							<td width="24"></td>
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
								<td><input type="checkbox" class="certificateCheckbox" /></td>
								<td>
									<input type="text" name="qualifiName" value="${certificate.qualifiName}" placeholder="ex) ����ó�����" />
								</td>
								<td>
									<input type="text" name="acquDate" value="${certificate.acquDate}" class="dateInput" placeholder="ex) yy.MM.dd" />
								</td>
								<td>
									<input type="text" name="organizeName" value="${certificate.organizeName}" placeholder="�ѱ�����η°���" />
								</td>
							</tr>
<%-- 						</c:otherwise> --%>
<%-- 						</c:choose> --%>
					</table>
				</td>
			</tr>


		</table>
		<p style="text-align: center">
			<button type="submit" id="saveButton">����</button>
			<button type="submit" id="submitButton">����</button>
		</p>




	</form>
</body>
</html>

