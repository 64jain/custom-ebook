<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Register Book</title>
</head>
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
<body background="/images/white_bg2.jpg">
<!---------------------NavBar opening -------------------------->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/">Home</a>
				
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Register Book</a></li>
				<li><a href="/about">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/logoutPublisher"><span class="glyphicon glyphicon-log-in"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>
	<!---------------------NavBar ending -------------------------->

	<form action="registerBook" method="post" enctype="multipart/form-data">
	<div class="container-fluid" style="width:50%" align="center">
  <h1 style="font-family:Georgia;"><b>REGISTER BOOK</b></h1>
  
  <div class="row">
    <div class="col-sm-4 card" style="background-color:lavender;"><b>ISBN </b></div>
    <div class="col-sm-6 card" style="background-color:lavenderblush;"> <input type="text" name="isbn" style="font-size: 18pt; height: 40px; width:280px; " /></div>
  </div>
   <div class="row">
    <div class="col-sm-4 card" style="background-color:lavender;"><b>NAME</b></div>
    <div class="col-sm-6 card " style="background-color:lavenderblush;">  <input type="text" name="bookName" style="font-size: 18pt; height: 40px; width:280px; "/></div>
  </div>
   <div class="row">
    <div class="col-sm-4 card" style="background-color:lavender;"><b>NO OF CHAPTERS</b></div>
    <div class="col-sm-6 card" style="background-color:lavenderblush;"> <input type="number" name="noOfChapters" style="font-size: 18pt; height: 40px; width:280px; "/></div>
  </div>
   <div class="row">
    <div class="col-sm-4 card" style="background-color:lavender;"><b>PRICE</b> </div>
    <div class="col-sm-6 card" style="background-color:lavenderblush;">  <input type="number" step="any" name="price" style="font-size: 18pt; height: 40px; width:280px; "/></div>
  </div>
   <div class="row">
    <div class="col-sm-4 card" style="background-color:lavender;"><b>KEYWORDS</b></div>
    <div class="col-sm-6 card" style="background-color:lavenderblush;"><input type="text" name="keywords" style="font-size: 18pt; height: 40px; width:280px; "/></div>
  </div>
    <div class="row">
    <div class="col-sm-4 card" style="background-color:lavender;"><b>DESCRIPTION</b></div>
    <div class="col-sm-6 card" style="background-color:lavenderblush;"><textarea name="description" rows="4" cols="30" style="font-size: 18pt; width:280px; "></textarea></div>
  </div>
   <div class="row">
    <div class="col-sm-4 card" style="background-color:lavender;"><b>UPLOAD YOUR BOOK</b></div>
    <div class="col-sm-6 card" style="background-color:lavenderblush;"> <input type="file" name="file" accept=".pdf" style="font-size: 14pt; height: 40px; width:280px; "/></div>
  </div>
 
  <input type="submit" class="button button2" name="register">
</div>
<!-- 
		<pre>
				ISBN No.     : <input type="text" name="isbn" />
				name     : <input type="text" name="bookName" />
				No of chapters : <input type="number" name="noOfChapters" />
				Price : <input type="number" name="price">
				keywords   : <input type="text" name="keywords" />
				<label>upload your book : </label><input type="file" name="file" />
				description   : <input type="text" name="description" />
			<input type="submit" name="register">
		</pre> -->
	</form>
</body>
</html>