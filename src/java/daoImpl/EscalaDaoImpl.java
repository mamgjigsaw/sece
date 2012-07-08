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
import org.hibernate.criterion.Restrictions;
import pojo.Escala;
import pojo.Variable;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class EscalaDaoImpl implements daoEscala {
    public final SessionFactory sf;
    public Escala escala;

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
        escala = (Escala)se.get(Escala.class, id);
        se.getTransaction().commit();
        return escala;
    }

    @Override
    public List<Escala> findByVariable(Variable variable) {
        List<Escala> list = new ArrayList<Escala>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Escala.class).add(Restrictions.eq("variable", variable)).list();
        se.getTransaction().commit();
        return list;
    }

    @Override
    public Escala findByVarRango(int id_variable, int rango) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        
        //Escala es = (Escala) se.createCriteria(Escala.class).add(Restrictions.eq("variable", variable)).add(Restrictions.and(Restrictions.gt("rangoMayor", rango), Restrictions.lt("rangoMenor", rango))).uniqueResult();
        escala =  (Escala) se.createQuery("from Escala as es where es.variable="+ id_variable +" and es.rangoMenor <= "+ rango +" and es.rangoMayor >= "+ rango).uniqueResult();
        se.getTransaction().commit();
        return escala;
    }
    
}
