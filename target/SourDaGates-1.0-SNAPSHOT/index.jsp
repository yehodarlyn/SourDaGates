<%-- 
    Document   : index
    Created on : 19 mar 2026, 10:24:39 p.m.
    Author     : jonyco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SourDaGates — Cyber Streetwear</title>
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>
    <body class="store-front">

        <nav class="navbar">
            <div class="navbar__logo">SDG <span>_Gate</span></div>
            <ul class="navbar__links">
                <li><a href="index.jsp" class="active">Colección</a></li>
                <li><a href="login.jsp">Admin</a></li>
            </ul>
            <div class="navbar__user">
                <c:choose>
                    <c:when test="${not empty sessionScope.usuarioLogueado}">
                        <span class="user-tag">${sessionScope.usuarioLogueado.nombre}</span>
                        <a href="LogoutServlet" class="btn-logout-small">Salir</a>
                    </c:when>
                    <c:otherwise>
                        <a href="login.jsp" class="btn-login-nav">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>

        <header class="hero">
            <div class="hero__content anim-fade-up">
                <h1 class="hero__title">DROP_03 <br><span>CYBERPUNK_SERIES</span></h1>
                <p class="hero__subtitle">Explora la nueva coleccion de streetwear diseñada para el asfalto</p>
            </div>
        </header>

        <main class="container mt-lg">
            <h2 class="section-title">TODAS_LAS_<span>PRENDAS</span></h2>

            <div class="product-grid">
                <%-- Iteramos sobre la lista de productos que enviara el Servlet --%>
                <c:forEach var="p" items="${listaProductos}">
                    <article class="product-card">
                        <div class="product-card__image">
                            
                            <img src="assets/images/${p.imagenUrl}" alt="${p.nombre}">
                        </div>
                        <div class="product-card__info">
                            <p class="product-card__category">Streetwear / Limited</p>
                            <h3 class="product-card__name">${p.nombre}</h3>
                            <p class="product-card__price">$${p.precio}</p>
                            <p class="product-card__stock">Disponibles: ${p.stock}</p>
                            <button class="btn btn-primary btn--full mt-sm">AÑADIR AL CARRO</button>
                        </div>
                    </article>
                </c:forEach>

                <%-- Mensaje por si la base de datos esta vacia --%>
                <c:if test="${empty listaProductos}">
                    <div style="grid-column: 1/-1; text-align: center; padding: 50px;">
                        <p style="color: var(--gray-mid);">Cargando inventario desde MySQL...</p>
                        <p style="font-size: 0.8rem; margin-top: 10px;">(Asegúrate de haber corrido el ProductoServlet)</p>
                    </div>
                </c:if>
            </div>
        </main>

        <footer class="site-footer mt-xl">
            <div class="container">
                <p>© 2026 SourDaGates System — Jonathan Romero Orozco</p>
                <p style="font-size: 0.7rem; color: #444; margin-top: 5px;">ID: 00000251632 | ITSON Ingenieria de Software</p>
            </div>
        </footer>

    </body>
</html>