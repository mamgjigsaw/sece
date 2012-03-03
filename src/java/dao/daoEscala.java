/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import pojo.Escala;

/**
 *
 * @author mamg
 */
public interface daoEscala extends dao<Escala>{
    Escala findByVariable(int id_variable);
    Escala findById(int id);
}
