/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Avance;
import pojo.Contrato;


/**
 *
 * @author mamg
 */
public interface daoAvance extends dao<Avance> {
   Avance  findById(int id_avance); 
   Avance findByIndiAndContra(int id_indicador,int id_contrato);   
   //agregado por David
   List<Avance> Xcontrato(Contrato contrato);
}
