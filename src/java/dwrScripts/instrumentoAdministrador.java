/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AsignacionSugItemDaoImpl;
import daoImpl.EscalaDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.NoticiasDaoImpl;
import daoImpl.SugerenciaDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.VariableDaoImpl;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import pojo.AsignacionSugItem;
import pojo.Escala;
import pojo.Indicador;
import pojo.Item;
import pojo.Noticias;
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
    public int newNota(int id, String titulo, String desc, String fecha) throws ParseException{
        int resp = 0;     
        Usuario u = new Usuario();
             UsuarioDaoImpl udi = new UsuarioDaoImpl();
             u = udi.findById(id);
             SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
             Date dt = new Date();
             //Timestamp ts1 = (Timestamp) sdf.parse(fecha);
             Timestamp ts = new Timestamp(dt.getTime());
            Date d = sdf.parse(fecha);
             Noticias n = new Noticias(titulo, desc, d, ts , u);
             NoticiasDaoImpl ndi = new NoticiasDaoImpl();
             ndi.create(n);
             resp = n.getIdNoticias();
             return resp;
    }
    
    public int newIndicador(String indicador, String contribucion){
        int resp = 0;
        Indicador ind = new Indicador(indicador, Double.parseDouble(contribucion), true, null, null);
        IndicadorDaoImpl idi = new IndicadorDaoImpl();
        idi.create(ind);
        resp = ind.getIdIndicador();
        return resp;
    }
    public int[] newVariable(String var, String idI, String pon, String esc4, String esc3, String esc2, String esc1, String esc0, int rMenor4, int rMayor4, int rMenor3, int rMayor3, int rMenor2, int rMayor2, int rMenor1, int rMayor1,int rMenor0, int rMayor0, String s4, String s3, String s2, String s1, String s0){
        int ids[] = new int[6];    
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
            ids[0] = v.getIdVariable();
            Escala escala = new Escala(v, esc4, a, rMayor4, rMenor4,s4);
            EscalaDaoImpl edi = new EscalaDaoImpl();
            edi.create(escala);
            ids[1] = escala.getIdEscala();
            escala = new Escala(v, esc3, b, rMayor3, rMenor3,s3);
            edi.create(escala);
            ids[2] = escala.getIdEscala();
            escala = new Escala(v, esc2, c, rMayor2, rMenor2,s2);
            edi.create(escala);
            ids[3] = escala.getIdEscala();
            escala = new Escala(v, esc1, d, rMayor1, rMenor1,s1);
            edi.create(escala);
            ids[4] = escala.getIdEscala();
            escala = new Escala(v, esc0, e, rMayor0, rMenor0,s0);
            edi.create(escala);
            ids[5] = escala.getIdEscala();
            return ids;
    }
   public int newItem(String item, String varItem){
             int id;
             Variable v = new Variable();
             VariableDaoImpl vdi = new VariableDaoImpl();
             v = vdi.findById(Integer.parseInt(varItem));
             Item ite = new Item(v, item, 1, null, null, null);
             ItemDaoImpl idi = new ItemDaoImpl();
             idi.create(ite);
             id = ite.getIdItem();
             return id;
    }
    
    public int[] newSugerencia(String sug, String items[]){
        Sugerencia s = new Sugerencia(sug, null, null);
        SugerenciaDaoImpl sdi = new SugerenciaDaoImpl();
        sdi.create(s);
        int ids[] = new int[items.length + 1];
        ids[0] = s.getIdSugerencia();
        for(int i=0; i<items.length;i++ ){
           int id = Integer.parseInt(items[i]);
           Item item = new Item();
           ItemDaoImpl idi = new ItemDaoImpl();
           item = idi.findById(id);
           AsignacionSugItem asi = new AsignacionSugItem(s, item);
           AsignacionSugItemDaoImpl asidi = new AsignacionSugItemDaoImpl();
           asidi.create(asi);
           ids[i+1]= asi.getIdAsignSug();
        }           
        return ids;
    }
   /*public void newAsigSug(int ids, int idI){
           Sugerencia s = new Sugerencia();
           SugerenciaDaoImpl sdi = new SugerenciaDaoImpl();
           s = sdi.findById(ids);
           Item i = new Item();
           ItemDaoImpl idi = new ItemDaoImpl();
           i = idi.findById(idI);
           AsignacionSugItem asi = new AsignacionSugItem(s, i);
           AsignacionSugItemDaoImpl asidi = new AsignacionSugItemDaoImpl();
           asidi.create(asi);
    }*/
}
