/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import internacionalizacionbeans.PreguntasInternacionalizacion;
import java.io.Serializable;
import javax.inject.Named;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author Prestigeusa
 */
@Named(value = "graficoPosicionExportacion")
public class graficoPosicionExportacion implements Serializable {
      private CartesianChartModel modeloCategoria;
      private PreguntasInternacionalizacion pi = PreguntasInternacionalizacion.getinstancia();
      
      private double posicion = pi.getPosicionExportadora();
      
       public CartesianChartModel getModeloCategoria() {
        return modeloCategoria;
       }

    public graficoPosicionExportacion() {
        crearModelo();
    }
    
    private void crearModelo(){
         modeloCategoria = new CartesianChartModel();
         
         ChartSeries resultado = new ChartSeries();
        resultado.setLabel("Posicion Exportacion");
        
        resultado.set("Nivel de exportacion",pi.getPosicionExportadora());
        
        modeloCategoria.addSeries(resultado);
      
    }

    /**
     * @return the posicion
     */
    public double getPosicion() {
        return posicion;
    }

    /**
     * @param posicion the posicion to set
     */
    public void setPosicion(double posicion) {
        this.posicion = posicion;
    }
       
}
