<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="style.css">
  <title>Index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  
   #wrapper1 {
  width: 90%;     /* specify a width! */
  margin: 0 auto; /* center */
}
  
  #div{

 border-radius: 5px;
    background-color: #f2f2f2;
     width: 60%;
     top:200px;
     margin: 0 auto;
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
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 8px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 20px 4px;
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

<div id="div">
<div id="wrapper1">
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


<button type="submit" name="OK" class="button">Poisci</button>



</form>
</div>
<br/>
<br/>

</div>

<br/>
<br/>
</div>



<table>
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
			<tr>
				<td><img src="<%=recepti.get(i).getSlika() %>" height="200" width="300"/></td>
	  			<td><%=recepti.get(i).getNaziv()%></td>
	  			<td><%=recepti.get(i).getKratekOpis()%></td>
			</tr>
					
		
		<%	
		
		}
		}
		else{
			%><div class="alert alert-danger">
		  <strong>Danger!</strong> Ni recepta ki vsebuje vnesene sestavine.
		</div><%
		}
		
	}
	else{
		//TODO: ispisi da ni zadetkov
		%><div class="alert alert-warning">
		  <strong>Warning!</strong> Niste vnesli sestavine.
		</div><%
	}
%>
</table>

</body>
</html> 