<%-- 
    Document   : gestionar_productos
    Created on : 19 mar 2026, 10:28:58 p.m.
    Author     : jonyco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SDG Admin — Gestion de Catalogo</title>
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
                    <li><a href="../ProductoServlet?accion=listar" class="active">Productos</a></li>
                    <li><a href="gestionar_pedidos.jsp">Pedidos</a></li>
                    <li><a href="../ResenaServlet?accion=listar">Reseñas</a></li>
                    <li><a href="../index.jsp">Ver Tienda</a></li>
                </ul>
            </aside>

            <header class="topbar">
                <div class="topbar__brand">SourDaGates <span>Control</span></div>
                <div class="topbar__actions">
                    <span style="color: var(--gray-mid); margin-right: 15px;">ID: 00000251632</span>
                    <a href="../LogoutServlet" class="topbar__btn topbar__btn--logout" style="text-decoration: none;">Salir</a>
                </div>
            </header>

            <main>
                <div class="anim-fade-up">
                    <h1 class="page-title">Gestian de <span>Catalogo</span></h1>
                    <p style="color: var(--gray-text);">Administra las prendas, precios y existencias del inventario real en MySQL</p>
                </div>

                <section class="grid-layout" style="display: grid; grid-template-columns: 1.5fr 1fr; gap: 30px; margin-top: 30px;">

                    <div class="card">
                        <h3 class="section-title" style="font-size: 1.2rem; margin-bottom: 20px;">Inventario <span>Actual</span></h3>
                        <table class="form-card__table" style="width: 100%; border-collapse: collapse; color: var(--white);">
                            <thead>
                                <tr style="border-bottom: 2px solid var(--black-border); text-align: left;">
                                    <th style="padding: 10px;">ID</th>
                                    <th style="padding: 10px;">Prenda</th>
                                    <th style="padding: 10px;">Precio</th>
                                    <th style="padding: 10px;">Stock</th>
                                    <th style="padding: 10px;">Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="prod" items="${listaProductos}">
                                    <tr style="border-bottom: 1px solid var(--black-border);">
                                        <td style="padding: 15px;">${prod.id}</td>
                                        <td style="padding: 15px; font-weight: bold;">${prod.nombre}</td>
                                        <td style="padding: 15px; color: var(--neon);">$${prod.precio}</td>
                                        <td style="padding: 15px;">${prod.stock} u.</td>
                                        <td style="padding: 15px;">
                                            <a href="../ProductoServlet?accion=eliminar&id=${prod.id}" 
                                               onclick="return confirm('¿Seguro que deseas eliminar esta prenda?')"
                                               style="color: #ff3b3b; text-decoration: none; font-size: 0.8rem;">[Eliminar]</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty listaProductos}">
                                    <tr>
                                        <td colspan="5" style="padding: 20px; text-align: center; color: var(--gray-mid);">
                                            No hay productos registrados. Usa el formulario para agregar uno
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>

                    <div class="form-card">
                        <h3 class="form-card__title">Agregar Nueva <span>Prenda</span></h3>
                        <form action="../ProductoServlet" method="POST" class="mt-sm">
                            <div class="form-group">
                                <label class="form-label">Nombre del Producto</label>
                                <input type="text" name="nombre" class="form-input" placeholder="Ej: Sudadera Noir" required>
                            </div>

                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                                <div class="form-group">
                                    <label class="form-label">Precio (USD)</label>
                                    <input type="number" step="0.01" name="precio" class="form-input" placeholder="0.00" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Stock</label>
                                    <input type="number" name="stock" class="form-input" placeholder="0" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Descripcion Tecnica</label>
                                <textarea name="descripcion" class="form-input" rows="3" placeholder="Detalles de tela, corte..."></textarea>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Imagen (assets/images/)</label>
                                <input type="text" name="imagen" class="form-input" placeholder="archivo.jpg">
                            </div>

                            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 10px;">
                                GUARDAR EN BASE DE DATOS
                            </button>
                        </form>
                    </div>

                </section>
            </main>

            <footer class="site-footer">
                Desarrollado por <strong>Jonathan Romero Orozco</strong> — Aplicaciones Web ITSON
            </footer>
        </div>

    </body>
</html>