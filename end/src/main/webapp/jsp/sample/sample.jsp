<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sample</title>
</head>
<body>
	<form action="/end/gb/send/sms" method="post">
		<input type="text" id="name" name="name" value="my_name" /> <input
			type="submit" value="提交" />
	</form>
	<br />
	<form action="/end/gb/send/email" method="post">
		<input type="text" id="name" name="name" value="my_name" /> <input
			type="submit" value="提交" />
	</form>
</body>
</html>