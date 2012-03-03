/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.AsignacionSugItem;

/**
 *
 * @author mamg
 */
public interface daoAsignacionSugItem  extends dao<AsignacionSugItem> {
    AsignacionSugItem findById(int id); 
}
