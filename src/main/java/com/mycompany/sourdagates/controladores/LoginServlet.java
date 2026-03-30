/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sourdagates.controladores;

import com.mycompany.sourdagates.modelos.bo.AutenticacionBO;
import com.mycompany.sourdagates.modelos.entidades.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author jonyco
 */


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private AutenticacionBO authBO = new AutenticacionBO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1-conseguirparametros del formulario(login.jspp)
        String correo = request.getParameter("email");
        String pass = request.getParameter("password");

        // 2-pedir al BO que valide la logica de negocio
        Usuario admin = authBO.loginAdministrador(correo, pass);

        if (admin != null) {
            // 3-exito:Crear sesion y guardar al usuario
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogueado", admin);
            
            // redirigir al modulo de administracion
            response.sendRedirect("admin/dashboard.jsp");
        } else {
            // 4-error:regresar al login con un mensaje
            request.setAttribute("error", "Credenciales incorrectas o no tienes permisos de admin");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}