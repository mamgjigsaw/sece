/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import dao.daoUsuario;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Empresa;
import pojo.Usuario;
import util.HibernateUtil;

/**
 *
 * @author mamg
 */
public class UsuarioDaoImpl implements daoUsuario{
    public final SessionFactory sf;
    public Usuario usuario;

    public UsuarioDaoImpl() {
        this.sf= HibernateUtil.getSessionFactory();
    }

    @Override
    public void create(Usuario object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Usuario object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(Usuario object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Usuario> findAll() {
        List<Usuario> usu= new ArrayList<Usuario>();
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        usu= se.createCriteria(Usuario.class).list();
        se.getTransaction().commit();
        return usu;
    }

    @Override
    public Usuario findByEmail(String email) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        usuario = (Usuario) se.createCriteria(Usuario.class).add(Restrictions.eq("correo", email)).uniqueResult();
        se.getTransaction().commit();
        return usuario;
    }

    @Override
    public Usuario findById(int id) {
        Session se=sf.getCurrentSession();
        se.beginTransaction();
        usuario= (Usuario) se.get(Usuario.class, id);
        se.getTransaction().commit();
        return usuario;
    }

    @Override
    public List<Usuario> usuariosxEmpresa(Empresa empresa) {
         List<Usuario> usuariosxEmpresa;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        Criteria criterio = se.createCriteria(Usuario.class).add(Restrictions.eq("empresa", empresa));
        usuariosxEmpresa = criterio.list();
        se.getTransaction().commit();
        return usuariosxEmpresa; 
    }

    @Override
    public List<Usuario> findDelegadosByIdEmpresa(Empresa empresa) {
        List<Usuario> listDelegados = new ArrayList<Usuario>();
        Session se = sf.getCurrentSession();      
        se.beginTransaction();
        listDelegados = se.createCriteria(Usuario.class).add(Restrictions.eq("empresa", empresa)).add(Restrictions.eq("tipoUsuario", 4)).list();
        se.getTransaction().commit();
        return listDelegados; 
    }
    public List<Usuario> capacitadoresActivos() {
         List<Usuario> cap;
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        Criteria criterio = se.createCriteria(Usuario.class).add(Restrictions.eq("tipoUsuario", 2)).add(Restrictions.eq("estado", 1));
        cap = criterio.list();
        se.getTransaction().commit();
        return cap; 
    }

    @Override
    public Usuario findAdministrador() {
        Session se=sf.getCurrentSession();
        se.beginTransaction();
        usuario= (Usuario) se.createCriteria(Usuario.class).add(Restrictions.eq("tipoUsuario", 1)).add(Restrictions.eq("estado", 1)).uniqueResult();
        se.getTransaction().commit();
        return usuario;
    }


}
