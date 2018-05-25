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
<h1>Dodaj nov recept</h1>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Recepti</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="index.jsp#">Doma</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li>
    </ul>
       <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Poisci">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    
     <li class="active"><a href="#"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<form name="myForm" action="" onsubmit="return validateForm()" method="post">
     <p><b>Naziv:</b><input type="text" name="naziv" placeholder="Vnesete naziv"></p>
        <p><b>Stevilo porcij:</b><input class="w3-input w3-padding-16 w3-border" type="number" min="1" placeholder="Vnesete stevilo porcij" name="steviloOseb" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></p>
        <p><b>Cas priprave:</b><input class="w3-input w3-padding-16 w3-border" type="text"  min="1"  placeholder="Vnesete cas priprave"  name="casPriprave" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required></p>
        <p><b>Opis:</b><textarea rows="5"  class="w3-input w3-padding-16 w3-border" type="text" placeholder="Vnesete kratek opis"  name="kratekOpis" required></textarea></p>
        <p><b>Video:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete video" name="video"></p>
        <p><b>Slika:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete slika"  name="slika"></p>
        <p><b>Kalorije:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete stevilo kalorije"   name="kalorije" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required></p>
        <p><b>Mascobe:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete stevilo mascobe"  name="mascobe" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required></p>
        <p><b>Ogljikovi hidrati:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete stevilo ogljikovi hidrati" name="hidrati" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required></p> 
        <p><b>Nacin priprave:</b><textarea rows="10"  class="w3-input w3-padding-16 w3-border" type="text" placeholder="Vnesete nacin priprave"  name="priprava"></textarea></p>
        <p><b>Datum objave:</b><input class="w3-input w3-padding-16 w3-border" type="date"   placeholder="Vnesete datum"  name="datum"></p>
        <p><button class="btn btn-success" type="submit" name="add">DONE</button></p>
        
        
       
      </form>
      
      <%
      ReceptZaglavljeDAO  rzd=new ReceptZaglavljeDAO ();
     
      if (request.getParameter("add")!= null) {
    	  ReceptZaglavlje rz=new ReceptZaglavlje();
    	 
    	  rz.setNaziv(request.getParameter("naziv"));
    	  rz.setSteviloOseb(Integer.parseInt(request.getParameter("steviloOseb")));
    	  rz.setCasPriprave(Double.parseDouble(request.getParameter("casPriprave")));
    	  rz.setKratekOpis(request.getParameter("kratekOpis"));
    	  rz.setVideo(request.getParameter("video"));
    	  rz.setSlika(request.getParameter("slika"));
    	  rz.setSteviloKalorije(Double.parseDouble(request.getParameter("kalorije")));
    	  rz.setMascobe(Double.parseDouble(request.getParameter("mascobe")));
    	  rz.setOgljikoviHidrati(Double.parseDouble(request.getParameter("hidrati")));
    	  rz.setOpisPriprave(request.getParameter("hidrati"));
    	  rz.setCasObjave(new Date());
    	  
    	  rzd.shrani(rz);
    	  
      }
      %>

</body>
</html>
