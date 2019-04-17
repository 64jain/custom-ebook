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
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	padding: 16px;
	text-align: center;
	/*background-color: #f1f1f1;*/
}

body{
  /* background-image:url("mybackground.jpg")*/
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
</style>
<script>
function deletedata(id)
{
	$.ajax({ type :'POST',
		contentType :"application/json",
		url:"deletechapter/"+id,
		success: function(data)
		{
			
		},
		error: function(data)
		{
			
		}
		
	});
}

            
</script>
</head>
<body background="/images/book1.jpeg" >
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
	${error}
	<div align="center">
		<form action="/saveEbookContent" method="post">
			
		<article>
			<div class="container">
				<table  align="center" class="table ">
					<caption>
						<h3> E-book Content</h3>
					</caption>
					<thead>
						<tr class="tr tr-success">
							<td><div class="card" style="background-color:black;"><font color="white"><b>Book Name</b></font></div></td>
							<td><div class="card" style="background-color:black;"><font color="white"><b>Chapter Name</b></font></div></td>
							<td><div class="card" style="background-color:black;"><font color="white"><b>Price</b></font></div></td>
							<td><div class="card" style="background-color:black;"><font color="white"><b>Serial Number</b></font></div></td>
							<td><div class="card" style="background-color:black;"><font color="white"><b>Remove</b></font></div></td>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${ebooks}" var="ebook">
							<tr>
								<td> <input	type="hidden" name="ebookid" value="${ebook.id}" />
								<div class="card" style="background-color:#FFD700;">
								<script>
								var bookname="${ebook.book.bookName}";
								var chaptername="${ebook.chapter.name}";
								var bookfrmchapter="${ebook.chapter.book.bookName}";
								 if(chaptername==="")
									 document.write(bookname);
								 else
									document.write(bookfrmchapter);
								
								</script>
								
								</div>
								</td>
								<td><div class="card" id="chapter" style="background-color: #AFEEEE;" >
								<script>
								var text="all chapters";
								var chaptername="${ebook.chapter.name}"; 
								 if(chaptername==="")
									 document.write(text);
								 else
									document.write(chaptername);
								
								</script>
								</div>
								</td>
								<td><div class="card" style="background-color: #FFC0CB;" id="price">
								<script>
								var bookprice="${ebook.book.price}";
								var chapterprice="${ebook.chapter.price}";
								var chaptername="${ebook.chapter.name}"; 
								 if(chaptername==="")
									 document.write(bookprice);
								 else
									document.write(chapterprice);
								
								</script>
								</div></td>
								<td><div class="card"  style="background-color: #D3D3D3;">
								<select name="sequence">
										
										<c:forEach begin="1" end="${size}" var="val">
											
											<option  value="${val}">${val}</option>
											
										</c:forEach>
								</select>
								</div>
								</td>
								<td>
								<button  class="button button2" onclick="deletedata(${ebook.id})">Delete</button>
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</article>
		<button class="button button2" style="background-color:#4682B4;"type="submit">Save</button>
	
	</form>
	
	<button class="button button2" style="background-color: #CD853F;" onclick="location.href='/payment'">Buy and Pay</button>
	</div>
</body>
</html>