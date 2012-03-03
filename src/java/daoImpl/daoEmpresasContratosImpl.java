/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoEmpresasContratos;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.EmpresasContratos;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class daoEmpresasContratosImpl implements daoEmpresasContratos {
    public final SessionFactory sf;

    public daoEmpresasContratosImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }    

    @Override
    public void create(EmpresasContratos object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(EmpresasContratos object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(EmpresasContratos object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<EmpresasContratos> findAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<EmpresasContratos> findAllByEstado(int contratoEstado) {
        List<EmpresasContratos> usu= new ArrayList<EmpresasContratos>();
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        usu= se.createCriteria(EmpresasContratos.class).add(Restrictions.eq("contratoEstado", contratoEstado)).list();
        se.getTransaction().commit();
        return usu;
    }
    
}
