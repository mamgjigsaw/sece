/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoAvance;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Avance;
import pojo.Contrato;
import pojo.Indicador;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class AvanceDaoImpl implements daoAvance {
    public final SessionFactory sf;
    public Avance avance;

    public AvanceDaoImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }    

    @Override
    public void create(Avance object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Avance object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Avance object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Avance> findAll() {
        List<Avance> list = new ArrayList<Avance>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Avance.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public Avance findById(int id_avance) {
        Session se=sf.getCurrentSession();
        se.beginTransaction();
        avance = (Avance) se.get(Avance.class, id_avance);
        se.getTransaction().commit();
        return avance;
    }

    @Override
    public Avance findByIndiAndContra(int id_indicador, int id_contrato) {
        Session se=sf.getCurrentSession();
        se.beginTransaction();
        
        //buscar indicador
        Indicador indicador = (Indicador) se.get(Indicador.class,id_indicador);
        //buscar contrato
        Contrato contrato = (Contrato) se.get(Contrato.class,id_contrato);        
        
        avance = (Avance) se.createCriteria(Avance.class).add(Restrictions.eq("indicador", indicador)).add(Restrictions.eq("contrato", contrato)).uniqueResult();
        se.getTransaction().commit();
        return avance;
    }

    //funcion q devuelve una Lista de Avance x Contrato
    @Override
    public List<Avance> Xcontrato(Contrato contrato) {
        List<Avance> resultados = new ArrayList<Avance>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        resultados = se.createCriteria(Avance.class).add(Restrictions.eq("contrato", contrato)).list();
        return resultados;
    }
    
}
