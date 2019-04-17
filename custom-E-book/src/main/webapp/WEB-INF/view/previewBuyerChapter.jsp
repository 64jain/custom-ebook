<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  <script>
//     function displayIframe() {
//         document.getElementById("preview").innerHTML = 
//         	"<iframe src=\"/images/temp/chapter_preview.pdf\" style=\"position : absolute;top: 0;right: 0;height: 100%;width: 50%;\"></iframe>";
        	
    $(document).ready(function(){
    	var chapter_id = $("#chapter_id").val();
    	var innerHtml = "<iframe src=\"getpdf1?id="+chapter_id+"\" style=\"position : absolute;top: 0;right: 0;height: 100%;width: 50%;\"></iframe>";
    	$("#preview_button").click(function(){
    		alert(innerHtml);
    		$("#preview").html(innerHtml);
    	});
    	$("#preview").load(location.href + " #preview");
    });
</script>
 <style>
body{
  /* background-image:url("mybackground.jpg")*/
   background-size:cover;
   background-repeat:no-repeat;
}

</style> 
<title>${chapter.name }</title>
</head>
<body  background="/images/grey_bg.jpg">
<!-- Navigation bar -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/buyHome"> CustomEbooks </a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active">
				<li><a href="/buyHome">Home</a></li>
				<li><a href="/about">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li><a href="/showEbookContent"><span class="glyphicon glyphicon-shopping-cart"></span>
						Cart</a></li>
				<li><a href="/logoutBuyer"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
						
			</ul>
		</div>
	</nav>
	<!---------- end ----------------->
<!-- 	<form action="searchResult" method="post"> -->
<%-- 			<input type="number" name="id" value="${book.id}" readonly/> --%>
<%-- 			<input type="text" name="isbn" value="${book.isbn}"/> --%>
<%-- 			<input type="text" name="bookName" value="${book.bookName}"/> --%>
<%-- 			<input type="number" name="noOfChapters" value="${book.noOfChapters}"/> --%>
<%-- 			<input type="number" name="totalNoOfPages" value="${book.totalNoOfPages}"/> --%>
<%-- 			<input type="number" name="price" value="${book.price}"/> --%>
<%-- 			<input type="text" name="bookLoc" value="${book.bookLoc}"/> --%>
<%-- 			<input type="text" name="keywords" value="${book.keywords}"/> --%>
<!-- 			<input type="submit" value="back"/> -->
<!-- 	</form> -->
<div id="complete">
<div id="preview" style="margin-left: 50%">
</div>
<div id="content">
<div class="container" style="width: 50%; margin-right:40%">
  <h2><i>${chapter.name}</i></h2>
  <ul class="list-group" style="width: 70%; margin-right:40%">
    <li class="list-group-item"><b>Description:</b>${chapter.description}</li>
    <li class="list-group-item"><b>Referenced from book:</b><a href="previewBuyerBook?id=${chapter.book.id}">${chapter.book.bookName}</a></li>
    <li class="list-group-item"><b>Author:</b>${chapter.book.publisher.name}</li>
    <li class="list-group-item"><b>Price:</b>${chapter.price}</li>
  </ul>
</div>
 <button type="button" class="btn btn-info" id="preview_button" style="margin-left: 20%">preview</button>
 <input type="number" id="chapter_id" value="${chapter.id}" hidden="true">
</div>
</div>

</body>
</html>