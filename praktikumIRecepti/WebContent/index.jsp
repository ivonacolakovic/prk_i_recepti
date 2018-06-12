<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="si.um.feri.praktikum.razredi.*"%>
<%@ page import="si.um.feri.praktikum.dao.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="index.css">
  <title>Index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">LoveAtFirstBite</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Doma</a></li>
     <li><a href="top10.jsp">Top 10</a></li>
      <li><a href="mostRecent.jsp">Najnovejsi</a></li>
      <li ><a href="iskanjePoSestavinah.jsp">Kaj imas v hladilniku?</a></li>
       
    </ul>
       
    <ul class="nav navbar-nav navbar-right">
    <li ><a href="mojiRecepti.jsp"><span class="glyphicon glyphicon-create"></span> Moji recepti</a></li>
     <li><a href="dodajRecept.jsp"><span class="glyphicon glyphicon-create"></span> Dodaj novi recept</a></li>
      <li><a href="uporabniki.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="prijava.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<div class="container"> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="10000">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="https://hips.hearstapps.com/del.h-cdn.co/assets/18/11/1520956952-chicken-tacos-horizontal.jpg" alt="Tacos" style="width:1100px;height:460px">
      </div>

      <div class="item">
        <img src="http://yesofcorsa.com/wp-content/uploads/2016/03/638734_pancakes.jpg" alt="Pancakes" style="width:1100px;height:460px">
      </div>
    
      <div class="item">
        <img src="http://sevilla.abc.es/gurme//wp-content/uploads/2013/05/ensalada-foie-frutos-rojos.jpg" alt="Salad" style="width:1100px;height:460px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
  
   
<div id="wrapper">
<form action="search.jsp">
<div class="custom-select" style="width:200px;">
<select name="tipjedi">
  <option value="ostalo" selected="selected">Tip jedi</option>
  <option value="juha">Juha</option>
  <option value="solata">Solata</option>
  <option value="predjed">Predjed</option>
  <option value="glavnajed">Glavna jed</option>
  <option value="sladica">Sladica</option>
</select>
</div>
<div class="custom-select" style="width:200px;">
<select name="sezona">
  <option value="ostalo" selected="selected">Sezona</option>
  <option value="zima">Zima</option>
  <option value="pomlad">Pomlad</option>
  <option value="jesen">Jesen</option>
  <option value="poletje">Poletje</option>
</select>
</div>
<div class="custom-select" style="width:200px;">
<select name="kuhinja">
  <option value="ostalo" selected="selected">Kuhinja</option>
  <option value="francoska">Francoska</option>
  <option value="italijanska">Italijanska</option>
  <option value="mehiska">Mehiska</option>
  <option value="kitajska">Kitajska</option>
</select>
</div>
<div class="custom-select" style="width:200px;">
<select name="caspriprave">
  <option value="ostalo" selected="selected">Cas priprave</option>
  <option value="30">manj kot 30min</option>
  <option value="60">manj kot 1h</option>
  <option value="120">manj kot 2h</option>

</select>
</div>

<input type="submit" value="Potrdi" class="button button4">

</form>

</div>
<br class="clearFloat"/>


<script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 0; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);</script>



<div class="container text-center">  
<h1 >RECEPTI</h1>

<br/>
<br/>
</div>





  <% ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
  ArrayList<ReceptZaglavlje> recepti = (ArrayList<ReceptZaglavlje>) rzd.vrniVse();
  for(int i=0; i<recepti.size(); i++){
  %>
  <div id="div">
  <div class="gallery">
  <form action="podrobnostiRecepta.jsp" method="post">

  			<img src="<%=recepti.get(i).getSlika() %>" style="width:270px" height="180px">
  			<div class="desc">
  			 <button class="button button4" type="submit" name="podrobnosti" value="<%=recepti.get(i).getId_recept()%>"><%= recepti.get(i).getNaziv()%></button>
  			
  			 </div>
  			
  		 </form>
  		 </div>
  		 </div>
  		 
  
 <%} %>




  <% 
           //String podrobnosti = request.getParameter("podrobnosti");
  		   //request.setAttribute("id", podrobnosti);
  		   
  		   %>
 

 
  		
  		   
  		   
  		   
  		  
 

	
	
	

</body>
</html>