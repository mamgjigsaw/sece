/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import pojo.Item;
import pojo.Variable;

/**
 *
 * @author mamg
 */
public interface daoItem extends dao<Item> {
    List<Item> findByVariable(Variable variable);
    List<Item> findByVariableActivo(Variable variable);
    Item findByName(String name);
    List<Item> findByVar(int idVariable);
    //added by dave
    int numItemActivos(); //devuelve el numero de items en total
    Item findById(int id);

}
