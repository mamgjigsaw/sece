/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Empresa;
import pojo.HistorialResultado;
import pojo.Indicador;

/**
 *
 * @author Dave
 */
public interface daoHistorialResultado extends dao<HistorialResultado> {
    List<HistorialResultado> resultadosxEmpresaxIndicador(Empresa empresa, Indicador indicador);
    
}
