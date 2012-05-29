/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AccesoDaoImpl;
import daoImpl.AsignacionCapaContraDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.DelegacionIndiUsuDaoImpl;
import daoImpl.EmpresaDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.RespItemDaoImpl;
import daoImpl.UsuarioDaoImpl;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import pojo.AsignacionCapaContra;
import pojo.Contrato;
import pojo.DelegacionIndiUsu;
import pojo.Empresa;
import pojo.Usuario;

/**
 *
 * @author Dave
 */
public class initCapacitadores {

    public initCapacitadores() {
    }
    
    public String obtenerURLSist() throws IOException{
    String url;
    Properties archivoConf = new Properties();
    archivoConf.load(this.getClass().getClassLoader().getResourceAsStream("/micelanea.properties"));
    url = (String) archivoConf.getProperty("seceUrl");
    return url;
    }
    
    public String insertarVideoChat(int idcontrato,int idusuario){
        ContratoDaoImpl cdi = new ContratoDaoImpl();
        Contrato contra = cdi.findById(idcontrato);
        
        //para obtener el nombre del usuario publicador        
        UsuarioDaoImpl udi = new UsuarioDaoImpl();
        Usuario user = udi.findById(idusuario);
        String nombreUsuario = user.getNombre();
        DelegacionIndiUsuDaoImpl doii = new DelegacionIndiUsuDaoImpl();
        List<DelegacionIndiUsu> delegados = doii.delegacionxContrato(contra);
        DelegacionIndiUsu delegado = new DelegacionIndiUsu();
        Iterator<DelegacionIndiUsu> it = delegados.iterator();
        String[] idUsuarios = new String [10];         
        int i=0;        
            while(it.hasNext()){
                delegado = it.next();                
                idUsuarios[i] = String.valueOf(delegado.getUsuario().getIdUsuario());
                i++;
            }//fin while
        
        String obj = "<object id='Video_Chat' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' "
                + "width='1000' height='625'> <param name='movie' value='resources/swf/publicador.swf?idcontrato="+ idcontrato +"&iduser="+idusuario+"&iduser2="+ idUsuarios[0]+"&iduser3="+ idUsuarios[1]+"&iduser4="+ idUsuarios[2]+"&nomUser="+ nombreUsuario+"'/>"
                + " <param name='quality' value='high'/> <embed src='resources/swf/publicador.swf?idcontrato="+ idcontrato +"&iduser="+idusuario+"&iduser2="+ idUsuarios[0]+"&iduser3="+ idUsuarios[1]+"&iduser4="+ idUsuarios[2]+"&nomUser="+ nombreUsuario+"' "
                + "quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='1000' height='625'></embed> </object>";
        return obj;
    }
    
    public String getDelegadoxContrato(int idcontrato){
        String resultado="";
         ContratoDaoImpl cdi = new ContratoDaoImpl();
        Contrato contra = cdi.findById(idcontrato);
         DelegacionIndiUsuDaoImpl doii = new DelegacionIndiUsuDaoImpl();
        List<DelegacionIndiUsu> delegados = doii.delegacionxContrato(contra);
        DelegacionIndiUsu delegado;
        Iterator<DelegacionIndiUsu> it = delegados.iterator();
        
        AccesoDaoImpl adi = new AccesoDaoImpl();
        Timestamp acces;
        if (it.hasNext()){
            resultado = "<table border='0' id='resultTable' width ='100%'><tr> <th>Delegado</th> <th>Ultimo Acceso</th> <th>Correo</th> <th>On-Line</th> </tr>";
            
             while (it.hasNext()){                 
                 delegado = it.next();            
                 acces = adi.fechaUltimoAcceso(delegado.getUsuario());    
                 resultado +="<tr style='text-align:center;'><td>"+delegado.getUsuario().getNombre()+"</td>";
                 resultado +="<td>";
             if (acces == null)
                 resultado +="(No hay registros de accesos)";
             else
                 resultado +=acces;
             resultado +="</td>";
             resultado +="<td>"+delegado.getUsuario().getCorreo()+"</td>";
             resultado +="<td>";
             if (delegado.getUsuario().getEstado() == 1)
                resultado +="<img src='images/offline-user-icon.png' title ='Usuario no Conectado' alt='Usuario no Conectado'/>";
             else if (delegado.getUsuario().getEstado() == 2)
                 resultado +="<img src='images/user-online-icon.png' title ='Usuario Conectado' alt='Usuario Conectado'/>";
             else if (delegado.getUsuario().getEstado() == 3)
                 resultado +="<img src='images/video-chat-icon.png' title ='Usuario en Videollamada' alt='Usuario en Videollamada'/>";
             else if (delegado.getUsuario().getEstado() == 4)
                 resultado +="<img src='images/remove-user-icon.png' title ='Usuario dado de baja' alt='Usuario dado de baja'/>";
             resultado +="</td></tr>";
             
             }//fin while
             resultado+="</table>";
             }//fin if
        
        return resultado;
    }
    
    public String empresaNoAsignada(int idempresa){
        String resultado="";
        EmpresaDaoImpl empi = new EmpresaDaoImpl();
        Empresa emp = empi.findByID(idempresa);
        resultado = "<table border='0' width ='100%'>"
                + "<tr><th width='505px'>Direcci&oacute;n</th><th width='259px'>Tel&eacute;fono</th><th width='184px'>Acci&oacute;n</th></tr>"
                + "<tr style='text-align:center;'>"
                + "<td>" + emp.getDireccion() + "</td>"
                + "<td>" + emp.getTelefono() + "</td>"
                + "<td> <img id='btnImgAprobar' src='images/icon_approve.png' alt='Aprobar' style='cursor:pointer;'/> <img id='btnImgEliminar' src='images/icon_delete.png' alt='Eliminar' style='cursor:pointer;'/>  </td>"
                + "</tr></table>";
        return resultado;
    }
    
    public String getListaENA(int idCapacitador){
           String resultado="";
                       
           Iterator<AsignacionCapaContra> it =  listaConxCapac(idCapacitador);
           
           AsignacionCapaContra acaco;       
           ContratoDaoImpl cdi = new ContratoDaoImpl();
           Contrato contra;
           UsuarioDaoImpl udi = new UsuarioDaoImpl();
           EmpresaDaoImpl edi = new EmpresaDaoImpl();
           Empresa emp ;
           Usuario contacto ;
            
           while (it.hasNext()) {
            acaco = it.next();
            
            //estado del contrato activo, contrato de esta empresa actualmente trabajandose,                                    
            if (acaco.getContrato().getEstado() == 0) {
                contra = cdi.findById(acaco.getContrato().getIdContrato());
                contacto = udi.findById(contra.getUsuario().getIdUsuario());
                emp = edi.findByID(contacto.getEmpresa().getIdEmpresa());
                 resultado += "<tr height = '35px'>"
                         + " <td id ='tdEmpresa' style='display:none;'>"+ emp.getIdEmpresa()+"</td>"
                         + " <td> "+ emp.getNombre() +" </td>"
                         + " <td> "+ contacto.getNombre() +" </td>"
                         + "<td>";  
                if (contra.getFechaInicio() == null) 
                    resultado += "(No hay Registros)";
                else 
                    resultado += contra.getFechaInicio();                
                 resultado += "</td>"
                         + "<td id ='tdContrato' style='display:none;'>"+ acaco.getContrato().getIdContrato() +"</td>"
                         + "<td id ='tdContacto' style='display:none;'>"+ contra.getUsuario().getIdUsuario() +"</td>"
                         + "</tr>";
            }//endif
        }//finif finwhile           
           return resultado;
    }
   
    private Iterator<AsignacionCapaContra> listaConxCapac(int idCapacitador){                
           AsignacionCapaContraDaoImpl a = new AsignacionCapaContraDaoImpl();
           UsuarioDaoImpl udi = new UsuarioDaoImpl();  
           Usuario capacitador = udi.findById(idCapacitador);            
           List<AsignacionCapaContra> l = a.findAllByIdUsuarioCapacitador(capacitador);
           Iterator<AsignacionCapaContra> it = l.iterator();
           return it;
    }
    
    private int AvancePorcXcontrato( Contrato contra ){       
        ItemDaoImpl idi = new ItemDaoImpl();
        RespItemDaoImpl ridi = new RespItemDaoImpl();        
        int respxContrato = ridi.ItemRespondidosxContrato(contra);
        //Numero de Items activos
        int numItems = idi.numItemActivos();
       
        return ((respxContrato * 100) / numItems);
    }
    
    public void quitarConFin(int idCapacitador, int diasGracia){        
       Iterator<AsignacionCapaContra> it =  listaConxCapac(idCapacitador);
       AsignacionCapaContra aco ;
       ContratoDaoImpl cdi = new ContratoDaoImpl();
       Contrato contrato ;
       Date finContrato;
       Date tiempoDgracia;
       Calendar c = Calendar.getInstance();
       while (it.hasNext()){
       aco = it.next();
       //if que filtra los contratos vigentes
       if ( AvancePorcXcontrato(aco.getContrato()) == 100){
           contrato = cdi.findById( aco.getContrato().getIdContrato() );
           finContrato = contrato.getFechaTermino();
           c.setTime(finContrato);
           c.add(Calendar.DATE, diasGracia);
           tiempoDgracia = c.getTime();
           if (new Date().after(tiempoDgracia))
           contrato.setEstado(2);//actualiza el estado del contrato a actualizado
           cdi.update(contrato);
       }//fin if 
       }//fin while
       
    }//fin metodo
   
    public  String getEmpreContratoFin(int idCapacitador){
        Iterator<AsignacionCapaContra> it =  listaConxCapac(idCapacitador);
        AsignacionCapaContra aco;       
        EmpresaDaoImpl edi = new EmpresaDaoImpl();
        Empresa emp = new Empresa();
        String resultado = "",nombre = "",fechaFin = "";
        while(it.hasNext()){            
            aco = it.next();            
            if (aco.getContrato().getEstado() == 2){               
                emp = edi.findByID(aco.getContrato().getUsuario().getEmpresa().getIdEmpresa());
                nombre = emp.getNombre();
                if (aco.getContrato().getFechaTermino() == null)
                    fechaFin="(No hay registros)";
                else
                    fechaFin = String.valueOf(aco.getContrato().getFechaTermino());               
                resultado += "<tr> <input type='hidden' value="+aco.getContrato().getIdContrato()+" />  <td height='35'> "+nombre+" </td> <td>"+fechaFin+" </td> </tr>";            
            }//fin if estado
        }//fin while
        return resultado;
    }//fin funcion
    
}