<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.example.demo.ebook.model.orderedEbook.OrderedEbook"
						import="com.example.demo.ebook.model.book.Book"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script>
    function format(value1,value2) {
    	 var ret = '<div>';
    	 value1 = value1.substring(0,value1.length-1);
    	 value2 = value2.substring(0,value2.length-1);
    	if(!(value1===""))
    		ret=ret+'<div>Contains Books:'+value1+'</div>';
    	if(!(value2===""))
    		ret=ret+'<div>Contains Chapter:'+value2+'</div>';
    	ret = ret+'</div>'; 
//         return '<div>Contains Books: ' + value1+ '</div>'+'<br>';
        return ret;
    }
    $(document).ready(function () {
        var table = $('#example').DataTable({});

        // Add event listener for opening and closing details
        $('#example').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = table.row(tr);
            var td1 = tr.find("td:eq(6)").text();
            var td2 = tr.find("td:eq(7)").text()

            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            } else {
                // Open this row
                row.child(format(td1,td2)).show();
                tr.addClass('shown');
            }
        });
    });
    </script>
    <style>
    td.details-control {
    background: url('http://www.datatables.net/examples/resources/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('http://www.datatables.net/examples/resources/details_close.png') no-repeat center center;
}
    </style>
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
<body background="/images/book12.jpg">
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
<table id="example" class="display nowrap" cellspacing="0" width="100%">
    <thead >
			<tr>
				<th></th>
				<th>Book Name</th>
				<th>Recipient Name</th>
				<th>Type</th>
				<th>Date</th>
				<th>preview</th>
				<th style="display: none"></th>
				<th style="display: none"></th>
			</tr>
		</thead>
    <tbody>
			<c:forEach items="${orderBooks}" var="orderbook">

				<tr >
					<c:set var="bookList" scope="page" value="" />
					<c:forEach items="${orderbook.bookList}" var="book">
						<c:set var="bookList" scope="page"
							value="${bookList}${book.bookName}," />
					</c:forEach>
					<c:set var="chapterList" scope="page" value="" />
					<c:forEach items="${orderbook.chapterList}" var="chapter">
						<c:set var="chapterList" scope="page"
							value="${chapterList}${chapter.name}," />
					</c:forEach>
					<td class="details-control"></td>
					<td>${orderbook.payment.title}</td>
					<td>${orderbook.payment.name}</td>
					<c:choose>
						<c:when test="${orderbook.payment.hardCopy}">
							<td>HardCopy</td>
						</c:when>
						<c:otherwise>
							<td>SoftCopy</td>
						</c:otherwise>
					</c:choose>
					<td>${orderbook.payment.purchaseDate}</td>
					<td><a href="displayEbook?index=${orderbook.id}"
						target="_blank">preview</a></td>
					<td style="display: none;" id="name">${bookList}</td>
					<td style="display: none;" id="name2">${chapterList}</td>
				</tr>
			</c:forEach>
		</tbody>
</table>
</body>
</html>