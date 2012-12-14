/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author Mendieta
 */
public class valoracionVCE implements java.io.Serializable {
    private Integer idValoracion;
    private Integer idContrato;
    private Integer idIndicador;
    private String nombre;
    private Integer ponderacion;
    private Double contribucion;
    private Integer escalaObtenida;
    private String esc0;
    private String esc1;
    private String esc2;
    private String esc3;
    private String esc4;

    

    public valoracionVCE() {
    }

    public valoracionVCE(Integer idValoracion, Integer idContrato, Integer idIndicador, String nombre, Integer ponderacion, Double contribucion, Integer escalaObtenida, String esc0, String esc1, String esc2, String esc3, String esc4) {
        this.idValoracion = idValoracion;
        this.idContrato = idContrato;
        this.idIndicador = idIndicador;
        this.nombre = nombre;
        this.ponderacion = ponderacion;
        this.contribucion = contribucion;
        this.escalaObtenida = escalaObtenida;
        this.esc0 = esc0;
        this.esc1 = esc1;
        this.esc2 = esc2;
        this.esc3 = esc3;
        this.esc4 = esc4;
    }

    public Integer getIdIndicador() {
        return idIndicador;
    }

    public void setIdIndicador(Integer idIndicador) {
        this.idIndicador = idIndicador;
    }
   
    public Double getContribucion() {
        return contribucion;
    }

    public void setContribucion(Double contribucion) {
        this.contribucion = contribucion;
    }

    public String getEsc0() {
        return esc0;
    }

    public void setEsc0(String esc0) {
        this.esc0 = esc0;
    }

    public String getEsc1() {
        return esc1;
    }

    public void setEsc1(String esc1) {
        this.esc1 = esc1;
    }

    public String getEsc2() {
        return esc2;
    }

    public void setEsc2(String esc2) {
        this.esc2 = esc2;
    }

    public String getEsc3() {
        return esc3;
    }

    public void setEsc3(String esc3) {
        this.esc3 = esc3;
    }

    public String getEsc4() {
        return esc4;
    }

    public void setEsc4(String esc4) {
        this.esc4 = esc4;
    }

    public Integer getEscalaObtenida() {
        return escalaObtenida;
    }

    public void setEscalaObtenida(Integer escalaObtenida) {
        this.escalaObtenida = escalaObtenida;
    }

    public Integer getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(Integer idContrato) {
        this.idContrato = idContrato;
    }

    

    public Integer getIdValoracion() {
        return idValoracion;
    }

    public void setIdValoracion(Integer idValoracion) {
        this.idValoracion = idValoracion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getPonderacion() {
        return ponderacion;
    }

    public void setPonderacion(Integer ponderacion) {
        this.ponderacion = ponderacion;
    }
    
}
