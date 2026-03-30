<%-- 
    Document   : gestionar_resenas
    Created on : 19 mar 2026, 11:17:59 p.m.
    Author     : jonyco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SDG Admin — Moderacion de Reseñas</title>
        <link rel="stylesheet" href="../assets/css/styles.css">
    </head>
    <body>

        <div class="site-wrapper">
            <aside class="sidebar">
                <div class="sidebar__logo-wrap">
                    <div class="sidebar__logo">SDG</div>
                    <div class="sidebar__sub">Admin Panel</div>
                </div>
                <p class="sidebar__section-label">Mantenimiento</p>
                <ul class="sidebar__nav">
                    <li><a href="dashboard.jsp">Dashboard</a></li>
                    <li><a href="../ProductoServlet?accion=listar">Productos</a></li>
                    <li><a href="gestionar_pedidos.jsp">Pedidos</a></li>
                    <li><a href="../ResenaServlet?accion=listar" class="active">Reseñas</a></li>
                    <li><a href="../index.jsp">Ver Tienda</a></li>
                </ul>
            </aside>

            <header class="topbar">
                <div class="topbar__brand">SourDaGates <span>Control</span></div>
                <div class="topbar__actions">
                    <span style="color: var(--gray-mid); margin-right: 15px;">Admin: Jonathan Romero</span>
                    <a href="../LogoutServlet" class="topbar__btn topbar__btn--logout" style="text-decoration: none;">Salir</a>
                </div>
            </header>

            <main>
                <div class="anim-fade-up">
                    <h1 class="page-title">Moderación de <span>Reseñas</span></h1>
                    <p style="color: var(--gray-text);">Gestiona los comentarios y calificaciones de los usuarios sobre las prendas</p>
                </div>

                <section class="mt-lg">
                    <div class="card">
                        <table class="form-card__table" style="width: 100%; border-collapse: collapse; color: var(--white);">
                            <thead>
                                <tr style="border-bottom: 2px solid var(--black-border); text-align: left;">
                                    <th style="padding: 10px;">Usuario</th>
                                    <th style="padding: 10px;">Producto</th>
                                    <th style="padding: 10px;">Calificación</th>
                                    <th style="padding: 10px;">Comentario</th>
                                    <th style="padding: 10px;">Fecha</th>
                                    <th style="padding: 10px;">Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="res" items="${listaResenas}">
                                    <tr style="border-bottom: 1px solid var(--black-border);">
                                        <td style="padding: 15px; color: var(--neon);">@${res.nombreUsuario}</td>
                                        <td style="padding: 15px;">${res.nombreProducto}</td>
                                        <td style="padding: 15px; color: #FFD700;">
                                            <c:forEach begin="1" end="${res.calificacion}">★</c:forEach>
                                            </td>
                                            <td style="padding: 15px; font-size: 0.9rem; color: var(--gray-text);">
                                                "${res.comentario}"
                                        </td>
                                        <td style="padding: 15px; font-size: 0.8rem; color: var(--gray-mid);">
                                            ${res.fecha}
                                        </td>
                                        <td style="padding: 15px;">
                                            <a href="../ResenaServlet?accion=eliminar&id=${res.id}" 
                                               onclick="return confirm('¿Eliminar esta reseña definitivamente?')"
                                               style="color: #ff3b3b; text-decoration: none; font-size: 0.8rem; font-weight: bold;">
                                                [Eliminar]
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty listaResenas}">
                                    <tr>
                                        <td colspan="6" style="padding: 30px; text-align: center; color: var(--gray-mid);">
                                            No hay reseñas pendientes de moderacion
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </section>
            </main>

            <footer class="site-footer">
                ID Estudiante: 00000251632 
            </footer>
        </div>

    </body>
</html>