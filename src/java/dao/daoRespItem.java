/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import pojo.Contrato;
import pojo.RespItem;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public interface daoRespItem extends dao<RespItem>{
    RespItem findByContrato(int id_contrato);
     //David
    int ItemRespondidosxUsuarioxContrato (Usuario usuario, Contrato contrato);
    int ItemRespondidosxContrato (Contrato contrato);

}
