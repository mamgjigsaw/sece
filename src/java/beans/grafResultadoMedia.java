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
 * @author davidalmanza
 */
@Named(value = "grafResultadoMedia")
public class grafResultadoMedia implements Serializable  {

    private CartesianChartModel modeloCategoria;
    private PreguntasInternacionalizacion pi = PreguntasInternacionalizacion.getinstancia();

    public CartesianChartModel getModeloCategoria() {
        return modeloCategoria;
    }
    
    public grafResultadoMedia() {
        crearModelo();
    }
    
    private void crearModelo(){
        modeloCategoria = new CartesianChartModel();

        double media = pi.media_inter();
    
        ChartSeries resultado = new ChartSeries();
        resultado.setLabel("Resultado");
        
        resultado.set("Situacion Productiva",pi.situacion_productiva());
        resultado.set("Estructura Empresarial",pi.estructura_empresarial());
        resultado.set("Situacion Financiera",pi.situacion_financiear());
        resultado.set("Preparación y Motivacion",pi.preparacion_motivacion_directiva());
        resultado.set("Política de Calidad",pi.politica_calidad());
        resultado.set("Diseño asociado al producto", pi.dis_asociado());
        resultado.set("Diferenciación del producto",pi.diferenciacion());
        resultado.set("Adaptacion del Producto al Mercado Externo",pi.adaptacion());
        resultado.set("Empaque y etiquetado", pi.empaques());
        resultado.set("Política de Marca", pi.politica_marca());
        resultado.set("Desarrollo de la Inteligencia comercial", pi.inteligencia_comercial());
        resultado.set("Gestión de trámites de exportación",pi.gestion_tramites_exportacion());
        resultado.set("Logística internacional",pi.logistica());
        resultado.set("Distriución comercial e internacional", pi.distribucion_comercial());
        resultado.set("Asociatividad", pi.asociatividad());
        resultado.set("Políticas de precio", pi.politica_precios());
        resultado.set("Promoción tradicional", pi.promocion_tradicional());
        resultado.set("Promoción de internet",  pi.promocion_internet());
        resultado.set("Responsabilidad Social", pi.responsabilidad_social());
        
        
        ChartSeries r_media = new ChartSeries("Media");
        
        r_media.set("Situacion Productiva", media);
        r_media.set("Estructura Empresarial", media);
        r_media.set("Situacion Financiera",media);
        r_media.set("Preparación y Motivacion",media);
        r_media.set("Política de Calidad", media);
        r_media.set("Diseño asociado al producto", media);
        r_media.set("Diferenciación del producto",media);
        r_media.set("Adaptacion del Producto al Mercado Externo",media);
        r_media.set("Empaque y etiquetado", media);
        r_media.set("Política de Marca", media);
        r_media.set("Desarrollo de la Inteligencia comercial",media);
        r_media.set("Gestión de trámites de exportación",media);
        r_media.set("Logística internacional", media);
        r_media.set("Distriución comercial e internacional", media);
        r_media.set("Asociatividad", media);
        r_media.set("Políticas de precio",media);
        r_media.set("Promoción tradicional", media);
        r_media.set("Promoción de internet", media);
        r_media.set("Responsabilidad Social", media);
        
        modeloCategoria.addSeries(resultado);
        modeloCategoria.addSeries(r_media);
    }
}
