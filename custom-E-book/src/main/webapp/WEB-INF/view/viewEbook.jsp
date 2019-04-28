<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  <script>
  	$(document).ready(function(){
  		var index = $("#index").val();
  		var innerHtml = "<iframe src=\"getEbook?index="+index+"\" style=\"position : absolute;top: 0;right: 0;height: 100%;width: 100%;\"></iframe>";
  		$("#preview").html(innerHtml);
  		//$("#preview").load(location.href + " #preview");
  	});
  </script>

</head>
<body>
<input type="number" id="index" hidden="true" value="${index}"/>
<div id="preview"></div>
</body>
</html>