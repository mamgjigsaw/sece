/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoDelegacionIndiUsu;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Contrato;
import pojo.DelegacionIndiUsu;
import pojo.Indicador;
import pojo.Usuario;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class DelegacionIndiUsuDaoImpl implements daoDelegacionIndiUsu{
    public final SessionFactory sf;
    public DelegacionIndiUsu deleg;

    public DelegacionIndiUsuDaoImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }   
    
    @Override
    public void create(DelegacionIndiUsu object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(DelegacionIndiUsu object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(DelegacionIndiUsu object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<DelegacionIndiUsu> findAll() {
        List<DelegacionIndiUsu> list = new ArrayList<DelegacionIndiUsu>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(DelegacionIndiUsu.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public DelegacionIndiUsu findByUsuario(Usuario usuario) {        
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        deleg = (DelegacionIndiUsu) se.createCriteria(DelegacionIndiUsu.class).add(Restrictions.eq("usuario", usuario)).uniqueResult();
        se.getTransaction().commit();        
        return deleg;
    }

    @Override
    public List<DelegacionIndiUsu> delegacionxContrato(Contrato contrato) {
        List<DelegacionIndiUsu> delegaciones = new ArrayList<DelegacionIndiUsu>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        delegaciones = se.createCriteria(DelegacionIndiUsu.class).add(Restrictions.eq("contrato", contrato)).list();
        return delegaciones;
    }

    @Override
    public DelegacionIndiUsu getDelByContCurrentlyandUsu(Usuario usuario) {
        List<DelegacionIndiUsu> delegaciones = new ArrayList<DelegacionIndiUsu>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        
        delegaciones = se.createCriteria(DelegacionIndiUsu.class).add(Restrictions.eq("usuario", usuario)).list();
                
        for(int i=0;i<delegaciones.size();i++){
            DelegacionIndiUsu del = delegaciones.get(i);
            
            Contrato contrato =  (Contrato) se.get(Contrato.class,del.getContrato().getIdContrato());
            
            if(contrato.getEstado()==1){
                deleg = del;
            }                    
        }
        
        se.getTransaction().commit();
        return deleg;
    }

    @Override
    public DelegacionIndiUsu findByContratoIndicador(Indicador indicador, Contrato contrato) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        deleg = (DelegacionIndiUsu) se.createCriteria(DelegacionIndiUsu.class).add(Restrictions.eq("indicador", indicador)).add(Restrictions.eq("contrato", contrato)).uniqueResult();
        se.getTransaction().commit();
        return deleg;
    }

    @Override
    public List<Usuario> usuariosSNRepetirdelegacionxContrato(Contrato contrato, Usuario user) {
       List<Usuario> usuarios = new ArrayList<Usuario>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        String hql = "select distinct d.usuario from DelegacionIndiUsu d where d.contrato = :contrato and d.usuario <> :usuario";
        usuarios = se.createQuery(hql)                
                .setParameter("contrato", contrato)
                .setParameter("usuario", user)
                .list();        
        return usuarios;
    }
    
}
