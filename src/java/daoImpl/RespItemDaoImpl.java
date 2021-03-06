/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import dao.daoRespItem;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import pojo.Contrato;
import pojo.Indicador;
import pojo.Item;
import pojo.RespItem;
import pojo.Usuario;
import pojo.Variable;
import util.SavedResult;

/**
 *
 * @author Personal
 */
public class RespItemDaoImpl implements daoRespItem{

    private SessionFactory sf;
    private Session s;
    private RespItem ri;

    public RespItemDaoImpl()
    {
        sf = util.HibernateUtil.getSessionFactory();
}
    @Override
    public RespItem findByContrato(int id_contrato) {
        s = sf.getCurrentSession();

        if(id_contrato <0)return null;
        s.beginTransaction();
        ri = (RespItem)s.get(RespItem.class, id_contrato);
        s.getTransaction().commit();

        return ri;
    }

    @Override
    public void create(RespItem object) {
        s = sf.getCurrentSession();
        if(object == null)return;
        s.beginTransaction();
        s.save(object);
        s.getTransaction().commit();

    }

    @Override
    public void delete(RespItem object) {
         s = sf.getCurrentSession();
        if(object == null)return;
        s.beginTransaction();
        s.delete(object);
        s.getTransaction().commit();

    }

    @Override
    public void update(RespItem object) {
         s = sf.getCurrentSession();
        if(object == null)return;
        s.beginTransaction();
        s.saveOrUpdate(object);
        s.getTransaction().commit();

    }

    @Override
    public List<RespItem> findAll() {
        List<RespItem> ris = new ArrayList<RespItem>();
        s = sf.getCurrentSession();
        s.beginTransaction();
        ris = s.createCriteria(RespItem.class).list();
        s.getTransaction().commit();

        return ris;
    }

    @Override
    public int ItemRespondidosxUsuarioxContrato(Usuario usuario, Contrato contrato) {
       int items = 0;
       s = sf.getCurrentSession();
       s.beginTransaction();
       //items = s.createQuery("select count (*) from RespItem").iterate();
       items = ((Integer)s.createCriteria(RespItem.class)
               .add( Restrictions.eq("usuario", usuario))
               .add(Restrictions.eq("contrato", contrato))
               .setProjection(Projections.rowCount()).list().get(0)).intValue();
       return items;
    }

    @Override
    public int ItemRespondidosxContrato(Contrato contrato) {
        int items = 0;
        s = sf.getCurrentSession();
        s.beginTransaction();
        items = ((Integer)s.createCriteria(RespItem.class)               
               .add(Restrictions.eq("contrato", contrato))
               .setProjection(Projections.rowCount()).list().get(0)).intValue();
       return items;
    }

    @Override
    public RespItem findByContratoItem(int id_contrato, int id_item) {
        s = sf.getCurrentSession();

        //if(id_contrato <0)return null;
        s.beginTransaction();
        
        Contrato contrato = new Contrato();
        contrato = (Contrato) s.get(Contrato.class, id_contrato);
        
        Item item = new Item();
        item = (Item) s.get(Item.class, id_item);
        
        ri = (RespItem) s.createCriteria(RespItem.class).add(Restrictions.eq("contrato", contrato)).add(Restrictions.eq("item", item)).uniqueResult();
        s.getTransaction().commit();

        return ri;
    }

    @Override
    public int ItemRespondidosxContratoByIndicador(int idContrato, int idIndicador) {
        int items = 0;
        s = sf.getCurrentSession();
        s.beginTransaction();
        
        Contrato contrato = new Contrato();        
        contrato = (Contrato) s.get(Contrato.class, idContrato);
                
        Indicador indicador = new Indicador();        
        indicador = (Indicador) s.get(Indicador.class, idIndicador);
        
        List<Variable> listVar = new ArrayList<Variable>();
        listVar = s.createCriteria(Variable.class).add(Restrictions.eq("indicador", indicador)).add(Restrictions.eq("estado", true)).list();
        
        Variable variable = new Variable();
        Iterator<Variable> iteVar =listVar.iterator();        
        
        List<Item> listItem = new ArrayList<Item>();
        ItemDaoImpl daoItem = new ItemDaoImpl();        
        
        Item item = new Item();       
        
        while(iteVar.hasNext()){
            variable = iteVar.next();
            
            listItem = daoItem.findByVariableActivo(variable);
            Iterator<Item> iteItem = listItem.iterator();        
            
            while(iteItem.hasNext()){
                item = iteItem.next();
                
                items += ((Integer)s.createCriteria(RespItem.class)               
               .add(Restrictions.eq("contrato", contrato))
               .add(Restrictions.eq("item", item))
               .setProjection(Projections.rowCount()).list().get(0)).intValue();
                
            }            
        }       
        
        
       return items;        
    }

    @Override
    public SavedResult SaveAllItems(List<RespItem> itemsR) {
        try{
        s = sf.getCurrentSession();
        s.beginTransaction();
        for (RespItem respItem : itemsR) {
            s.save(respItem);
        }
        s.getTransaction().commit();
        } catch (Exception e){ return SavedResult.SAVED_FAIL;}

        return SavedResult.SAVED_SUCCES;
            
    }
 
}
