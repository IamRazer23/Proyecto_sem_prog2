<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String usuario = request.getParameter("usuario");
String contrasena = request.getParameter("contrasena");

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/AlquilerdeAutos?useSSL=false&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "";

    conn = DriverManager.getConnection(url, dbUser, dbPass);

    String sql = "SELECT nombre_completo FROM usuarios WHERE usuario = ? AND contrasena = ?";
    ps = conn.prepareStatement(sql);
    ps.setString(1, usuario);
    ps.setString(2, contrasena);
    rs = ps.executeQuery();

    if (rs.next()) {
        String nombreCompleto = rs.getString("nombre_completo");

        // Siempre redirigir a AdminPanel.jsp sin importar el usuario
        response.sendRedirect("AdminPanel.jsp");

    } else {
        out.println("<h2>Usuario o contraseña incorrectos.</h2>");
    }

} catch (Exception e) {
    out.println("<h2>Error: " + e.getMessage() + "</h2>");
    e.printStackTrace();
} finally {
    try { if (rs != null) rs.close(); } catch (Exception ex) {}
    try { if (ps != null) ps.close(); } catch (Exception ex) {}
    try { if (conn != null) conn.close(); } catch (Exception ex) {}
}
%>
