package pojo;
// Generated Nov 3, 2011 11:28:07 PM by Hibernate Tools 3.2.1.GA


import daoImpl.AccesoDaoImpl;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private Integer idUsuario;
     private Empresa empresa;
     private String nombre;
     private String cargo;
     private String telefono;
     private String correo;
     private String direccion;
     private int tipoUsuario;
     private String password;
     private Integer estado;
     private Set contratos = new HashSet(0);
     private Set accesos = new HashSet(0);
     private Set respItems = new HashSet(0);
     private Set delegacionIndiUsus = new HashSet(0);
     private Set asignacionCapaContras = new HashSet(0);

    public Usuario() {
    }

    public Usuario(int idUsuario){
        this.idUsuario = idUsuario;
    }
	
    public Usuario(String nombre, String correo, int tipoUsuario, String password) {
        this.nombre = nombre;
        this.correo = correo;
        this.tipoUsuario = tipoUsuario;
        this.password = password;
    }
    public Usuario(Empresa empresa, String nombre, String cargo, String telefono, String correo, String direccion, int tipoUsuario, String password, Integer estado, Set contratos, Set accesos, Set respItems, Set delegacionIndiUsus, Set asignacionCapaContras) {
       this.empresa = empresa;
       this.nombre = nombre;
       this.cargo = cargo;
       this.telefono = telefono;
       this.correo = correo;
       this.direccion = direccion;
       this.tipoUsuario = tipoUsuario;
       this.password = password;
       this.estado = estado;
       this.contratos = contratos;
       this.accesos = accesos;
       this.respItems = respItems;
       this.delegacionIndiUsus = delegacionIndiUsus;
       this.asignacionCapaContras = asignacionCapaContras;
    }
   
    public Integer getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
    public Empresa getEmpresa() {
        return this.empresa;
    }
    
    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getCargo() {
        return this.cargo;
    }
    
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getCorreo() {
        return this.correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public int getTipoUsuario() {
        return this.tipoUsuario;
    }
    
    public void setTipoUsuario(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Integer getEstado() {
        return this.estado;
    }
    
    public void setEstado(Integer estado) {
        this.estado = estado;
    }
    public Set getContratos() {
        return this.contratos;
    }
    
    public void setContratos(Set contratos) {
        this.contratos = contratos;
    }
    public Set getAccesos() {
        return this.accesos;
    }
    
    public void setAccesos(Set accesos) {
        this.accesos = accesos;
    }
    public Set getRespItems() {
        return this.respItems;
    }
    
    public void setRespItems(Set respItems) {
        this.respItems = respItems;
    }
    public Set getDelegacionIndiUsus() {
        return this.delegacionIndiUsus;
    }
    
    public void setDelegacionIndiUsus(Set delegacionIndiUsus) {
        this.delegacionIndiUsus = delegacionIndiUsus;
    }
    public Set getAsignacionCapaContras() {
        return this.asignacionCapaContras;
    }
    
    public void setAsignacionCapaContras(Set asignacionCapaContras) {
        this.asignacionCapaContras = asignacionCapaContras;
    }
   public JRDataSource getAccesoDS(){
        List<Acceso> acc = new ArrayList<Acceso>();
        AccesoDaoImpl adi = new AccesoDaoImpl();
        acc = adi.findByUser(this);
         return new JRBeanCollectionDataSource(acc);
    }



}


