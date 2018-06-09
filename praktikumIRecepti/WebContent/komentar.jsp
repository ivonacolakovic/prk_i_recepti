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
try{
System.out.println("kom "+request.getParameter("komentar"));
}catch(NullPointerException e){
	System.err.println(e.toString());
	System.out.println("im caught");
}
if(!(request.getParameter("komentar").equals(null))){
	System.out.println("kom ni null");
	//int i = Integer.parseInt(request.getParameter("komentar"));
}else{
	System.out.println("probao sam");
}


%>
<form  method="post">
        <b>OCENA:</b><input class="w3-input w3-padding-16 w3-border" type="number" min="1" max="5"placeholder="Vnesete ocena" id="ocena" name="ocena" />
        <b>Komentar:</b><textarea rows="5"  class="w3-input w3-padding-16 w3-border" type="text" placeholder="Vnesete komentar"  id="comentar" name="comentar" ></textarea>

        <button class="but" type="submit" name="dodaj" value="1" >DODAJ</button>
        </form>
        <% 
        OcenaDAO od1 = new OcenaDAO();
System.out.println("dodaj je : " + request.getParameter("dodaj"));
int id2 = Integer.parseInt(request.getParameter("komentar"));
if (request.getParameter("dodaj")!=null){
	System.out.println("u if sum i dosadno mi e ");
	  Ocena o = new Ocena();
  	  o.setOcena(Integer.parseInt(request.getParameter("ocena")));
  	  o.setKomentar(request.getParameter("comentar"));
  	  o.setTk_recept_id(id2);
  	  o.setLajk(null);
  	  od1.shrani(o);
  	response.sendRedirect("http://localhost:8080/praktikumIRecepti/index.jsp");

}
else{

	System.out.println("eve sum jas aren");
	
}
%>
       

</body>
</html>
