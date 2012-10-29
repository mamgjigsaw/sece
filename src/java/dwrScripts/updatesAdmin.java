/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AsignacionCapaContraDaoImpl;
import daoImpl.AsignacionSugItemDaoImpl;
import daoImpl.EscalaDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.NoticiasDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.VariableDaoImpl;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import pojo.AsignacionCapaContra;
import pojo.AsignacionSugItem;
import pojo.Escala;
import pojo.Indicador;
import pojo.Item;
import pojo.Noticias;
import pojo.Usuario;
import pojo.Variable;

/**
 *
 * @author Mendieta
 */
public class updatesAdmin {
  
     public updatesAdmin(){
}
     public String getCapacitadores(){
        String resultado = "";
        UsuarioDaoImpl udi = new UsuarioDaoImpl();
                
       List<Usuario> capacitadores = udi.uCapacitadores();  
       Iterator<Usuario> itc = capacitadores.iterator();
       Usuario ucap = new Usuario();
       while(itc.hasNext()){
        ucap = itc.next();        
            AsignacionCapaContraDaoImpl accdi = new AsignacionCapaContraDaoImpl();
            List<AsignacionCapaContra> numEmp = accdi.findAllByIdUsuarioCapacitador(ucap);
            int numero = 0;
           if(numEmp.isEmpty()){
                //sigue valiendo 0
            }
             else {
            numero = numEmp.size();   
            }
           String s = String.valueOf(numero);  
  
        String idc = ucap.getIdUsuario().toString();
        resultado +="<tr id="+idc+">"
                   + "<td>"+ucap.getNombre()+"</td>"
                   + "<td>"+ucap.getTelefono()+"</td>"
                   + "<td>"+ucap.getCorreo()+"</td>"
                   + "<td>"+ucap.getDireccion()+"</td>"
                   + "<td>"+s+"</td>"
                   + "<td>";
                   if (ucap.getEstado() == 1 || ucap.getEstado() == 2)
                    resultado += "<img style='cursor: pointer' class='imgdel' src='images/icon_delete.png' alt='Desactivar' />";
                   if(ucap.getEstado() == 0)
                    resultado += "<img style='cursor: pointer' class='imgapp' src='images/icon_approve.png' alt='Activar' /></a>";
                   resultado += "</td> </tr>";                    
       }       
        return resultado;
     }
     
      public int[] deleteCapacitador(String idc){
                int r[] = new int[2];
                Usuario usu = new Usuario();
                UsuarioDaoImpl udim = new UsuarioDaoImpl();
                usu = udim.findById(Integer.parseInt(idc));
                usu.setEstado(0);
                udim.update(usu);
                r[0] = 1;
                r[1] = usu.getIdUsuario();
                return r;
    }
      public void activateCapacitador(String idc){
          Usuario usu = new Usuario();
          UsuarioDaoImpl udim = new UsuarioDaoImpl();
          usu = udim.findById(Integer.parseInt(idc));
          usu.setEstado(1);
          udim.update(usu);
      }
      
      public void deleteIndicador(String idi){
           Indicador indi = new Indicador();
           IndicadorDaoImpl idimp = new IndicadorDaoImpl();          
           indi = idimp.findById(Integer.parseInt(idi));
           indi.setEstado(false);
           idimp.update(indi);
      }
      public void deleteVariable(int id){
              Variable v = new Variable();
              VariableDaoImpl vdi = new VariableDaoImpl();
               v = vdi.findById(id);
               v.setEstado(false);
               vdi.update(v);
      }
      
      public void deleteItem(int id){
              Item i = new Item();
              ItemDaoImpl itdi = new ItemDaoImpl();
              i = itdi.findById(id);
              i.setEstado(0);
              itdi.update(i);
      }
      public void updateIndicador(int idInd, String Indi, Double cont){
           Indicador indi = new Indicador();
           IndicadorDaoImpl idimp = new IndicadorDaoImpl();          
           indi = idimp.findById(idInd);
           indi.setNombre(Indi);
           indi.setContribucion(cont);
           idimp.update(indi);
      }
      public void updateVariables(int id, String var, int pon, int idI){
             Indicador i = new Indicador();
                     IndicadorDaoImpl idi = new IndicadorDaoImpl();
                     i = idi.findById(idI);
                     Variable v = new Variable();
                     VariableDaoImpl vdi = new VariableDaoImpl();
                     v = vdi.findById(id);
                     v.setIndicador(i);
                     v.setNombre(var);
                     v.setPonderacion(pon);
                     vdi.update(v);
      }
      public void updateItem(int id, String ite, int idv){
                 Item i = new Item();
                 ItemDaoImpl idi = new ItemDaoImpl();
                 i = idi.findById(id);
                 Variable v = new Variable();
                 VariableDaoImpl vdi = new VariableDaoImpl();
                 v = vdi.findById(idv);
                 i.setVariable(v);
                 i.setDescripcion(ite);
                 idi.update(i);
      }//checar
      public void updateEscala(int id, String esc, int rm, int rM){
           Escala e = new Escala();
           EscalaDaoImpl edi = new EscalaDaoImpl();
           e = edi.findById(id);
           e.setDescripcion(esc);
           e.setRangoMenor(rm);
           e.setRangoMayor(rM);
           edi.update(e);          
      }
      public void deleteAsignacionS(int id){
          AsignacionSugItem asi = new AsignacionSugItem();
          AsignacionSugItemDaoImpl asidi = new AsignacionSugItemDaoImpl();
         asi = asidi.findById(id);
         asidi.delete(asi);
      }
      public void deleteNota(int id){
          Noticias noti = new Noticias();
          NoticiasDaoImpl notDI = new NoticiasDaoImpl();
          noti = notDI.findbyId(id);
          notDI.delete(noti);
                 
      }
      public void updateNoticias(int id, String titulo, String descripcion, String fecha) throws ParseException{
         Noticias noti = new Noticias();
         NoticiasDaoImpl ndi = new NoticiasDaoImpl();
         noti = ndi.findbyId(id);
         noti.setTitulo(titulo);
         noti.setDescripcion(descripcion);
         SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
         Date dt = new Date();
         dt = sdf.parse(fecha);
         noti.setFecha_evento(dt);
         ndi.update(noti);
      }
}
