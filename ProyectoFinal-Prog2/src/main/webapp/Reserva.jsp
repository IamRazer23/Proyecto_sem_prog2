<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Reserva - Alquiler de Autos</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

<header class="header">
    <div class="logo">
        <img src="imagenes/Logo.png" alt="Logo" height="40">
    </div>
    <nav class="navbar">
        <ul>
            <li><a href="Flota.jsp">Flota</a></li>
            <li><a href="">Sobre Nosotros</a></li>
        </ul>
    </nav>
</header>

<main>

<div class="reserva-contenedor">
<%
// Capturar parámetro 'id' de la solicitud
String idParam = request.getParameter("id");
int id = 0;
double precio = 0.0;

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

if (idParam != null) {
    try {
        id = Integer.parseInt(idParam);

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/AlquilerdeAutos?useSSL=false&serverTimezone=UTC",
            "root", "");

        ps = conn.prepareStatement("SELECT * FROM autos WHERE id = ?");
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
            String nombre = rs.getString("nombre");
            String imagen = rs.getString("imagen");
            precio = rs.getDouble("precio");
            String transmision = rs.getString("transmision");
            String combustible = rs.getString("combustible");
            int aire_acondicionado = rs.getInt("aire_acondicionado");
%>

<!-- Sección izquierda: selección de coberturas y extras -->

<div class="reserva-izquierda">
<h3>Coberturas</h3>
<label><input type="radio" name="cobertura-radio" class="opcion-cobertura" data-precio="15" checked>
Protección Parcial (CDW) - $15/día</label>
<label><input type="radio" name="cobertura-radio" class="opcion-cobertura" data-precio="40">
Protección Completa - $40/día</label>
<label><input type="radio" name="cobertura-radio" class="opcion-cobertura" data-precio="0">
Sin protección - $0/día</label>

<h3>Extras</h3>
<label><input type="checkbox" class="opcion-extra" data-precio="0" checked>
Silla de Bebé - $0/día</label>
<label><input type="checkbox" class="opcion-extra" data-precio="5">
GPS - $5/día</label>
</div>


<!-- Sección derecha: resumen de reserva y formulario de envío -->
<div class="reserva-derecha">
    <h3>Retiro - Retorno</h3>
    <p>
        📅 <input type="date" name="fecha_inicio_input" id="fechaInicio" required>
        → <input type="date" name="fecha_fin_input" id="fechaFin" required>
    </p>
    <p>Días: <span id="diasReserva">1</span></p>
    <p>Sucursal1 → Sucursal2</p>

    <h3>Carro <%= nombre %> o similar</h3>

    <img src="<%= imagen %>" alt="Auto" style="max-width:200px;">

    <div class="datos-auto">
        <p>⚙️ <%= transmision %> &nbsp; ⛽ <%= combustible %> &nbsp; <%= (aire_acondicionado ==1)?"❄ A/C":"Sin A/C" %></p>
    </div>

    <h3>Detalles de la Reserva</h3>
    <p>Auto: <%= nombre %></p>

    <p>Cobertura: <span id="resumenCobertura"></span></p>

    <p>Extras: <span id="resumenExtras"></span></p>

    <p>Subtotal: $<span id="subtotal"></span></p>
    <p>ITBMS: $<span id="itbms"></span></p>
    <p><strong>Total: $<span id="total"></span></strong></p>

<!-- Formulario oculto para enviar datos al checkout -->
    <form action="Checkout.jsp" method="post" id="formReserva">
  <input type="hidden" name="id" value="<%= id %>">
  <input type="hidden" name="imagen" value="<%= imagen %>">
  <input type="hidden" name="subtotal" id="inputSubtotal">
  <input type="hidden" name="itbms" id="inputItbms">
  <input type="hidden" name="total" id="inputTotal">
  <input type="hidden" name="cobertura" id="inputCobertura">
  <input type="hidden" name="extras" id="inputExtras">
  <input type="hidden" name="fecha_inicio" id="inputFechaInicio">
  <input type="hidden" name="fecha_fin" id="inputFechaFin">
  <button type="submit">Continuar</button>
</form>

</div>

<!-- Script para calcular precios y actualizar la interfaz -->
<script>
document.addEventListener("DOMContentLoaded", () => {
  // Precio base diario desde el servidor
  const precioBase = <%= precio %>;
  const coberturas = document.querySelectorAll(".opcion-cobertura");
  const extras = document.querySelectorAll(".opcion-extra");

// Recalcula subtotal, ITBMS y total, y actualiza elementos
  function recalcular() {
    let dias = calcularDias();
    if (dias < 1) dias = 1;
    document.getElementById("diasReserva").textContent = dias;

    let subtotal = precioBase * dias;

    coberturas.forEach(c => { if (c.checked) subtotal += +c.dataset.precio * dias; });
    extras.forEach(e => { if (e.checked) subtotal += +e.dataset.precio * dias; });

    const itbms = +(subtotal * 0.07).toFixed(2);
    const total = +(subtotal + itbms).toFixed(2);

    document.getElementById("subtotal").textContent = subtotal.toFixed(2);
    document.getElementById("itbms").textContent = itbms.toFixed(2);
    document.getElementById("total").textContent = total.toFixed(2);

// Actualizar valores ocultos del formulario
    document.getElementById("inputSubtotal").value = subtotal.toFixed(2);
    document.getElementById("inputItbms").value = itbms.toFixed(2);
    document.getElementById("inputTotal").value = total.toFixed(2);

// Resumen de cobertura seleccionada
    const coberturaSel = [...coberturas].find(c => c.checked);
    document.getElementById("inputCobertura").value = coberturaSel?.parentNode.textContent.trim();
    document.getElementById("resumenCobertura").textContent = coberturaSel?.parentNode.textContent.trim();

 // Resumen de extras seleccionados
    const extrasSel = [...extras].filter(e => e.checked).map(e => e.parentNode.textContent.trim()).join(", ");
    document.getElementById("inputExtras").value = extrasSel;
    document.getElementById("resumenExtras").textContent = extrasSel;
  }

// Calcula la cantidad de días entre dos fechas
  function calcularDias() {
    const inicio = document.getElementById("fechaInicio").value;
    const fin = document.getElementById("fechaFin").value;

    if (!inicio || !fin) return 1;

    const dateInicio = new Date(inicio);
    const dateFin = new Date(fin);

    const diffTime = dateFin - dateInicio;
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;

    return diffDays > 0 ? diffDays : 1;
  }

// Listeners para cambios de fecha y opciones
  document.getElementById("fechaInicio").addEventListener("change", () => {
    document.getElementById("inputFechaInicio").value = document.getElementById("fechaInicio").value;
    recalcular();
  });
  document.getElementById("fechaFin").addEventListener("change", () => {
    document.getElementById("inputFechaFin").value = document.getElementById("fechaFin").value;
    recalcular();
  });

  [...coberturas, ...extras].forEach(e => e.addEventListener("change", recalcular));

 // Cálculo inicial
  recalcular();
});
</script>

<%
        } else {
%>
<p style="color:red;">Auto no encontrado.</p>
<%
        }
    } catch (Exception e) {
%>
<p style="color:red;">Error: <%= e.getMessage() %></p>
<%
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
} else {
%>
<p style="color:red;">No se especificó ningún auto.</p>
<%
}
%>
</div>
</main>

</body>
</html>
