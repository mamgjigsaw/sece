package pojo;
// Generated Nov 26, 2012 10:28:48 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * AreasInter generated by hbm2java
 */
public class AreasInter  implements java.io.Serializable {


     private Integer idArea;
     private String nombre;
     private Byte estado;
     private Set resultadoInters = new HashSet(0);

    public AreasInter() {
    }

    public AreasInter(String nombre, Byte estado, Set resultadoInters) {
       this.nombre = nombre;
       this.estado = estado;
       this.resultadoInters = resultadoInters;
    }
   
    public Integer getIdArea() {
        return this.idArea;
    }
    
    public void setIdArea(Integer idArea) {
        this.idArea = idArea;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Byte getEstado() {
        return this.estado;
    }
    
    public void setEstado(Byte estado) {
        this.estado = estado;
    }
    public Set getResultadoInters() {
        return this.resultadoInters;
    }
    
    public void setResultadoInters(Set resultadoInters) {
        this.resultadoInters = resultadoInters;
    }




}

