<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buyer's Cart</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Payment</title>
<style>
body{
  /* background-image:url("mybackground.jpg")*/
   background-size:cover;
   background-repeat:no-repeat;
}


</style>
</head>
<body >
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
<form action="/paymentPage" method="POST">
<%-- <p>Total price is:${price }</p> --%>
<%-- <input type="hidden" name ="price" value="${price}"/> --%>
<input type="radio" name="price" value=${price} checked="checked"> <font size="5" ><b>SoftCopy for ${price}</b></font><br>
<input type="radio" name="price" value=${hardCopyPrice}><font size="5" ><b>Hard Copy for ${hardCopyPrice}</b></font><br>
<input type="hidden" name="hardCopyPrice" value="${ hardCopyPrice}"/>

<i>(Rs. 0.5/page and 30/- for shipping)</i><br>
<input  class="btn btn-info" type="submit" value="Buy Now"/>
</form>
</body>
</html>