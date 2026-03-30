/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sourdagates.controladores;

import com.mycompany.sourdagates.modelos.bo.ProductoBO;
import com.mycompany.sourdagates.modelos.entidades.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author jonyco
 */
@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

    private ProductoBO bo = new ProductoBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            bo.removerProducto(id);
            response.sendRedirect("ProductoServlet?accion=listar");
        } else {
            //accion por defol:listar productos para la tabla admin
            List<Producto> productos = bo.obtenerTodos();
            request.setAttribute("listaProductos", productos);
            request.getRequestDispatcher("admin/gestionar_productos.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //logica para Crear/Guardar nuevo producto
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String desc = request.getParameter("descripcion");
        String img = request.getParameter("imagen");

        Producto p = new Producto(0, nombre, desc, precio, stock, img);
        bo.registrarProducto(p);

        response.sendRedirect("ProductoServlet?accion=listar");
    }
}
