<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
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
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
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
  background:#999;
  }
  #navMenu ul li a {
  text-align:center;
  font-family:"Comic Sans MS",cursive;
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

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://www.famouspizzaexpress.com/images/pizza35.jpg" alt="Image">
        <div class="carousel-caption">
          
        </div>      
      </div>

      <div class="item">
        <img src="https://timeincsecure-a.akamaihd.net/rtmp_uds/474428695/201711/3955/474428695_5661309737001_5661262459001-vs.jpg?pubId=474428695&videoId=5661262459001" alt="Image">
        <div class="carousel-caption">
         <!-- izpis na slici -->
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
   
<div id="wrapper">
<div id="navMenu">
<ul>
<li><a href="#">Tip jedi</a>
<ul>
<li><a href="#">Juha</a>
<li><a href="#">Solata</a>
<li><a href="#">Predjed</a>
<li><a href="#">Glavna jed</a>
<li><a href="#">Sladica</a>
</ul>

</ul>
<ul>
<li><a href="#">Sezona</a>
<ul>
<li><a href="#">Zima</a>
<li><a href="#">Spomlad</a>
<li><a href="#">Poletje</a>
<li><a href="#">Jesen</a>
</ul>

</ul>
<ul>
<li><a href="#">Kuhinja</a>
<ul>
<li><a href="#">Mehiska</a>
<li><a href="#">Francoska</a>
<li><a href="#">Italijanska</a>
<li><a href="#">Kitajska</a>
</ul>

</ul>
<ul>
<li><a href="#">Cas priprave</a>
<ul>
<li><a href="#">manj kot 30min</a>
<li><a href="#">manj kot 1h</a>
<li><a href="#">manj kot 2h</a>
</ul>

</ul>


</ul>
<ul>
<li ><a style="background:red;" href="#">Isci</a>
</ul>
<br class="clearFloat"/>
</div>
</div>
<div class="container text-center">  
<h3>Recepti</h3><br>
</div>
<div class="container">
<table class="table">
  <% ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
  ArrayList<ReceptZaglavlje> recepti = (ArrayList<ReceptZaglavlje>) rzd.vrniVse();
  for(int i=0; i<recepti.size(); i++){
  %>
  		<tr class="success">
  			<td><img src="<%=recepti.get(i).getSlika() %>" height="200" width="300"/></td>
  			<td><%=recepti.get(i).getNaziv()%></td>
  			<td><%=recepti.get(i).getKratekOpis()%></td>
  		</tr>
   <%} %>
  </table>
</div>  

</body>
</html>