/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.UsuarioDaoImpl;
import daoImpl.encriptar;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public class validate {
  
    public validate() {
    }
    
    public int loguearse(String email, String password){
        int respuesta=0;
                        
        UsuarioDaoImpl usudao = new UsuarioDaoImpl();
        Usuario usuario = new Usuario();
        usuario = usudao.findByEmail(email);
        
        if(usuario==null){
            respuesta = 0;//significa que digito mal el email o no existe
        }else{
            if(usuario.getEstado()==0){
                respuesta=3;
            }else{
               String pass = encriptar.md5(password);            
                 if(usuario.getPassword().equals(pass)){
                     respuesta = 1;//es la persona correcta
                 }else{                   
                     respuesta = 2;//digito mal el password                   
                }   
            }                            
        }
            
        return respuesta;
    }
    
    public void  bloquear(String email){
        UsuarioDaoImpl usudao = new UsuarioDaoImpl();
        Usuario usuario = new Usuario();
        usuario = usudao.findByEmail(email);
        usuario.setEstado(0);
        usudao.update(usuario);
    }
    
}
