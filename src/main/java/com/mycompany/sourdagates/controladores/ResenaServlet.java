/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sourdagates.controladores;

import com.mycompany.sourdagates.modelos.bo.ResenaBO;
import com.mycompany.sourdagates.modelos.entidades.Resena;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author jonyco
 */
@WebServlet(name = "ResenaServlet", urlPatterns = {"/ResenaServlet"})
public class ResenaServlet extends HttpServlet {

    private ResenaBO bo = new ResenaBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            bo.borrarResenaInapropiada(id);
            response.sendRedirect("ResenaServlet?accion=listar");
        } else {
            // Acción por defecto: Listar para moderación
            List<Resena> resenas = bo.obtenerResenasParaModeracion();
            request.setAttribute("listaResenas", resenas);
            request.getRequestDispatcher("admin/gestionar_resenas.jsp").forward(request, response);
        }
    }
}
