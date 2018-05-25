<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table>
      	<%ReceptZaglavljeDAO  rzd = new ReceptZaglavljeDAO ();
      	ArrayList <ReceptZaglavlje> recepti = (ArrayList<ReceptZaglavlje>) rzd.vrniNajnovejse();
      	for(int i= 0; i < recepti.size() ; i++){%>
      		<tr>
      			<td>recepti.get(i).getSlika();</td>
      			<td>recepti.get(i).getNaziv();</td>
      			<td>recepti.get(i).getKratekOpis();</td>
      		</tr>
      	<% } %>
      </table>

</body>
</html>