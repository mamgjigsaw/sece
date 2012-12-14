/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import internacionalizacionbeans.PreguntasInternacionalizacion;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author Prestigeusa
 */
@ManagedBean
@RequestScoped
public class graficoPE {
    private CartesianChartModel modeloCategoria;
      private PreguntasInternacionalizacion pi = PreguntasInternacionalizacion.getinstancia();
      
      private double posicion = pi.getPosicionExportadora();
      
       public CartesianChartModel getModeloCategoria() {
        return modeloCategoria;
       }

    /**
     * Creates a new instance of graficoPE
     */
    public graficoPE() {
        crearModelo();
    }
    
    private void crearModelo(){
         modeloCategoria = new CartesianChartModel();
         
         ChartSeries resultado = new ChartSeries();
        resultado.setLabel("Posicion Exportacion");
        
        resultado.set("",pi.getPosicionExportadora());
        
        modeloCategoria.addSeries(resultado);
      
    }

    public double getPosicion() {
        return posicion;
    }

    public void setPosicion(double posicion) {
        this.posicion = posicion;
    }
}
