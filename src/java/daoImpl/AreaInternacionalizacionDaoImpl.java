/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.AreasInter;
import util.HibernateUtil;

/**
 *
 * @author Dave
 */
public class AreaInternacionalizacionDaoImpl implements dao.daoAreasInternacionalizacion {

    public final SessionFactory sf;
    
    public AreasInter areas;

    public AreaInternacionalizacionDaoImpl() {
         this.sf = HibernateUtil.getSessionFactory();
    }
    
    @Override
    public List<AreasInter> areas() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void create(AreasInter object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(AreasInter object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(AreasInter object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<AreasInter> findAll() {
        List<AreasInter> list ;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(AreasInter.class).list();
        se.getTransaction().commit();
        return list;
    }

    @Override
    public AreasInter findById(int idArea) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        areas = (AreasInter) se.get(AreasInter.class,idArea);
        se.getTransaction().commit();
        return areas;
    }
    
}
