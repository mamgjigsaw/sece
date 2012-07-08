/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoSugerencia;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Sugerencia;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class SugerenciaDaoImpl implements daoSugerencia{
    public SessionFactory sf;
    public Sugerencia sug;
    public  SugerenciaDaoImpl() {
        sf= util.HibernateUtil.getSessionFactory();
    }

    @Override
    public Sugerencia findByItem(int id_item) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void create(Sugerencia object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Sugerencia object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Sugerencia object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Sugerencia> findAll() {
        List<Sugerencia> list = new ArrayList<Sugerencia>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Sugerencia.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public Sugerencia findById(int id) {
        Session se=sf.getCurrentSession();
        se.beginTransaction();
        sug = (Sugerencia) se.get(Sugerencia.class, id);
        se.getTransaction().commit();
        return sug;
    }
}
