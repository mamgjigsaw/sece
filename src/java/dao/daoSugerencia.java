/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import pojo.Sugerencia;

/**
 *
 * @author mamg
 */
public interface daoSugerencia extends dao<Sugerencia> {
    Sugerencia findByItem(int id_item);

}
