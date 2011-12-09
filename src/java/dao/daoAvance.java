/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.Avance;

/**
 *
 * @author mamg
 */
public interface daoAvance extends dao<Avance> {
   Avance  findById(int id_avance); 
   Avance findByIndiAndContra(int id_indicador,int id_contrato);   
}
