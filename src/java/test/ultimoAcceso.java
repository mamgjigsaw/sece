/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import daoImpl.AccesoDaoImpl;
import daoImpl.UsuarioDaoImpl;
import java.util.Date;
import pojo.Usuario;

/**
 *
 * @author Dave
 */
public class ultimoAcceso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Usuario user = new Usuario();
        UsuarioDaoImpl udi = new UsuarioDaoImpl();
        Date acces;
        AccesoDaoImpl adi = new AccesoDaoImpl();
        
        user = udi.findById(63);
         acces = adi.fechaUltimoAcceso(user);
         System.out.println(acces);
        
    }
}
