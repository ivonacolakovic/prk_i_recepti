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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>podrobnosti</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="podrobnosti.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
      <li ><a href="mostRecent.jsp">Najnovejsi</a></li>
      <li ><a href="iskanjePoSestavinah.jsp">Kaj imas v hladilniku?</a></li>
       
    </ul>
       
    <ul class="nav navbar-nav navbar-right">
    <li ><a href="mojiRecepti.jsp"><span class="glyphicon glyphicon-create"></span> Moji recepti</a></li>
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="registracija.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
%>
<div id="div3" >
<div id="wrapper1">
<br/>
<div id="gumb" >
     <form action="index.jsp" method="post">
         <div class="inner"><button style="font-size:20px"  type="submit" name="pdf" value="" class="btn btn-danger"  > <i class="fa fa-file-pdf-o"></i></button></div>
        
       
       </form>
</div>
<h1><%=recept.getNaziv() %></h1>

<br/>

<h4><%=recept.getKratekOpis() %></h4>
<br>

<br>
<img src="<%=recept.getSlika() %>" height="420" width="850"/> 
<i>Datum objave:<%=recept.getCasObjave() %></i>


<br/>
<br/>
<br/>

</div>
</div>

<br/>
<br/>

<br/>
<br/>


<div id="div1" >
<div id="wrapper">


	<br/>
<h4><b>Stevilo porcij:</b><%=recept.getSteviloOseb() %></h4>
<h4><b>Cas priprave: </b><%=recept.getCasPriprave() %></h4>
<hr>
<h4><b>Kalorije: </b></h4><h5><%=recept.getSteviloKalorije() %></h5>
<h4><b>Mascobe: </b></h4><h5><%=recept.getMascobe() %></h5>
<h4><b>Oglijikovi hidrati: </b></h4><h5><%=recept.getOgljikoviHidrati() %></h5>
<h4><b>Alergeni: </b></h4><h5><%=recept.getAlergeniSkupaj() %></h5>

<hr>
   <br> 
       <iframe src="<%=recept.getVideo()%>" width="420" height="315"></iframe>
<br>


<%} %>
<br><br><br>

<% 
OcenaDAO od = new OcenaDAO();
  ArrayList<Ocena> oceni = (ArrayList<Ocena>) od.vrniVse(id);
  if(oceni.isEmpty()){
	  %>
	  <div class="alert alert-danger">
		  <strong>Danger!</strong> Ni komentara za recept.
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
 
  		
<br>

 </div>
 </div>
<div id="div2">
<div id="wrapper">

<h4><b>Sestavine:</b></h4>
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
 <br>
       <br>
<h4><b>Nacin priprave: </b> <br>
<br>
<%=recept.getOpisPriprave() %></h4>
<br>

 <br>
       <br>
    

<br>
<br>		





<form action="komentar.jsp" method="post">

        <div class="inner">
        <input  type="button" name="komentar" value="kom" onClick="nastaviVrednostOcene()"/>
        </div>
        </form>

   
       </div>
     
      
       <br>
       <br>
       <br>
         </div>
       
             
        <%
        System.out.println("fjiespjfsejfosj" + recept.getId_recept());
       PDF dp=new PDF ();
       if(request.getParameter("pdf")==null){
     	   System.out.println(recept.getId_recept());
    	    dp.izprintajPDF(recept);
    	    
     
     		 
       }
      %>
  			
        
       
<%}  %>
<div id="div1">
<div id="div4">
<div id="wrapper">

 
<form name="myForm"  onsubmit="return validateForm()" method="post" >
<br>
 <div >
     <input type="radio" id="ocena1" name="ocena" value="1" >
      <label for="ocena1">1</label>
   
     <input type="radio" id="ocena2" name="ocena" value="2" >
    <label for="ocena2">2</label>
    
     <input type="radio"  id="ocena3" name="ocena" value="3" >
   <label for="ocena3">3</label>
   
     <input type="radio" id="ocena4" name="ocena" value="4" >
    <label for="ocena4">4</label>
    
     <input type="radio"  id="ocena5" name="ocena" value="5" >
 	<label for="ocena5">5</label>
 	
 	
 <br>
  </div><br>
<div class="form-group">
         <label for="priprave">Vnesite komentar:</label>
      <textarea class="form-control" rows="6" id="priprave" type="text" placeholder="Vnesite komentar"  name="priprava" required></textarea>
    </div>
<br>

      <p><button   class="btn btn-success" type="submit" value="<%=2 %>" name="posljiKomentar">Poslji komentar</button></p>
    <br>
</form>
</div>
</div>
</div>

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

<script>
function nastaviVrednostOcene(){
	document.form1.komentar.value = "button 1"
}
</script>
</body>
</html>