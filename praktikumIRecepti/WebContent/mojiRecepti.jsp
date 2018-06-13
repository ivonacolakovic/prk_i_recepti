<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<link rel="stylesheet" type="text/css" href="style1.css"></link>
  <title>MojiRecepti</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
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
      <li ><a href="iskanjePoSestavinah.jsp">Kaj imas v hladilniku?</a></li>
       
    </ul>
       
    <ul class="nav navbar-nav navbar-right">
    <li class="active"><a href="mojiRecepti.jsp"><span class="glyphicon glyphicon-create"></span> Moji recepti</a></li>
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="registracija.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<%
//
if(!session.getAttribute("uporabnik").equals(null)){
	System.out.println(session.getAttribute("uporabnik"));
	String u = session.getAttribute("uporabnik").toString();
	int upo = Integer.parseInt(u);
	System.out.println(u);
%>
<br class="clearFloat"/>

<div id="wrapper"> 
<h1 > MOJI RECEPTI</h1>

<br/>
<br/>
</div>





  <% ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
  ArrayList<ReceptZaglavlje> recepti = (ArrayList<ReceptZaglavlje>) rzd.vrniMojiRecepti(upo);
  for(int i=0; i<recepti.size(); i++){
  %>
  <div id="div">
  <div class="gallery">
  <form action="podrobnostiRecepta.jsp" method="post">

  			<img src="<%=recepti.get(i).getSlika() %>" style="width:350px" height="230px">
  			<div class="desc">
  			 <button class="button button4" type="submit" name="podrobnosti" value="<%=recepti.get(i).getId_recept()%>"><%= recepti.get(i).getNaziv()%></button>
  			 
  			 </div>
  			  
  			
  		 </form>
  		 <form action="">
  		 <button class="btn btn-info" style="font-size:20px" type="submit" name="uredi" value="<%=recepti.get(i).getId_recept()%>"><i class="fa fa-edit"></i></button>
  		 
  		 <button  class="btn btn-danger" style="font-size:20px" type="submit" name="izbrisi" value="<%=recepti.get(i).getId_recept()%>"> <i class="fa fa-trash-o"></i></button>

  		 </form>
  		 </div>
  		 </div>
  		 
  
 <%}}
String u = session.getAttribute("uporabnik").toString();
int upo = Integer.parseInt(u);
if(request.getParameter("izbrisi")!=null){
	ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
	int sifra = Integer.parseInt(request.getParameter("izbrisi"));
	rzd.izbrisiRecept(upo, sifra);
	
	
}
if(request.getParameter("uredi")!=null){
	int uredi = Integer.parseInt(request.getParameter("uredi"));
	session.setAttribute("urejanje", uredi);
	response.sendRedirect("http://localhost:8080/praktikumIRecepti/urejanjeRecepta.jsp");
	
}



%>



</body>
</html>