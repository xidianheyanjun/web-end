<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>image</title>
</head>
<body>
	<img src="/end/image" />

	<h2>Hello World!</h2>
	<form action="/end/upload/image" method="post"
		enctype="multipart/form-data">
		<input type="file" id="file" name="file" /> <input type="submit"
			value="提交" />
	</form>
</body>
</html>