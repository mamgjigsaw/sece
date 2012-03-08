/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.util.Date;

/**
 *
 * @author mamg
 */
public class EmpresasContratos implements java.io.Serializable{
    private Integer idEmpresa;
    private String empresaNombre;
    private String descripcion;
    private String telefono;
    private String ciudad;
    private String direccion;
    private String contactoNombre;
    private String contactoCargo;
    private String contactoTelefono;
    private String contactoCorreo;
    private Integer contratoEstado;
    private Date contratoFecha;
    private Date contratoFechaFinalizo;

    public EmpresasContratos() {
    }

    public EmpresasContratos(Integer idEmpresa, String empresaNombre, String descripcion, String telefono, String ciudad, String direccion, String contactoNombre, String contactoCargo, String contactoTelefono, String contactoCorreo, Integer contratoEstado, Date contratoFecha, Date contratoFechaFinalizo) {
        this.idEmpresa = idEmpresa;
        this.empresaNombre = empresaNombre;
        this.descripcion = descripcion;
        this.telefono = telefono;
        this.ciudad = ciudad;
        this.direccion = direccion;
        this.contactoNombre = contactoNombre;
        this.contactoCargo = contactoCargo;
        this.contactoTelefono = contactoTelefono;
        this.contactoCorreo = contactoCorreo;
        this.contratoEstado = contratoEstado;
        this.contratoFecha = contratoFecha;
        this.contratoFechaFinalizo = contratoFechaFinalizo;
    }

    
    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getContactoCargo() {
        return contactoCargo;
    }

    public void setContactoCargo(String contactoCargo) {
        this.contactoCargo = contactoCargo;
    }

    public String getContactoCorreo() {
        return contactoCorreo;
    }

    public void setContactoCorreo(String contactoCorreo) {
        this.contactoCorreo = contactoCorreo;
    }

    public String getContactoNombre() {
        return contactoNombre;
    }

    public void setContactoNombre(String contactoNombre) {
        this.contactoNombre = contactoNombre;
    }

    public String getContactoTelefono() {
        return contactoTelefono;
    }

    public void setContactoTelefono(String contactoTelefono) {
        this.contactoTelefono = contactoTelefono;
    }

    public Date getContratoFecha() {
        return contratoFecha;
    }

    public void setContratoFecha(Date contratoFecha) {
        this.contratoFecha = contratoFecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmpresaNombre() {
        return empresaNombre;
    }

    public void setEmpresaNombre(String empresaNombre) {
        this.empresaNombre = empresaNombre;
    }

    public Integer getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(Integer idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Integer getContratoEstado() {
        return contratoEstado;
    }

    public void setContratoEstado(Integer contratoEstado) {
        this.contratoEstado = contratoEstado;
    }

    public Date getContratoFechaFinalizo() {
        return contratoFechaFinalizo;
    }

    public void setContratoFechaFinalizo(Date contratoFechaFinalizo) {
        this.contratoFechaFinalizo = contratoFechaFinalizo;
    }
    
}
