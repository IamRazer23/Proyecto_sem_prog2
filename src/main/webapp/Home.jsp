<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Home - Alquiler de Autos</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

<header class="header">
  <div class="logo">
    <a href="Home.jsp"><img src="imagenes/Logo.png" alt="Logo" height="40"></a>
  </div>
  <nav class="navbar">
    <ul>
      <li><a href="Flota.jsp">Flota</a></li>
      <li><a href="SobreNosotros.html">Sobre Nosotros</a></li>
      <li><a href="https://www.google.com/"><ion-icon name="search-outline"></ion-icon></a></li>
      <li><a href="https://www.instagram.com/"><ion-icon name="logo-instagram"></ion-icon></a></li>
      <li><a href="https://x.com/?lang=es"><ion-icon name="logo-twitter"></ion-icon></a></li>
      <li><a href="https://www.tiktok.com/es-419/"><ion-icon name="logo-tiktok"></ion-icon></a></li>
    </ul>
  </nav>
  <div class="header-right">
            <a href="LoginAdmin.jsp"><ion-icon name="person"></ion-icon></a>
        </div>
</header>

<main>
  <section style="text-align:center; margin:20px;">
    <h1 class="titulo">Noticias y Actualidad</h1>
    <p class="texto">Mantente informado con las últimas noticias y videos relevantes para nuestra organización.</p>
  </section>

  <section class="noticias-contenedor" style="display:flex; flex-wrap:wrap; justify-content:center; gap:20px; padding:20px;">

    <div class="noticias-contenedor">

  <!-- Noticia 1 -->
  <div class="noticia">
    <h3>Informe de análisis del tamaño, la participación y las tendencias del mercado global de alquiler de vehículos</h3>
    <p>El mercado mundial de alquiler de automóviles se valoró en 124.310 millones de dólares en 2024 y se espera que alcance los 347.230 millones de dólares en 2032.</p>
    <a href="https://www.databridgemarketresearch.com/es/reports/global-car-rental-market#:~:text=Tama%C3%B1o%20del%20mercado%20de%20alquiler%20de%20coches,que%20est%C3%A1n%20impulsando%20la%20expansi%C3%B3n%20del%20mercado. 	" target="_blank" class="btn">Leer más</a>
  </div>

  <!-- Noticia 2 -->
  <div class="noticia">
    <h3>Hertz ahora vende sus Tesla usados directamente a clientes de alquiler</h3>
    <p>Hertz, una de las mayores alquiladoras de coches del mundo, anunció en 2021 que compraría 100.000 Teslas; luego pisó el freno y dijo que compraría muchos menos de los que había planeado. </p>
    <a href="https://www.hibridosyelectricos.com/coches/alquiladora-hertz-no-quiere-alquilar-sus-tesla-en-su-lugar-toma-decision-inedita-empresa-su-tipo_77632_102.html" target="_blank" class="btn">Leer más</a>
  </div>

  <!-- Video -->
  <div class="noticia">
    <h3>Cómo funciona un negocio de alquiler de autos</h3>
    <p>Un video explicativo sobre los retos y oportunidades del negocio de rentas de autos alrededor del mundo.</p>
    <iframe src="https://www.youtube.com/embed/Fc2JaAaqIps?si=6R8X0w2OofKGx0vd" frameborder="0" allowfullscreen></iframe>
  </div>

</div>


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
