/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoOperacion;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Operacion;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class OperacionDaoImpl implements daoOperacion{
    public final SessionFactory sf;
    public Operacion operacion;

    public OperacionDaoImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }

    @Override
    public void create(Operacion object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Operacion object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Operacion object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Operacion> findAll() {
        List<Operacion> list = new ArrayList<Operacion>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Operacion.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public Operacion findById(int id_operacion) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        operacion = (Operacion) se.get(Operacion.class, id_operacion); 
        se.getTransaction().commit();
        
        return operacion;
    }
    
}
