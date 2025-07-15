<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/styles.css">
<title>Flota</title>
</head>
<body>

<header class="header">
<div class="logo">
<a href="AdminPanel.jsp"><img src="imagenes/Logo.png" alt="Logo" height="40"></a>
</div>
<nav class="navbar">
<ul>
<li><p>EN</p><ion-icon name="globe"></ion-icon></li>
<li><a href="AdminPanel.jsp">Administrar Flota</a></li>
<li><a href="AgregarCarro.jsp">Agregar Carro</a></li>
</ul>
</nav>
<div class="header-right">
<a href="Flota.jsp"><ion-icon name="person"></ion-icon></a>
</div>
</header>

<main>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
  "jdbc:mysql://localhost:3306/AlquilerdeAutos?useSSL=false&serverTimezone=UTC", 
  "root", "");
  // Ejecutar consulta para recuperar todos los autos
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(
  "SELECT id, nombre, imagen, disponible, precio, transmision, combustible, aire_acondicionado, espacio, pasajeros, puertas FROM autos");
%>

<div class="main-container">
<%
// Iterar sobre cada registro de auto y generar su "card" de edición
while (rs.next()) {
    int id = rs.getInt("id");
    String nombre = rs.getString("nombre");
    String imagen = rs.getString("imagen");
    boolean disponible = rs.getBoolean("disponible");
    double precio = rs.getDouble("precio");
    String transmision = rs.getString("transmision");
    String combustible = rs.getString("combustible");
    int aire = rs.getInt("aire_acondicionado");
    String espacio = rs.getString("espacio");
    int pasajeros = rs.getInt("pasajeros");
    int puertas = rs.getInt("puertas");
%>

<div class="Auto">
  <h3 class="subtitulo-auto"><%= nombre %></h3>

  <span class="status <%= disponible ? "available" : "unavailable" %>">
    <%= disponible ? "✔ Disponible" : "✖ No Disponible" %>
  </span>

  <img src="<%= imagen %>" alt="Foto de <%= nombre %>" class="auto-img" />

  <div class="datos-auto">
    <div>
      <ion-icon name="car-sport-outline"></ion-icon><br>
      <%= transmision %>
    </div>
    <div>
      <ion-icon name="color-fill-outline"></ion-icon></br>
      <%= combustible %>
    </div>
    <div>
      <ion-icon name="snow-outline"></ion-icon><br>
      <%= aire==1?"A/C":"Sin A/C" %>
    </div>
    <div>
      <ion-icon name="briefcase-outline"></ion-icon><br>
      <%= espacio %>
    </div>
    <div>
      <ion-icon name="person-outline"></ion-icon><br>
      <%= pasajeros %> pax
    </div>
    <div>
      <ion-icon name="car-outline"></ion-icon><br>
      <%= puertas %> puertas
    </div>
  </div>

  <div class="precio">
    💲 <%= precio %> <span style="font-size:12px;">por día</span>
  </div>

  <form class="Admin-form" action="AdminCarro.jsp" method="get">
    <input type="hidden" name="id" value="<%= id %>">
    <button type="submit" class="boton-reserva">Editar</button>
  </form>
</div>

<%
}
rs.close();
st.close();
conn.close();
%>
</div>
</main>

<footer>
<div class="footer-columns">
<div>
<h4 class="subtitulo">CONTACTO</h4>
<p class="texto">Reservaciones: (507)203-8472</p>
<p class="texto">Asistencia 24H: (507)204-9550</p>
</div>
<div>
<h4 class="subtitulo">SERVICIOS</h4>
<p class="texto">Rentas</p>
<p class="texto">Coberturas</p>
</div>
<div>
<h4 class="subtitulo">SOPORTE</h4>
<p class="texto">Términos de uso</p>
<p class="texto">Requisitos para alquilar</p>
</div>
<div>
<h4 class="subtitulo">SÍGUENOS</h4>
<p class="texto">📷 Instagram</p>
</div>
</div>
<p class="texto-guia">&copy; 2025-Vrom</p>
</footer>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</body>
</html>
