<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="csvUpload" method="post" enctype="multipart/form-data">
 <input type="text" name="id"/>
 <input type="file" name="file"/>
 <input type ="submit" name="fileUpload"/> 
 </form>
</body>
</html>