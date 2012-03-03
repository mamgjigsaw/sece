/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoEscala;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Escala;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class EscalaDaoImpl implements daoEscala {
    public final SessionFactory sf;

    public EscalaDaoImpl() {
        this.sf= HibernateUtil.getSessionFactory();
    }

    @Override
    public Escala findByVariable(int id_variable) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void create(Escala object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Escala object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Escala object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Escala> findAll() {
        List<Escala> list = new ArrayList<Escala>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Escala.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public Escala findById(int id) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        Escala es = (Escala)se.get(Escala.class, id);
        se.getTransaction().commit();
        return es;
    }
    
}
