/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sourdagates.modelos.bo;

import com.mycompany.sourdagates.modelos.dao.ProductoDAO;
import com.mycompany.sourdagates.modelos.entidades.Producto;
import java.util.List;

/**
 *
 * @author jonyco
 */
public class ProductoBO {

    private ProductoDAO dao = new ProductoDAO();

    public List<Producto> obtenerTodos() {
        return dao.listar();
    }

    public boolean registrarProducto(Producto p) {
        if (p.getPrecio() <= 0 || p.getStock() < 0) {
            return false;
        }
        return dao.insertar(p);
    }

    public boolean removerProducto(int id) {
        return dao.eliminar(id);
    }
}
