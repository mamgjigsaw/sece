/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;



public class HistorialResultado implements java.io.Serializable {

    private Integer idavance;    
    private Empresa empresa;
    private Contrato contrato;
    private Indicador indicador;
    private float resultado;
  

    public HistorialResultado() {}

    public HistorialResultado(Integer idavance, float resultado, Empresa empresa, Indicador indicador) {
        this.idavance = idavance;
        this.resultado = resultado;
        this.empresa = empresa;
        this.indicador = indicador;
    }

    public Integer getIdavance() {
        return idavance;
    }

    public void setIdavance(Integer idavance) {
        this.idavance = idavance;
    }   

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }

    public Contrato getContrato() {
        return contrato;
    }

    public void setContrato(Contrato contrato) {
        this.contrato = contrato;
    }
    
    public Indicador getIndicador() {
        return indicador;
    }

    public void setIndicador(Indicador indicador) {
        this.indicador = indicador;
    }

    public float getResultado() {
        return resultado;
    }

    public void setResultado(float resultado) {
        this.resultado = resultado;
    }
    
    
    
}
