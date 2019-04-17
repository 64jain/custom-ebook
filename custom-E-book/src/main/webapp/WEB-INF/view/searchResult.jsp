<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.example.demo.ebook.model.book.Book"
	import="com.example.demo.ebook.model.chapter.Chapter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
body {

   background-size:cover;
   background-repeat:no-repeat;
}

* {
	box-sizing: border-box;
}

form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}
</style>

</head>
<body background="/images/book1.jpeg">
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
	<form class="example" action="searchResult"
		style="margin: auto; max-width: 50%">
		<input type="text" placeholder="Search.." name="keywords"
			value="${keywords}">
		<button type="submit">
			<i class="fa fa-search"></i>
		</button>
	</form>
	<br />
	<br />
	<form action="addToCart" method="post">
		<div class="container">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#book_collapse" style="min-width: 30%">Books</button>
			<div id="book_collapse" class="collapse in">
				<c:choose>
					<c:when test="${not empty books}">
						<article>
							<div class="container">
								<table class="table" style="border-style: double;border-color: black;">
									<thead>
									<tr >
										<th></th>
										<th>Book Name</th>
										<th>Price</th>
									</tr>
									</thead>
									<tbody>
										<c:forEach items="${books}" var="book">
											<tr>
												<th scope="row">
													<!-- Material unchecked -->
													<div class="pretty p-default p-curve p-toggle">
														<input type="checkbox" class="form-check-input"
															name="bookIdList" value="${book.id}"> 
														<div class="state p-success p-on"> <label>Selected</label>
													</div>
													<div class="state p-danger p-off">
														<label>Not Selected</label>
													</div>
													</div>
												</th>
												<td><a href="previewBuyerBook?id=${book.id}">${book.bookName}</a></td>
												<td>${book.price}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</article>
					</c:when>
					<c:otherwise>
		No book found<br />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<br /> <br />
		<div class="container">
			<button type="button" class="btn btn-info" data-toggle="collapse"
				data-target="#chapter_collapse" style="min-width: 30%;"><b>Chapter</b></button>
			<div id="chapter_collapse" class="collapse in">
				<c:choose>
					<c:when test="${not empty chapters}">
						<article>
								<table class="table "style="border-style: double;border-color: black;">
									<thead>
									<tr>
										<th></th>
										<th>Chapter Name</th>
										<th>Book Name</th>
										<th>Price</th>
									</tr>
									</thead>
									<tbody>
										<c:forEach items="${chapters}" var="chapter">
											<tr>
												<th scope="row">
													<!-- Material unchecked -->
													<div class="pretty p-default p-curve p-toggle">
														<input type="checkbox" class="form-check-input"
															name="chapterIdList" value="${chapter.id}"> 
														<div class="state p-success p-on"> <label>Selected</label>
													</div>
													<div class="state p-danger p-off">
														<label>Not Selected</label>
													</div>
													</div>
												</th>
												<td><a href="previewBuyerChapter?id=${chapter.id}">${chapter.name}</a></td>
												<td>${chapter.book.bookName}</td>
												<td>${chapter.price}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
						</article>
					</c:when>
					<c:otherwise>
						<br />
						<br />
						No chapter found
						<br />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<c:if test="${(not empty books) || (not empty chapters)}">
		<br>
			<input class="btn btn-info"type="submit" value="Submit" style="margin-left: 50%;" />
		</c:if>
	</form>
</body>
</html>