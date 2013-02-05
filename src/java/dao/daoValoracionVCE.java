/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.avanceVCE;
import pojo.valoracionVCE;

/**
 *
 * @author Mendieta
 */
public interface daoValoracionVCE extends dao <valoracionVCE> {
  List<valoracionVCE> findByAvanceVCE(avanceVCE aVCE);  
}
