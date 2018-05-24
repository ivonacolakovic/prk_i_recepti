<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

      ReceptZaglavljeDAO  rzd =new ReceptZaglavljeDAO ();
      ArrayList <ReceptZaglavlje> recepti= new ArrayList<ReceptZaglavlje>();
      for(int i= 0; i < recepti.size() ; i++){
      
      recepti.get(i).getNaziv();
      recepti.get(i).getKratekOpis();
      recepti.get(i).getSlika();
      } 
      

</body>
</html>