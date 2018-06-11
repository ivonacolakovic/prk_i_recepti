<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="style.css">
  <title>MojiRecepti</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    
  #div{

 border-radius: 5px;
    
     width: 80%;
     margin: 0 auto;
  }

    div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 300 px;
}

div.gallery:hover {
    border: 1px solid #777;
}



div.desc {
    padding: 15px;
    text-align: center;
}
 

  body {
    background-color: url("https://ak0.picdn.net/shutterstock/videos/6336830/thumb/1.jpg?i10c=img.resize(height:160)");
}

#wrapper {
  width: 62%;     /* specify a width! */
  margin: 0 auto; /* center */
  }
  .button {

    border: none;
    color: white;
    padding: 8px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 0px 8px;
    cursor: pointer;
}
.button4 {background-color: #e7e7e7; color: black;}


  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">LoveAtFirstBite</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Doma</a></li>
     <li><a href="top10.jsp">Top 10</a></li>
      <li><a href="mostRecent.jsp">Najnovejsi</a></li>
      <li><a href="iskanjePoSestavinah.jsp">Kaj imas v hladilniku?</a></li>
    </ul>
       <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Poisci">
      </div>
      <button type="submit" class="btn btn-default">Poisci</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="uporabniki.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<%
if(!session.getAttribute("uporabnik").equals(null)){
	System.out.println(session.getAttribute("uporabnik"));
	String u = session.getAttribute("uporabnik").toString();
	int upo = Integer.parseInt(u);
	System.out.println(u);
%>
<br class="clearFloat"/>

<div class="container text-center">  
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

  			<img src="<%=recepti.get(i).getSlika() %>" style="width:270px" height="180px">
  			<div class="desc">
  			 <button class="button button4" type="submit" name="podrobnosti" value="<%=recepti.get(i).getId_recept()%>"><%= recepti.get(i).getNaziv()%></button>
  			
  			 </div>
  			
  		 </form>
  		 </div>
  		 </div>
  		 
  
 <%}} %>



</body>
</html>