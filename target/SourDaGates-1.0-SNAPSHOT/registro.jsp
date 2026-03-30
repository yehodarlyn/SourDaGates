<%-- 
    Document   : registro
    Created on : 19 mar 2026, 10:25:12 p.m.
    Author     : jonyco
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SourDaGates — Crear Cuenta</title>
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>
    <body>

        <div class="auth-container">
            <section class="auth-card">
                <header class="text-center" style="margin-bottom: 30px;">
                    <h1 style="color: var(--neon); letter-spacing: 3px;">REGISTRO_SDG</h1>
                    <p style="color: var(--gray-text); font-size: 0.7rem;">INGRESA TUS DATOS PARA CONTINUAR</p>
                </header>

                <%-- Mensaje de Error enviado por el Servlet --%>
                <c:if test="${not empty error}">
                    <div class="alert alert-error">
                        ${error}
                    </div>
                </c:if>

                <form action="RegistroServlet" method="POST">
                    <div class="form-group">
                        <label class="form-label">Nombre Completo</label>
                        <input type="text" name="nombre" class="form-input" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Correo Electronico</label>
                        <input type="email" name="email" class="form-input" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Contraseña</label>
                        <input type="password" name="password" class="form-input" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Teléfono (Opcional)</label>
                        <input type="text" name="telefono" class="form-input">
                    </div>

                    <button type="submit" class="btn btn-primary btn--full">CREAR CUENTA</button>
                </form>

                <footer class="text-center" style="margin-top: 20px; font-size: 0.8rem;">
                    <span style="color: var(--gray-text);">¿Ya tienes cuenta?</span> 
                    <a href="login.jsp" style="color: var(--neon); text-decoration: none;"> Inicia Sesion</a>
                </footer>
            </section>
        </div>

    </body>
</html>