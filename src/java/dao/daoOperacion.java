/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.Operacion;

/**
 *
 * @author mamg
 */
public interface daoOperacion extends dao<Operacion> {
    Operacion findById(int id_operacion);
    
}
