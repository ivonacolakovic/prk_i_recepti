<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
  body {
    background-image: url("https://www.redfynn.com/wp-content/uploads/2016/08/home-italian-food-background.jpg");
}
</style>
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
<h1>Dodaj alergene</h1>


<form name="myForm" action="" onsubmit="return validateForm()" method="post">
     <p><b>Naziv alergena:</b><input type="text" name="naziv" placeholder="Vnesete naziv" required></p>

       
        <p><button class="btn btn-success" type="submit" name="add">DONE</button></p>
        
        
       
      </form>
      
       <%
     AlergeniDAO ad=new AlergeniDAO ();
     ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
      if (request.getParameter("add")!= null) {
    	/*  String i = (String) request.getParameter("dodanRecept");
    	 	int id = Integer.parseInt(i);
    	 	ReceptZaglavlje fr = rzd.najdi(id);
    	 	
    	  System.out.println("naziv: "+ fr.getNaziv());
    	  System.out.println("kratek Opis:  "+ fr.getKratekOpis());*/ 
    	  Alergeni a=new Alergeni(request.getParameter("naziv"));
    	 
    	  a.setNaziv(request.getParameter("naziv"));
    	  
  ad.shrani(a);
    	  
      }
      %>

</body>
</html>