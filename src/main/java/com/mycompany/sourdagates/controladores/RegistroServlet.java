/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sourdagates.controladores;

import com.mycompany.sourdagates.modelos.dao.Conexion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author jonyco
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1-recuperar parametros del formulario
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String tel = request.getParameter("telefono");

        // 2-onsertar en la base de datos --rol por defoul:cliente--
        String sql = "INSERT INTO usuarios (nombre, correo, password, rol, telefono) VALUES (?, ?, ?, 'cliente', ?)";

        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, tel);

            int filas = ps.executeUpdate();

            if (filas > 0) {
                //registro exitoso -> mandar al login
                response.sendRedirect("login.jsp?msg=success");
            } else {
                request.setAttribute("error", "No se pudo completar el registro");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            //rrror:Elcorreo ya existe--llave unica--
            request.setAttribute("error", "El correo ya esta registrado en el sistema");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
}
