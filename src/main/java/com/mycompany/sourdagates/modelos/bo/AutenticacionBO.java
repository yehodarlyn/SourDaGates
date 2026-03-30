/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sourdagates.modelos.bo;

import com.mycompany.sourdagates.modelos.dao.UsuarioDAO;
import com.mycompany.sourdagates.modelos.entidades.Usuario;

/**
 *
 * @author jonyco
 */

public class AutenticacionBO {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    public Usuario loginAdministrador(String correo, String password) {
        //lógica extra como encriptacion o intentos fallidos
        return usuarioDAO.validarAdmin(correo, password);
    }
}
