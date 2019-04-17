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
<title>Register</title>

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
  padding: 10px;
}

/* Left column */
.column.side.left {
  width: 29%;
  margin-left:2%;
  margin-right:0.2% 
}

/*  right column */
.column.side.right {
  width: 27%;
   margin-left:0.2%;
	margin-right:2%
}

/* Middle column */
.column.middle {
  width:38%;
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
				<a class="navbar-brand" href="/regBuyerPublisher">Register</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">Home</a></li>
				<li><a href="/loginBuyerPublisher">Login</a></li>
				<li><a href="/about">About</a></li>
			</ul>
			
		</div>
	</nav>
	<!---------- end ----------------->
<!-- <div class="topnav"> -->
<!--   <a href="/">Home</a> -->
<!--  <a href="/loginBuyerPublisher">Login</a> -->
<!-- </div> -->
<!-- <div class="header"> -->
<!-- <div id="headerimg"  style="background-image:url(/images/reg2.jpg);height:235px; background-repeat:no-repeat;object-fit:cover;padding-top:-16px;margin-top:-16px;padding-bottom:-16px;margin-bottom:-16px;padding-left:-16px;margin-left:-16px;padding-right:-16px;margin-right:-16px;"> -->
<!--  </div> -->
  
<!-- </div> -->


<div class="row">
  <div class="column side left">
    <h2>Register as Buyer</h2>
    <p>Make your own Customized Ebook with plenty of available collections  </p>
     <button type="button" class="btn btn-info" id="myBtn1">Register Buyer</button>
  </div>
  
  <div class="column middle">
  <div id="image"  style="background-image:url(/images/ebook1.jpg);height:450px;">
  </div>
  </div>
  
  <div class="column side right">
    <h2>Register as Publisher</h2>
    <p>Publish your own book and sell them chapterwise as well</p>
  <button type="button" class="btn btn-info" id="myBtn2">Register Publisher</button>
  </div>
</div>


<!-- Modal for buyer -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Register</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="registerBuyer" method="POST" role="form">
         
            <div class="form-group">
             <label for="name"><span class="glyphicon glyphicon-user"></span>Buyer name</label>
             <input type="text" class="form-control" name="name" placeholder="Enter Your Name"  />
             </div>
             
              <div class="form-group">
             <label for="loginId"><span class="glyphicon glyphicon-user"></span>Login ID</label>
             <input type="text" class="form-control" name="loginId" placeholder="Enter LoginId" />
             </div>
             
           
            
             <div class="form-group">
             <label for="email"><span class="glyphicon glyphicon-user"></span>Email</label>
             <input type="text" class="form-control" name="email" placeholder="Enter Email"/>
             </div>
               
            <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             <input type="password" class="form-control" name="password" placeholder="Enter Password" />
            </div>
             
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
            
          <!--   <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a></p>--->
            
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Register!!</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Already a member? <a href="#">Login</a></p>
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
          <h4><span class="glyphicon glyphicon-lock"></span> Register</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="registerPublisher" method="POST" role="form">
          
          
            <div class="form-group">
             <label for="name"><span class="glyphicon glyphicon-user"></span>Publisher name</label>
             <input type="text" class="form-control" name="name" placeholder="Enter Your Name" />
             </div>
             
              <div class="form-group">
             <label for="loginId"><span class="glyphicon glyphicon-user"></span>Login ID</label>
             <input type="text" class="form-control" name="loginId" placeholder="Enter LoginId"/>
             </div>
            
             <div class="form-group">
             <label for="email"><span class="glyphicon glyphicon-user"></span>Email</label>
             <input type="text" class="form-control" name="email" placeholder="Enter Email" />
             </div>
             
              <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             <input type="password" class="form-control" name="password" placeholder="Enter Password"/>
            </div>
             
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
            
          <!--   <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a></p>--->
            
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Register!!</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Already a member? <a href="#">Login</a></p>
        </div>
      </div>   
    </div>
  </div>
  <!-- end publisher -->
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
</body>
</html>