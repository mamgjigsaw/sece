/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.avanceVCE;

/**
 *
 * @author Mendieta
 */
public interface daoAvanceVCE extends dao<avanceVCE> {
    avanceVCE findbyID(int id);
    List<avanceVCE> findByContrato(int idContrato);
}
