/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoZone;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Zone;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class ZoneDaoImpl implements daoZone {
    public final SessionFactory sf;
    public Zone zone;

    public ZoneDaoImpl() {
        this.sf= HibernateUtil.getSessionFactory();
    }

    @Override
    public void create(Zone object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Zone object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Zone object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Zone> findAll() {
        List<Zone> list = new ArrayList<Zone>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Zone.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public Zone findById_Zone(int id_zone) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        zone = (Zone) se.get(Zone.class, id_zone);
        se.getTransaction().commit();
        return zone;
    }
    
}
