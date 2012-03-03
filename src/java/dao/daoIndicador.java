/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import pojo.Indicador;

/**
 *
 * @author mamg
 */
public interface daoIndicador extends dao<Indicador> {
    Indicador findByName(String name);
    Indicador findById(int id);
    int getCountIndicador();
    List<Indicador> findAllByActive();

}
