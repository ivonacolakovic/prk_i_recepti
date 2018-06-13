<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<script src="/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>uporabniki</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">LoveAtFirstBite</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="index.jsp">Doma</a></li>
     <li><a href="top10.jsp">Top 10</a></li>
      <li><a href="mostRecent.jsp">Najnovejsi</a></li>
      <li ><a href="iskanjePoSestavinah.jsp">Kaj imas v hladilniku?</a></li>
       
    </ul>
       
    <ul class="nav navbar-nav navbar-right">
    <li ><a href="mojiRecepti.jsp"><span class="glyphicon glyphicon-create"></span> Moji recepti</a></li>
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li class="active"><a href="registracija.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<br/>


<div class="clearfix">

 
<img class= "img3" src="https://mitrasale.com/wp-content/uploads/2018/01/social-media-messaging.png" alt="Smiley face"  style="width:600px;height:400px; margin-left:20px; margin-right:50px;">
  <div id="div6">
<div id="wrapper9">
   <br/>
  <h2 style="color:#3c3c3c;" > REGISTRACIJA </h2>
   
 <br/>
<form name="myForm"  onsubmit="return validateForm()" method="post" >

     <div class="form-group">
    
      <label for="usr">Ime</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite ime" name="ime" required >
    </div>
   
      <div class="form-group">
      <label for="usr">Priimek</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite priimek" name="priimek" required >
    </div>
    <div class="form-group">
      <label for="usr">Uporabnisko ime</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite uporabnisko ime" name="uporabniskoIme" required >
    </div>
      <div class="form-group">
      <label for="usr">e-mail</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite e-mail" name="email" required >
    </div>
    
      <div class="form-group">
      <label for="usr">Geslo</label>
      <input type="password" class="form-control"  placeholder="Vnesite geslo" name="geslo" id="myInput" required >
      <input type="checkbox" onclick="myFunction()">Show Password
    
        </div>
    <div class="form-group">
    <label for="usr">Potrdi Geslo</label>
    <input type="password" class="form-control" placeholder="Confirm Password"  id="confirm_password" required>
    </div>
    <div id="naslov">
        <p><button   class="btn btn-success" type="submit"  name="add">DODAJ</button></p>
        <br/>
        
        </div>
        </form>
       
   
      </div>
      </div>
      <script>
function myFunction() {
    var x = document.getElementById("myInput");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
var password = document.getElementById("password")
, confirm_password = document.getElementById("confirm_password");

function validatePassword(){
if(password.value != confirm_password.value) {
  confirm_password.setCustomValidity("Passwords Don't Match");
} else {
  confirm_password.setCustomValidity('');
}
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
</script>
      <%
      UporabnikiDAO  ud=new UporabnikiDAO ();
    
    		  
    		  if (request.getParameter("add")!= null) {
    		    	 
    		    	  Uporabniki u=new Uporabniki();
    		    	 
    		    	  u.setIme(request.getParameter("ime"));
    		    	  u.setPriimek(request.getParameter("priimek"));
    		    	  u.setEmail(request.getParameter("email"));
    		    	  u.setUporabniskoIme(request.getParameter("uporabniskoIme"));
    		    	  u.setGeslo(request.getParameter("geslo"));
    		    	 // u.setGeslo(request.getParameter("gesloP"));
    		    	  
    
     
    		    	  ud.shrani(u);
    		    	  response.sendRedirect("http://localhost:8080/praktikumIRecepti/prijava.jsp");
    		    	
    		    	 
    		      }
    	      else{
    	    	  System.out.println("kogcfgvhbjnkuyvhjbmfd");
    	      }
    	      %>
</body>
</html>