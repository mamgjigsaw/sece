/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import dao.daoAcceso;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import pojo.Acceso;
import pojo.Usuario;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class AccesoDaoImpl implements daoAcceso{
    public final SessionFactory sf;
    public Acceso acceso;

    public AccesoDaoImpl() {
        this.sf= HibernateUtil.getSessionFactory();
    }

    @Override
    public void create(Acceso object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Acceso object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Acceso object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Acceso> findAll() {
        List<Acceso> list = new ArrayList<Acceso>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Acceso.class).list();
        se.getTransaction().commit();

        return list;
    }
    
    @Override
    public Timestamp fechaUltimoAcceso(Usuario usuario) {        
        Timestamp acc;
        Session se = sf.getCurrentSession();
        se.beginTransaction();        
        Criteria criterio = se.createCriteria(Acceso.class);
        criterio.add(Restrictions.eq("usuario", usuario));
        ProjectionList projectionList  = Projections.projectionList();
        projectionList.add(Projections.max("fechaEntrada"));
        criterio.setProjection(projectionList);
        acc = (Timestamp) criterio.uniqueResult();
        return acc;
     }

}
