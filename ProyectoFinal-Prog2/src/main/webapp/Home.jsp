<!-- <%@ page contentType="text/html; charset=UTF-8" language="java" %> --> <!-- Hay que volver a activar esta línea si se usa JSP -->
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Alquiler de Autos - Home</title>
<link rel="stylesheet" href="css/styles.css">
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
      <li><a href="Flota.jsp">Flota</a></li>
      <li><a href="#">Locaciones</a></li>
      <li><a href="#">Mis Reservas</a></li>
      <li><a href="#">Sobre Nosotros</a></li>
    </ul>
  </nav>
  <div class="header-right">
    <ion-icon name="person"></ion-icon>
  </div>
</header>

<main>
  <section class="hero-banner">
    <div class="banner-image">
      <!-- Imagen o background -->
    </div>
  </section>

  <section class="reserva">
    <h2 class="titulo">Haz Tu Reserva</h2>
    <form class="reserva-form">
      <div class="row">
        <div class="field">
          <label class="texto">Sucursal de retiro</label>
          <select><option>Selecciona</option></select>
        </div>
        <div class="field">
          <label class="texto">Sucursal de retorno</label>
          <select><option>Selecciona</option></select>
        </div>
      </div>

      <div class="row">
        <div class="field">
          <label class="texto">Fecha de retiro</label>
          <input type="date">
        </div>
        <div class="field">
          <label class="texto">Hora</label>
          <input type="time">
        </div>
        <div class="field">
          <label class="texto">Fecha de retorno</label>
          <input type="date">
        </div>
        <div class="field">
          <label class="texto">Hora</label>
          <input type="time">
        </div>
      </div>

      <button type="submit" class="atencion">Continuar</button>
      <p class="texto-guia">Todos los campos son obligatorios.</p>
    </form>
  </section>
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
