/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoBitacora;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Bitacora;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class BitacoraDaoImpl implements daoBitacora {
    public final SessionFactory sf;

    public BitacoraDaoImpl() {
       this.sf= HibernateUtil.getSessionFactory();
    }    

    @Override
    public void create(Bitacora object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Bitacora object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Bitacora object) {
         Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();    
    }

    @Override
    public List<Bitacora> findAll() {
        List<Bitacora> list = new ArrayList<Bitacora>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Bitacora.class).list();
        se.getTransaction().commit();

        return list;
    }
    
}
