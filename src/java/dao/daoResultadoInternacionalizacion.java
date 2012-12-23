/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Contrato;
import pojo.ResultadoInter;

/**
 *
 * @author Dave
 */
public interface daoResultadoInternacionalizacion extends dao<ResultadoInter> {
    List<ResultadoInter> resultadosxContratos(Contrato contrato);
    
}
