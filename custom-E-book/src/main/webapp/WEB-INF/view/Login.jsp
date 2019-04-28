<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    background-color: #6495ED;
    color:white !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }

body {
  margin: 0;
  background-size:cover;
   background-repeat:no-repeat;
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
margin-top: 1.6%;
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
<body background="/images/grey_bg.jpg">
<!-- -----------------Displaying error-------------------------------- -->
<div class="modal fade" id="errorModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Error while Login</h4>
        </div>
        <div class="modal-body">
          <p>${error}</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <c:set var="err" value= "Invalid username or password" /> 
<c:set var="error" value="${error}" /> 
 <c:choose> 
   <c:when test="${error==err}">
   <script>
  
   $('#errorModal').modal();
     </script> 
    </c:when> 
     <c:otherwise> 
     <script>
   $('#errorModal').modal("hide");
     
     </script>
     </c:otherwise>    
 </c:choose> 
<!-- -----------------Displaying error-------------------------------- -->
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


<div class="row">
  <div class="column side" style="padding-left:1.8%;">
   <h2 ><center><i>Login as Buyer</i></center></h2>
   <hr>
   <br>
   <br>
   <p ><font size="4">Login into the website,see and make use of respective books or chapters of your interest!</font></p>
   <br>
   <br>
    <div style="margin-left: 18%;">
     <button type="button" class="btn btn-info" id="myBtn1">Login Buyer</button></div>
  </div>
  
  <div class="column middle" >
  <div id="image"  style="background-image:url(/images/ebook2.jpg);height:500px;">
  </div>
  </div>
  
  <div class="column side" style="padding-left:0.5%;padding-right:1%;">
     <center><h2 ><i>Login as Publisher</i></h2></center>
     <hr>
   <br>
   <br>
    <p ><font size="4">After login,you can sell your own book and make money out of it!</font></p>
   <br>
   <br>
   <div style="margin-left:27%;">
  <button type="button" class="btn btn-info" id="myBtn2">Login Publisher</button></div>
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
             <input type="text" id="buyer_login" class="form-control" name="loginId" placeholder="Enter LoginId" required/>
             </div>
             
              <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             <input type="password" class="form-control" name="password" placeholder="Enter Password" required/>
            </div>
              
            
          <!--   <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a></p>--->
            
              <button type="submit" class="btn btn-success btn-block" style="background-color:#6495ED;"><span class="glyphicon glyphicon-off"></span><font color="white">Login!!</font></button>
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
             <input type="text" class="form-control" name="loginId" placeholder="Enter LoginId" required/>
             </div>
             
              <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             <input type="password" class="form-control" name="password" placeholder="Enter Password" required/>
            </div>
            
          <!--   <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a></p>--->
            
              <button type="submit" class="btn btn-success btn-block" style="background-color:#6495ED;"><span class="glyphicon glyphicon-off"></span> Login!!</button>
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