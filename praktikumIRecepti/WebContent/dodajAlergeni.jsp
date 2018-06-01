<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>dodajAlergen</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
 h1 {
 font-style:italic;
 }
  body {
    background-image: url("https://www.redfynn.com/wp-content/uploads/2016/08/home-italian-food-background.jpg");
}
  /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
 

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  #navMenu {   
  margin:0;
  padding:0;
  
  }
  #navMenu ul {
  margin:0;
  padding:0;
  line-height:30px;
  }
  #navMenu li {
  margin:0;
  padding:0;
  list-style:none;
  float:left;
  position:relative;
 background-color: 	 #8c8c8c;
   
  }
  #navMenu ul li a {
  text-align:center;
  font-family: 'Raleway', Helvetica, Arial, sans-serif;
  text-decoration:none;
  height:30px;
  width:150px;
  display:block;
  color:#FFF;
  border:1px solid #FFF;
  text-shadow: 1px 1px 1px #000;
  }
  #navMenu ul ul {
  position:absolute;
  visibility:hidden;
  top:32px;
  }
  #navMenu ul li:hover ul {
  visibility:visible;
  }
  #navMenu li:hover {
  background:09F;
  }
  #navMenu ul li:hover ul li a:hover {
  background:#CCC;
  color:#000;
  
  }
  #navMenu a:hover {
  color:#000;
  
  }
  .clearFloat {
  clear:both;
  margin:0;
  padding:0;
  
  }
  #wrapper {
  width: 30%;     /* specify a width! */
  margin: 0 auto; /* center */
}

  </style>
</head>
<body>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp#">Doma</a></li>
     <li><a href="top10.jsp#">Top 10</a></li>
      <li><a href="mostRecent.jsp#">Most recent</a></li>
    </ul>
       <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Poisci">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<div id="wrapper">
<h1>Dodaj alergene</h1>
<br>

<form name="myForm" action="" onsubmit="return validateForm()" method="post">
    <div class="form-group">
      <label for="usr">Naziv alergena:</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesete naziv" required >
    </div>
    
     
       
        <p><button class="btn btn-success" type="submit" name="add">DONE</button></p>
        
        
       
      </form>
      </div>
      <% ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
      int id = rzd.vrniZadnjiId();
      ReceptZaglavlje r = rzd.najdi(id);
%>
      
       <%

     if (request.getParameter("add")!= null) {       	 
       	  r.setAlergeni(request.getParameter("naziv"));
       	  
     			rzd.shrani(r);
    	  
      }
      %>

</body>
</html>