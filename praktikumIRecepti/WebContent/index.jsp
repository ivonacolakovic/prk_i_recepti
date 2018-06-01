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

  h2 {
  
  font-family: 'Raleway', Helvetica, Arial, sans-serif;
  }
  
  body {
    background-image: url("https://ak0.picdn.net/shutterstock/videos/6336830/thumb/1.jpg?i10c=img.resize(height:160)");
}
  
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
 background-color: 	 #8c8c8c;
   
  }
  #navMenu ul li a {
  text-align:center;
  font-family: 'Raleway', Helvetica, Arial, sans-serif;
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
  #wrapper {
  width: 60%;     /* specify a width! */
  margin: 0 auto; /* center */
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

<div class="container"> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="10000">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="https://hips.hearstapps.com/del.h-cdn.co/assets/18/11/1520956952-chicken-tacos-horizontal.jpg" alt="Tacos" style="width:1120px;height:450px">
      </div>

      <div class="item">
        <img src="http://yesofcorsa.com/wp-content/uploads/2016/03/638734_pancakes.jpg" alt="Pancakes" style="width:1120px;height:450px">
      </div>
    
      <div class="item">
        <img src="http://sevilla.abc.es/gurme//wp-content/uploads/2013/05/ensalada-foie-frutos-rojos.jpg" alt="Salad" style="width:1120px;height:450px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
  
   
<div id="wrapper">
<div id="navMenu">
<ul>
<li><a href="#">Tip jedi</a>
<ul>
<li><a href="juha.jsp">Juha</a>
<li><a href="3">Solata</a>
<li><a href="">Predjed</a>
<li><a href="#">Glavna jed</a>
<li><a href="sladica.jsp">Sladica</a>
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
<br><br>
<form action="search.jsp">
<select name="tipjedi">
  <option value="juha">Juha</option>
  <option value="solata">Solata</option>
  <option value="predjed">Predjed</option>
  <option value="glavnajed">Glavna jed</option>
  <option value="sladica">Sladica</option>
</select>
<select name="sezona">
  <option value="zima">Zima</option>
  <option value="pomlad">Pomlad</option>
  <option value="jesen">Jesen</option>
  <option value="poletje">Poletje</option>
</select>
<select name="kuhinja">
  <option value="francoska">Francoska</option>
  <option value="italijanska">Italijanska</option>
  <option value="mehiska">Mehiska</option>
  <option value="kitajska">Kitajska</option>
</select>
<select name="caspriprave">
  <option value="30">manj kot 30min</option>
  <option value="60">manj kot 1h</option>
  <option value="120">manj kot 2h</option>

</select>

<input type="submit" value="Submit">
</form>


<ul>
<li ><a style="background:tomato;" href="#">Isci</a>
</ul>

<br class="clearFloat"/>
</div>
</div>
<div class="container text-center">  
<h2 style="color:#e60000;">RECEPTI</h2><br>
</div>
<div class="container">
<table>
  <% ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
  ArrayList<ReceptZaglavlje> recepti = (ArrayList<ReceptZaglavlje>) rzd.vrniVse();
  for(int i=0; i<recepti.size(); i++){
  %>
 <form action="podrobnostiRecepta.jsp" method="post">
 
 <tr>
  			<td><img src="<%=recepti.get(i).getSlika() %>" height="200" width="300"/></td>
  			
                <td><button class="btn btn-success" type="submit" name="podrobnosti" value="<%=recepti.get(i).getId_recept()%>"><%= recepti.get(i).getNaziv()%></button></td>
  			
  			<td><i><%=recepti.get(i).getKratekOpis()%></i></td>
  		</tr>
   </form>
  		  </table>
  		  
 <%} %>


  <% 
           //String podrobnosti = request.getParameter("podrobnosti");
  		   //request.setAttribute("id", podrobnosti);
  		   
  		   %>
 

 
  		
  		   
  		   
  		   
  		  
 

	
	</div>
	

</body>
</html>