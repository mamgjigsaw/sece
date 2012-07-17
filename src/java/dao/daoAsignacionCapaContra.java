/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.AsignacionCapaContra;
import pojo.Contrato;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public interface daoAsignacionCapaContra extends dao<AsignacionCapaContra>{
     //---------------------------added by David
    //---------------------------added by David
    List<AsignacionCapaContra> findAllByIdUsuarioCapacitador(Usuario us);
<<<<<<< HEAD
    AsignacionCapaContra findbyIdContrato(Contrato c);
    AsignacionCapaContra findbyId(int id);
=======
    Usuario findUsByContra (Contrato contrato);
>>>>>>> origin/master
}
