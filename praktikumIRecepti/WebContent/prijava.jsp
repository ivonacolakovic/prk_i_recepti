 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>


img {
    float: right;
}
.form-group {
overflow: auto;
}

.img2 {
    float: right;
   
}
.img3 {
    float: left;
     margin: 400px 0px 0px 20px;
     
}


 #naslov {
  width: 15%;     /* specify a width! */
  margin: 0 auto; /* center */
}

#div{

 border-radius: 5px;
    background-color: #f2f2f2;
     width: 27%;
     margin: 80px 200px 200px 600px;


 
}
 #wrapper {
  width: 85%;     /* specify a width! */
  margin: 0 auto; /* center */
}
h2 {
 font-family: 'Raleway', Helvetica, Arial, sans-serif;
 text-align:center;
}


</style>
<script src="/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prijava</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    
     <li class="active"><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="uporabniki.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
  
    </ul>
  </div>
</nav>



<img class= "img3" src="http://www.pngmart.com/files/5/Indian-Food-PNG-HD.png" alt="Smiley face"  style="width:600px;height:300px; margin-left:20px; margin-right:50px;">
  

<img class= "img2" src="http://www.marcosmexicangrill.com/assets/images/content/menu/sliderphoto_01_tacos.png" alt="Smiley face"  style="width:500px;height:250px; margin-left:20px; margin-right:50px;">
 
 <div id="div">
<div id="wrapper">
 
    


  <br/>
<h2 style="color:#3c3c3c;" > PRIJAVA </h2>
<form name="myForm"  onsubmit="return validateForm()" method="post" >
 <br/>
  
    <div class="form-group">
      <label for="usr">Uporabnisko ime</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite uporabnisko ime" name="uporabniskoIme" required >
    </div>
     
      <div class="form-group">
      <label for="usr">Geslo</label>
      <input type="password" class="form-control"  placeholder="Vnesite geslo" name="geslo" id="myInput" required >
    <input type="checkbox" onclick="myFunction()">Show Password
    </div>
     </br>
  <div id="naslov">
        <p><button   class="btn btn-success" type="submit"  name="add">DODAJ</button></p>
        
        <br/>
      
        </div>
        </form>
       
  
      </div>
    
       
   
      </div>
 
    
      <script>
function myFunction() {
    var x = document.getElementById("myInput");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
</script>
      <%
      UporabnikiDAO  ud=new UporabnikiDAO ();
    
    		  
    		  if (request.getParameter("add")!= null) {
    		    	 
    		    	  Uporabniki u=new Uporabniki();
    		    	 
    		    	  u.setIme(request.getParameter("ime"));
    		    	  u.setPriimek(request.getParameter("priimek"));
    		    	  u.setEmail(request.getParameter("email"));
    		    	  u.setUporabniskoIme(request.getParameter("uporabniskoIme"));
    		    	  u.setGeslo(request.getParameter("geslo"));
    		    	  
    
     
    		    	  ud.shrani(u);
    		    	
    		    	 
    		      }
    	      else{
    	    	  System.out.println("kogcfgvhbjnkuyvhjbmfd");
    	      }
    	      %>
</body>
</html>