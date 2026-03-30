<%-- 
    Document   : login
    Created on : 19 mar 2026, 10:25:04 p.m.
    Author     : jonyco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SourDaGates — Acceso al Sistema</title>
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>
    <body>

        <div class="auth-container">
            <section class="auth-card anim-fade-up">

                <header class="text-center" style="margin-bottom: 30px;">
                    <h1 style="color: var(--neon); letter-spacing: 3px; font-size: 1.5rem;">ACCESO_SISTEMA</h1>
                    <p style="color: var(--gray-text); font-size: 0.7rem;">INGRESA TUS CREDENCIALES DE @SOURDAGATES</p>
                </header>

                <%-- AJUSTE: Mensaje de exito tras registro (viene por URL) --%>
                <c:if test="${param.msg == 'success'}">
                    <div class="alert" style="background: rgba(0, 255, 204, 0.1); color: var(--neon); border: 1px solid var(--neon); margin-bottom: 20px; text-align: center; font-size: 0.8rem;">
                        ¡CUENTA CREADA! YA PUEDES INICIAR SESIÓN.
                    </div>
                </c:if>

                <%-- Mensaje de ErrorEnviado por el LoginServlet --%>
                <c:if test="${not empty error}">
                    <div class="alert alert-error text-center">
                        ${error}
                    </div>
                </c:if>

                <form action="LoginServlet" method="POST">
                    <div class="form-group">
                        <label class="form-label">Correo Electronico</label>
                        <input type="email" name="email" class="form-input" placeholder="admin@sourdagates.com" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Contraseña</label>
                        <input type="password" name="password" class="form-input" placeholder="••••••••" required>
                    </div>

                    <div style="margin-top: 30px;">
                        <button type="submit" class="btn btn-primary btn--full">ENTRAR AL PANEL</button>
                    </div>
                </form>

                <footer class="text-center" style="margin-top: 25px; font-size: 0.8rem;">
                    <span style="color: var(--gray-text);">¿No tienes cuenta?</span> 
                    <a href="registro.jsp" style="color: var(--neon); text-decoration: none; font-weight: bold;"> Registrate aqui</a>
                    <br><br>
                    <a href="index.jsp" style="color: var(--gray-mid); text-decoration: none; font-size: 0.7rem;">← Volver a la tienda</a>
                </footer>
            </section>
        </div>

        <p style="position: fixed; bottom: 20px; width: 100%; text-align: center; color: #222; font-size: 0.65rem; letter-spacing: 1px;">
            SDG_SECURE_AUTH // JONATHAN ROMERO OROZCO // ID: 00000251632
        </p>

    </body>
</html>