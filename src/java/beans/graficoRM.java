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

        resultado.set("Situacion Productiva",roundTwoDecimals( getPi().situacion_productiva()));
        resultado.set("Estructura Empresarial",roundTwoDecimals( getPi().estructura_empresarial()));
        resultado.set("Situacion Financiera",roundTwoDecimals( getPi().situacion_financiear()));
        resultado.set("Preparación y Motivacion",roundTwoDecimals( getPi().preparacion_motivacion_directiva()));
        resultado.set("Política de Calidad",roundTwoDecimals( getPi().politica_calidad()));
        resultado.set("Diseño asociado al producto",roundTwoDecimals( getPi().dis_asociado()));
        resultado.set("Diferenciación del producto",roundTwoDecimals( getPi().diferenciacion()));
        resultado.set("Adaptacion del Producto al Mercado Externo",roundTwoDecimals( getPi().adaptacion()));
        resultado.set("Empaque y etiquetado",roundTwoDecimals( getPi().empaques()));
        resultado.set("Política de Marca",roundTwoDecimals( getPi().politica_marca()));
        resultado.set("Desarrollo de la Inteligencia comercial",roundTwoDecimals( getPi().inteligencia_comercial()));
        resultado.set("Gestión de trámites de exportación",roundTwoDecimals( getPi().gestion_tramites_exportacion()));
        resultado.set("Logística internacional",roundTwoDecimals( getPi().logistica()));
        resultado.set("Distriución comercial e internacional",roundTwoDecimals( getPi().distribucion_comercial()));
        resultado.set("Asociatividad",roundTwoDecimals( getPi().asociatividad()));
        resultado.set("Políticas de precio",roundTwoDecimals( getPi().politica_precios()));
        resultado.set("Promoción tradicional",roundTwoDecimals( getPi().promocion_tradicional()));
        resultado.set("Promoción de internet",roundTwoDecimals( getPi().promocion_internet()));
        resultado.set("Responsabilidad Social",roundTwoDecimals( getPi().responsabilidad_social()));


        ChartSeries r_media = new ChartSeries("Media");

        r_media.set("Situacion Productiva", media);
        r_media.set("Estructura Empresarial", media);
        r_media.set("Situacion Financiera", media);
        r_media.set("Preparación y Motivacion", media);
        r_media.set("Política de Calidad", media);
        r_media.set("Diseño asociado al producto", media);
        r_media.set("Diferenciación del producto", media);
        r_media.set("Adaptacion del Producto al Mercado Externo", media);
        r_media.set("Empaque y etiquetado", media);
        r_media.set("Política de Marca", media);
        r_media.set("Desarrollo de la Inteligencia comercial", media);
        r_media.set("Gestión de trámites de exportación", media);
        r_media.set("Logística internacional", media);
        r_media.set("Distriución comercial e internacional", media);
        r_media.set("Asociatividad", media);
        r_media.set("Políticas de precio", media);
        r_media.set("Promoción tradicional", media);
        r_media.set("Promoción de internet", media);
        r_media.set("Responsabilidad Social", media);

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
