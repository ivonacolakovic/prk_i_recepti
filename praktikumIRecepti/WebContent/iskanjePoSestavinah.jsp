<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
  body {
    background-image: url("https://www.redfynn.com/wp-content/uploads/2016/08/home-italian-food-background.jpg");
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Kaj imas v hladilniku?</h1>
<br/>
<h3>Lacen si in ne zelis iti v trgovino? Ze imas nekatere sestavine v hladilniku?
<br/>
Ce je tvoj odgovor DA, uporabi iskanje receptov ki vsebujejo samo sestavine katere ze imas!</h3>
<br/>
<br/>
Vnesi sestavine: (loci z vejico)
<br/>
<input type="text" name="sestavine"/>
<button type="submit" name="OK">OK</button>
<table>
<% 	ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
	ArrayList<ReceptZaglavlje> recepti = null;
	String input = request.getParameter("sestavine");
	
	if(input != null){
		recepti = rzd.isciPoSestavinah(input);
	}
	
	for(int i = 0; i < recepti.size(); i++){
	%>
		<tr>
			<td><img src="<%=recepti.get(i).getSlika() %>" height="200" width="300"/></td>
  			<td><%=recepti.get(i).getNaziv()%></td>
  			<td><%=recepti.get(i).getKratekOpis()%></td>
		</tr>
	
	<%	
	}
%>
</table>
</body>
</html>