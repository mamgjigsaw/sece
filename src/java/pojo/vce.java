/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.util.List;

/**
 *
 * @author Dave
 */
public class vce implements java.io.Serializable {
    private int id_contrato;
    private String nombre_empresa;
    private List<Indicador> listIndi;

    public int getId_contrato() {
        return id_contrato;
    }

    public vce() {
    }

    public vce(int id_contrato, String nombre_empresa, List<Indicador> listIndi) {
        this.id_contrato = id_contrato;
        this.nombre_empresa = nombre_empresa;
        this.listIndi = listIndi;
    }
    
    public void setId_contrato(int id_contrato) {
        this.id_contrato = id_contrato;
    }

    public List<Indicador> getListIndi() {
        return listIndi;
    }

    public void setListIndi(List<Indicador> listIndi) {
        this.listIndi = listIndi;
    }

    public String getNombre_empresa() {
        return nombre_empresa;
    }

    public void setNombre_empresa(String nombre_empresa) {
        this.nombre_empresa = nombre_empresa;
    }
    
    
    
}
