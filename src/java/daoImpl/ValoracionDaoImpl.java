/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoValoracion;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Valoracion;
import util.HibernateUtil;

/**
 *
 * @author wmiguel
 */
public class ValoracionDaoImpl implements daoValoracion{
    public final SessionFactory sf;
    public Valoracion valoracion;

    public ValoracionDaoImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }

    @Override
    public void create(Valoracion object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Valoracion object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Valoracion object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Valoracion> findAll() {
        List<Valoracion> usu= new ArrayList<Valoracion>();
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        usu= se.createCriteria(Valoracion.class).list();
        se.getTransaction().commit();
        return usu;
    }
    
}
