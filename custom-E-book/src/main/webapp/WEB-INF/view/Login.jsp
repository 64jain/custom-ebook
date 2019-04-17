<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Login</title>
 <style>
   * {
   
  box-sizing: border-box;
}
 .modal-header, h4, .close {
    background-color: #5cb85c;
    color:white !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }

body {
  margin: 0;
}

/* Style the header */
.header {
  background-color:#f1f1f1;
  padding: 20px;
  text-align: center;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;

}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Create three unequal columns that floats next to each other */
.column {
  float: left;
 
}

/* Left and right column */
.column.side {
  width: 28%;
}

/* Middle column */
.column.middle {
  width: 44%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column.side, .column.middle {
    width: 100%;
  }
}
}
    </style>
</head>
<body>
<!-- Navigation bar -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/loginBuyerPublisher">Login</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">Home</a></li>
				<li><a href="/regBuyerPublisher">Register</a></li>
				<li><a href="/about">About</a></li>
			</ul>
			
		</div>
	</nav>
	<!---------- end ----------------->
<!--  <div class="topnav"> -->
<!--   <a href="/">Home</a> -->
<!--     <a href="/regBuyerPublisher">Register</a> -->
<!-- </div> -->

<!-- <div class="header"> -->
<!-- <div id="headerimg"  style="background-image:url(/images/login1.jpg);height:290px; background-repeat:no-repeat;object-fit:cover;padding-top:-16px;margin-top:-16px;padding-bottom:-16px;margin-bottom:-16px;padding-left:-16px;margin-left:-16px;padding-right:-16px;margin-right:-16px;"> -->
<!--  </div> -->

<div class="row">
  <div class="column side" style="padding-left:1.8%;">
    <h2>Login as Buyer</h2>
    <p>Login into the website,see and make use of respective books or chapters of your interest!</p>
     <button type="button" class="btn btn-info" id="myBtn1">Login Buyer</button>
  </div>
  
  <div class="column middle">
  <div id="image"  style="background-image:url(/images/ebook2.jpg);height:500px;">
  </div>
  </div>
  
  <div class="column side" style="padding-left:0.5%;padding-right:1%;">
    <h2>Login as Publisher</h2>
    <p>After login,you can sell your own book and make money out of it!</p>
  <button type="button" class="btn btn-info" id="myBtn2">Login Publisher</button>
  </div>
</div>

<!-- Modal for buyer -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="validateBuyerLogin" method="POST" role="form">
          
           <div class="form-group">
             <label for="loginId"><span class="glyphicon glyphicon-user"></span>Login ID</label>
             <input type="text" class="form-control" name="loginId" placeholder="Enter LoginId" />
             </div>
             
              <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             <input type="password" class="form-control" name="password" placeholder="Enter Password" />
            </div>
              <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
            
          <!--   <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a></p>--->
            
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login!!</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>New User? <a href="regBuyerPublisher">Register</a></p>
        </div>
      </div>   
    </div>
  </div>
  <!-- end buyer -->
  <!-- Modal for publisher -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span>Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="validatePublisherLogin" method="POST" role="form">
          
           <div class="form-group">
             <label for="loginId"><span class="glyphicon glyphicon-user"></span>Login ID</label>
             <input type="text" class="form-control" name="loginId" placeholder="Enter LoginId" />
             </div>
             
              <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             <input type="password" class="form-control" name="password" placeholder="Enter Password" />
            </div>
              <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
            
          <!--   <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a></p>--->
            
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login!!</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>New User? <a href="regBuyerPublisher">Register</a></p>
        </div>
      </div>   
    </div>
  </div>
  <!-- end buyer -->
  
  <script>
$(document).ready(function(){
	  $("#myBtn1").click(function(){
	    $("#myModal1").modal();
	  });
	});

$(document).ready(function(){
	  $("#myBtn2").click(function(){
	    $("#myModal2").modal();
	  });
	});
</script>

</div>
</body>
</html>