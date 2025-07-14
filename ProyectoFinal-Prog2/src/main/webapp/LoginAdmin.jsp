<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Alquiler de Autos - Iniciar Sesión</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

<section>
<div class="login-box">
   <form action="ProcesoLogin.jsp" method="post">
        <h2>Login</h2>
        <div class="input-box">
            <span class="icon">
                <ion-icon name="mail"></ion-icon>
            </span>
            <input type="text" name="usuario" required>
            <label>Usuario</label>
        </div>
        <div class="input-box">
        <span class="icon">
            <ion-icon name="lock-closed"></ion-icon>
        </span>
        <input type="password" name="contrasena" required>
        <label>Contraseña</label>
        </div>

        <button type="submit" name="accion" value="login">Login</button>

   </form>
</div>
</section>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
