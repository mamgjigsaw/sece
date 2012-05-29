/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.sql.Timestamp;
import java.util.List;
import pojo.Acceso;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public interface daoAcceso extends dao<Acceso>{
    Acceso findById(int id_acceso);
    //---------------------------added by David
    //---------------------------added by David
    Timestamp fechaUltimoAcceso (Usuario usuario);
     Acceso findUltimoAcceso(Usuario usuario);
     List<Acceso> findByUser(Usuario usuario);
}
