<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Payment</title>


</head>
<body>
<!-- Navigation bar -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Payment Page</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">Home</a></li>
				
				<li><a href="#">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/logoutBuyer"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>
	<!---------- end ----------------->
	<form action="/successPayment" method="POST">
<p> The price of the book is ${price}</p><br>
hardcopy is:${hardCopyPrice}<br>
<c:set var="price" value="${price}" /> <!-- This same as your request attribute -->
<c:choose>
    <c:when test="${price==hardCopyPrice}">
    	<label for="addr" >Address: </label>
        <textarea name="addr" rows="3" cols="18"></textarea><br>
        <label>Payment Method:</label>
        <select name="paymentMethod">
        <option value="Cash On Delivery">Cash On Delivery</option>
        <option value="Credit Card">Credit Card</option>
        <option value="Debit Card">Debit Card</option>
        <option value="BHIM UPI">BHIM UPI</option>
        </select><br>
        <input type="hidden" name="copy_type" value="HardCopy"/>
    </c:when>
    <c:otherwise>
    
     <textarea name="addr"  style="display:none;" ></textarea>
     <input type="hidden" name="copy_type" value="SoftCopy"/>
     <select name="paymentMethod" >
     <option value="Credit Card">Credit Card</option>
        <option value="Debit Card">Debit Card</option>
        <option value="BHIM UPI">BHIM UPI</option>
     </select>
    </c:otherwise>      
</c:choose>


<input type="hidden" name="price" value="${price}"/>
<input type="submit" value="Buy Now"/>
</form>
</body>
</html>