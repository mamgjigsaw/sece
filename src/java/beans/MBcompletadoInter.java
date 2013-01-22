/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import daoImpl.AsignacionCapaContraDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.EmpresaCompletaDaoImpl;
import daoImpl.EmpresaDaoImpl;
import daoImpl.ProductoDaoImpl;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;
import pojo.Contrato;
import pojo.Empresa;
import pojo.EmpresaCompleta;
import pojo.Producto;
import pojo.Usuario;

/**
 *
 * @author Dave
 */
@ManagedBean(name = "mbcompletado")
@ViewScoped
public class MBcompletadoInter implements java.io.Serializable{
    
    //datos pasados por url
    private  int idempresa, idcontrato;
     
    private EmpresaCompletaDaoImpl ecdi;
    private EmpresaDaoImpl edi = new EmpresaDaoImpl();
    private Empresa emp;
    private ContratoDaoImpl cdi = new ContratoDaoImpl();
    private Contrato contra;
    private Usuario usuario,usuarioCapacitador;
   
    private String prueba;
    
    private ProductoDaoImpl pdi;
    
    
    private Boolean empaque;
  
    private EmpresaCompleta ec = new EmpresaCompleta();
    
    //para años del combobox
    private ArrayList<SelectItem> years = new ArrayList<SelectItem>();    
    final int initialYear = 1900;
    final int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    
    private ArrayList<SelectItem> sectores = new ArrayList<SelectItem>();    
    
    ///datos nuevos a llenar
    private String razonSocial;

    private Producto producto = new Producto();
    private List<Producto> productos = new ArrayList<Producto>();
    
    /** Creates a new instance of MBcompletadoInter */
    public MBcompletadoInter() {
       
    }

    public MBcompletadoInter(int empresa) {
        edi = new EmpresaDaoImpl();
        emp = edi.findByID(empresa);
    }

    @PostConstruct
    public void init() {
        
        //cargar los datos del http request
        //idcontrato = 15 idempresa=2
        HttpServletRequest request=(HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
        setIdempresa(Integer.parseInt(request.getParameter("idempresa")));
        setIdcontrato(Integer.parseInt(request.getParameter("idcontrato")));

        edi = new EmpresaDaoImpl();
        emp = edi.findByID(getIdempresa());
        cdi = new ContratoDaoImpl();
        contra = cdi.findById(getIdcontrato());
        
        emp.setNombre(emp.getNombre());
        emp.setDescripcion(emp.getDescripcion());
        emp.setTelefono(emp.getTelefono());
        emp.setDireccion(emp.getDireccion());
        emp.setCiudad(emp.getCiudad());
        for (int year = initialYear; year <= currentYear; year++) {
            years.add(new SelectItem(year, String.valueOf(year)));
        }
        agregarSectores();
        //assignar datos del contacto
        usuario = new Usuario();
        usuario.setNombre(contra.getUsuario().getNombre());
        usuario.setCargo(contra.getUsuario().getCargo());
        usuario.setCorreo(contra.getUsuario().getCorreo());
        usuario.setTelefono(contra.getUsuario().getTelefono());
        
        //Cargar Capacitador del Contrato        
        AsignacionCapaContraDaoImpl daoAsignacion = new AsignacionCapaContraDaoImpl();
        usuarioCapacitador = daoAsignacion.findUsByContra(contra);

    }
     
    public void reiniciar(){
        producto = new Producto();
        System.out.println("producto agregado");
    }

    public String guardarEC(){
        
        System.out.print("Guardando");
        
        pdi = new ProductoDaoImpl();
        Iterator<Producto> it = productos.iterator();
        while(it.hasNext()){
            Producto producto2 = it.next();
            producto2.setEmpresa(emp);
            pdi.create(producto2); 
        }
        
        ecdi = new EmpresaCompletaDaoImpl();        
        ec.setContrato(contra);
        //EmpresaCompleta ec2 = new EmpresaCompleta( usuario, "Femsa", "ruc",  "empresa@correo.com", "www.empresa.com", 1998, "Agropecuario", "fabricante", "1er", "2da", 5, 4, 4, "oferta", "empaque", "comentarios sobre antes", "comentarios ahora");
//(Usuario usuario, String razonSocial, String ruc, String correo, String web, Integer anioCreacion, String sector, String nivelEmpresa, String actividadPrimaria, String actividadSecundaria, Integer numeroEmpleadosPermanente, Integer numeroEmpleadosTemp, Integer facturacionAnual, String ofertaPrincipal, String empaqueProducto, String comentariosAnterior, String comentarios) {
        
        ecdi.create(ec);
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,"Guardado", "Datos Satisfactoriamente Guardados!"));  
        return "";
    }
      
    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    
    public EmpresaDaoImpl getEdi() {
        return edi;
    }

    public void setEdi(EmpresaDaoImpl edi) {
        this.edi = edi;
    }

    public Empresa getEmp() {
        return emp;
    }

    public void setEmp(Empresa emp) {
        this.emp = emp;
    }

    
    public ArrayList<SelectItem> getYears() {
        return years;
    }

    public void setYears(ArrayList<SelectItem> years) {
        this.years = years;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public List<Producto> getProductos() {
        return productos;
    }

    public void setProductos(List<Producto> productos) {
        this.productos = productos;
    }

    public Boolean getEmpaque() {
        return empaque;
    }

    public void setEmpaque(Boolean empaque) {
        this.empaque = empaque;
    }

    public EmpresaCompleta getEc() {
        return ec;
    }

    public void setEc(EmpresaCompleta ec) {
        this.ec = ec;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    private void agregarSectores() {
        
        sectores.add(new SelectItem("Agropecuario (sin transformacion)","Agropecuario (sin transformación)"));
        sectores.add(new SelectItem("Forestal y/o maderera","Forestal y/o maderera"));
        sectores.add(new SelectItem("Agroindustrial (con transformacion a partir de productos agricolas o ganaderos)","Agroindustrial (con transformación a partir de productos agrícolas o ganaderos)"));
        sectores.add(new SelectItem("Industria extractiva o transformacion primaria (bienes intermedios)","Industria extractiva o transformación primaria (bienes intermedios)"));
        sectores.add(new SelectItem("Industria de transformacion secundaria (bienes de equipo o consumo terminados)","Industria de transformación secundaria (bienes de equipo o consumo terminados)"));
        sectores.add(new SelectItem("Artesanias","Artesanías"));
        sectores.add(new SelectItem("Distribucion y logistica","Distribución y logística"));
        sectores.add(new SelectItem("Servicios empresariales","Servicios empresariales"));
        sectores.add(new SelectItem("Servicios personales","Servicios personales"));
        sectores.add(new SelectItem("Hosteleria, restauracion y Turismo","Hostelería, restauración y Turismo"));
    }

    public ArrayList<SelectItem> getSectores() {
        return sectores;
    }

    public void setSectores(ArrayList<SelectItem> sectores) {
        this.sectores = sectores;
    }

    public int getIdempresa() {
        return idempresa;
    }

    public void setIdempresa(int idempresa) {
        this.idempresa = idempresa;
    }

    public int getIdcontrato() {
        return idcontrato;
    }

    public void setIdcontrato(int idcontrato) {
        this.idcontrato = idcontrato;
    }

    public String getPrueba() {
        return prueba;
    }

    public void setPrueba(String prueba) {
        this.prueba = prueba;
    }

    public Usuario getUsuarioCapacitador() {
        return usuarioCapacitador;
    }

    public void setUsuarioCapacitador(Usuario usuarioCapacitador) {
        this.usuarioCapacitador = usuarioCapacitador;
    }
}
