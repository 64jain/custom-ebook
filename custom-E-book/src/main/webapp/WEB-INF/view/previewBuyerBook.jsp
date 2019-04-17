<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.example.demo.ebook.model.book.Book"
	import="com.example.demo.ebook.model.chapter.Chapter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <title>${book.bookName}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body{
  /* background-image:url("mybackground.jpg")*/
   background-size:cover;
   background-repeat:no-repeat;
}

</style>
</head>
<body background="/images/grey_bg.jpg">

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
	<div id="complete">
<div id="preview" style="margin-left: 50%">
</div>
<div id="content">
<div class="container" style="width: 50%; margin-right:40%">
 
  <h2><i>${book.bookName}</i></h2>
  <ul class="list-group" style="width: 70%; margin-right:40%">
    <li class="list-group-item"><b>Description:</b>${book.description}</li>
    <li class="list-group-item"><b>Author:</b>${book.publisher.name}</li>
    <li class="list-group-item"><b>Price:</b>${book.price}</li>
    <li class="list-group-item"><b>Book Chapters:</b>
    <ul>
			<c:forEach items="${chapters}" var="chapter">
				<li class="nav-item"><a class="nav-link"
					href="previewBuyerChapter?id=${chapter.id}">${chapter.name}</a></li>
			</c:forEach>
			</ul>
    </li>
  </ul>
</div>
 <button type="button" class="btn btn-info" id="preview_button" style="margin-left: 20%">preview</button>
 <input type="number" id="chapter_id" value="${chapter.id}" hidden="true">
</div>
</div>

	
</body>
</html>