/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import dao.daoItem;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import pojo.Indicador;
import pojo.Item;
import pojo.Variable;

/**
 *
 * @author mamg
 */
public class ItemDaoImpl implements daoItem {

    private SessionFactory sf;
    private Session s;
    private Item i;

    public ItemDaoImpl()
    {
         sf = util.HibernateUtil.getSessionFactory();

    }  

    @Override
    public void create(Item object) {
        Session ses = sf.getCurrentSession();
        if(object==null) return;
        ses.beginTransaction();
        ses.save(object);
        ses.getTransaction().commit();
    }

    @Override
    public void delete(Item object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(Item object) {
    Session ses = sf.getCurrentSession();
    if(object==null) return;
    ses.beginTransaction();
    ses.update(object);
    ses.getTransaction().commit();
    }

    @Override
    public List<Item> findAll() {
        List<Item> items = new ArrayList<Item>();

        s = sf.getCurrentSession();
        s.beginTransaction();
        items = s.createCriteria(Item.class).list();
        s.getTransaction().commit();

       return items;
    }

    @Override
    public Item findByName(String name) {
       s = sf.getCurrentSession();

       if(name == null)return null;
       s.beginTransaction();
       i = (Item)s.createCriteria(Item.class).add(Restrictions.eq("descripcion", name)).uniqueResult();
       s.getTransaction().commit();

        return i;
    }

    @Override
    public List<Item> findByVar(int idVariable) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
public Item findById(int id){
    s =sf.getCurrentSession();
    if(id==0) return null;
    s.beginTransaction();
    i = (Item)s.get(Item.class, id);
    s.getTransaction().commit();
    return i;
}

    @Override
    public List<Item> findByVariable(Variable variable) {
        List<Item> list = new ArrayList<Item>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Item.class).add(Restrictions.eq("variable", variable)).list();
        return list;
    }

    @Override
    public List<Item> findByVariableActivo(Variable variable) {
        List<Item> list = new ArrayList<Item>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Item.class).add(Restrictions.eq("variable", variable)).add(Restrictions.eq("estado", 1)).list();
        return list;
    }

    @Override
    public int numItemActivos() {
        int items =0;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        items = (Integer) se.createCriteria(Item.class).add(Restrictions.eq("estado", 1)).setProjection(Projections.rowCount()).uniqueResult();         
        return items;
    }

    @Override
    public int numItemActivosByIndicador(int idIndicador) {
        int items =0;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        
        Indicador indicador = new Indicador();        
        indicador = (Indicador) se.get(Indicador.class, idIndicador);
        
        List<Variable> listVar = new ArrayList<Variable>();
        listVar = se.createCriteria(Variable.class).add(Restrictions.eq("indicador", indicador)).add(Restrictions.eq("estado", true)).list();
        
        Variable variable = new Variable();
        Iterator<Variable> iteVar =listVar.iterator();
        while(iteVar.hasNext()){
            variable = iteVar.next();
            items += (Integer) se.createCriteria(Item.class)
                .add(Restrictions.eq("estado", 1))
                .add(Restrictions.eq("variable", variable))
                .setProjection(Projections.rowCount())
                .uniqueResult();         
        }       
        
        return items;
    }
}