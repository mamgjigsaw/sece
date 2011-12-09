/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import dao.daoItem;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
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

    /* public List<Item> findAllByInd(int id_variable) {
        List<Item> items = new ArrayList<Item>();
        s = sf.getCurrentSession();
        s.beginTransaction();
        items = s.createSQLQuery("select * from item where id_variable = "+ id_variable).addEntity("variable", Item.class).list();
        s.getTransaction().commit();
        return items;
    }
*/
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
        list = se.createCriteria(Item.class).add(Restrictions.eq("variable", variable)).add(Restrictions.eq("estado", 1)).list();
        return list;
    }

    @Override
    public int numItem() {
         int items =0;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        items = ( (Long) se.createQuery("select count(*) from Item").iterate().next() ).intValue();
        return items;
    }
}