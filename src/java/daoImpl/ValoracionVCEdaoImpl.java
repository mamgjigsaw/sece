/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoValoracionVCE;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.avanceVCE;
import pojo.valoracionVCE;

/**
 *
 * @author Mendieta
 */
public class ValoracionVCEdaoImpl implements daoValoracionVCE {
     public SessionFactory sf;
     public Session s;
     
    public ValoracionVCEdaoImpl() {
        sf = util.HibernateUtil.getSessionFactory();
    }
   
    @Override
    public List<valoracionVCE> findByAvanceVCE(avanceVCE aVCE) {
        List<valoracionVCE> valoraciones = new ArrayList<valoracionVCE>();
        s = sf.getCurrentSession();
        s.beginTransaction();
        int idC = aVCE.getIdContrato();
        int idI = aVCE.getIdindicador();
        valoraciones = s.createCriteria(valoracionVCE.class).add(Restrictions.eq("idContrato", idC)).add(Restrictions.eq("idIndicador", idI)).list();
        s.getTransaction().commit();
        return valoraciones;
    }

    @Override
    public void create(valoracionVCE object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(valoracionVCE object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(valoracionVCE object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<valoracionVCE> findAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
