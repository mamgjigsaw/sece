/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.Empresa;

/**
 *
 * @author mamg
 */
public interface daoEmpresa extends dao<Empresa>{
    //---------------------------added by David    
    Empresa findByID(int id_empresa);
}
