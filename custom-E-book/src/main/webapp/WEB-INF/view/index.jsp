<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custom Ebook</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
 body{

   background-size:cover;
   background-repeat:no-repeat;
}
/* override position and transform in 3.3.x */
.carousel-inner .item.left.active {
  transform: translateX(-33%);
}
.carousel-inner .item.right.active {
  transform: translateX(33%);
}

.carousel-inner .item.next {
  transform: translateX(33%)
}
.carousel-inner .item.prev {
  transform: translateX(-33%)
}

.carousel-inner .item.right,
.carousel-inner .item.left { 
  transform: translateX(0);
}


.carousel-control.left,.carousel-control.right {background-image:none;}
  </style>
  <script>
 $('#myCarousel').carousel({
  interval: 10000
})

$('.carousel .item').each(function(){
  var next = $(this).next();
  if (!next.length) {
    next = $(this).siblings(':first');
  }
  next.children(':first-child').clone().appendTo($(this));
  
  if (next.next().length>0) {
    next.next().children(':first-child').clone().appendTo($(this));
  }
  else {
  	$(this).siblings(':first').children(':first-child').clone().appendTo($(this));
  }
});
 
$(document).ready(function(){
	var res = <%=session.getAttribute("result") %>;
	if (res!=null) {
		alert(res);
	}
});
  </script>
</head>
<body background="/images/index.jpeg" >
<div id="navigation" >
<!-- navbar area -->

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><b>Custom EBooks</b></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/regBuyerPublisher"><span class="glyphicon glyphicon-user"></span>Register </a></li>
       <li><a href="/loginBuyerPublisher"><span class="glyphicon glyphicon-user"></span> Login</a></li> 
        <!--  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li> -->
    </ul>
    </div>
   
</nav>
</div>
<!------ corousel starting -------->
<!-- <div class="container"> -->
<!--   <h2><b>Custom E Books</b></h2> -->
<!--   <div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
<!--     Indicators -->
<!--     <ol class="carousel-indicators"> -->
<!--       <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!--       <li data-target="#myCarousel" data-slide-to="1"></li> -->
<!--       <li data-target="#myCarousel" data-slide-to="2"></li> -->
<!--     </ol> -->

<!--     Wrapper for slides -->
<!--     <div class="carousel-inner"> -->

<!--       <div class="item active"> -->
<!--         <img src="/images/book10.jpg" alt="Los Angeles" style="width:100%;height:80%;"> -->
<!--         <div class="carousel-caption"> -->
<!--           <h3>Los Angeles</h3> -->
<!--           <p>LA is always so much fun!</p> -->
<!--         </div> -->
<!--       </div> -->

<!--       <div class="item"> -->
<!--         <img src="/images/book11.jpg" alt="Chicago" style="width:100%;height:80%;"> -->
<!--         <div class="carousel-caption"> -->
<!--           <h3>Chicago</h3> -->
<!--           <p>Thank you, Chicago!</p> -->
<!--         </div> -->
<!--       </div> -->
    
<!--       <div class="item"> -->
<!--         <img src="/images/book16.jpg" alt="New York" style="width:100%;height:80%;"> -->
<!--         <div class="carousel-caption"> -->
<!--           <h3>New York</h3> -->
<!--           <p>We love the Big Apple!</p> -->
<!--         </div> -->
<!--       </div> -->
  
<!--     </div> -->

<!--     Left and right controls -->
<!--     <a class="left carousel-control" href="#myCarousel" data-slide="prev"> -->
<!--       <span class="glyphicon glyphicon-chevron-left"></span> -->
<!--       <span class="sr-only">Previous</span> -->
<!--     </a> -->
<!--     <a class="right carousel-control" href="#myCarousel" data-slide="next"> -->
<!--       <span class="glyphicon glyphicon-chevron-right"></span> -->
<!--       <span class="sr-only">Next</span> -->
<!--     </a> -->
<!--   </div> -->
<!-- </div> -->

<!------ corousel ending -------->
<!-- navbar area -->

<!-- main body area -->
<!-- <div id="image" style="background-image:url(/images/book_index.jpg);object-fit:cover;padding-top:-21px;margin-top:-21px;"> -->

<!--   </div> -->
  
<!-- main body area -->

<!-- 
<div id="middle" style="background-color:#A0522D; height:400px;">
</div>middle text -->
<!-- <!-- footer area -->
<!-- <div style=" background-color:#000000;padding: 10px; text-align: center;color: red; height:120px;"> -->
		
<!-- </div> -->
<!-- footer area -->
<!-- <a href="/regBuyer">register Buyer</a> <br/> -->
<!-- <a href="/regPublisher">register Publisher</a> <br/> -->
 <h2 style="color:white;"><b>Custom E Books</b></h2> 
<div class="container">
<div class="col-md-10 col-md-offset-1">
<div class="carousel slide" id="myCarousel">
  <div class="carousel-inner">
    <div class="item active">
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/angelsdemons.jpg" class="img-responsive"></a></div>
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/harrypotter1.jpg" class="img-responsive"></a></div>
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/pinnochio.jpg" class="img-responsive"></a></div>
    </div>
<!--     <div class="item"> -->
<!--     </div> -->
    <div class="item">
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/lifeofpi.jpg" class="img-responsive"></a></div>
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/davinci.jpg" class="img-responsive"></a></div>
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/pinnochio.jpg" class="img-responsive"></a></div>
    </div>
    <div class="item">
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/pinnochio.jpg" class="img-responsive"></a></div>
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/twilight.jpg" class="img-responsive"></a></div>
      <div class="col-md-4"><a href="#"><img src="/images/bookcover/harrypotter1.jpg" class="img-responsive"></a></div>
    </div>
    
  </div>
  <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
</div>
</div>
</div>

</body>
</html>