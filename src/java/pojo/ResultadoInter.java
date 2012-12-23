package pojo;
// Generated Nov 26, 2012 10:28:48 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * ResultadoInter generated by hbm2java
 */
public class ResultadoInter  implements java.io.Serializable {


     private Integer idResultado;
     private AreasInter areasInter;
     private Contrato contrato;
     private Double resultado;
     private Date fechaFinalizacion;

    public ResultadoInter() {
    }

    public ResultadoInter(AreasInter areasInter, Contrato contrato, Double resultado, Date fechaFinalizacion) {
       this.areasInter = areasInter;
       this.contrato = contrato;
       this.resultado = resultado;
       this.fechaFinalizacion = fechaFinalizacion;
    }
   
    public Integer getIdResultado() {
        return this.idResultado;
    }
    
    public void setIdResultado(Integer idResultado) {
        this.idResultado = idResultado;
    }
    public AreasInter getAreasInter() {
        return this.areasInter;
    }
    
    public void setAreasInter(AreasInter areasInter) {
        this.areasInter = areasInter;
    }
    public Contrato getContrato() {
        return this.contrato;
    }
    
    public void setContrato(Contrato contrato) {
        this.contrato = contrato;
    }
    public Double getResultado() {
        return this.resultado;
    }
    
    public void setResultado(Double resultado) {
        this.resultado = resultado;
    }
    public Date getFechaFinalizacion() {
        return this.fechaFinalizacion;
    }
    
    public void setFechaFinalizacion(Date fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }




}


