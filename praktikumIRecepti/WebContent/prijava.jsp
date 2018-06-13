 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css"></link>
<style>

 body {
    background-image: url("http://content.seamless.com/swdesign/img/background/landingpage-tacos-20140730.jpg");
}


</style>

<script src="/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Prijava</title>

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
      <li><a href="registracija.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li class="active"><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>





 <div id="div5">
<div id="wrapper7">
 
    


  <br/>
<h2 style="color:#3c3c3c;" > PRIJAVA </h2>
<form name="myForm"  onsubmit="return validateForm()" method="post" >
 <br/>
  
    <div class="form-group">
      <label for="usr">Uporabnisko ime</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite uporabnisko ime" name="uporabniskoIme" required >
    </div>
     
      <div class="form-group">
      <label for="usr">Geslo</label>
      <input type="password" class="form-control"  placeholder="Vnesite geslo" name="geslo" id="myInput" required >
    <input type="checkbox" onclick="myFunction()">Show Password
    </div>
     </br>
  <div id="naslov">
        <p><button   class="btn btn-success" type="submit"  name="add">Prijava</button></p>
        
        <br/>
      
        </div>
        </form>
          <div id="naslov">
        <form action="registracija.jsp">	
        	<button class="btn btn-success" type="submit" name="">Registracija</button>
        </form>
        </div>
       
  
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
</script>

      <%
      UporabnikiDAO  ud=new UporabnikiDAO ();
      
    		  if (request.getParameter("add")!= null) {
    			Uporabniki u=new Uporabniki();

    		    	 String ime = request.getParameter("uporabniskoIme");
    		    String geslo = request.getParameter("geslo");
    		    	  System.out.println("Ime je:" +ime);
    		    	  System.out.println("Geslo je: " +geslo);
    		     System.out.println("ID je" + ud.vrniIdUporabnika(ime, geslo));
                       System.out.println("ID je" + ud.vrniIdUporabnika(ime, geslo));
    		    	  if(ud.vrniIdUporabnika(ime,geslo)!= 0 ){
    		    		  
    		    		  int uporabnik = ud.vrniIdUporabnika(ime, geslo);
    		    		  System.out.println("NAJAVEN E uporabnik so id:" +uporabnik);
    		    		  response.sendRedirect("http://localhost:8080/praktikumIRecepti/mojiRecepti.jsp");
    		    		  session.setAttribute("uporabnik", uporabnik);
    		    	  }
    		    	  else{
    		    	  %><div class="alert alert-danger">
    				  <strong>Danger!</strong> Napaka, poskusite se enkrat.
    				</div><%
    				}
    	     }
    	      %>
    	      
 
</body>
</html>