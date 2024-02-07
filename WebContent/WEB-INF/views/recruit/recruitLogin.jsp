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
		/* $j(".name").on("input", function() {
			var inputValue = $j(this).val();
		    var filteredValue = inputValue.replace(/[^\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F\uAC01-\uD7A3\s]/g, ''); // 한글 및 공백만 허용
		    
		    // 한글이 입력되지 않았을 때 알림을 표시
		    if (inputValue !== filteredValue) {
		        alert("이름은 한글로 입력해주세요.");
		    }
		    
		    $j(this).val(filteredValue);
		    
		}); */
		$j(".phone").on("input", function(event) {
			var input = $j(this).val();
			
			if (event.which === 8) return;
			
		    // 입력 값이 숫자가 아닌 경우 또는 숫자가 11자리를 초과하는 경우
		    if (!/^\d+$/.test(input) || input.length > 11) {
		        alert("올바른 전화번호 형식이 아닙니다. 숫자로만 입력해주세요.");
		        /* $j(this).val(""); // 입력 필드 초기화 */
		        return;
		    }

		    // 입력 값에서 숫자만 추출합니다.
		    var digits = input.replace(/\D/g, "");

		    // 숫자만 추출한 결과가 11자리 이상인 경우에만 처리합니다.
		    if (digits.length >= 11) {
		        // 전화번호 형식에 맞게 변환합니다.
		        var formattedNumber;
		        if (digits.length === 11) {
		            formattedNumber = digits.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
		        } else {
		            formattedNumber = digits.replace(/(\d{3})(\d{3,4})(\d{4})/, "$1-$2-$3");
		        }
		        // 변환된 값을 입력 필드에 설정합니다.
		        $j(this).val(formattedNumber);
		    }
		});
		
		$j("#button").on("click", function() {
			var input = $j(".required").val()
			if(input == ""){
				alert("값을 입력해주세요.");
			}
		});
		
	});

</script>
<body>
<form action="/recruit/login" method="POST">
<table id="boardTable" align="center" border="2">
	<tr align="center" style="font-weight:bold;">
		<td>
			<label for="name">이름</label>
		</td>
		<td>
			<input id="name" type="text" name="name" class="name required" required/>
		</td>
	</tr>
	<tr align="center" style="font-weight:bold;">
		<td>
			<label for="phone">휴대폰번호</label>
		</td>
		<td>
			<input id="phone" type="text" name="phone" class="phone required" required/>
		</td>
	</tr>
	<tr >
		<td colspan="2" align="center">
			<button id="button">입사지원</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>