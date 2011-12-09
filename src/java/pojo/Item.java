package pojo;
// Generated Nov 3, 2011 11:28:07 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Item generated by hbm2java
 */
public class Item  implements java.io.Serializable {


     private Integer idItem;
     private Variable variable;
     private String descripcion;
     private Integer estado;
     private Set asignacionSugItems = new HashSet(0);
     private Set respItems = new HashSet(0);
     private Set asignacionSugItems_1 = new HashSet(0);

    public Item() {
    }

    public Item(Variable variable, String descripcion, Integer estado, Set asignacionSugItems, Set respItems, Set asignacionSugItems_1) {
       this.variable = variable;
       this.descripcion = descripcion;
       this.estado = estado;
       this.asignacionSugItems = asignacionSugItems;
       this.respItems = respItems;
       this.asignacionSugItems_1 = asignacionSugItems_1;
    }
   
    public Integer getIdItem() {
        return this.idItem;
    }
    
    public void setIdItem(Integer idItem) {
        this.idItem = idItem;
    }
    public Variable getVariable() {
        return this.variable;
    }
    
    public void setVariable(Variable variable) {
        this.variable = variable;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Integer getEstado() {
        return this.estado;
    }
    
    public void setEstado(Integer estado) {
        this.estado = estado;
    }
    public Set getAsignacionSugItems() {
        return this.asignacionSugItems;
    }
    
    public void setAsignacionSugItems(Set asignacionSugItems) {
        this.asignacionSugItems = asignacionSugItems;
    }
    public Set getRespItems() {
        return this.respItems;
    }
    
    public void setRespItems(Set respItems) {
        this.respItems = respItems;
    }
    public Set getAsignacionSugItems_1() {
        return this.asignacionSugItems_1;
    }
    
    public void setAsignacionSugItems_1(Set asignacionSugItems_1) {
        this.asignacionSugItems_1 = asignacionSugItems_1;
    }




}


