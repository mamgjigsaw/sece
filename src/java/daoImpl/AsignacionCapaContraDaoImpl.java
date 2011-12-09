/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoAsignacionCapaContra;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.AsignacionCapaContra;
import pojo.Usuario;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class AsignacionCapaContraDaoImpl implements daoAsignacionCapaContra {
    public final SessionFactory sf;
    public AsignacionCapaContra asignacion;

    public AsignacionCapaContraDaoImpl() {
        this.sf =  HibernateUtil.getSessionFactory();
    }    

    @Override
    public void create(AsignacionCapaContra object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(AsignacionCapaContra object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(AsignacionCapaContra object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<AsignacionCapaContra> findAll() {
        List<AsignacionCapaContra> list = new ArrayList<AsignacionCapaContra>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(AsignacionCapaContra.class).list();
        se.getTransaction().commit();

        return list;
    }

    @Override
    public List<AsignacionCapaContra> findAllByIdUsuarioCapacitador(Usuario us) {
        List<AsignacionCapaContra> list = new ArrayList<AsignacionCapaContra>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(AsignacionCapaContra.class).add(Restrictions.eq("usuario", us)).list();
        se.getTransaction().commit();
        return list;
    }
    
}
