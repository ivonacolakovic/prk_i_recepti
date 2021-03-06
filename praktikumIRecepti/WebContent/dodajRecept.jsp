<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="podrobnosti.css">
<script src="/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>dodajRecept</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div id="example">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">LoveAtFirstBite</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="index.jsp">Doma</a></li>
     <li><a href="top10.jsp">Top 10</a></li>
      <li><a href="mostRecent.jsp">Najnovejsi</a></li>
      <li ><a href="iskanjePoSestavinah.jsp">Kaj imas v hladilniku?</a></li>
       
    </ul>
       
    <ul class="nav navbar-nav navbar-right">
    <li ><a href="mojiRecepti.jsp"><span class="glyphicon glyphicon-create"></span> Moji recepti</a></li>
     <li class="active"><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="registracija.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>


</br>
<div id="w1" >
<h2 style="color:#3c3c3c;" > DODAJ NOV RECEPT </h2>
</div>
<br>
<%
if(session.getAttribute("uporabnik") == null){

	response.sendRedirect("http://localhost:8080/praktikumIRecepti/prijava.jsp");
	  
}
else{
	System.out.println(session.getAttribute("uporabnik"));
	String u = session.getAttribute("uporabnik").toString();
	int upo = Integer.parseInt(u);
	System.out.println(u);
%>
<form name="myForm"  onsubmit="return validateForm()" method="post" >
<div id="d1" >
<div id="w">
<br>
<br>

     <div class="form-group">
      <label for="usr">Naziv</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite naziv" name="naziv" required >
    </div>
    <div class="form-group">
      <label for="stvp">Stevilo porcij:</label>
      <input type="text" class="form-control" id="stvp" type="number" placeholder="Vnesite stevilo porcij" type="number" min="1" placeholder="Vnesete stevilo porcij" name="steviloPorcij" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
    </div>
     <div class="form-group">
      <label for="casp">Cas priprave (min):</label>
      <input type="text" class="form-control" id="casp" type="text"  min="1"  placeholder="Vnesite cas priprave"  name="casPriprave" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
    </div>
       <div class="form-group">
      <label for="comment">Opis:</label>
      <textarea class="form-control" rows="3" id="comment" type="text" placeholder="Vnesite kratek opis"  name="kratekOpis" required></textarea>
    </div>
     <div class="form-group">
         <label for="priprave">Nacin priprave:</label>
      <textarea class="form-control" rows="6" id="priprave" type="text" placeholder="Vnesite nacin priprave"  name="priprava" required></textarea>
    </div>
  
     
     <div class="form-group">
      <label for="kal">Kalorije:</label>
      <input type="text" class="form-control" id="kal" type="text" min="1"  placeholder="Vnesite stevilo kalorij"   name="kalorije" >
    </div>
    <br>
    <br>
     </div>
    </div>
    
    <div id="d2">
    <div id="w">
    <br>
    <br>
    <div class="form-group">
      <label for="masc">Mascobe:</label>
      <input type="text" class="form-control" id="masc" type="text" min="1"  placeholder="Vnesete mascobe (g)"  name="mascobe" >
    </div>
    <div class="form-group">
      <label for="oglj">Ogljikovi hidrati:</label>
      <input type="text" class="form-control" id="oglj" type="text" min="1"  placeholder="Vnesete ogljikove hidrate (g)" name="hidrati" >
    </div>

     <div class="form-group">
      <label for="usr">Naziv alergena (locite z vejico):</label>
      <input type="text" class="form-control" id="usr" placeholder="Vnesite naziv" name="alergeni" required >
    </div>
    <div >
    <input type="radio" id="tipjedi1" name="tipjedi" value="juha" required>
    <label for="tipjedi1">Juha</label>

     <input type="radio" id="tipjedi2" name="tipjedi" value="solata" required>
    <label for="tipjedi2">Solata</label>

   <input type="radio" id="tipjedi3" name="tipjedi" value="predjed" required>
    <label for="tipjedi3">Predjed</label>
    
     <input type="radio" id="tipjedi4" name="tipjedi" value="glavnajed" required>
    <label for="tipjedi4">Glavna jed</label>
    
     <input type="radio" id="tipjedi5" name="tipjedi" value="sladica" required>
    <label for="tipjedi5">Sladica</label>
  </div><br>
      <div >
    <input type="radio" id="sezona1" name="sezona" value="zima" required>
    <label for="sezona1" >Zima</label>

    <input type="radio" id="sezona2" name="sezona" value="pomlad" required>
    <label for="sezona2">Pomlad</label>
    
  <input type="radio" id="sezona3" name="sezona" value="poletje" required>
    <label for="sezona3">Poletje</label>
    
     <input type="radio" id="sezona4" name="sezona" value="jesen" required>
    <label for="sezona4">Jesen</label>
  </div><br>
        <div >
    <input type="radio" id="kuhinja1" name="kuhinja" value="mehiska" required>
    <label for="kuhinja1">Mehiska</label>

    <input type="radio" id="kuhinja2" name="kuhinja" value="francoska" required>
    <label for="kuhinja2">Francoska</label>
    
  <input type="radio" id="kuhinja3" name="kuhinja" value="italijanska" required>
    <label for="kuhinja3">Italijanska</label>
    
     <input type="radio" id="kuhinja4" name="kuhinja" value="kitajska" required>
    <label for="kuhinja4">Kitajska</label>
  </div>
  <br>
     <div class="form-group">
      <label for="video">Video (link):</label>
      <input type="text" class="form-control" id="video"type="text" min="1"  placeholder="Vnesite video" name="video">
    </div>
     <div class="form-group">
      <label for="slika">Slika (link):</label>
      <input type="text" class="form-control" id="slika"type="text" min="1"  placeholder="Vnesite sliko"  name="slika">
    </div>
    <br>
    <br>
  <div id="naslov">
        <p><button   class="btn btn-success" type="submit"  name="add">DODAJ</button></p>
        <br>
        </div>
         </div>
       </div>
       
        </form>
       
  
     
      <%
      ReceptZaglavljeDAO  rzd=new ReceptZaglavljeDAO ();
    //System.out.println("dugme "+request.getParameter("add"));
      
      if (request.getParameter("add")!= null) {
    	 //System.out.println("u ifu");
    	  ReceptZaglavlje rz=new ReceptZaglavlje();
    	 
    	  rz.setNaziv(request.getParameter("naziv"));
    	  System.out.println("stP: "+request.getParameter("steviloPorcij"));
    	  rz.setSteviloOseb(Integer.parseInt(request.getParameter("steviloPorcij")));
    	  rz.setCasPriprave(Double.parseDouble(request.getParameter("casPriprave")));
    	  rz.setKratekOpis(request.getParameter("kratekOpis"));
    	  rz.setVideo(request.getParameter("video"));
    	  rz.setSlika(request.getParameter("slika"));
    	  rz.setSteviloKalorije(Double.parseDouble(request.getParameter("kalorije")));
    	  rz.setMascobe(Double.parseDouble(request.getParameter("mascobe")));
    	  rz.setOgljikoviHidrati(Double.parseDouble(request.getParameter("hidrati")));
    	  rz.setOpisPriprave(request.getParameter("priprava"));
    	  rz.setCasObjave(new Date());
    	  rz.setAlergeniSkupaj(request.getParameter("alergeni"));
    	  rz.setKuhinja(request.getParameter("kuhinja"));
    	  rz.setSezona(request.getParameter("sezona"));
    	  rz.setTipjedi(request.getParameter("tipjedi"));
    	  rz.setTk_uporabnik(upo);
    	  
    	  rzd.shrani(rz);
    	  response.sendRedirect("http://localhost:8080/praktikumIRecepti/dodajSestavine.jsp");
    	  int zadnjiId = rzd.vrniZadnjiId();
    	  System.out.println("last id: "+zadnjiId);
    	  request.setAttribute("zadnjiId", zadnjiId);
    	 
      }
      else{
    	  System.out.println("kogcfgvhbjnkuyvhjbmfd");
      }}
      %>
      </div>
     
</body>
</html>
