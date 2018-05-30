<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp#">Doma</a></li>
      <li><a href="#">Top 10</a></li>
      <li><a href="#">Most recent</a></li>
      <li><a href="#">Kaj imas v hladilniku?</a></li>
    </ul>
       <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Poisci">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    
    
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      
    </ul>
  </div>
</nav>

<%int id = Integer.parseInt(request.getParameter("podrobnosti"));
ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO ();
ReceptZaglavlje recept = rzd.najdi(id);
%>

<%
if(!request.getParameter("podrobnosti").equals(null)){
%>

<h1><%=recept.getNaziv() %></h1>
<h3>Kratek opis: <%=recept.getKratekOpis() %></h3>
<i>Datum objave:<%=recept.getCasObjave() %></i>
<img src="<%=recept.getSlika() %>" height="200" width="300"/>
<div class="textOverImage"
		style="background-image: url(https://02.avoncdn.com/shop/assets/en/prod/prod_1190882_xl.jpg?w=700)"
		data-text="Avon True Color Glazewear Lip Gloss 
 Our #1 lip gloss is new and improved. Glazewear delivers high shine, rich color, and instant moisturization.
 
 8$">
	</div>
	<br>
	<br>
	<br>
<p>Stevilo porcij:<%=recept.getSteviloOseb() %></p>
<p>Cas priprave: <%=recept.getCasPriprave() %></p>
<p>Kalorije: <%=recept.getSteviloKalorije() %></p>
<p>Mascobe:<%=recept.getMascobe() %></p>
<p>Oglijikovi hidrati:<%=recept.getOgljikoviHidrati() %></p>
<p>Alergeni:<%=recept.getAlergeni() %></p>
<p>Sestavine:<%=recept.getSestavine() %></p>
<p>Nacin priprave:<%=recept.getOpisPriprave() %></p>
<iframe src="<%=recept.getVideo() %>" height="300" width="300"></iframe>

<%}else{} %>
<br><br><br>
<% 
OcenaDAO od = new OcenaDAO();
  ArrayList<Ocena> oceni = (ArrayList<Ocena>) od.vrniVse(id);
  for(int i=0; i<oceni.size(); i++){
  %>
  <tr>
  			<td><b>Ocena:</b><%=oceni.get(i).getOcena() %></td>
  			<br>
  			
                <td><b>Komentar:</b><%=oceni.get(i).getKomentar()%></td>
  		
  		<%}
  
       
        if (request.getParameter("dodaj")!=null ){
        	 
        	Ocena o = new Ocena();
        	  o.setKomentar(request.getParameter("komentar"));
        	  o.setOcena(Integer.parseInt(request.getParameter("ocena")));
        	  o.setTk_recept_id(id);
        	  od.shrani(o);
        	 
        }%>
  		</tr>
  		
 
  		
  		<br><br><br>

  

<form action=""  method="post">
        <p><b>OCENA:</b><input class="w3-input w3-padding-16 w3-border" type="number" min="1" max="5"placeholder="Vnesete ocena" name="ocena" ></p>
        <p><b>Komentar:</b><textarea rows="5"  class="w3-input w3-padding-16 w3-border" type="text" placeholder="Vnesete komentar"  name="komentar" ></textarea></p>
        <p><button class="btn btn-success" type="submit" name="dodaj">DODAJ</button></p>
        </form>
<%

        
        
        %>

        

</body>
</html>