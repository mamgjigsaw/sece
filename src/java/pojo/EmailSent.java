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
public class EmailSent implements java.io.Serializable {
    private Integer idSent;
    private Usuario usuario;
    private Date fecha;
    private String codigo;

    public EmailSent() {
    }

    public EmailSent(Usuario usuario, Date fecha, String codigo) {
        this.usuario = usuario;
        this.fecha = fecha;
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getIdSent() {
        return idSent;
    }

    public void setIdSent(Integer idSent) {
        this.idSent = idSent;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
    
}
