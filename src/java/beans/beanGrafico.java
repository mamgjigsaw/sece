/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LineChartSeries;

/**
 *
 * @author Prestigeusa
 */
@ManagedBean
@RequestScoped
public class beanGrafico {

   private CartesianChartModel  linearModel;  
  
    public beanGrafico() {  
        createLinearModel();  
    }  
  
    public CartesianChartModel getLinearModel() {  
        return linearModel;  
    }  
  
    private void createLinearModel() {  
        /*linearModel = new CartesianChartModel();  
  
        LineChartSeries series1 = new LineChartSeries();  
        series1.setLabel("Series 1");  
  
        series1.set(1, 2);  
        series1.set(2, 1);  
        series1.set(3, 3);  
        series1.set(4, 6);  
        series1.set(5, 8);  
  
        LineChartSeries series2 = new LineChartSeries();  
        series2.setLabel("Series 2");  
        series2.setMarkerStyle("diamond");  
  
        series2.set(1, 6);  
        series2.set(2, 3);  
        series2.set(3, 2);  
        series2.set(4, 7);  
        series2.set(5, 9);  
  
        linearModel.addSeries(series1);  
        linearModel.addSeries(series2);  
        * /
        */
        linearModel = new CartesianChartModel();

       
        ChartSeries resultado = new ChartSeries();
        resultado.setLabel("Resultado");
        
        resultado.set("Situacion Productiva",3);
        resultado.set("Estructura Empresarial",5);
       
        
        
        ChartSeries r_media = new ChartSeries("Media");
        
        r_media.set("Situacion Productiva", 2);
        r_media.set("Estructura Empresarial", 2);
        
        
        linearModel.addSeries(resultado);
        linearModel.addSeries(r_media);
    }  
}
