<%-- 
    Document   : gestionar_pedidos
    Created on : 19 mar 2026, 10:29:08 p.m.
    Author     : jonyco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SDG Admin — Gestion de Pedidos</title>
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
                    <li><a href="gestionar_pedidos.jsp" class="active">Pedidos</a></li>
                    <li><a href="../ResenaServlet?accion=listar">Reseñas</a></li>
                    <li><a href="../index.jsp">Ver Tienda</a></li>
                </ul>
            </aside>

            <header class="topbar">
                <div class="topbar__brand">SourDaGates <span>Orders</span></div>
                <div class="topbar__actions">
                    <span style="color: var(--gray-text); margin-right: 15px;">Admin: ${sessionScope.usuarioLogueado.nombre}</span>
                    <a href="../LogoutServlet" class="topbar__btn topbar__btn--logout" style="text-decoration: none;">Salir</a>
                </div>
            </header>

            <main>
                <div class="anim-fade-up">
                    <h1 class="page-title">Gestion de <span>Pedidos</span></h1>
                    <p style="color: var(--gray-text);">Control de logistica y estados de envio para clientes de SourDaGates</p>
                </div>

                <section class="mt-lg">
                    <div class="card">
                        <table class="form-card__table" style="width: 100%; border-collapse: collapse; color: var(--white);">
                            <thead>
                                <tr style="border-bottom: 2px solid var(--black-border); text-align: left;">
                                    <th style="padding: 10px;">Orden #</th>
                                    <th style="padding: 10px;">Fecha</th>
                                    <th style="padding: 10px;">Total</th>
                                    <th style="padding: 10px;">Estado Actual</th>
                                    <th style="padding: 10px;">Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Aqui se listaran los pedidos desde el PedidoDAO --%>
                                <c:forEach var="ped" items="${listaPedidos}">
                                    <tr style="border-bottom: 1px solid var(--black-border);">
                                        <td style="padding: 15px;">SDG-00${ped.id}</td>
                                        <td style="padding: 15px;">${ped.fecha}</td>
                                        <td style="padding: 15px; color: var(--neon); font-weight: bold;">$${ped.total}</td>
                                        <td style="padding: 15px;">
                                            <span class="status-badge" style="padding: 4px 8px; border-radius: 4px; font-size: 0.7rem; background: rgba(0,255,204,0.1); color: var(--neon);">
                                                ${ped.estado}
                                            </span>
                                        </td>
                                        <td style="padding: 15px;">
                                            <%-- Formulario rapido para cambiar estado --%>
                                            <form action="../PedidoServlet" method="POST" style="display: flex; gap: 5px;">
                                                <input type="hidden" name="idPedido" value="${ped.id}">
                                                <select name="nuevoEstado" class="form-input" style="padding: 5px; font-size: 0.7rem; width: auto;">
                                                    <option value="PENDIENTE">PENDIENTE</option>
                                                    <option value="ENVIADO">ENVIADO</option>
                                                    <option value="ENTREGADO">ENTREGADO</option>
                                                    <option value="CANCELADO">CANCELADO</option>
                                                </select>
                                                <button type="submit" class="btn btn-primary" style="padding: 5px 10px; font-size: 0.6rem;">ACTUALIZAR</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <%-- Mensaje si no hay pedidos --%>
                                <c:if test="${empty listaPedidos}">
                                    <tr>
                                        <td colspan="5" style="padding: 40px; text-align: center; color: var(--gray-mid);">
                                            No hay órdenes registradas en el sistema todavía.
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </section>
            </main>

            <footer class="site-footer">
                Jonathan Romero Orozco — Gestion de Ventas 
            </footer>
        </div>

    </body>
</html>