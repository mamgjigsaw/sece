/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import pojo.Escala;
import pojo.Variable;

/**
 *
 * @author mamg
 */
public interface daoEscala extends dao<Escala>{
    Escala findByVariable(int id_variable);
    Escala findByVarRango(int id_variable,int rango);
    List<Escala> findByVariable(Variable variable);
    Escala findById(int id);
}
