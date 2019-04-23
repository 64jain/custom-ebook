<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Configure Chapters</title>
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

.loader {
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

</style>
<script>
	$(document).ready(function(){
		$(":button").click(function() {
			var id = $(this).attr('id');
			$("#spin_"+id).show();
			var startPage = $("#start_page_"+id).val();
			var endPage = $("#end_page_"+id).val();
			var totalPages = $("#totalNoOfPages").val();
			var sourceLoc = $("#bookLoc").val();
			$.ajax({
				url:'preview',
				data: {id : id, startPage : startPage, endPage : endPage, totalPages : totalPages, source : sourceLoc}
//  				success: function(responseText) {
//  					//$("#start_img_"+id).show();
// 					//$("#end_img_"+id).show();
//  					if(responseText != "") {
//  						alert(responseText);
//  					}
//  				}
			});
			$("#spin_"+id).show();
			var delayInMilliseconds = 9000; //1 second

			setTimeout(function() {
				$("#start_img_"+id).attr('src', "/images/temp/start_preview_"+id+".jpg")
				$("#end_img_"+id).attr('src', "/images/temp/end_preview_"+id+".jpg")
				$("#start_img_"+id).load(location.href + " #start_img_"+id);
				$("#start_img_"+id).show();
				$("#end_img_"+id).load(location.href + " #end_img_"+id);
				$("#end_img_"+id).show();
				$("#spin_"+id).hide();
			}, delayInMilliseconds);
			
			
// 			alert("id = "+id + " start page = "+startPage+" endPage = "+endPage);
		});
	});
</script>
</head>
<body>
<!---------------------NavBar opening -------------------------->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Configure Chapters</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">Home</a></li>
				<li><a href="#">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/logoutPublisher"><span class="glyphicon glyphicon-log-in"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>
	<!---------------------NavBar ending -------------------------->
	
	<form action="saveChapters" method="post">
	<div class="container-fluid" style="width:55%" align="center">
  <h1 style="font-family:Georgia;"><b>CONFIGURE CHAPTERS</b></h1>
  
			<input type="number" name="bookId" value="${book.id}" hidden="true"/>
			<input type="number" name="noOfChapters" value="${book.noOfChapters}" hidden="true"/>
			<input type="number" id="totalNoOfPages" name="totalNoOfPages" value="${book.totalNoOfPages}" hidden="true"/>
			<input type="text" id="bookLoc" name="bookLoc" value="${book.bookLoc}" hidden="true"/>
		<c:forEach var="i" begin="1" end="${book.noOfChapters}">
		
		<div class="jumbotron jumbotron-fluid">
			<h3><b>Chapter ${i} </b></h3>
			  <div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>NAME OF CHAPTER </b>
					</div>
					<div class="col-sm-6 card" style="background-color: lavenderblush;">
						<input type="text" name="name_${i}"
							style="font-size: 12pt; height: 40px; width: 280px;" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>PRICE</b>
					</div>
					<div class="col-sm-6 card" style="background-color: lavenderblush;">
						<input type="number" step="any" name="price_${i}" min="0"
							style="font-size: 12pt; height: 40px; width: 280px;" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>DESCRIPTION OF CHAPTER</b>
					</div>
					<div class="col-sm-6 card" style="background-color: lavenderblush;">
						<textarea rows="4" cols="30" name="description_${i}"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>KEYWORDS (SPACE SEPARATED)</b>
					</div>
					<div class="col-sm-6 card" style="background-color: lavenderblush;">
						<input type="text"   name="keywords_${i}"
							style="font-size: 12pt; height: 40px; width: 280px;" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>START PAGE</b>
					</div>
					<div class="col-sm-6 card" style="background-color: lavenderblush;">
						<input type="number" min="1" max="${book.totalNoOfPages}"
				name="start_page_${i}" id="start_page_${i}"
							style="font-size: 12pt; height: 40px; width: 280px;" />
					</div>
				</div>
					<div class="row">
					<div class="col-sm-4 card" style="background-color: lavender;">
						<b>END PAGE</b>
					</div>
					<div class="col-sm-6 card" style="background-color: lavenderblush;">
						<input type="number" min="1" max="${book.totalNoOfPages}"
				name="end_page_${i}" id="end_page_${i}"
							style="font-size: 12pt; height: 40px; width: 280px;" />
					</div>
				</div> 
				<br> <button type="button" id="${i}">preview</button> <br>
				<div  class="loader" id="spin_${i}" hidden="true"></div>
			<img src="" hidden="true" id="start_img_${i}" height="200" width="150">
			<img src="" hidden="true" id="end_img_${i}" height="200" width="150">
			<br>
			<br>
			
			</div>
		</c:forEach>
		
		<input class="button button2" type="submit" value="configure chapters">
		</div>
	</form>
</body>
</html>