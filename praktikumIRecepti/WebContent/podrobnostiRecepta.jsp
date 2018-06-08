<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

#wrapper {
  width: 85%;     /* specify a width! */
  margin: 0 auto; /* center */
}

#wrapper1 {
  width: 75%;     /* specify a width! */
  margin: 0 auto; /* center */
}
#div1{


  position:absolute;
    top:750px;
    left:190px;
    width:35%;
    border-radius: 5px;
    background-color: #f2f2f2;
}

#div2{
  position:absolute;
    top:750px;
    right:230px;
    width:35%;
    border-radius: 5px;
    background-color: white;
}

#div3{

    top:100px;
  
    width:80%;
  border-radius: 5px;
    background-color: white;
    margin:0px auto;
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
<title>podrobnosti</title>
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
<div id="div3" >
<div id="wrapper1">


<h1><%=recept.getNaziv() %></h1>

<h3><%=recept.getKratekOpis() %></h3>
<br>
<img src="<%=recept.getSlika() %>" height="420" width="800"/> 
<br>
<i>Datum objave:<%=recept.getCasObjave() %></i>
<br/>
<br/>

</div>
</div>

<div id="div1" >
<div id="wrapper">


	<br/>
<h4><b>Stevilo porcij:</b><%=recept.getSteviloOseb() %></h4>
<h4><b>Cas priprave: </b><%=recept.getCasPriprave() %></h4>
<h4><b>Kalorije: </b><%=recept.getSteviloKalorije() %></h4>
<h4><b>Mascobe: </b><%=recept.getMascobe() %></h4>
<h4><b>Oglijikovi hidrati: </b><%=recept.getOgljikoviHidrati() %></h4>
<h4><b>Alergeni: </b><%=recept.getAlergeniSkupaj() %></h4>
<h4><b>Nacin priprave: </b><%=recept.getOpisPriprave() %></h4>
<iframe src="<%=recept.getVideo()%>" width="420" height="315"></iframe>

<br>
<br>
<br>

 </div>
 </div>
<div id="div2">
<div id="wrapper">
<br><br>
<h3>Sestavine:</h3>
<table>
<tr>
   <th><h4>Naziv</h4></th>
    <th><h4>Kolicina</h4></th> 
    <th><h4>Enota</h4></th>
  </tr>
<%SestavineDAO sd = new SestavineDAO();
List<Sestavine> sestavine = sd.vrniSestavine(recept.getId_recept());
for(int i=0;i<sestavine.size();i++){%> 
<tr>
    <td><h5><%=sestavine.get(i).getNaziv()%></h5></td>
    <td><h5><%=sestavine.get(i).getKolicina()%></h5></td>
    <td><h5><%=sestavine.get(i).getEnota()%></h5></td>
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
        <button  type="submit" name="komentar" value="<%= id %>" class="btn btn-primary">Komentiraj</button>
        </form>
        
      
       <br/>
        <form action="index.jsp" method="post">
         <button  type="submit" name="pdf" value="" class="btn btn-danger" > PDF </button>
        
       </form>
       <br>
       <br>
       <br>
        <%
        System.out.println("fjiespjfsejfosj" + recept.getId_recept());
       PDF dp=new PDF ();
       if(request.getParameter("pdf")==null){
     	   System.out.println(recept.getId_recept());
    	    dp.izprintajPDF(recept);
    	    
     
     		 
       }
      %>
  			
        
       
<%}
%>
<form method="post">
<button type="submit" name="like" value="like" class="btn btn-default btn-sm">
  <span class="glyphicon glyphicon-thumbs-up"></span> Like
</button>
<button type="submit" name="dislike" value="dislike" class="btn btn-default btn-sm">
  <span class="glyphicon glyphicon-thumbs-down"></span> Dislike
</button>

</form>
<br>
<br>
<br>
<br>
<%
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