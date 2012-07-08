/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoNoticias;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Noticias;
import util.HibernateUtil;

/**
 *
 * @author Mendieta
 */
public class NoticiasDaoImpl implements daoNoticias {
    public final SessionFactory sf;
    public Noticias noticias;
    
    public NoticiasDaoImpl() {
        this.sf= HibernateUtil.getSessionFactory();
    }
    
    @Override
    public Noticias findbyId(int id) {
        Session s = sf.getCurrentSession();

       if(id < 0)return null;
       s.beginTransaction();
       noticias = (Noticias) s.get(Noticias.class, id);
       s.getTransaction().commit();
        return noticias;
    }

    @Override
    public void create(Noticias object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Noticias object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Noticias object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Noticias> findAll() {
        List<Noticias> list = new ArrayList<Noticias>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Noticias.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public List<Noticias> findLastest() {
        List<Noticias> list = new ArrayList<Noticias>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Noticias.class).add(Restrictions.sqlRestriction("fecha_evento > date_add(CURDATE(), INTERVAL -1 DAY) order by fecha_evento asc;")).list();
        se.getTransaction().commit();

        return list;
    }
    
}
