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
				alert("성공");
				
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {

		    	alert("실패");
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
						<label for="name">이름</label>
					</td>
					<td align="left">
						<input id="name" type="text" name="name"  value="${login.name}"/>
					</td>
					<td width="1000">
						<label for="birth">생년월일</label>
					</td>
					<td align="left">
						<input id="birth" type="text" name="birth" value="${login.birth}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="gender">성별</label>
					</td>
					<td align="left">
						<select name="gender">
							<option selected value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</td>
					<td>
						<label for="phone">연락처</label>
					</td>
					<td>
						<input id="phone" type="text" name="phone" value="${login.phone}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="email">이메일</label>
					</td>
					<td align="left">
						<input id="email" type="text" name="email" value="${login.email}" />
					</td>
					<td>
						<label for="addr">주소</label>
					</td>
					<td>
						<input id="addr" type="text" name="addr" value="${login.addr}" />
					</td>
				</tr>
				<tr align="center" style="font-weight:bold;">
					<td>
						<label for="location">희망근무지</label>
					</td>
					<td align="left">
						<select name="location">
							<option selected value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
						</select>
					</td>
					<td>
						<label for="workType">근무형태</label>
					</td>
					<td align="left">
						<select name="workType">
							<option selected value="정규직">정규직</option>
							<option value="계약직">계약직</option>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td align="left" border="0">
			학력
		</td>
	</tr>
	<tr>
		<td align="right" border="none">
			<button>추가</button><button>삭제</button>
		</td>
	</tr>
	<tr>
		<td>
			<table align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td>
						재학기간
					</td>
					<td>
						구분
					</td>
					<td>
						학교명(소재지)
					</td>
					<td>
						전공
					</td>
					<td>
						학점
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
							<option value="졸업">졸업</option>
							<option value="재학">재학</option>
							<option value="중퇴">중퇴</option>
						</select>
					</td>
					<td>
						<input type="text" />
						<select>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="강원">강원</option>
							<option value="전라도">전라도</option>
							<option value="경상도">경상도</option>
							<option value="제주도">제주도</option>
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
			경력
		</td>
	</tr>
	<tr>
		<td align="right" border="none">
			<button>추가</button><button>삭제</button>
		</td>
	</tr>
	<tr>
		<td>
			<table align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td>
						근무기간
					</td>
					<td>
						회사명
					</td>
					<td>
						부서/직급/직책
					</td>
					<td>
						지역
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
			자격증
		</td>
	</tr>
	<tr>
		<td align="right" border="none">
			<button>추가</button><button>삭제</button>
		</td>
	</tr>
	<tr>
		<td>
			<table align="center" border="2">
				<tr>
					<td>
						
					</td>
					<td>
						근무기간
					</td>
					<td>
						회사명
					</td>
					<td>
						부서/직급/직책
					</td>
					<td>
						지역
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
<button>저장</button><button>제출</button>


</form>
</body>
</html>

