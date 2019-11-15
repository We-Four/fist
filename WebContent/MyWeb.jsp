<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="MyWebJS.js"></script>
<link rel="stylesheet" href="MyWeb.css" />
</head>
<body>
	<div id="box">
		<div id="cus">
			<table id="customers">
				<tr>
					<th colspan="5" valign="middle">Employee Information</th>
				</tr>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>age</th>
					<th>gender</th>
					<th>address</th>
				</tr>
				<tr>
					<td ondblclick="sr()">1</td>
					<td ondblclick="sr()">admin</td>
					<td ondblclick="sr()">20</td>
					<td ondblclick="sr()">男</td>
					<td ondblclick="sr()">CN</td>
				</tr>
			</table>
		</div>
		<div id="we">
			<button id="jia" onclick="jian()"></button>
			<button id="oo" onclick="jie()"></button>
		</div>
	</div>
</body>
</html>