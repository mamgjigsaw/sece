/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AsignacionSugItemDaoImpl;
import daoImpl.EscalaDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.SugerenciaDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.VariableDaoImpl;
import pojo.AsignacionSugItem;
import pojo.Escala;
import pojo.Indicador;
import pojo.Item;
import pojo.Sugerencia;
import pojo.Usuario;
import pojo.Variable;

/**
 *
 * @author Mendieta
 */
public class instrumentoAdministrador {
    public instrumentoAdministrador(){         
   }
    
    public void newIndicador(String indicador, String contribucion){
        Indicador ind = new Indicador(indicador, Double.parseDouble(contribucion), true, null, null);
        IndicadorDaoImpl idi = new IndicadorDaoImpl();
        idi.create(ind);
    }
    public void newVariable(String var, String idI, String pon, String esc4, String esc3, String esc2, String esc1, String esc0, int rMenor4, int rMayor4, int rMenor3, int rMayor3, int rMenor2, int rMayor2, int rMenor1, int rMayor1,int rMenor0, int rMayor0){
            Indicador indi = new Indicador();
            IndicadorDaoImpl idi = new IndicadorDaoImpl();
            Integer a = 4;
            Integer b = 3;
            Integer c = 2;
            Integer d = 1;
            Integer e = 0;
            
            indi = idi.findById(Integer.parseInt(idI));
            
            Variable v = new Variable(indi, var, Integer.parseInt(pon), true, null, null);
            VariableDaoImpl vdi = new VariableDaoImpl();
            vdi.create(v);
            Escala escala = new Escala(v, esc4, a, rMayor4, rMenor4);
            EscalaDaoImpl edi = new EscalaDaoImpl();
            edi.create(escala);
            escala = new Escala(v, esc3, b, rMayor3, rMenor3);
            edi.create(escala);
            escala = new Escala(v, esc2, c, rMayor2, rMenor2);
            edi.create(escala);
            escala = new Escala(v, esc1, d, rMayor1, rMenor1);
            edi.create(escala);
            escala = new Escala(v, esc0, e, rMayor0, rMenor0);
            edi.create(escala);
    }
    public void newItem(String item, String varItem){
             Variable v = new Variable();
             VariableDaoImpl vdi = new VariableDaoImpl();
             v = vdi.findById(Integer.parseInt(varItem));
             Item ite = new Item(v, item, 1, null, null, null);
             ItemDaoImpl idi = new ItemDaoImpl();
             idi.create(ite);
    }
    
    public void newSugerencia(String sug, String items[]){
        Sugerencia s = new Sugerencia(sug, null, null);
        SugerenciaDaoImpl sdi = new SugerenciaDaoImpl();
        sdi.create(s);
        
        for(int i=0; i<items.length;i++ ){
           int id = Integer.parseInt(items[i]);
           Item item = new Item();
           ItemDaoImpl idi = new ItemDaoImpl();
           item = idi.findById(id);
           AsignacionSugItem asi = new AsignacionSugItem(s, item);
           AsignacionSugItemDaoImpl asidi = new AsignacionSugItemDaoImpl();
           asidi.create(asi);
        }           
    }
    public void newAsigSug(int ids, int idI){
           Sugerencia s = new Sugerencia();
           SugerenciaDaoImpl sdi = new SugerenciaDaoImpl();
           s = sdi.findById(ids);
           Item i = new Item();
           ItemDaoImpl idi = new ItemDaoImpl();
           i = idi.findById(idI);
           AsignacionSugItem asi = new AsignacionSugItem(s, i);
           AsignacionSugItemDaoImpl asidi = new AsignacionSugItemDaoImpl();
           asidi.create(asi);
    }
}
