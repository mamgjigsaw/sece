/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.EmailSent;
import pojo.Usuario;

/**
 *
 * @author wmiguel
 */
public interface daoEmailSent extends dao<EmailSent> {
    EmailSent findById(int idEmailSent);
    EmailSent findByUsuario(Usuario usuario);
    EmailSent findByCodigo(String codigo);
    
}
