/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sourdagates.modelos.dao;

import com.mycompany.sourdagates.modelos.entidades.Resena;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jonyco
 */
public class ResenaDAO {

    //requi:consultar reseñas 
    public List<Resena> listarTodas() {
        List<Resena> lista = new ArrayList<>();
        //unir con productos y usuarios para mostrar nombres reales en el admin
        String sql = "SELECT r.*, p.nombre as nombre_producto, u.nombre as nombre_usuario "
                + "FROM resenas r "
                + "JOIN productos p ON r.id_producto = p.id_producto "
                + "JOIN usuarios u ON r.id_usuario = u.id_usuario "
                + "ORDER BY r.fecha DESC";

        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Resena r = new Resena();
                r.setId(rs.getInt("id_resena"));
                r.setComentario(rs.getString("comentario"));
                r.setCalificacion(rs.getInt("calificacion"));
                r.setFecha(rs.getTimestamp("fecha"));
                r.setNombreProducto(rs.getString("nombre_producto"));
                r.setNombreUsuario(rs.getString("nombre_usuario"));
                lista.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    //requi:eliminar reseñas 
    public boolean eliminar(int id) {
        String sql = "DELETE FROM resenas WHERE id_resena = ?";
        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
