package pojo;
// Generated Nov 3, 2011 11:28:07 PM by Hibernate Tools 3.2.1.GA


import daoImpl.VariableDaoImpl;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 * Indicador generated by hbm2java
 */
public class Indicador  implements java.io.Serializable {


     private Integer idIndicador;
     private String nombre;
     private Double contribucion;
     private Boolean estado;
     private Set delegacionIndiUsus = new HashSet(0);
     private Set variables = new HashSet(0);

    public Indicador() {
    }

    public Indicador(String nombre, Double contribucion, Boolean estado, Set delegacionIndiUsus, Set variables) {
       this.nombre = nombre;
       this.contribucion = contribucion;
       this.estado = estado;
       this.delegacionIndiUsus = delegacionIndiUsus;
       this.variables = variables;
    }
   
    public Integer getIdIndicador() {
        return this.idIndicador;
    }
    
    public void setIdIndicador(Integer idIndicador) {
        this.idIndicador = idIndicador;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Double getContribucion() {
        return this.contribucion;
    }
    
    public void setContribucion(Double contribucion) {
        this.contribucion = contribucion;
    }
    public Boolean getEstado() {
        return this.estado;
    }
    
    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    public Set getDelegacionIndiUsus() {
        return this.delegacionIndiUsus;
    }
    
    public void setDelegacionIndiUsus(Set delegacionIndiUsus) {
        this.delegacionIndiUsus = delegacionIndiUsus;
    }
    public Set getVariables() {
        return this.variables;
    }
    
    public void setVariables(Set variables) {
        this.variables = variables;
    }

    public JRDataSource getVariableDS(){
        List<Variable> vars = new ArrayList();
        VariableDaoImpl vdi = new VariableDaoImpl();
        vars = vdi.findAll();
         return new JRBeanCollectionDataSource(vars);
    }


}


