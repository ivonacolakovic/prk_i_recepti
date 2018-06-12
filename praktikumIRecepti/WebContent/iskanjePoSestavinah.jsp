<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet" type="text/css" href="style.css">
  <title>Index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
      <li class="active"><a href="iskanjePoSestavinah.jsp">Kaj imas v hladilniku?</a></li>
       
    </ul>
       
    <ul class="nav navbar-nav navbar-right">
    <li ><a href="mojiRecepti.jsp"><span class="glyphicon glyphicon-create"></span> Moji recepti</a></li>
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="uporabniki.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>

<div id="div1">
<div id="wra1">
<br/>

<h1 >Kaj imas v hladilniku?</h1>
<br/>
<h4>Lacen si in ne zelis iti v trgovino? Ze imas nekatere sestavine v hladilniku?
<br/>
<br/>
Ce je tvoj odgovor DA, uporabi iskanje receptov ki vsebujejo samo sestavine katere ze imas!</h4>
<br/>
<br/>
<div class="container">
<form method="post">

<br/>

<br/>



<div class="col-xs-4">
        <label for="sestavine">Vnesi sestavine: (loci samo z vejico):</label>
        <input class="form-control" id="sestavine" type="text" name="sestavine">
      </div>


<button type="submit" name="OK" class="button1">Poisci</button>



</form>
</div>
<br/>
<br/>

</div>

<br/>
<br/>
</div>

<br>
<br>
<br>



<% 	ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
	ArrayList<ReceptZaglavlje> recepti = null;
	//String input = request.getParameter("sestavine");
	
	if(request.getParameter("sestavine") != null && request.getParameter("OK")!=null){
		String input = request.getParameter("sestavine");
		System.out.println("njs "+input);
		recepti = rzd.isciPoSestavinah(input);
		if(!recepti.isEmpty()){
	
		for(int i = 0; i < recepti.size(); i++){
		%>
			 <div id="d">
  <div class="gallery">
    <form action="podrobnostiRecepta.jsp" method="post">
				<img src="<%=recepti.get(i).getSlika() %>" style="width:350px" height="230px"/>
				<div class="desc">
				 <button class="button button4" type="submit" name="podrobnosti" value="<%=recepti.get(i).getId_recept()%>"><%= recepti.get(i).getNaziv()%></button>
	  			
			</div>
			</form>
					
		</div>
		</div>
		<%	
		
		}
		}
		else{
			%><div id="wra2"><div class="alert alert-danger">
		  <strong>Opozorilo!</strong> Ni recepta ki vsebuje vnesene sestavine.
		</div></div><%
		}
		
	}
	else{
		//TODO: ispisi da ni zadetkov
		%><div id="wra2"><div class="alert alert-warning">
		  <strong>Opozorilo!</strong> Niste vnesli sestavine.
		</div></div><%
	}
%>


</body>
</html> 