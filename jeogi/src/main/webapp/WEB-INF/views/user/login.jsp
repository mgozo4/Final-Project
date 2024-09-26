<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/typicons/2.0.9/typicons.min.css">
</head>
<body id="particles-js">
<div>
	<h1>LOGIN PAGE</h1>
	<form action="${path}/user/login" method="POST">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="u_id"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="u_pw"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<label>
						<input type="checkbox" name="rememberme" />
						로그인 정보 저장
					</label>
				</td>
			</tr>
			<tr>
				<th colspan="2"><button>로그인</button></th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>