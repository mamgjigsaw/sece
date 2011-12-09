/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoAsignacionSugItem;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class AsignacionSugItem implements daoAsignacionSugItem {
    public final SessionFactory sf;
    public AsignacionSugItem asignacion;

    public AsignacionSugItem(SessionFactory sf) {
        this.sf = HibernateUtil.getSessionFactory();
    }    

    @Override
    public void create(pojo.AsignacionSugItem object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(pojo.AsignacionSugItem object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(pojo.AsignacionSugItem object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<pojo.AsignacionSugItem> findAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
