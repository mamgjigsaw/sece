/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.EmpresasContratos;

/**
 *
 * @author mamg
 */
public interface daoEmpresasContratos extends dao<EmpresasContratos> {
    List<EmpresasContratos> findAllByEstado (int contratoEstado);    
}
