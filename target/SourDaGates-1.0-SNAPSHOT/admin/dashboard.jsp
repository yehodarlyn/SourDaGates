<%-- 
    Document   : dashboard
    Created on : 19 mar 2026, 11:34:51 p.m.
    Author     : jonyco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SDG Admin — Panel de Control</title>
        <link rel="stylesheet" href="../assets/css/styles.css">
    </head>
    <body>

        <div class="site-wrapper">
            <aside class="sidebar">
                <div class="sidebar__logo-wrap">
                    <div class="sidebar__logo">SDG</div>
                    <div class="sidebar__sub">Admin Panel</div>
                </div>
                <p class="sidebar__section-label">Navegacion</p>
                <ul class="sidebar__nav">
                    <li><a href="dashboard.jsp" class="active">Dashboard</a></li>
                    <li><a href="../ProductoServlet?accion=listar">Productos</a></li>
                    <li><a href="gestionar_pedidos.jsp">Pedidos</a></li>
                    <li><a href="../ResenaServlet?accion=listar">Reseñas</a></li>
                </ul>
            </aside>

            <header class="topbar">
                <div class="topbar__brand">SourDaGates <span>Control</span></div>
                <div class="topbar__actions">
                    <span style="color: var(--gray-text); margin-right: 15px;">Admin: ${sessionScope.usuarioLogueado.nombre}</span>
                    <a href="../LogoutServlet" class="btn-logout-small" style="text-decoration: none; color: var(--error);">[Cerrar Sesion]</a>
                </div>
            </header>

            <main style="padding: 40px;">
                <div class="anim-fade-up">
                    <h1 class="page-title">Bienvenido, <span>${sessionScope.usuarioLogueado.nombre}</span></h1>
                    <p style="color: var(--gray-text);">ID de Estudiante: 00000251632</p>
                </div>

                <section class="grid-layout" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-top: 40px;">

                    <div class="card text-center" style="padding: 30px; border: 1px solid var(--black-border); background: var(--card-bg);">
                        <h2 style="color: var(--neon); font-size: 2rem;">📦</h2>
                        <h3 style="margin-top: 10px;">Catalogo</h3>
                        <p style="font-size: 0.8rem; color: var(--gray-text); margin-bottom: 20px;">Gestiona prendas, stock y precios</p>
                        <a href="../ProductoServlet?accion=listar" class="btn btn-primary btn--full" style="text-decoration: none; font-size: 0.8rem;">GESTIONAR</a>
                    </div>

                    <div class="card text-center" style="padding: 30px; border: 1px solid var(--black-border); background: var(--card-bg);">
                        <h2 style="color: var(--neon); font-size: 2rem;">🛒</h2>
                        <h3 style="margin-top: 10px;">Pedidos</h3>
                        <p style="font-size: 0.8rem; color: var(--gray-text); margin-bottom: 20px;">Actualiza estados de envio y entrega</p>
                        <a href="gestionar_pedidos.jsp" class="btn btn-primary btn--full" style="text-decoration: none; font-size: 0.8rem;">VER ORDENES</a>
                    </div>

                    <div class="card text-center" style="padding: 30px; border: 1px solid var(--black-border); background: var(--card-bg);">
                        <h2 style="color: var(--neon); font-size: 2rem;">⭐</h2>
                        <h3 style="margin-top: 10px;">Reseñas</h3>
                        <p style="font-size: 0.8rem; color: var(--gray-text); margin-bottom: 20px;">Modera comentarios de los clientes</p>
                        <a href="../ResenaServlet?accion=listar" class="btn btn-primary btn--full" style="text-decoration: none; font-size: 0.8rem;">MODERAR</a>
                    </div>

                </section>

                <footer style="margin-top: 60px; padding-top: 20px; border-top: 1px solid var(--black-border); font-size: 0.7rem; color: var(--gray-mid);">
                    SERVIDOR: Apache Tomcat // BASE DE DATOS: MySQL 8.0 // ROL: ADMINISTRADOR
                </footer>
            </main>
        </div>

    </body>
</html>