<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
  div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 180px;
}

div.gallery:hover {
    border: 1px solid #777;
}



div.desc {
    padding: 15px;
    text-align: center;
    background-color:white;
}
 body {
    background-image: url("https://www.redfynn.com/wp-content/uploads/2016/08/home-italian-food-background.jpg");
}
 #wrapper {
  width: 30%;     /* specify a width! */
  margin: 0 auto; /* center */
}
.container {
    position: relative;
    width: 100%;
    max-width: 400px;
}

.container img {
    width: 100%;
    height: 50%;
}

.container .btn {
    position: absolute;
    transition: .5s ease;
    top: 70%;
    left: 15%;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    background-color: none;
    color: black;
    font-size: 13px;
    padding: 10px 13px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    text-align: center;
}

.container .btn:hover {
    background-color: black;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Najnovejsi recepti</title>
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
      <li class="active"><a href="mostRecent.jsp">Najnovejsi</a></li>
      <li><a href="iskanjePoSestavinah.jsp">Kaj imas v hladilniku?</a></li>
    </ul>
       <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Poisci">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="uporabniki.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>

<div id="wrapper">
<h1>Najnovejsi recepti</h1>
</div>
<br>

	
      	<%ReceptZaglavljeDAO  rzd = new ReceptZaglavljeDAO ();
      	ArrayList <ReceptZaglavlje> recepti = (ArrayList<ReceptZaglavlje>) rzd.vrniNajnovejse();
      	for(int i= 0; i < recepti.size() ; i++){%>
      		
      		<div class="gallery">
      		<form action="podrobnostiRecepta.jsp" method="post">
      		<img src="<%=recepti.get(i).getSlika() %>" style="width:180px" height="150px">
  			<div class="desc">
  			 <button class="but" type="submit" name="podrobnosti" value="<%=recepti.get(i).getId_recept()%>"><%= recepti.get(i).getNaziv()%></button>
  			
  			 </div>
  			
  		 </form>
  		 </div>
  
 <%} %>
</body>
</html>