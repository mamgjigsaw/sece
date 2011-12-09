/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Contrato;
import pojo.DelegacionIndiUsu;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public interface daoDelegacionIndiUsu extends dao<DelegacionIndiUsu> {
    DelegacionIndiUsu findByUsuario(Usuario usuario);
    //agregado por David
    List<DelegacionIndiUsu> delegacionxContrato(Contrato contrato);
}
