<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Checkout - Alquiler de Autos</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

<header class="header">
    <div class="logo">
        <img src="logo.png" alt="Logo" height="40">
    </div>
    <nav class="navbar">
        <ul>
            <li><a href="Flota.jsp">Flota</a></li>
            <li><a href="Gracias.jsp">Sobre Nosotros</a></li>
        </ul>
    </nav>
</header>

<main>

<div class="checkout-container">
<%
String id = request.getParameter("id");
String imagen = request.getParameter("imagen");
String cobertura = request.getParameter("cobertura");
String extras = request.getParameter("extras");
String subtotal = request.getParameter("subtotal");
String itbms = request.getParameter("itbms");
String total = request.getParameter("total");
String fechaInicio = request.getParameter("fecha_inicio");
String fechaFin = request.getParameter("fecha_fin");

String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");

if (nombre != null && apellido != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/AlquilerdeAutos?useSSL=false&serverTimezone=UTC",
            "root", "");

        PreparedStatement ps = conn.prepareStatement("UPDATE autos SET disponible = 0 WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        ps.close();
        conn.close();
%>
<p style="color:green;">✅ Reserva confirmada. El auto ha sido marcado como no disponible.</p>
<%
    } catch (Exception e) {
%>
<p style="color:red;">Error al actualizar: <%= e.getMessage() %></p>
<%
    }
} else {
%>

<form method="post" class="checkout-form">
<input type="hidden" name="id" value="<%= id %>">
<input type="hidden" name="cobertura" value="<%= cobertura %>">
<input type="hidden" name="extras" value="<%= extras %>">
<input type="hidden" name="subtotal" value="<%= subtotal %>">
<input type="hidden" name="itbms" value="<%= itbms %>">
<input type="hidden" name="total" value="<%= total %>">
<input type="hidden" name="fecha_inicio" value="<%= fechaInicio %>">
<input type="hidden" name="fecha_fin" value="<%= fechaFin %>">

<h3>Datos del Conductor</h3>
<label>Nombre <input type="text" name="nombre" required></label>
<label>Apellido <input type="text" name="apellido" required></label>
<label>Teléfono <input type="text" name="telefono" required></label>
<label>Licencia <input type="text" name="licencia" required></label>
<label>Correo <input type="email" name="correo" required></label>
<label>Fecha de nacimiento <input type="date" name="fecha" required></label>
<button type="submit">Reservar</button>
</form>

<div class="checkout-summary">
<h3>Retiro - Retorno</h3>
<p>📅 <%= fechaInicio %> → <%= fechaFin %></p>

<h3>Carro <%= id %> o similar</h3>

<img src="<%= imagen %>" alt="Auto" style="max-width:200px;">

<div class="datos-auto">
<p>⚙️ AT &nbsp; ⛽ Ngal/Km &nbsp; ❄ A/C</p>
</div>

<h3>Detalles de la Reserva</h3>
<p>Auto: Carro <%= id %></p>
<p>Cobertura: <%= cobertura %></p>
<p>Extras: <%= extras %></p>
<p>Subtotal: $<%= subtotal %></p>
<p>ITBMS: $<%= itbms %></p>
<p><strong>Total: $<%= total %></strong></p>
</div>

<%
}
%>
</div>

</body>
</html>
