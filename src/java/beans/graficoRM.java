/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import internacionalizacionbeans.PreguntasInternacionalizacion;
import java.text.DecimalFormat;
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
public class graficoRM {

    private CartesianChartModel modeloCategoria;
    private PreguntasInternacionalizacion pi = PreguntasInternacionalizacion.getinstancia();

    public CartesianChartModel getModeloCategoria() {
        return modeloCategoria;
    }

    /**
     * Creates a new instance of graficoRM
     */
    public graficoRM() {
        crearModelo();
    }

    private void crearModelo() {
        modeloCategoria = new CartesianChartModel();

        double media = roundTwoDecimals( getPi().media_inter());

        ChartSeries resultado = new ChartSeries();
        resultado.setLabel("Resultado");

        resultado.set("Responsabilidad Social",roundTwoDecimals( pi.responsabilidad_social()));
        resultado.set("Promoción de internet", roundTwoDecimals( pi.promocion_internet()));
        resultado.set("Promoción tradicional", roundTwoDecimals(pi.promocion_tradicional()));
        resultado.set("Políticas de precio",roundTwoDecimals( pi.politica_precios()));
        resultado.set("Asociatividad", roundTwoDecimals(pi.asociatividad()));
        resultado.set("Distriución comercial e internacional", roundTwoDecimals(pi.distribucion_comercial()));
        resultado.set("Logística internacional",roundTwoDecimals(pi.logistica()));
        resultado.set("Gestión de trámites de exportación",roundTwoDecimals(pi.gestion_tramites_exportacion()));
        resultado.set("Desarrollo de la Inteligencia comercial", roundTwoDecimals(pi.inteligencia_comercial()));
        resultado.set("Política de Marca", roundTwoDecimals(pi.politica_marca()));
        resultado.set("Empaque y etiquetado", roundTwoDecimals(pi.empaques()));
        resultado.set("Adaptacion del Producto al Mercado Externo",roundTwoDecimals(pi.adaptacion()));
        resultado.set("Diferenciación del producto",roundTwoDecimals(pi.diferenciacion()));
        resultado.set("Diseño asociado al producto", roundTwoDecimals(pi.dis_asociado()));
        resultado.set("Política de Calidad",roundTwoDecimals(pi.politica_calidad()));
        resultado.set("Preparación y Motivacion",roundTwoDecimals(pi.preparacion_motivacion_directiva()));
        resultado.set("Situacion Financiera",roundTwoDecimals(pi.situacion_financiear()));
        resultado.set("Estructura Empresarial",roundTwoDecimals(pi.estructura_empresarial()));
        resultado.set("Situacion Productiva",roundTwoDecimals(pi.situacion_productiva()));
     
        ChartSeries r_media = new ChartSeries("Media");
        
        r_media.set("Responsabilidad Social", media);
        r_media.set("Promoción de internet", media);
        r_media.set("Promoción tradicional", media);
        r_media.set("Políticas de precio", media);
        r_media.set("Asociatividad", media);
        r_media.set("Distriución comercial e internacional", media);
        r_media.set("Logística internacional", media);
        r_media.set("Gestión de trámites de exportación", media);
        r_media.set("Desarrollo de la Inteligencia comercial", media);
        r_media.set("Política de Marca", media);
        r_media.set("Empaque y etiquetado", media);
        r_media.set("Adaptacion del Producto al Mercado Externo", media);
        r_media.set("Diferenciación del producto", media);
        r_media.set("Diseño asociado al producto", media);
        r_media.set("Política de Calidad", media);
        r_media.set("Preparación y Motivacion", media);
        r_media.set("Situacion Financiera", media);
        r_media.set("Estructura Empresarial", media);
        r_media.set("Situacion Productiva", media);

        modeloCategoria.addSeries(resultado);
        modeloCategoria.addSeries(r_media);
    }

    public double roundTwoDecimals(double d) {
        DecimalFormat twoDForm = new DecimalFormat("#.##");
        return Double.valueOf(twoDForm.format(d));
    }

    public PreguntasInternacionalizacion getPi() {
        return pi;
    }
}
