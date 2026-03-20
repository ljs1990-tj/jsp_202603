<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 11_sign-up.jsp -->	
	<!-- 아이디, 비밀번호, 비밀번호 확인, 이름, 나이를 입력받아서 -->
	<!-- submit 실행 시 12_sign-up-result.jsp 로 보내기 -->
	<!-- 단, 모든 값은 빈값 x -->
	<!-- 비밀번호, 비밀번호 확인은 같은 값이여야 함 -->
	<form action="12_sign-up-result.jsp" name="signUp">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd1" type="password"></label>
		</div>
		<div>
			<label>비밀번호 확인 : <input name="pwd2" type="password"></label>
		</div>
		<div>
			<label>이름 : <input name="userName"></label>
		</div>
		<div>
			<label>나이 : <input name="age"></label>
		</div>
		<div>
			<input type="button" value="가입!" onclick="fnSignUp()">
		</div>
	</form>	
	<!-- 12_sign-up-result.jsp 에서는 받은 값을 출력 -->
	<!-- 아이디 : ooo , 이름 :ooo -->
</body>
</html>
<script>
	function fnSignUp(){
		let obj = document.signUp;
		if(obj.userId.value.length == 0){
			alert("아이디 입력하셈");
			obj.userId.focus();
			return;
		}
		if(obj.pwd1.value.length == 0){
			alert("비밀번호 입력하셈");
			obj.pwd1.focus();
			return;
		}
		if(obj.pwd1.value != obj.pwd2.value){
			alert("비밀번호 2개 다르다");
			obj.pwd1.focus();
			return;
		}
		if(obj.userName.value.length == 0){
			alert("이름 입력하셈");
			obj.userName.focus();
			return;
		}
		if(obj.age.value.length == 0){
			alert("나이 입력하셈");
			obj.age.focus();
			return;
		}
		
		obj.submit();
		
	}
</script>







