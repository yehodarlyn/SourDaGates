/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sourdagates.modelos.bo;

import com.mycompany.sourdagates.modelos.dao.ResenaDAO;
import com.mycompany.sourdagates.modelos.entidades.Resena;
import java.util.List;

/**
 *
 * @author jonyco
 */
public class ResenaBO {

    private ResenaDAO dao = new ResenaDAO();

    public List<Resena> obtenerResenasParaModeracion() {
        return dao.listarTodas();
    }

    public boolean borrarResenaInapropiada(int id) {
        return dao.eliminar(id);
    }
}
