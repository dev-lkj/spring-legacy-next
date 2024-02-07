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
		    var filteredValue = inputValue.replace(/[^\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F\uAC01-\uD7A3\s]/g, ''); // �ѱ� �� ���鸸 ���
		    
		    // �ѱ��� �Էµ��� �ʾ��� �� �˸��� ǥ��
		    if (inputValue !== filteredValue) {
		        alert("�̸��� �ѱ۷� �Է����ּ���.");
		    }
		    
		    $j(this).val(filteredValue);
		    
		}); */
		$j(".phone").on("input", function(event) {
			var input = $j(this).val();
			
			if (event.which === 8) return;
			
		    // �Է� ���� ���ڰ� �ƴ� ��� �Ǵ� ���ڰ� 11�ڸ��� �ʰ��ϴ� ���
		    if (!/^\d+$/.test(input) || input.length > 11) {
		        alert("�ùٸ� ��ȭ��ȣ ������ �ƴմϴ�. ���ڷθ� �Է����ּ���.");
		        /* $j(this).val(""); // �Է� �ʵ� �ʱ�ȭ */
		        return;
		    }

		    // �Է� ������ ���ڸ� �����մϴ�.
		    var digits = input.replace(/\D/g, "");

		    // ���ڸ� ������ ����� 11�ڸ� �̻��� ��쿡�� ó���մϴ�.
		    if (digits.length >= 11) {
		        // ��ȭ��ȣ ���Ŀ� �°� ��ȯ�մϴ�.
		        var formattedNumber;
		        if (digits.length === 11) {
		            formattedNumber = digits.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
		        } else {
		            formattedNumber = digits.replace(/(\d{3})(\d{3,4})(\d{4})/, "$1-$2-$3");
		        }
		        // ��ȯ�� ���� �Է� �ʵ忡 �����մϴ�.
		        $j(this).val(formattedNumber);
		    }
		});
		
		$j("#button").on("click", function() {
			var input = $j(".required").val()
			if(input == ""){
				alert("���� �Է����ּ���.");
			}
		});
		
	});

</script>
<body>
<form action="/recruit/login" method="POST">
<table id="boardTable" align="center" border="2">
	<tr align="center" style="font-weight:bold;">
		<td>
			<label for="name">�̸�</label>
		</td>
		<td>
			<input id="name" type="text" name="name" class="name required" required/>
		</td>
	</tr>
	<tr align="center" style="font-weight:bold;">
		<td>
			<label for="phone">�޴�����ȣ</label>
		</td>
		<td>
			<input id="phone" type="text" name="phone" class="phone required" required/>
		</td>
	</tr>
	<tr >
		<td colspan="2" align="center">
			<button id="button">�Ի�����</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>