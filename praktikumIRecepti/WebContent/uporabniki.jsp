<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
 body {
    background-color: 	#F5F5DC;
}
 #wrapper {
  width: 30%;     /* specify a width! */
  margin: 0 auto; /* center */
}
h2 {
 font-family: 'Raleway', Helvetica, Arial, sans-serif;

}
</style>
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
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="index.jsp#">Doma</a></li>
     <li><a href="top10.jsp#">Top 10</a></li>
      <li><a href="mostRecent.jsp#">Najnovejsi</a></li>
    </ul>
       <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Poisci">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    
     <li class="active"><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<div id="wrapper">
<h2 style="color:#e60000;">REGISTRACIJA </h2>
<br>

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
      <input type="text" class="form-control" id="usr" placeholder="Vnesite geslo" name="geslo" required >
    </div>
    
        <p><button type="submit"  name="add">DODAJ</button></p>
        </form>
       
   
      </div>
      <%
      UporabnikiDAO  ud=new UporabnikiDAO ();
    
    		  
    		  if (request.getParameter("add")!= null) {
    		    	 
    		    	  Uporabniki u=new Uporabniki();
    		    	 
    		    	  u.setIme(request.getParameter("ime"));
    		    	  u.setPriimek(request.getParameter("priimek"));
    		    	  u.setEmail(request.getParameter("email"));
    		    	  u.setUporabniskoIme(request.getParameter("uporabniskoIme"));
    		    	  u.setGeslo(request.getParameter("geslo"));
    		    	  
    
     
    		    	  ud.shrani(u);
    		    	
    		    	 
    		      }
    	      else{
    	    	  System.out.println("kogcfgvhbjnkuyvhjbmfd");
    	      }
    	      %>
</body>
</html>