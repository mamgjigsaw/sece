/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AsignacionSugItemDaoImpl;
import daoImpl.EscalaDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.VariableDaoImpl;
import pojo.AsignacionSugItem;
import pojo.Escala;
import pojo.Indicador;
import pojo.Item;
import pojo.Usuario;
import pojo.Variable;

/**
 *
 * @author Mendieta
 */
public class updatesAdmin {
  
     public updatesAdmin(){
}
      public void deleteCapacitador(String idc){
                Usuario usu = new Usuario();
                UsuarioDaoImpl udim = new UsuarioDaoImpl();
                usu = udim.findById(Integer.parseInt(idc));
                usu.setEstado(0);
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
}
