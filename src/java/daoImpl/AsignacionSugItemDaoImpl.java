/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoAsignacionSugItem;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.AsignacionSugItem;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class AsignacionSugItemDaoImpl implements daoAsignacionSugItem {
    public SessionFactory sf;
    public AsignacionSugItemDaoImpl asignacion;

    public AsignacionSugItemDaoImpl() {
       sf = HibernateUtil.getSessionFactory();
    }    

    @Override
    public void create(AsignacionSugItem object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(AsignacionSugItem object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(AsignacionSugItem object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<AsignacionSugItem> findAll() {
      List<AsignacionSugItem> asi = new ArrayList<AsignacionSugItem>();
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        asi = se.createCriteria(AsignacionSugItem.class).list();
        se.getTransaction().commit();
        return asi;
    }

    @Override
    public AsignacionSugItem findById(int id) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        AsignacionSugItem a = (AsignacionSugItem)se.get(AsignacionSugItem.class, id);
        se.getTransaction().commit();
        return a;
    }
    
}
