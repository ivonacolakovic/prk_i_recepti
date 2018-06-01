<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<style>
  body {
    background-image: url("https://www.redfynn.com/wp-content/uploads/2016/08/home-italian-food-background.jpg");
}
  #wrapper {
  width: 30%;     /* specify a width! */
  margin: 0 auto; /* center */
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
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
int r = recept.getId_recept();

%>

<%
if(!request.getParameter("podrobnosti").equals(null)){
%>

<div id="wrapper">
<h1><%=recept.getNaziv() %></h1>
<br>
<h4>Kratek opis: <%=recept.getKratekOpis() %></h4>
<img src="<%=recept.getSlika() %>" height="200" width="300"/>
<br>
<i>Datum objave:<%=recept.getCasObjave() %></i>

	
	<br>
	<br>
	<br>
<p><b>Stevilo porcij:<%=recept.getSteviloOseb() %></b></p>
<p><b>Cas priprave: <%=recept.getCasPriprave() %></b></p>
<p><b>Kalorije: <%=recept.getSteviloKalorije() %></b></p>
<p><b>Mascobe:<%=recept.getMascobe() %></b></p>
<p><b>Oglijikovi hidrati:<%=recept.getOgljikoviHidrati() %></b></p>
<p><b>Alergeni:<%=recept.getAlergeniSkupaj() %></b></p>
<p><b>Nacin priprave:<%=recept.getOpisPriprave() %></b></p>
<iframe src="<%=recept.getVideo()%>" height="300" width="300"></iframe>
<br><br>
<b>Sestavine:
<table>
<tr>
    <th>Naziv</th>
    <th>Kolicina</th> 
    <th>Enota</th>
  </tr>
<%SestavineDAO sd = new SestavineDAO();
List<Sestavine> sestavine = sd.vrniSestavine(recept.getId_recept());
for(int i=0;i<sestavine.size();i++){%> 
<tr>
    <td><%=sestavine.get(i).getNaziv()%></td>
    <td><%=sestavine.get(i).getKolicina()%></td>
    <td><%=sestavine.get(i).getEnota()%></td>
  </tr>

<%} %>
</table>


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
  
%>
  		</tr>
  		
 
  		
  		<br><br><br>

  

<form action="podrobnostiRecepta.jsp"  method="post">
        <p><b>OCENA:</b><input class="w3-input w3-padding-16 w3-border" type="number" min="1" max="5"placeholder="Vnesete ocena" name="ocena" ></p>
        <p><b>Komentar:</b><textarea rows="5"  class="w3-input w3-padding-16 w3-border" type="text" placeholder="Vnesete komentar"  name="komentar" ></textarea></p>

        <p><button type="submit"  value="dodaj" name="dodaj">DODAJ</button></p>
        </form>
        
<%
System.out.println(r);
//session.setAttribute("id", r);
//String nesh = (session.getAttribute("id")).toString();
//System.out.println(nesh);
OcenaDAO od1 = new OcenaDAO();
System.out.println(request.getParameter("dodaj"));
System.out.println(request.getParameter("ocena"));
System.out.println(request.getParameter("komentar"));
if (request.getParameter("dodaj")!=null ){
	System.out.println("u if sum i dosadno mi e ");


	  Ocena o = new Ocena();
  	  o.setOcena(Integer.parseInt(request.getParameter("ocena")));
  	  o.setKomentar(request.getParameter("komentar"));
  	  o.setTk_recept_id(r);
  	  od1.shrani(o);

}else{
	System.out.println(r);
}
%>
</div>
</body>
</html>