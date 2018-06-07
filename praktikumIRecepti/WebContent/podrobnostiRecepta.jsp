<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<style>
#div{

 border-radius: 5px;
    background-color: #f2f2f2;
     width: 40%;
     margin: 0 auto;
}
   #example {
    background-image:url("https://www.redfynn.com/wp-content/uploads/2016/08/home-italian-food-background.jpg");
    background-repeat:no-repeat;
    background-size:100% 100%;
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
<div id="example">
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
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
    
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="uporabniki.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
</div>

<%
if(!request.getParameter("podrobnosti").equals(null)){
	int id = Integer.parseInt(request.getParameter("podrobnosti"));

ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO ();
ReceptZaglavlje recept = rzd.najdi(id);
int r = recept.getId_recept();
%>
<form method="post">
        <button type="submit" name="like" value="like" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-thumbs-up"></span> Like
        </button>
        <button type="submit" name="dislike" value="dislike" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-thumbs-down"></span> Dislike
        </button>
      
      </form>
      


<%
if(!request.getParameter("podrobnosti").equals(null)){
%><%
if(request.getParameter("like")!=null){
	OcenaDAO od1 = new OcenaDAO();
	System.out.println(request.getParameter("like"));
	      String l = "lajk";
		  Ocena o = new Ocena();
		  o.setOcena(1);
		  o.setKomentar(null);
	  	  o.setLajk(l);
	  	  o.setTk_recept_id(r);
	  	  od1.shrani(o);

	}else if(request.getParameter("dislike")!=null){
		OcenaDAO od1 = new OcenaDAO();
		System.out.println(request.getParameter("dislike"));
		 String d = "dislajk";

			  Ocena o = new Ocena();
		      o.setLajk(d);
		  	  o.setTk_recept_id(r);
		  	  od1.shrani(o);
	

}
	else{
		
	}
%>
<div id="div">
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
<b>Sestavine:</b>
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
  if(oceni.isEmpty()){
	  %>
	  <div class="alert alert-danger">
		  <strong>Danger!</strong> Ni komentara za recepta.
		</div><table>
 <% }else{
  for(int i=0; i<oceni.size(); i++){
  %>
  <tr>
  <td>
<%=oceni.get(i).getOcena()%>
 </td>   <td>
<%=oceni.get(i).getKomentar()%>
   </td> </tr>
  		<%}}
  
%>
  </table>		
 
  		
  		

  

<form action="komentar.jsp" method="post">
        <button  type="submit" name="komentar" value="<%= id %>">Dodaj komentar</button>
        </form>
        <form action="index.jsp" method="post">
         <button  type="submit" name="pdf" value="">Izpis</button>
        
       </form>
        <%
        System.out.println("fjiespjfsejfosj" + recept.getId_recept());
       PDF dp=new PDF ();
       if(request.getParameter("pdf")==null){
     	   System.out.println(recept.getId_recept());
    	   dp.izprintajPDF(recept);
     
     		 
       }
      %>
  			
        
       
<%}

/*System.out.println(r);
//session.setAttribute("id", r);
//String nesh = (session.getAttribute("id")).toString();
//System.out.println(nesh);
OcenaDAO od1 = new OcenaDAO();
System.out.println("dodaj je : " + request.getParameter("dodaj"));
//System.out.println("ocena je :" +request.getParameter("ocena"));
//System.out.println("komentar je :" +request.getParameter("komentar"));
if (request.getParameter(String.valueOf(id))!=null ){
	System.out.println("u if sum i dosadno mi e ");
	  Ocena o = new Ocena();
  	  o.setOcena(Integer.parseInt(request.getParameter("ocena")));
  	  o.setKomentar(request.getParameter("komentar"));
  	  o.setTk_recept_id(r);
  	  o.setLajk(null);
  	  od1.shrani(o);
  	response.sendRedirect("http://localhost:8080/praktikumIRecepti/index.jsp");

}
else{

	System.out.println("eve sum jas aren");
	
}}*/
%>
</div>
</div>
</body>
</html>