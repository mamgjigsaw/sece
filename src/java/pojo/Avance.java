package pojo;
// Generated Nov 3, 2011 11:28:07 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Acceso generated by hbm2java
 */
public class Avance  implements java.io.Serializable {


     private Integer idAvance;
     private Contrato contrato;
     private Indicador indicador;
     private Integer var;
     private float resultado;
     private Integer v;
     private float vs;

    public Avance() {
    }

    public Avance(Contrato contrato, Indicador indicador, Integer var, float resultado, int v, float vs) {
        this.contrato = contrato;
        this.indicador = indicador;
        this.var = var;
        this.resultado = resultado;
        this.v = v;
        this.vs = vs;
    }

    public Contrato getContrato() {
        return contrato;
    }

    public void setContrato(Contrato contrato) {
        this.contrato = contrato;
    }

    public Integer getIdAvance() {
        return idAvance;
    }

    public void setIdAvance(Integer idAvance) {
        this.idAvance = idAvance;
    }

    public Indicador getIndicador() {
        return indicador;
    }

    public void setIndicador(Indicador indicador) {
        this.indicador = indicador;
    }

    public Integer getVar() {
        return var;
    }

    public void setVar(Integer var) {
        this.var = var;
    }

    public float getResultado() {
        return resultado;
    }

    public void setResultado(float resultado) {
        this.resultado = resultado;
    }

        
    public Integer getV() {
        return v;
    }

    public void setV(Integer v) {
        this.v = v;
    }

    public float getVs() {
        return vs;
    }

    public void setVs(float vs) {
        this.vs = vs;
    }

     



}


