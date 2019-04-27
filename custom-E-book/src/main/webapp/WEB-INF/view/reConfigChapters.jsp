<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reconfigChapters</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
body{
   background-image:radial-gradient(white, grey);
   /*url("/images/white_bg2.jpg"); */
 
   background-size:cover;
   background-repeat:no-repeat;
}
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	padding: 16px;
	text-align: center;
	/*background-color: #f1f1f1;*/
}
.button {
  background-color: #FF6347; /* Green */
 border-radius: 8px;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  
}
.button2:hover {

  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

</style>
<script>
	function scrollDown(i)
	{ var index=i+1;
	var n = index.toString();
	 document.getElementById(n).scrollIntoView(true);
	}
	</script>
	<script>
	function scrollUp(i)
	{ var index=i-1;
	var n = index.toString();
	 document.getElementById(n).scrollIntoView(true);
	}
	</script>

</head>
<body>
<!---------------------NavBar opening -------------------------->
<!-- Navigation bar -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/pubHome"> CustomEbooks </a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active">
				<li><a href="/pubHome">Home</a></li>
				<li><a href="/about">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			
				<li><a href="/logoutPublisher"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
						
			</ul>
		</div>
	</nav>
	<!---------- end ----------------->
	<form action="reSaveChapters" method="post">
	<div class="container-fluid" style="width:55%" align="center">
  <h1 style="font-family:Georgia;"><b>RECONFIGURE CHAPTERS</b></h1>
			<input type="number" name="bookId" value="${book.id}" hidden="true"/>
			
			<input type="text" name="isbn" value="${book.isbn}" hidden="true"/>
			<input type="text" name="bookName" value="${book.bookName}"hidden="true"/>
			<input type="number" name="noOfChapters" value="${book.noOfChapters}"hidden="true"/>
			<input type="number" id="totalNoOfPages" name="totalNoOfPages" value="${book.totalNoOfPages}" hidden="true"/>
			<input type="number" name="price" value="${book.price}" hidden="true"/>
			<input type="text" id="bookLoc" name="bookLoc" value="${book.bookLoc}" hidden="true"/>
			<input type="text" name="keywords" value="${book.keywords}" hidden="true"/>
			
			<c:set var="i" scope="page" value="1" />
			<c:set var="totalbooks"  value="${listOfChapters.size()}" />
		<c:forEach items="${listOfChapters}" var="chapter">
		<div class="jumbotron jumbotron-fluid" id="${i}">
			<h3><b>Chapter ${i} </b></h3>
			  <div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>NAME OF CHAPTER </b>
					</div>
					<div class="col-sm-8 card" style="background-color: lavenderblush;">
					<input type="text" name="name_${chapter.id}" value="${chapter.name}" style="font-size: 12pt; height: 40px; width: 280px;" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>PRICE</b>
					</div>
					<div class="col-sm-8 card" style="background-color: lavenderblush;">
					<input type="number" name="price_${chapter.id}" min="0" value="${chapter.price}"style="font-size: 12pt; height: 40px; width: 280px;" />
						
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>DESCRIPTION OF CHAPTER</b>
					</div>
					<div class="col-sm-8 card" style="background-color: lavenderblush;">
					<textarea rows="4" cols="34" name="description_${chapter.id}" >${chapter.description}</textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>KEYWORDS (SPACE SEPARATED)</b>
					</div>
					<div class="col-sm-8 card" style="background-color: lavenderblush;">
					 <input type="text" name="keywords_${chapter.id}" value="${chapter.keywords}"style="font-size: 12pt; height: 40px; width: 280px;" />
					</div>
				</div>
			 
			<br>
					
					<c:choose>
						<c:when test="${i==totalbooks}">
						<button type="button" class="btn btn-info" onclick="scrollUp(${i})">Previous</button>
						</c:when>
						<c:when test="${i==1}">
						<button type="button" class="btn btn-info" onclick="scrollDown(${i})">Next</button>
						</c:when>
						<c:otherwise>
						<button type="button" class="btn btn-info" onclick="scrollUp(${i})">Previous</button>
						<button type="button" class="btn btn-info" onclick="scrollDown(${i})">Next</button>
						</c:otherwise>
					</c:choose>

			<c:set var="i" scope="page" value="${i+1}" />
			</div>
		</c:forEach>
		<div align="center">
		<input type="submit" class="button button2" value="configure chapters">
		</div>
		</div>
	</form>

</body>
</html>