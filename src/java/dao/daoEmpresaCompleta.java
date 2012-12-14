/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.Contrato;
import pojo.EmpresaCompleta;

/**
 *
 * @author Dave
 */
public interface daoEmpresaCompleta extends dao<EmpresaCompleta> {
    EmpresaCompleta findByIdContrato(Contrato contrato);
}
