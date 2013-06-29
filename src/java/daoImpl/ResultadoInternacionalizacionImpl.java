/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Contrato;
import pojo.ResultadoInter;
import util.HibernateUtil;

/**
 *
 * @author Dave
 */
public class ResultadoInternacionalizacionImpl implements dao.daoResultadoInternacionalizacion{

    public final SessionFactory sf;
    public ResultadoInter resultInter;

    public ResultadoInternacionalizacionImpl() {
        this.sf= HibernateUtil.getSessionFactory();
    }
    
    @Override
    public List<ResultadoInter> resultadosxContratos(Contrato contrato) {
        List<ResultadoInter> list;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(ResultadoInter.class).add(Restrictions.eq("contrato", contrato)).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public void create(ResultadoInter object) {
       Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit(); 
    }

    @Override
    public void delete(ResultadoInter object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(ResultadoInter object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<ResultadoInter> findAll() {
        List<ResultadoInter> list;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(ResultadoInter.class).list();
        se.getTransaction().commit();

        return list;
    }
    
}
