<!-- <%@ page contentType="text/html; charset=UTF-8" language="java" %> --> <!-- Hay que volver a activar esta línea si se usa JSP -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>Flota</title>
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="logo.png" alt="Logo" height="40">
        </div>
        <nav class="navbar">
            <ul>
                <li><p>EN</p>
                    <ion-icon name="globe"></ion-icon></li>
                <li><a href="FlotaAdmin.jsp#">Flota</a></li>
            </ul>
        </nav>
        <div class="header-right">
            <ion-icon name="person"></ion-icon>
        </div>
    </header>
    
    
    <main>
    <h2 class="titulo-boton">Empieza tu reserva aquí</h2>

    <%
      // JDBC: cargar driver, conectar y consultar
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3307/alquiler", "root", "");
      Statement st = conn.createStatement();
      ResultSet rs = st.executeQuery(
        "SELECT id, modelo, espacio, pasajeros, puertas, transmision, combustible, precio, imagen, disponible FROM autos");
    %>

    <div class="main-container">
    <%
      while (rs.next()) {
        int    id          = rs.getInt("id");
        String modelo      = rs.getString("modelo");
        String espacio     = rs.getString("espacio");
        int    pasajeros   = rs.getInt("pasajeros");
        int    puertas     = rs.getInt("puertas");
        String transmision = rs.getString("transmision");
        String combustible = rs.getString("combustible");
        double precio      = rs.getDouble("precio");
        String imgSrc      = rs.getString("imagen");
        boolean dispo      = rs.getBoolean("disponible");
    %>
      <div class="Auto">
        <h3 class="subtitulo-auto"><%= modelo %></h3>
        <span class="status <%= dispo ? "available" : "unavailable" %>">
          <%= dispo ? "Disponible" : "No Disponible" %>
        </span>

        <img src="imagenes/<%= imgSrc %>" alt="Foto de <%= modelo %>" class="auto-img" />
        <div class="datos-auto">
          <div class="espacio">
            <ion-icon name="briefcase-outline" size="large"></ion-icon><br>
            <%= espacio %>
          </div>
          <div class="pasajeros">
            <ion-icon name="person-outline"></ion-icon><br>
            <%= pasajeros %>
          </div>
          <div class="puertas">
            <ion-icon name="car-sport-outline"></ion-icon><br>
            <%= puertas %>
          </div>
          <div class="transmision">
            <ion-icon name="settings-outline"></ion-icon><br>
            <%= transmision %>
          </div>
          <div class="combustible">
            <ion-icon name="medkit-outline"></ion-icon><br>
            <%= combustible %>
          </div>
          <div class="aire">
            <ion-icon name="snow-outline"></ion-icon><br>
            A/C
          </div>
        </div>

        <form class="reserva-form" action="reserva.jsp" method="get">
          <input type="hidden" name="idAuto" value="<%= id %>">
          <button type="submit" class="boton-reserva">Reservar</button>
        </form>
      </div>
    <%
      }  // while
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
