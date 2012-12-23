/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import dao.daoProducto;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import pojo.Producto;
import util.HibernateUtil;

/**
 *
 * @author davidalmanza
 */
public class ProductoDaoImpl implements daoProducto {
    public final SessionFactory sf;
    public Producto producto;

    public ProductoDaoImpl() {
        this.sf= HibernateUtil.getSessionFactory();
    }

    
    
    @Override
    public Producto findById(int idproducto) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Producto> findListbyempresa(int idempresa) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void create(Producto object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.save(object);
        se.getTransaction().commit();
    }

    @Override
    public void delete(Producto object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(Producto object) {
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        se.update(object);
        se.getTransaction().commit();
    }

    @Override
    public List<Producto> findAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
