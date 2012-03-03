/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoHistorialResultado;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import pojo.Empresa;
import pojo.HistorialResultado;
import pojo.Indicador;

/**
 *
 * @author Dave
 */
public class HistorialResultadoDaoImpl implements daoHistorialResultado {
    public final SessionFactory sf;
    public HistorialResultado hr;

    public HistorialResultadoDaoImpl() {
        this.sf = util.HibernateUtil.getSessionFactory();
    }    
    
    @Override
    public List<HistorialResultado> resultadosxEmpresaxIndicador(Empresa empresa, Indicador indicador) {
        Session ses = sf.getCurrentSession();
        List<HistorialResultado> resultados = new ArrayList<HistorialResultado>();
        ses.beginTransaction();
        resultados = ses.createCriteria(HistorialResultado.class)
                .add(Restrictions.eq("empresa", empresa))
                .add(Restrictions.eq("indicador", indicador))                
                .list();
        ses.getTransaction().commit();
        return resultados;
    }

    @Override
    public void create(HistorialResultado object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(HistorialResultado object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(HistorialResultado object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<HistorialResultado> findAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
