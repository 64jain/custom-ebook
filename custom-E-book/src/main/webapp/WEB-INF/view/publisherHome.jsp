<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.example.demo.ebook.model.publisher.Publisher"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Publisher Home</title>
<style>
body{
  /* background-image:url("mybackground.jpg")*/
   background-size:cover;
   background-repeat:no-repeat;
}
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	padding: 16px;
	text-align: center;
	/*background-color: #f1f1f1;*/
}

.button-disable {
  background-color: red;
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
}

.button-enable {
  background-color: green;
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
}

.button5 {border-radius: 50%;}


.button2:hover {

  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
.info {
  background-color: #87CEEB;
  border-left: 6px solid #2196F3;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("button").click(function(){
			var id = $(this).attr("id").substring(2);
			var d_e = $(this).attr("id").substring(0,1);
			$.ajax({
				url: "changeBookStatus",
				data: {id:id, mode:d_e},
				success: function(data)
				{
					window.location = data;
				} 
			});
			
		});
	});
</script>
</head>
<body background="/images/grey_bg.jpg">
<!---------------------NavBar opening -------------------------->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Publisher Home</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">Home</a></li>
				<li><a href="/about">About</a></li>
				<li><a href="/regBook">Register Book</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/logoutPublisher"><span class="glyphicon glyphicon-log-in"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>
	<!---------------------NavBar ending -------------------------->

	
	<br />
	
	<br>
	<article>
		<div class="container">
			<table align="center" class="table ">
				<caption>
					<b><h3 style="font-family:Georgia;">UPLOADED BOOKS</h3></b>
				</caption>
				<thead>
					<tr class="tr tr-success">
						<td><div class="card" style="background-color: black;">
								<font color="white"><b>ISBN</b></font>
							</div></td>
						<td><div class="card" style="background-color: black;">
								<font color="white"><b>Book Name</b></font>
							</div></td>
						<td><div class="card" style="background-color: black;">
								<font color="white"><b>Price</b></font>
							</div></td>
						<td><div class="card" style="background-color: black;">
								<font color="white"><b>Chapters Configured</b></font>
							</div></td>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${publisherBooks}" var="book">

						<tr>
							<td>
								<div class="card" style="background-color: #FFD700;">${book.isbn}</div>
							</td>
							<td><div class="card" style="background-color: #AFEEEE;">
									<a
										href=<c:choose>
							<c:when test="${book.chaptersAdded==true}">
						        "reConfChapters?id=${book.id}"
							</c:when>
							<c:otherwise>
						        "confChapters?id=${book.id}"
							</c:otherwise>
						</c:choose>>${book.bookName}</a>
								</div></td>
							<td><div class="card" style="background-color: #FFC0CB;">${book.price}</div></td>
							<td><div class="card" style="background-color: #D3D3D3;">
									<c:choose>
										<c:when test="${book.chaptersAdded==true}">
						        Yes
							</c:when>
										<c:otherwise>
						        No*
							</c:otherwise>
									</c:choose>
								</div></td>
								
								<td>
								<c:choose>
									<c:when test="${book.disabled==false}">
										<button type="button" class="button-disable button5" id="d_${book.id}">Disable</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="button-enable button5" id="e_${book.id}">Enable</button>
									</c:otherwise>
								</c:choose>								
								 </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</article>

	<div class="info">
		<h3>*Note - if you haven't configured your chapters, the book will
			only be available as a whole for sale</h3>
	</div>
</body>
</html>