
import daoImpl.EmpresaDaoImpl;
import daoImpl.HistorialResultadoDaoImpl;
import daoImpl.IndicadorDaoImpl;
import java.util.Iterator;
import java.util.List;
import pojo.Empresa;
import pojo.HistorialResultado;
import pojo.Indicador;





public class test {

  

    public static void main(String[] args) {
         EmpresaDaoImpl edi = new EmpresaDaoImpl();
         Empresa empresa = edi.findByID(12);         
         IndicadorDaoImpl idi = new IndicadorDaoImpl();
         Indicador indicador = idi.findById(1);        
        
         HistorialResultadoDaoImpl hrdi = new HistorialResultadoDaoImpl();         
         List<HistorialResultado> resultados = hrdi.resultadosxEmpresaxIndicador(empresa,indicador);
         Iterator<HistorialResultado> it = resultados.iterator();
         HistorialResultado hr;         
         while(it.hasNext()){
             hr = it.next();
             System.out.println("Fecha: "+hr.getContrato().getFechaTermino() + " Resultado: "+Math.round( hr.getResultado() ) );
         }
         }
       
    }
    
     

