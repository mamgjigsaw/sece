/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Contrato;
import pojo.DelegacionIndiUsu;
import pojo.Indicador;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public interface daoDelegacionIndiUsu extends dao<DelegacionIndiUsu> {
    DelegacionIndiUsu findByUsuario(Usuario usuario);    
    DelegacionIndiUsu getDelByContCurrentlyandUsu(Usuario usuario);
    DelegacionIndiUsu findByContratoIndicador(Indicador indicador, Contrato contrato);
    //agregado por David
    List<DelegacionIndiUsu> delegacionxContrato(Contrato contrato);
}
