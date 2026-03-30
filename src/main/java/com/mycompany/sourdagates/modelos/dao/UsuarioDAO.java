/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sourdagates.modelos.dao;

import com.mycompany.sourdagates.modelos.entidades.Usuario;
import java.sql.*;

/**
 *
 * @author jonyco
 */

public class UsuarioDAO {

    public Usuario validarAdmin(String correo, String password) {
        String sql = "SELECT * FROM usuarios WHERE correo = ? AND password = ? AND rol = 'admin'";

        try (Connection con = Conexion.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, correo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setRol(rs.getString("rol"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; //si no coinciden las credenciales o no es admin
    }
}
