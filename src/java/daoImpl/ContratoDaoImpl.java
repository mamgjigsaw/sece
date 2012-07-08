/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import dao.daoContrato;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import pojo.Contrato;
import pojo.Usuario;

/**
 *
 * @author Personal
 */
public class ContratoDaoImpl implements daoContrato {
     private SessionFactory sf;     
     private Contrato c;

    public ContratoDaoImpl()
    {
      sf = util.HibernateUtil.getSessionFactory();

    }
    @Override
    public Contrato findById_Empresa(int id_empresa) {
        Session se = sf.getCurrentSession();
        if(id_empresa < 0) return null;

        se.beginTransaction();
        c = (Contrato) se.get(Contrato.class, id_empresa);
        se.getTransaction().commit();

        return c;
    }

    @Override
    public Contrato findByEstado(int estado) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        c = (Contrato) se.createCriteria(Contrato.class).add(Restrictions.eq("estado", estado)).uniqueResult();
        se.getTransaction().commit();
        return c;
    }

    @Override
    public void create(Contrato object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Contrato object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Contrato object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Contrato> findAll() {
        List<Contrato> list = new ArrayList<Contrato>();
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Contrato.class).list();
        se.getTransaction().commit();
        return list;
    }

    @Override
    public Contrato findById(int id_contrato) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        c = (Contrato) se.get(Contrato.class, id_contrato);
        se.getTransaction().commit();
        return c;
    }
///check method
    @Override
    public int cantidadContratosxUsuarioFinalizados(Usuario usuario) {
        int contratos = 0;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        contratos =  (Integer) se.createCriteria(Contrato.class)
                    .add(Restrictions.eq("usuario", usuario))
                    .add(Restrictions.eq("estado", 2))
                    .setProjection(Projections.rowCount()).uniqueResult();
        se.getTransaction().commit();
        return contratos;
    }

    @Override
    public List<Contrato> contratosxUsuario(Usuario usuario) {
       List<Contrato> contratos;
         Session se = sf.getCurrentSession();
         se.beginTransaction();
         contratos = se.createCriteria(Contrato.class)
                     .add(Restrictions.eq("usuario", usuario)).list();   
         se.getTransaction().commit();
         return contratos;
    }

    @Override
    public Contrato findByUsuario(Usuario usuario) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        c = (Contrato) se.createCriteria(Contrato.class).add(Restrictions.eq("usuario", usuario)).add(Restrictions.eq("estado", 1)).uniqueResult();   
        se.getTransaction().commit();
        return c;
    }

    @Override
    public Contrato findByContrato_usuario(int contrato, Usuario usuario) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        c = (Contrato) se.createCriteria(Contrato.class).add(Restrictions.eq("idContrato", contrato)).add(Restrictions.eq("usuario", usuario)).uniqueResult();
        se.getTransaction().commit();
        return c;
    }

}
