/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import daoImpl.EmailInactividadDaoImpl;
import daoImpl.UsuarioDaoImpl;
import pojo.Usuario;

/**
 *
 * @author Dave
 */
public class EmailInactividad {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        UsuarioDaoImpl udi = new UsuarioDaoImpl();
        Usuario user = udi.findById(61);
        EmailInactividadDaoImpl edi = new EmailInactividadDaoImpl();
        int intentos = 0;
        try{                    
            intentos = edi.intentosEmailInactividadxUsuario(user);
        }catch(java.lang.NullPointerException ne){ }
        System.out.println(intentos);

        
    }
}
