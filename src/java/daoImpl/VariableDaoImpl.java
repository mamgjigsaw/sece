/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package daoImpl;

import dao.daoVariable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import pojo.Indicador;
import pojo.Variable;

/**
 *
 * @author mamg
 */
public class VariableDaoImpl implements daoVariable {
     public SessionFactory sf;
     public Session s;
     public Variable v;



     public VariableDaoImpl ()
     {
        sf = util.HibernateUtil.getSessionFactory();

     }

     //////////////////////////////////??????????????????????????????????
      
    /* asi estaba antes que la cambiara quien hizo este metodo?????
     public Variable findByIndicador(int id_indicador) {
         s = sf.getCurrentSession();

         if(id_indicador == 0)return null;
        s.beginTransaction();
            v = (Variable)s.get(Variable.class, id_indicador);
        s.getTransaction().commit();
            return v;
    }
     */
    
///////////////////////////?????????????????????????????????????????????
    @Override
    public void create(Variable object) {
    Session ses = sf.getCurrentSession();
    if(object==null) return;
    ses.beginTransaction();
    ses.save(object);
    ses.getTransaction().commit();
    }

    @Override
    public void delete(Variable object) {
       Session ses = sf.getCurrentSession();
       if(object==null) return;
       ses.beginTransaction();
       ses.delete(object);
       ses.getTransaction().commit();
    }

    @Override
    public void update(Variable object) {
        Session ses = sf.getCurrentSession();
        if(object==null) return;
        ses.beginTransaction();
        ses.update(object);
        ses.getTransaction().commit();
    }

    @Override
    public List<Variable> findAll() {
        List<Variable> var = new ArrayList<Variable>();
        s = sf.getCurrentSession();
        s.beginTransaction();
        var = s.createCriteria(Variable.class).list();
        s.getTransaction().commit();
        return var;
    }

    @Override
    public Variable findByName(String name) {
          Session ses = sf.getCurrentSession();
        if (name==null) return null;
        ses.beginTransaction();
        v = (Variable) ses.createCriteria(Variable.class).add(Restrictions.eq("nombre",name)).uniqueResult();
        return v;
    }

/*public List<Variable> findallByID(){
    List<Variable> var = new ArrayList<Variable>();
    s = sf.getCurrentSession();
    s.beginTransaction();
    var = s.createQuery("select variable where id_indicador = 10").setEntity(null, s).list();
    s.getTransaction();

return var;
}*/

    public List<Variable> findAllInd(int id_indicador) {
        List<Variable> var = new ArrayList<Variable>();
        s = sf.getCurrentSession();
        s.beginTransaction();
        var = s.createSQLQuery("select * from variable where id_indicador = "+id_indicador).addEntity("variable", Variable.class).list();
        s.getTransaction().commit();
        //var = s.createCriteria(Variable.class).add(Restrictions.eq("id_indicador", id_indicador)).list();
        return var;
    }

    @Override
    public List<Variable> findByIndicador(Indicador indicador) {
        List<Variable> list = new ArrayList<Variable>();
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        list = se.createCriteria(Variable.class).add(Restrictions.eq("indicador", indicador)).list();
        se.getTransaction().commit();
        
        return list;
    }

    @Override
    public Variable findById(int id_variable) {        
        Session se = sf.getCurrentSession();
        se.beginTransaction();
        v = (Variable) se.get(Variable.class,id_variable);
        se.getTransaction().commit();
        
        return v;
    }
  

}
