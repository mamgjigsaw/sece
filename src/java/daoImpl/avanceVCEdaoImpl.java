/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoAvanceVCE;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.avanceVCE;

/**
 *
 * @author Mendieta
 */
public class avanceVCEdaoImpl implements daoAvanceVCE {
    public SessionFactory sf;
    public Session s;

    public avanceVCEdaoImpl() {
     sf = util.HibernateUtil.getSessionFactory();
    }
    
    
    @Override
    public List<avanceVCE> findByContrato(int idContrato) {
        List<avanceVCE> avances = new ArrayList<avanceVCE>();
        s = sf.getCurrentSession();
        s.beginTransaction();
        avances = s.createCriteria(avanceVCE.class).add(Restrictions.eq("idContrato", idContrato)).list();
        s.getTransaction().commit();
        return avances;
    }

    @Override
    public void create(avanceVCE object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(avanceVCE object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(avanceVCE object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<avanceVCE> findAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public avanceVCE findbyID(int id) {
       s = sf.getCurrentSession();
       s.beginTransaction();
       avanceVCE a = (avanceVCE)s.get(avanceVCE.class, id);
       s.getTransaction().commit();
       return a;
    }
    
}
