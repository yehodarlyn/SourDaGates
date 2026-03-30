/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package com.mycompany.sourdagates.filtros;

import com.mycompany.sourdagates.modelos.entidades.Usuario;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author jonyco
 */
//este filtro protege todo lo que este dentro de la carpeta admin/
@WebFilter(filterName = "AdminFilter", urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        //verifica si hay un usuario en sesion y si es administrador
        Usuario usuario = (session != null) ? (Usuario) session.getAttribute("usuarioLogueado") : null;

        if (usuario != null && "admin".equals(usuario.getRol())) {
            //si es admin lo deja pasar al siguiente recurso
            chain.doFilter(request, response);
        } else {
            //si no esta logueado o no es admin lo manda al login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        }
    }
}
