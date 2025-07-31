<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/styles.css">
<title>Editar Auto</title>
</head>
<body>

<header class="header">
<div class="logo">
<a href="Home.jsp"><img src="imagenes/Logo.png" alt="Logo" height="40"></a>
</div>
<nav class="navbar">
<ul>
<li><p>EN</p><ion-icon name="globe"></ion-icon></li>
<li><a href="AdminPanel.jsp">Administrar Flota</a></li>
<li><a href="AgregarCarro.jsp">Agregar Carro</a></li>
</ul>
</nav>
 <div class="header-right">
      <a href="LoginAdmin.jsp"><ion-icon name="exit"></ion-icon></a>
</div>
</header>

<main>
<h2 class="titulo-boton">Editar Auto</h2>

<%
String idStr = request.getParameter("id");
if (idStr == null || idStr.isEmpty()) {
%>
<p>Error: ID no especificado.</p>
<a href="AdminPanel.jsp" class="boton-reserva">Volver</a>
<%
} else {
    int id = Integer.parseInt(idStr);
    String accion = request.getParameter("accion");

    if ("POST".equalsIgnoreCase(request.getMethod()) && (accion == null || !"eliminar".equals(accion))) {
        // Actualizar
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
            "UPDATE autos SET nombre=?, imagen=?, precio=?, transmision=?, combustible=?, aire_acondicionado=?, espacio=?, pasajeros=?, puertas=?, disponible=? WHERE id=?");

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
        ps.setInt(11, id);

        ps.executeUpdate();
        ps.close();
        conn.close();
%>
<p style="text-align:center; color:green;">✅ Auto actualizado correctamente.</p>
<a href="adminPanel.jsp" class="boton-reserva">Volver</a>
<%
    } else if ("eliminar".equals(accion)) {
        // Eliminar
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/AlquilerdeAutos?useSSL=false&serverTimezone=UTC", 
            "root", "");
        PreparedStatement ps = conn.prepareStatement("DELETE FROM autos WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
        conn.close();
%>
<p style="text-align:center; color:red;">🗑️ Auto eliminado correctamente.</p>
<a href="AdminPanel.jsp" class="boton-reserva">Volver</a>
<%
    } else {
        // Mostrar datos para editar
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/AlquilerdeAutos?useSSL=false&serverTimezone=UTC", 
            "root", "");
        PreparedStatement ps = conn.prepareStatement(
            "SELECT * FROM autos WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
%>

<form method="post" action="AdminCarro.jsp?id=<%=id%>" class="edit-form" style="max-width:600px; margin:0 auto; background:#fff; padding:20px; border-radius:8px; box-shadow:0 2px 5px rgba(0,0,0,0.1);">
  <label>Nombre: <input type="text" name="nombre" value="<%= rs.getString("nombre") %>"></label><br>

  <label>Imagen URL: <input type="text" name="imagen" value="<%= rs.getString("imagen") %>"></label><br>

  <label>Precio: <input type="number" step="0.01" name="precio" value="<%= rs.getDouble("precio") %>"></label><br>

  <label>Transmisión: <input type="text" name="transmision" value="<%= rs.getString("transmision") %>"></label><br>

  <label>Combustible: <input type="text" name="combustible" value="<%= rs.getString("combustible") %>"></label><br>

  <label>Aire Acondicionado: 
    <input type="checkbox" name="aire_acondicionado" <%= rs.getInt("aire_acondicionado")==1 ? "checked" : "" %>>
  </label><br>

  <label>Espacio: <input type="text" name="espacio" value="<%= rs.getString("espacio") %>"></label><br>

  <label>Pasajeros: <input type="number" name="pasajeros" value="<%= rs.getInt("pasajeros") %>"></label><br>

  <label>Puertas: <input type="number" name="puertas" value="<%= rs.getInt("puertas") %>"></label><br>

  <label>Disponible: 
    <input type="checkbox" name="disponible" value="1" <%= rs.getBoolean("disponible") ? "checked" : "" %>>
  </label><br><br>

  <button type="submit" class="boton-reserva">Guardar Cambios</button>
</form>

<form method="post" action="AdminCarro.jsp?id=<%=id%>&accion=eliminar" 
      onsubmit="return confirm('¿Estás seguro de que quieres eliminar este auto?');"
      style="max-width:600px; margin:10px auto; text-align:center;">
  <button type="submit" class="boton-reserva" style="background-color:#a51e1e;">Eliminar Auto</button>
</form>

<a href="AdminPanel.jsp" class="boton-reserva">Cancelar</a>

<%
        } else {
%>
<p>No se encontró un auto con el ID especificado.</p>
<a href="AdminPanel.jsp" class="boton-reserva">Volver</a>
<%
        }
        rs.close();
        ps.close();
        conn.close();
    }
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
