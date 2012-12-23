/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.util.Date;

/**
 *
 * @author wmiguel
 */
public class Valoracion implements java.io.Serializable{
    private int idValoracion;
    private Contrato contrato;
    private Usuario usuario;
    private Variable variable;
    private int escalaObtenida;
    private int ponderacion;
    private Double contribucion;
    private Date fecha;

    public Valoracion(Contrato contrato, Usuario usuario, Variable variable, int escalaObtenida, int ponderacion, Double contribucion, Date fecha) {
        this.contrato = contrato;
        this.usuario = usuario;
        this.variable = variable;
        this.escalaObtenida = escalaObtenida;
        this.ponderacion = ponderacion;
        this.contribucion = contribucion;
        this.fecha = fecha;
    }

    public Valoracion() {
    }

    public int getIdValoracion() {
        return idValoracion;
    }

    public void setIdValoracion(int idValoracion) {
        this.idValoracion = idValoracion;
    }

    public Contrato getContrato() {
        return contrato;
    }

    public void setContrato(Contrato contrato) {
        this.contrato = contrato;
    }

    public Double getContribucion() {
        return contribucion;
    }

    public void setContribucion(Double contribucion) {
        this.contribucion = contribucion;
    }

    public int getEscalaObtenida() {
        return escalaObtenida;
    }

    public void setEscalaObtenida(int escalaObtenida) {
        this.escalaObtenida = escalaObtenida;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getPonderacion() {
        return ponderacion;
    }

    public void setPonderacion(int ponderacion) {
        this.ponderacion = ponderacion;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Variable getVariable() {
        return variable;
    }

    public void setVariable(Variable variable) {
        this.variable = variable;
    }
    
    
}
