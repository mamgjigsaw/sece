/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.util.Date;

/**
 *
 * @author Mendieta
 */
public class Noticias implements java.io.Serializable  {
    private Integer idNoticias;
    private String titulo;
    private String descripcion;
    private Date fecha_evento;
    private Date fecha_creacion;
    private Usuario usuario;
    
    public Noticias(String titulo, String descripcion, Date fecha_evento, Date fecha_creacion, Usuario usuario) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fecha_evento = fecha_evento;
        this.fecha_creacion = fecha_creacion;
        this.usuario = usuario;
    }

    public Noticias() {
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(Date fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public Date getFecha_evento() {
        return fecha_evento;
    }

    public void setFecha_evento(Date fecha_evento) {
        this.fecha_evento = fecha_evento;
    }

    public Integer getIdNoticias() {
        return idNoticias;
    }

    public void setIdNoticias(Integer idNoticias) {
        this.idNoticias = idNoticias;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
    
}
