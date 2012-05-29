/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author wmiguel
 */
public class SMTPAuthentication extends Authenticator {
    
    @Override
    public PasswordAuthentication getPasswordAuthentication()
    {
        
        String username = "sece@pml.org.ni";           
        String password = "dmk$3$/*001**";
        
        return new PasswordAuthentication(username, password);
        
    }
}
