/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoPais;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Pais;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class PaisDaoImpl implements daoPais{
    public final SessionFactory sf;

    public PaisDaoImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }

    @Override
    public void create(Pais object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Pais object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Pais object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Pais> findAll() {
        List<Pais> list = new ArrayList<Pais>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Pais.class).list();
        se.getTransaction().commit();

        return list;
    }
    
}
