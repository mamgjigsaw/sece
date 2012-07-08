/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import dao.daoIndicador;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import pojo.Indicador;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class IndicadorDaoImpl implements daoIndicador {
    public final SessionFactory sf;
    public Indicador indicador;

    public IndicadorDaoImpl() {
        sf= HibernateUtil.getSessionFactory();
    }

    @Override
    public Indicador findByName(String name) {
        Session s = sf.getCurrentSession();

        if(name == null)return null;
        s.beginTransaction();
        indicador = (Indicador)s.createCriteria(Indicador.class).add(Restrictions.eq("nombre", name)).uniqueResult();
        s.getTransaction().commit();

        return indicador;
    }

    @Override
    public void create(Indicador object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Indicador object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();        
    }

    @Override
    public void update(Indicador object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.update(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Indicador> findAll() {
        List<Indicador> in = new ArrayList<Indicador>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        in = se.createCriteria(Indicador.class).list();
        se.getTransaction().commit();

        return in;
    }

    @Override
    public Indicador findById(int id) {
       Session s = sf.getCurrentSession();

       if(id < 0)return null;
       s.beginTransaction();
       indicador = (Indicador) s.get(Indicador.class, id);
       s.getTransaction().commit();
        return indicador;
    }

    @Override
    public int getCountIndicador() {
        int cantidad=0;
       Session s = sf.getCurrentSession();       
       s.beginTransaction();
       
       ProjectionList proList = Projections.projectionList();
       proList.add(Projections.rowCount());
       cantidad = (Integer)  s.createCriteria(Indicador.class).setProjection(proList).uniqueResult();
       
       s.getTransaction().commit();
        return cantidad;
    }

    @Override
    public List<Indicador> findAllByActive() {
        List<Indicador> in = new ArrayList<Indicador>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        in = se.createCriteria(Indicador.class).add(Restrictions.eq("estado",true)).list();
        se.getTransaction().commit();

        return in;
    }

}
