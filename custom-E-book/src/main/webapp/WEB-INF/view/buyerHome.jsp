<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buyer Home</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Buyer Home</title>
<style>
body{
  
   background-size:cover;
   background-repeat:no-repeat;
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


* {
  box-sizing: border-box;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
        font-size: 14px;
    font-size: inherit;
    text-rendering: auto;
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

/* form.example::after { */
/*   content: ""; */
/*   clear: both; */
/*   display: table; */
/* } */

</style>
</head>
<body background="/images/book_index.jpg">
	
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
			<li><a href="/myOrders"><span class="glyphicon glyphicon-list-alt"></span>
						My Orders</a></li>
			<li><a href="/showEbookContent"><span class="glyphicon glyphicon-shopping-cart"></span>
						Cart</a></li>
				<li><a href="/logoutBuyer"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
						
			</ul>
		</div>
	</nav>
	<!---------- end ----------------->
${result}

	<h1 class="display-2" style="color: white;"><b>Hello,${buyer.name}</b></h1><br>
<!-- 	<button class="button button2" style="background-color: #CD853F;" onclick="location.href='/showEbookContent'">Go to Cart</button> -->
<!-- </body> -->
<br>
<br>
<br>
<form class="example" action="searchResult" style="margin: auto;max-width: 50%">
		<input type="text" placeholder="Search.." name="keywords">
		<button type="submit">
			<i class="fa fa-search"></i>
		</button>
	</form>
	</body>
</html>