/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sourdagates.modelos.dao;

import java.sql.*;

/**
 *
 * @author jonyco
 */
public class PedidoDAO {

    //requi:actualizar el estado del pedido
    public boolean actualizarEstado(int idPedido, String nuevoEstado) {
        String sql = "UPDATE pedidos SET estado = ? WHERE id_pedido = ?";
        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nuevoEstado);
            ps.setInt(2, idPedido);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
