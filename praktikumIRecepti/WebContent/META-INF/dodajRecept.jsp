<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>dodajRecept</title>
</head>
<body>
<h1>Dodaj nov recept</h1>
<form action="/action_page.php" method="post"

onsubmit="return validateForm()" method="post" action="">

        <p><b>Naziv:</b><input type="text" name="naziv" placeholder="Vnesete naziv" required></p>
        <p><b>Stevilo porcij:</b><input class="w3-input w3-padding-16 w3-border" type="number" min="1" placeholder="Vnesete stevilo porcij" required name="steviloOseb" ></p>
        <p><b>Cas priprave:</b><input class="w3-input w3-padding-16 w3-border" type="text"  min="1"  placeholder="Vnesete cas priprave" required name="casPriprave" pattern="(?=.*\d)(?=.*[0-9]).{8,}" title="You must use only numbers!" required></p>
        <p><b>Opis:</b><textarea rows="5"  class="w3-input w3-padding-16 w3-border" type="text" placeholder="Vnesete kratek opis" required name="kratekOpis" required></textarea></p>
        <p><b>Video:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete video"  name="video" ></p>
        <p><b>Slika:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete slika"  required name="slika" ></p>
        <p><b>Kalorije:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete stevilo kalorije"  required name="kalorije" pattern="(?=.*\d)(?=.*[0-9]).{8,}" title="You must use only numbers!" required></p>
        <p><b>Mascobe:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete stevilo mascobe"  required name="mascobe"pattern="(?=.*\d)(?=.*[0-9]).{8,}" title="You must use only numbers!" required></p>
        <p><b>Ogljikovi hidrati:</b><input class="w3-input w3-padding-16 w3-border" type="text" min="1"  placeholder="Vnesete stevilo ogljikovi hidrati"  required name="hidrati" pattern="(?=.*\d)(?=.*[0-9]).{8,}" title="You must use only numbers!" required></p> 
        <p><b>Nacin priprave:</b><textarea rows="10"  class="w3-input w3-padding-16 w3-border" type="text" placeholder="Vnesete nacin priprave"  required name="priprava" required></textarea></p>
        <p><b>Datum objave:</b><input class="w3-input w3-padding-16 w3-border" type="date"   placeholder="Vnesete datum"  required name="datum" required></p> 
        
        <p><button class="w3-button" type="submit"name="add">KONEC</button></p>
      </form>
      
      <%
      ReceptZaglavljeDAO  rzd=new ReceptZaglavljeDAO ();
     
      if (request.getParameter("add")!= null) {
    	  ReceptZaglavlje rz=new ReceptZaglavlje();
    	 
    	  rz.setNaziv(request.getParameter("naziv"));

    	  rz.setSteviloOseb(Integer.parseInt(request.getParameter("steviloOseb")));
    	  rz.setCasPriprave(Double.parseDouble(request.getParameter("casPriprave")));
    	  rz.setKratekOpis(request.getParameter("kratekOpis"));
    	  rz.setVideo(request.getParameter("video"));
    	  rz.setSlika(request.getParameter("slika"));
    	  rz.setSteviloKalorije(Double.parseDouble(request.getParameter("kalorije")));
    	  rz.setMascobe(Double.parseDouble(request.getParameter("mascobe")));
    	  rz.setOgljikoviHidrati(Double.parseDouble(request.getParameter("hidrati")));
    	  rz.setOpisPriprave(request.getParameter("hidrati"));
    	  String datum1=request.getParameter("datum");
    	  rz.setCasObjave(java.sql.Date.valueOf(datum1));
    	  
    	  rzd.shrani(rz);
    	  
      }
      %>

</body>
</html>