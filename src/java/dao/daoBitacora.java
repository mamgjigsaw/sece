/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Acceso;
import pojo.Bitacora;

/**
 *
 * @author mamg
 */
public interface daoBitacora extends dao<Bitacora> {
    List<Bitacora> findByAccess(Acceso a);
}
