<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/styles.css">
<title>Agregar Auto</title>
</head>
<body>

<header class="header">
<div class="logo">
<a href="Home.jsp"><img src="logo.png" alt="Logo" height="40"></a>
</div>
<nav class="navbar">
<ul>
<li><p>EN</p><ion-icon name="globe"></ion-icon></li>
<li><a href="AdminPanel.jsp">Administrar Flota</a></li>
<li><a href="AgregarCarro.jsp">Agregar Carro</a></li>
</ul>
</nav>
<div class="header-right">
<ion-icon name="person"></ion-icon>
</div>
</header>

<main>
<h2 class="titulo-boton">Agregar Nuevo Auto</h2>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String nombre = request.getParameter("nombre");
    String imagen = request.getParameter("imagen");
    double precio = Double.parseDouble(request.getParameter("precio"));
    String transmision = request.getParameter("transmision");
    String combustible = request.getParameter("combustible");
    int aire = request.getParameter("aire_acondicionado") != null ? 1 : 0;
    String espacio = request.getParameter("espacio");
    int pasajeros = Integer.parseInt(request.getParameter("pasajeros"));
    int puertas = Integer.parseInt(request.getParameter("puertas"));
    boolean disponible = "1".equals(request.getParameter("disponible"));

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/AlquilerdeAutos?useSSL=false&serverTimezone=UTC", 
        "root", "");
    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO autos (nombre, imagen, precio, transmision, combustible, aire_acondicionado, espacio, pasajeros, puertas, disponible) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    ps.setString(1, nombre);
    ps.setString(2, imagen);
    ps.setDouble(3, precio);
    ps.setString(4, transmision);
    ps.setString(5, combustible);
    ps.setInt(6, aire);
    ps.setString(7, espacio);
    ps.setInt(8, pasajeros);
    ps.setInt(9, puertas);
    ps.setBoolean(10, disponible);

    int inserted = ps.executeUpdate();
    ps.close();
    conn.close();
%>
<p style="text-align:center; color:green;">✅ Auto agregado correctamente.</p>
<a href="adminPanel.jsp" class="boton-reserva">Volver</a>
<%
} else {
%>

<form method="post" action="AgregarCarro.jsp" class="edit-form" style="max-width:600px; margin:0 auto; background:#fff; padding:20px; border-radius:8px; box-shadow:0 2px 5px rgba(0,0,0,0.1);">
  <label>Nombre: <input type="text" name="nombre" required></label><br>

  <label>Imagen URL: <input type="text" name="imagen" required></label><br>

  <label>Precio: <input type="number" step="0.01" name="precio" required></label><br>

  <label>Transmisión: <input type="text" name="transmision" required></label><br>

  <label>Combustible: <input type="text" name="combustible" required></label><br>

  <label>Aire Acondicionado: 
    <input type="checkbox" name="aire_acondicionado">
  </label><br>

  <label>Espacio: <input type="text" name="espacio" required></label><br>

  <label>Pasajeros: <input type="number" name="pasajeros" required></label><br>

  <label>Puertas: <input type="number" name="puertas" required></label><br>

  <label>Disponible: 
    <input type="checkbox" name="disponible" value="1" checked>
  </label><br><br>

  <button type="submit" class="boton-reserva">Guardar</button>
  <a href="adminPanel.jsp" class="boton-reserva">Cancelar</a>
</form>

<%
}
%>

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
