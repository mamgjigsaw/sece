/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoEmpresa;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Empresa;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class EmpresaDaoImpl implements daoEmpresa {
    public final SessionFactory sf;

    public EmpresaDaoImpl() {
        this.sf =  HibernateUtil.getSessionFactory();
    }
    @Override
    public void create(Empresa object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Empresa object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Empresa object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Empresa> findAll() {
        List<Empresa> list = new ArrayList<Empresa>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Empresa.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public Empresa findByID(int id_empresa) {        
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        Empresa empresa = (Empresa) se.get(Empresa.class, id_empresa);
        return empresa;
    }
    
}
