<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<title>Payment Page</title>
</head>
<body>
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
	<form action="/successPayment" method="POST">
		<div class="container">
			<h2>Payment Summary</h2>
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse1">Review Your Order</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="items">
								<div class="col-md-9">
									<!--                                                     <table class="table table-striped"> -->
									<!--                                                         <tr> -->
									<!--                                                             <td colspan="2"> -->
									<!--                                                                 <a class="btn btn-warning btn-sm pull-right" -->
									<!--                                                                    href="http://www.startajobboard.com/" -->
									<!--                                                                    title="Remove Item">X</a> -->
									<!--                                                                 <b> -->
									<!--                                                                     Premium Posting</b></td> -->
									<!--                                                         </tr> -->
									<!--                                                         <tr> -->
									<!--                                                             <td> -->
									<!--                                                                 <ul> -->
									<!--                                                                     <li>One Job Posting Credit</li> -->
									<!--                                                                     <li>Job Distribution*</li> -->
									<!--                                                                     <li>Social Media Distribution</li> -->
									<!--                                                                 </ul> -->
									<!--                                                             </td> -->
									<!--                                                             <td> -->
									<!--                                                                 <b>$147.00</b> -->
									<!--                                                             </td> -->
									<!--                                                         </tr> -->
<!-- 									</table> -->
								</div>
								<div class="col-md-3">
									<div style="text-align: center;">
										<h3>Order Total</h3>
										<h3>
											<span style="color: green;">Rs. ${price}</span>
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse2">Contact and Billing Information</a>
							</h4>
						</div>
						<div id="collapse2" class="panel-collapse collapse">
							<div class="panel-body">
								<b>Help us keep your account safe and secure, please verify
									your billing information.</b>
								<c:set var="price" value="${price}" />
								<!-- This same as your request attribute -->
								<c:choose>
									<c:when test="${price==hardCopyPrice}">
										<table class="table table-striped" style="font-weight: bold;">
										<tr>
												<td style="width: 175px;"><label for="title">Title of the Book:</label></td>
												<td><input class="form-control" name="title"
													required="required" type="text"/></td>
											</tr>
											<tr>
												<td style="width: 175px;"><label for="name">Recipient name:</label></td>
												<td><input class="form-control" name="name"
													required="required" type="text" value="${buyer.name }" /></td>
											</tr>
											<tr>
												<td style="width: 175px;"><label for="email">Recipient email:</label></td>
												<td><input class="form-control" name="email"
													required="required" type="text" value="${buyer.email}" /></td>
											</tr>
											
											<tr>
												<td style="width: 175px;"><label for="addr">Recipient address:</label></td>
												<td><textarea name="addr" rows="3" cols="23"required></textarea></td>
											</tr>
<!-- 											<tr> -->
<!-- 												<td style="width: 175px;"><label>Payment -->
<!-- 														Method:</label></td> -->
<!-- 														<td><select name="paymentMethod"> -->
<!-- 														<option value="Cash On Delivery">Cash On Delivery</option> -->
<!-- 														<option value="Credit Card">Credit Card</option> -->
<!-- 														<option value="Debit Card">Debit Card</option> -->
<!-- 														<option value="BHIM UPI">BHIM UPI</option> -->
<!-- 												</select></td> -->
<!-- 											</tr> -->

										</table>
										<input type="hidden" name="copy_type" value="HardCopy" />

									</c:when>
									<c:otherwise>
										<table class="table table-striped"
											style="font-weight: bold; ">
											<tr>
												<td style="width: 175px;"><label for="title">Title of the Book:</label></td>
												<td><input class="form-control" name="title"
													required="required" type="text"/></td>
											</tr>
											<tr>
												<td style="width: 175px;"><label for="name">Recipient name:</label></td>
												<td><input class="form-control" name="name"
													required="required" type="text" value="${buyer.name }" /></td>
											</tr>
											<tr>
												<td style="width: 175px;"><label for="email">Recipient email:</label></td>
												<td><input class="form-control" name="email"
													required="required" type="text" value="${buyer.email}" /></td>
													
											
											</tr>
											<tr>
											<td></td>
											<td><textarea name="addr" rows="3" cols="23" style="display: none;"></textarea></td>
											<tr>
												
<!-- 											<tr> -->
<!-- 												<td style="width: 175px;"><label>Payment -->
<!-- 														Method:</label></td> -->
<!-- 												<td><select name="paymentMethod"> -->
<!-- 														<option value="Credit Card">Credit Card</option> -->
<!-- 														<option value="Debit Card">Debit Card</option> -->
<!-- 														<option value="BHIM UPI">BHIM UPI</option> -->
<!-- 												</select></td> -->
<!-- 											</tr> -->

										</table>

										<input type="hidden" name="copy_type" value="SoftCopy" />

									</c:otherwise>
								</c:choose>



								<br /> <br />

							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse3">Payment Information</a>
							</h4>
						</div>
						<div id="collapse3" class="panel-collapse collapse">
							<div class="panel-body">
								Select Payment Method
								<hr>
								<div align="center">
								<c:set var="price" value="${price}" />
								<!-- This same as your request attribute -->
								<c:choose>
									<c:when test="${price==hardCopyPrice}">
										<select name="paymentMethod">
											<option value="Cash On Delivery">Cash On Delivery</option>
											<option value="Credit Card">Credit Card</option>
											<option value="Debit Card">Debit Card</option>
											<option value="BHIM UPI">BHIM UPI</option>
										</select>
									</c:when>
									<c:otherwise>
										<select name="paymentMethod">
											<option value="Credit Card">Credit Card</option>
											<option value="Debit Card">Debit Card</option>
											<option value="BHIM UPI">BHIM UPI</option>
										</select>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="price" value="${price}" /> <input
				type="submit" value="Buy Now" />
				</div>
	</form>

</body>
</html>