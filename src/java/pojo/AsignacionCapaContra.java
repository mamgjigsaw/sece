package pojo;
// Generated Nov 3, 2011 11:28:07 PM by Hibernate Tools 3.2.1.GA



/**
 * AsignacionCapaContra generated by hbm2java
 */
public class AsignacionCapaContra  implements java.io.Serializable {


     private Integer idAsignacion;
     private Usuario usuario;
     private Contrato contrato;

    public AsignacionCapaContra() {
    }

    public AsignacionCapaContra(Usuario usuario, Contrato contrato) {
       this.usuario = usuario;
       this.contrato = contrato;
    }
   
    public Integer getIdAsignacion() {
        return this.idAsignacion;
    }
    
    public void setIdAsignacion(Integer idAsignacion) {
        this.idAsignacion = idAsignacion;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Contrato getContrato() {
        return this.contrato;
    }
    
    public void setContrato(Contrato contrato) {
        this.contrato = contrato;
    }




}


