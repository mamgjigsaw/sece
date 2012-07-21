/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import daoImpl.EmpresaDaoImpl;
import daoImpl.HistorialResultadoDaoImpl;
import daoImpl.IndicadorDaoImpl;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import pojo.Empresa;
import pojo.HistorialResultado;
import pojo.Indicador;

/**
 *
 * @author Dave
 */
public class HistoriaIndicadores {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         EmpresaDaoImpl edi = new EmpresaDaoImpl();
         Empresa empresa = new Empresa();          
         IndicadorDaoImpl idi = new IndicadorDaoImpl();
         Indicador indicador = new Indicador();
         HistorialResultadoDaoImpl hrdi = new HistorialResultadoDaoImpl();       
        
        int idEmpresa = 12;
        int idIndicador = 1;        
        empresa =edi.findByID(idEmpresa);        
        indicador = idi.findById(idIndicador);             
        List<HistorialResultado> resultados = hrdi.resultadosxEmpresaxIndicador(empresa,indicador);
        Iterator<HistorialResultado> it = resultados.iterator();
        HistorialResultado hr;         
       
        if (resultados.isEmpty())
            System.out.print("no hay nada");
            try {    
                while(it.hasNext()){
                hr = it.next();
                System.out.println(hr.getContrato().getFechaTermino()+";"+hr.getResultado());
                }
                
            } finally {            
                System.out.close();
            }
    }
}
