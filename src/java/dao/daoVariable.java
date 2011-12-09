/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import pojo.Indicador;
import pojo.Variable;

/**
 *
 * @author mamg
 */
public interface daoVariable extends dao<Variable> {
    List<Variable> findByIndicador(Indicador indicador);
    Variable findByName(String name);    
    Variable findById(int id_variable);
}
