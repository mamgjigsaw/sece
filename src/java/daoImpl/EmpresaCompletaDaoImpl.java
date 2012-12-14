/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoEmpresaCompleta;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Contrato;
import pojo.EmpresaCompleta;
import util.HibernateUtil;

/**
 *
 * @author Dave
 */
public class EmpresaCompletaDaoImpl implements daoEmpresaCompleta{

    public final SessionFactory sf;
    public EmpresaCompleta empresaCompleta;

    public EmpresaCompletaDaoImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }
    
    @Override
    public void create(EmpresaCompleta object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(EmpresaCompleta object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(EmpresaCompleta object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.update(object);
        se.getTransaction().commit();
    }

    @Override
    public List<EmpresaCompleta> findAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public EmpresaCompleta findByIdContrato(Contrato contrato) {
       Session se = sf.getCurrentSession();
        se.beginTransaction();
        empresaCompleta = (EmpresaCompleta) se.createCriteria(EmpresaCompleta.class).add(Restrictions.eq("contrato", contrato)).uniqueResult();
        se.getTransaction().commit();
        return empresaCompleta;
    }
    
}
