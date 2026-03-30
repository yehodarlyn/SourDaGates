/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sourdagates.controladores;

import com.mycompany.sourdagates.modelos.dao.PedidoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author jonyco
 */
@WebServlet(name = "PedidoServlet", urlPatterns = {"/PedidoServlet"})
public class PedidoServlet extends HttpServlet {

    private PedidoDAO dao = new PedidoDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
        String estado = request.getParameter("nuevoEstado");

        if (dao.actualizarEstado(idPedido, estado)) {
            response.sendRedirect("admin/gestionar_pedidos.jsp?msg=success");
        } else {
            response.sendRedirect("admin/gestionar_pedidos.jsp?msg=error");
        }
    }
}
