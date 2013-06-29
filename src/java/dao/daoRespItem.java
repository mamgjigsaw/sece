/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import pojo.Contrato;
import pojo.Item;
import pojo.RespItem;
import pojo.Usuario;
import util.SavedResult;

/**
 *
 * @author mamg
 */
public interface daoRespItem extends dao<RespItem>{
    RespItem findByContrato(int id_contrato);
    RespItem findByContratoItem(int id_contrato,int id_item);
     //David
    int ItemRespondidosxUsuarioxContrato (Usuario usuario, Contrato contrato);
    int ItemRespondidosxContrato (Contrato contrato);
    int ItemRespondidosxContratoByIndicador (int idContrato, int idIndicador);
    SavedResult SaveAllItems(List<RespItem> itemsR);

}
