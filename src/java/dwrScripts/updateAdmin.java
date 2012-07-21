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
    
    public String[] datosPersonales(String idU, String nombre, String cargo, String tel, String mail, String dir){
     
        String resp[] = new String[5];
    
       UsuarioDaoImpl udi = new UsuarioDaoImpl();
       Usuario usu = new Usuario();
       
       usu = udi.findById(Integer.parseInt(idU));
             
       usu.setNombre(nombre);
       usu.setCargo(cargo);
       usu.setTelefono(tel);
       usu.setCorreo(mail);
       usu.setDireccion(dir); 
       
       udi.update(usu);
       
       resp[0] = usu.getNombre();
       resp[1] = usu.getCargo();
       resp[2] = usu.getTelefono();
       resp[3] = usu.getCorreo();
       resp[4] = usu.getDireccion();
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
