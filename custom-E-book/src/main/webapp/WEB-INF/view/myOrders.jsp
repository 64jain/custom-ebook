<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.example.demo.ebook.model.payment.Payment"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!--   <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" rel="stylesheet"/> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.13/js/dataTables.bootstrap4.min.js"></script>
 <script>
 $(document).ready(function() {
	  $('#example').DataTable();
	});
</script>
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
<title>Orders History</title>
</head>
<body>
<%-- 	<c:set var="index" scope="page" value="1" /> --%>
<%-- 	<c:forEach items="${files_list}" var="file"> --%>
<%-- 		<a href="displayEbook?index=${index}" target="_blank">${file.getName()}</a> --%>
<!-- 		<br /> -->
<%-- 		<c:set var="index" scope="page" value="${index +1}" /> --%>
<%-- 	</c:forEach> --%>
<!-- ---------------------------------------------------------------------------------------------------------------- -->
<!-- Navigation bar -->
	<nav class="navbar navbar-inverse" style="padding-bottom: -2%">
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
			<li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>
						My Orders</a></li>
			<li><a href="/showEbookContent"><span class="glyphicon glyphicon-shopping-cart"></span>
						Cart</a></li>
				<li><a href="/logoutBuyer"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
						
						
			</ul>
		</div>
	</nav>
	<!---------- end ----------------->
	<div class="container">
	<h2>Order History</h2>
	<table id="example" class="table table-inverse" >
		<thead >
			<tr>
				<th>Book Name</th>
				<th>Recipient Name</th>
				<th>Type</th>
				<th>Date</th>
				<th>preview</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="index" scope="page" value="1" />
			<c:forEach items="${payments}" var="payment">
				<tr id="tr-id-${index}" class="tr-class-${index}">
					<td id="td-id-${index}" class="td-class-${index}">${payment.title}</td>
					<td id="td-id-${index}" class="td-class-${index}">${payment.name}</td>
					<c:choose>
						<c:when test="${payment.hardCopy}">
							<td id="td-id-${index}" class="td-class-${index}">HardCopy</td>
						</c:when>
						<c:otherwise>
							<td id="td-id-${index}" class="td-class-${index}">SoftCopy</td>
						</c:otherwise>
					</c:choose>
					<td id="td-id-${index}" class="td-class-${index}">${payment.purchaseDate}</td>
					<td id="td-id-${index}" class="td-class-${index}"><a href="displayEbook?index=${index}" target="_blank">preview</a></td>
				</tr>
				<c:set var="index" scope="page" value="${index +1}" />
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>