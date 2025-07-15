<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Gracias por tu Reserva</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

<header class="header">
    <div class="logo">
        <a href="Home.jsp"><img src="imagenes/Logo.png" alt="Logo" height="40"></a>
        <a href="google.com"><ion-icon name="search-outline"></ion-icon></a>
    </div>
    <nav class="navbar">
        <ul>
            <li><a href="Flota.jsp">Flota</a></li>
            <li><a href="SobreNosotros.html">Sobre Nosotros</a></li>
        </ul>
    </nav>
    <div class="header-right">
        <a href="LoginAdmin.jsp"><ion-icon name="person"></ion-icon></a>
    </div>
</header>

<main>
<div class="checkout-container">

<%
String id = request.getParameter("id");
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String fechaInicio = request.getParameter("fecha_inicio");
String fechaFin = request.getParameter("fecha_fin");
String cobertura = request.getParameter("cobertura");
String extras = request.getParameter("extras");
String subtotal = request.getParameter("subtotal");
String itbms = request.getParameter("itbms");
String total = request.getParameter("total");
String imagen = request.getParameter("imagen");
%>

<div class="checkout-summary">
<h2 style="color:green;">✅ ¡Gracias por tu reserva, <%= nombre %>!</h2>

<h3>Retiro - Retorno</h3>
<p>📅 <%= fechaInicio %> → <%= fechaFin %></p>

<h3>Carro <%= id %> o similar</h3>
<img src="<%= imagen %>" alt="Auto reservado" style="max-width:200px;">

<div class="datos-auto">
<p>⚙️ AT &nbsp; ⛽ Ngal/Km &nbsp; ❄ A/C</p>
</div>

<h3>Detalles de la Reserva</h3>
<p>Cliente: <strong><%= nombre %> <%= apellido %></strong></p>
<p>Cobertura: <%= cobertura %></p>
<p>Extras: <%= extras %></p>
<p>Subtotal: $<%= subtotal %></p>
<p>ITBMS: $<%= itbms %></p>
<p><strong>Total: $<%= total %></strong></p>

<a href="Home.jsp" style="display:inline-block; margin-top:20px;">🏠 Volver al inicio</a>
</div>

</div>
</main>

</body>
</html>
