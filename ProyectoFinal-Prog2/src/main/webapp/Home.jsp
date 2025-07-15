<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Alquiler de Autos - Home</title>
  <link rel="stylesheet" href="css/styles.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }

    body {
      background-color: #f7f7f7;
      color: #111;
    }

    header {
      background-color: #fff;
      border-bottom: 1px solid #ccc;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 10px 20px;
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 1000;
    }

    .logo img {
      height: 40px;
    }

    .navbar ul {
      display: flex;
      list-style: none;
      gap: 20px;
    }

    .navbar ul li a,
    .navbar ul li p {
      text-decoration: none;
      color: #111;
      font-size: 14px;
    }

    .header-right ion-icon {
      font-size: 20px;
    }

    main {
      margin-top: 80px;
      margin-bottom: 60px;
    }

    .noticias {
      background-color: #fff;
      max-width: 1100px;
      margin: auto;
      padding: 40px 20px;
      display: flex;
      flex-direction: column;
      gap: 40px;
    }

    .noticia {
      display: flex;
      gap: 20px;
      border-bottom: 1px solid #ddd;
      padding-bottom: 20px;
    }

    .noticia .texto {
      flex: 1;
    }

    .noticia h3 {
      font-size: 1.4em;
      margin-bottom: 10px;
    }

    .noticia p {
      font-size: 1em;
      margin-bottom: 10px;
    }

    .noticia a {
      color: #0066cc;
      text-decoration: none;
      font-weight: bold;
    }

    .noticia img,
    .noticia iframe {
      width: 300px;
      height: 210px;
      border-radius: 5px;
      object-fit: cover;
    }

    footer {
      background-color: #333;
      color: #fff;
      font-size: 13px;
      padding: 15px 10px;
    }

    .footer-columns {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      gap: 10px;
    }

    .footer-columns div {
      flex: 1;
      min-width: 150px;
      margin: 5px;
    }

    .footer-columns h4 {
      font-size: 14px;
      margin-bottom: 5px;
    }

    .footer-columns p {
      font-size: 12.5px;
      margin: 3px 0;
    }

    .texto-guia {
      text-align: center;
      font-size: 12px;
      margin-top: 10px;
    }

    @media (max-width: 768px) {
      .noticia {
        flex-direction: column;
      }

      .noticia img,
      .noticia iframe {
        width: 100%;
        height: auto;
      }

      .footer-columns {
        flex-direction: column;
        align-items: center;
      }
    }
  </style>
</head>
<body>
  <header class="header">
    <div class="logo">
      <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Car_rental_logo.svg/512px-Car_rental_logo.svg.png" alt="Logo">
    </div>
    <nav class="navbar">
      <ul>
        <li><p>EN</p><ion-icon name="globe"></ion-icon></li>
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
    <section class="noticias">
      <h2 class="titulo">Noticias Relevantes</h2>

      <article class="noticia">
        <div class="texto">
          <h3>🚔 Más de mil sanciones en 24 horas por infracciones de tránsito</h3>
          <p>Panamá / En las últimas 24 horas, la Dirección Nacional de Operaciones del Tránsito (DNOT) reportó 1,904 infracciones al reglamento, siendo el exceso de velocidad la más común entre los conductores.</p>
          <a href="https://www.tvn-2.com/nacionales/accidente-transito-mil-sanciones-atropellos-colon_1_2197881.html" target="_blank">Leer artículo</a>
        </div>
        <img src="https://cdn.pixabay.com/photo/2019/11/24/10/29/police-4649780_1280.jpg" alt="Agente de tránsito sancionando">
      </article>

      <article class="noticia">
        <div class="texto">
          <h3>⚠️ Policía alerta sobre aumento de estafas en compra de autos por internet</h3>
          <p>Panamá / La Policía Nacional reporta un incremento de fraudes en compras de vehículos en línea: estafadores piden adelantos y luego desaparecen, sin entregar el vehículo ni devolver el dinero.</p>
          <a href="https://www.telemetro.com/nacionales/policia-nacional-reporta-aumento-estafas-la-compra-autos-internet-n6033639" target="_blank">Leer artículo</a>
        </div>
        <img src="https://cdn.pixabay.com/photo/2020/06/24/11/27/police-5331528_1280.jpg" alt="Estafas por internet en autos">
      </article>

      <article class="noticia">
        <div class="texto">
          <h3>🚗 ALQUILER DE AUTOS EN PANAMÁ – ¡Muy Barato en el Aeropuerto!</h3>
          <p>Descubre cómo alquilar un auto barato en el aeropuerto de Panamá, con consejos para economizar, tipos de seguros, empresas recomendadas y todo lo que necesitas saber antes de reservar.</p>
          <a href="https://www.youtube.com/watch?v=fQkpeNuRyjo" target="_blank">Ver video</a>
        </div>
        <iframe src="https://www.youtube.com/embed/fQkpeNuRyjo" frameborder="0" allowfullscreen></iframe>
      </article>
    </section>
  </main>

  <footer>
    <div class="footer-columns">
      <div>
        <h4>CONTACTO</h4>
        <p>Reservaciones: (507)203-8472</p>
        <p>Asistencia 24H: (507)204-9550</p>
      </div>
      <div>
        <h4>SERVICIOS</h4>
        <p>Rentas</p>
        <p>Coberturas</p>
      </div>
      <div>
        <h4>SOPORTE</h4>
        <p>Términos de uso</p>
        <p>Requisitos para alquilar</p>
      </div>
      <div>
        <h4>SÍGUENOS</h4>
        <p>📷 Instagram</p>
      </div>
    </div>
    <p class="texto-guia">&copy; 2025-Vrom</p>
  </footer>

  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>

