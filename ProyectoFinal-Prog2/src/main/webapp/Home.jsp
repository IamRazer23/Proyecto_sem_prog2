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
      <img src="imagenes/logo.png" alt="Logo">
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
          <h3>🔋 Panamá impulsa movilidad sostenible</h3>
          <p>El gobierno panameño implementa estrategias para reducir el tráfico, incluyendo incentivos al uso de autos eléctricos y compartidos.</p>
          <a href="#">Leer artículo</a>
        </div>
        <img src="imagenes/movilidad.jpg" alt="Movilidad Sostenible">
      </article>

      <article class="noticia">
        <div class="texto">
          <h3>📈 Alquiler de autos en auge durante la temporada alta</h3>
          <p>Durante las vacaciones, el alquiler de autos en Panamá aumenta hasta un 26%, impulsado por el turismo nacional e internacional.</p>
          <a href="#">Leer más</a>
        </div>
        <img src="imagenes/alquiler.jpg" alt="Alquiler de Autos">
      </article>

      <article class="noticia">
        <div class="texto">
          <h3>🎥 Los mejores destinos para recorrer en auto por Panamá</h3>
          <p>Video con recomendaciones de rutas, tips y paisajes ideales para explorar el país en auto.</p>
          <a href="#">Ver en YouTube</a>
        </div>
        <iframe src="https://www.youtube.com/embed/x2TfMJ9uVAo" frameborder="0" allowfullscreen></iframe>
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


