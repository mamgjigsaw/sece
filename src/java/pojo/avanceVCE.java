/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import daoImpl.ValoracionVCEdaoImpl;
import net.sf.jasperreports.engine.JRDataSource;
import java.util.ArrayList;
import java.util.List;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
/**
 *
 * @author Mendieta
 */
public class avanceVCE implements java.io.Serializable {
  private Integer idavance;   
  private Integer idContrato; 
  private Integer idindicador;
  private String indicador; 
  private Double contribucion;
  private Integer v;
  private Double vs;
  private Double res; 

    
  
    public avanceVCE(Integer idavance, Integer idContrato, Integer idindicador, String indicador, Double contribucion , Integer v, Double vs, Double res) {
        this.idavance = idavance;
        this.idContrato = idContrato;
        this.idindicador = idindicador;
        this.indicador = indicador;
        this.contribucion = contribucion;
        this.v = v;
        this.vs = vs;
        this.res = res;       
        
    }
   
   
   public avanceVCE(){
   }
   
    public Integer getIdindicador() {
        return idindicador;
    }

    public void setIdindicador(Integer idindicador) {
        this.idindicador = idindicador;
    }
    public Integer getIdavance() {
        return idavance;
    }
    public void setIdavance(Integer idavance) {
        this.idavance = idavance;
    }

    
    public void setIdContrato(Integer idContrato) {
        this.idContrato = idContrato;
    }

    public Integer getIdContrato() {
        return idContrato;
    }
    public String getIndicador() {
        return indicador;
    }

    public void setIndicador(String indicador) {
        this.indicador = indicador;
    }

    public Double getContribucion() {
        return contribucion;
    }

    public void setContribucion(Double contribucion) {
        this.contribucion = contribucion;
    }
     
    public Double getRes() {
        return res;
    }

    public void setRes(Double res) {
        this.res = res;
    }

    public Integer getV() {
        return v;
    }

    public void setV(Integer v) {
        this.v = v;
    }

    public Double getVs() {
        return vs;
    }

    public void setVs(Double vs) {
        this.vs = vs;
    }    
    
   public JRDataSource getValoracionesDS(){
        List<valoracionVCE> vce = new ArrayList();
        ValoracionVCEdaoImpl vdi = new ValoracionVCEdaoImpl();
        vce  = vdi.findByAvanceVCE(this);
         return new JRBeanCollectionDataSource(vce);
    } 
}
