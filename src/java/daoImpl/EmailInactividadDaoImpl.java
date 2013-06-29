/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoEmailInactividad;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import pojo.EmailInactividad;
import pojo.Usuario;
import util.HibernateUtil;

/**
 *
 * @author Dave
 */
public class EmailInactividadDaoImpl implements daoEmailInactividad {

    public final SessionFactory sf;
    public EmailInactividad emailInac;

    public EmailInactividadDaoImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }   
    
    @Override
    public int intentosEmailInactividadxUsuario(Usuario user) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        int intentos = (Integer) se.createCriteria(EmailInactividad.class)
                .add(Restrictions.eq("usuario", user))
                .setProjection(Projections.property("intentos"))
                .uniqueResult();
        se.getTransaction().commit();        
        return intentos;
    }

    @Override
    public void create(EmailInactividad object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(EmailInactividad object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(EmailInactividad object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<EmailInactividad> findAll() {
        List<EmailInactividad> list = new ArrayList<EmailInactividad>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(EmailInactividad.class).list();
        se.getTransaction().commit();
        return list;
    }

    public EmailInactividad findByUsuario(Usuario user) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        emailInac = (EmailInactividad) se.createCriteria(EmailInactividad.class).add(Restrictions.eq("usuario", user)).uniqueResult();
        return emailInac;
    }
    
}
