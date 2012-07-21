/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoEmailSent;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.EmailSent;
import pojo.Usuario;
import util.HibernateUtil;

/**
 *
 * @author wmiguel
 */
public class EmailSentDaoImpl implements daoEmailSent {
    public final SessionFactory sf;
    public EmailSent emailSent;

    public EmailSentDaoImpl() {
        this.sf = HibernateUtil.getSessionFactory();
    }

    @Override
    public EmailSent findById(int idEmailSent) {
       Session s = sf.getCurrentSession();

       if(idEmailSent < 0)return null;
       s.beginTransaction();
       emailSent = (EmailSent) s.get(EmailSent.class, idEmailSent);
       s.getTransaction().commit();
        return emailSent;
    }

    @Override
    public EmailSent findByUsuario(Usuario usuario) {
        Session s = sf.getCurrentSession();
       
       s.beginTransaction();
       emailSent = (EmailSent) s.createCriteria(EmailSent.class).add(Restrictions.eq("usuario", usuario)).uniqueResult();
       s.getTransaction().commit();
       return emailSent;
    }

    @Override
    public EmailSent findByCodigo(String codigo) {
       Session s = sf.getCurrentSession();
       
       s.beginTransaction();
       emailSent = (EmailSent) s.createCriteria(EmailSent.class).add(Restrictions.eq("codigo", codigo)).uniqueResult();
       s.getTransaction().commit();
       return emailSent;
    }

    @Override
    public void create(EmailSent object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(EmailSent object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.delete(object);
        se.getTransaction().commit();
    }

    @Override
    public void update(EmailSent object) {
        Session se= sf.getCurrentSession();
        se.beginTransaction();
        se.saveOrUpdate(object);
        se.getTransaction().commit();
    }

    @Override
    public List<EmailSent> findAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public EmailSent findByCorreo(String correo) {
        Session s = sf.getCurrentSession();
       
       s.beginTransaction();
       
       Usuario usuario = new Usuario();
       usuario = (Usuario) s.createCriteria(Usuario.class).add(Restrictions.eq("correo", correo)).uniqueResult();
       emailSent = (EmailSent) s.createCriteria(EmailSent.class).add(Restrictions.eq("usuario", usuario)).uniqueResult();
       s.getTransaction().commit();
       return emailSent;
    }
    
}
