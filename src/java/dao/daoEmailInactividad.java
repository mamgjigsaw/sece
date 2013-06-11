/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.EmailInactividad;
import pojo.Usuario;

/**
 *
 * @author Dave
 */
public interface daoEmailInactividad extends dao<EmailInactividad> {
    int intentosEmailInactividadxUsuario (Usuario user);
    
}
