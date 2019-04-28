<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buyer Home</title>
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
<title>Buyer Home</title>
<style>
body,html{
  
   background-size:cover;
   background-repeat:no-repeat;
   height:100%;
}
/* .button { */
/* 	  background-color: #FF6347; /* Green */ */
/* 	 border-radius: 8px; */
/* 	  color: white; */
/* 	  padding: 15px 32px; */
/* 	  text-align: center; */
/* 	  text-decoration: none; */
/* 	  display: inline-block; */
/* 	  font-size: 15px; */
/* 	  margin: 4px 2px; */
/* 	  cursor: pointer; */
/* 	  -webkit-transition-duration: 0.4s; /* Safari */ */
/* 	  transition-duration: 0.4s; */
	  
/* 	} */
/* 	.button2:hover { */

/* 	  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19); */
/* 	} */
.list-group-item {
background-color: transparent;
border-top: 1px solid #ddd;
border-radius: 0;
color: #fff;
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
<script>
	$(document).ready(function(){
		var search = $("#search_value").val();
		if(search==null) {
			$("#search").attr("disabled","true");
		}
		else {
			$("#search").removeAttr("disabled");
		}
	});
</script>

</head>
<body background="/images/book_index.jpg" >
	
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

	<h1 class="display-2" style="color: white;"><b>hello, ${buyer.name}</b></h1><br>
<!-- 	<button class="button button2" style="background-color: #CD853F;" onclick="location.href='/showEbookContent'">Go to Cart</button> -->
<!-- </body> -->
<br>
<br>
<br>
<form class="example" action="searchResult" style="margin: auto;max-width: 50%">
		<input id="search_value" type="text" placeholder="Search.." name="keywords">
		<button type="submit" class="btn btn-default" id="search" disabled>
			Search
		</button>
	</form>
	<br>
	<br>
	<br>
	<br>
	<c:set var="error" value="${books}" /> 
	<c:choose> 
   <c:when test="${books==null}">
   
   </c:when>
    <c:otherwise> 
    <script>
$(document).ready(function(){

$("#recommendedBooks").show(1000); 


});
</script>
    </c:otherwise>
    </c:choose>
<div class="container" id="recommendedBooks" style="width:30%;display:none;margin-left:32%;">
    	
    <ul class="nav nav-pills nav-stacked">
    <li class="active"><center><b><i><font size="6" color="yellow">Books you might like ...</font></i></b></center></li>
     <c:forEach items="${books}" var="temp">
    <li><a href="previewBuyerBook?id=${temp.id}" style="color:dark grey;"><center><b><font size="4">${temp.bookName}</font></b></center></a></li>
   </c:forEach>
  </ul>

    	</div>
				<!-- 	<ul class="list-group" style="width:28%;margin-left:35%;" > -->
				<%--     <li class="list-group-item" style="background-color: transparent;border: 1px solid black;border-radius: 8px;color:white;"><a href="previewBuyerBook?id=${temp.id}" style="color:dark grey;"><center><b><font size="5">${temp.bookName}</font></b></center></a></li> --%>

<!-- 				</ul> -->
			</body>
</html>