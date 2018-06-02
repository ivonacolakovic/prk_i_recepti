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
    background-image: url("https://www.redfynn.com/wp-content/uploads/2016/08/home-italian-food-background.jpg");
}
 #wrapper {
  width: 30%;     /* specify a width! */
  margin: 0 auto; /* center */
}


</style>
<script src="/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>dodajRecept</title>

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
      <li><a href="uporabniki.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<div id="wrapper">
<h1>Dodaj sestavine</h1>
<br>
<%
if (request.getParameter("add")!= null) {}
%>

<form name="myForm" action="" onsubmit="return validateForm()" method="post">
 <div class="form-group">
      <label for="usr">Naziv</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesete naziv" name="naziv" required >
    </div>
    
 <div class="form-group">
      <label for="usr">Enota</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite enotu" name="enota" required >
    </div>
     <div class="form-group">
      <label for="stvp">Kolicina:</label>
      <input type="text" class="form-control" id="stvp" type="text" placeholder="Vnesite kolicinu"    name="kolicina" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
    </div> 
   
        <p><button class="btn btn-success" type="submit" name="dodaj">Dodaj</button></p>
        
       
      </form>
      
       <%
     SestavineDAO ad=new SestavineDAO ();
     
      if (request.getParameter("dodaj")!= null) {
    	  Sestavine s=new Sestavine();
    	  ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
    	  s.setNaziv(request.getParameter("naziv"));
    	  s.setEnota(request.getParameter("enota"));
    	  s.setKolicina(Double.parseDouble(request.getParameter("kolicina")));
    	  s.setTk_recept(rzd.vrniZadnjiId());
    	  
  ad.shrani(s);
    	  
      }
      %>
      
</div>
</body>
</html>