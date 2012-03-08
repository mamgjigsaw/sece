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
 * @author Mendieta
 */
public class updateAdmin {
    
    public updateAdmin(){       
    }
    
    public int datosPersonales(String idU, String nombre, String cargo, String tel, String mail, String dir){
     
        int resp = 0;
    
       UsuarioDaoImpl udi = new UsuarioDaoImpl();
       Usuario usu = new Usuario();
       
       usu = udi.findById(Integer.parseInt(idU));
             
       usu.setNombre(nombre);
       usu.setCargo(cargo);
       usu.setTelefono(tel);
       usu.setCorreo(mail);
       usu.setDireccion(dir); 
       
       udi.update(usu);
        
       return resp;
       
    }
    
    public int password(String idU, String act, String nueva){
        int resp = 0;
            UsuarioDaoImpl udi = new UsuarioDaoImpl();
            Usuario usu = new Usuario();
       
            usu = udi.findById(Integer.parseInt(idU));     
            String pasEnc = encriptar.md5(act);
            
            if(usu.getPassword().equals(pasEnc)){
               String nuevaEnc = encriptar.md5(nueva);
               usu.setPassword(nuevaEnc);
               udi.update(usu);
                resp = 1;
            }
            else{
            resp = 0;
            }
        
        return resp;
    }
    
    
}
