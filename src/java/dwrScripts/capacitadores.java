/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.EmpresaDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.encriptar;
import pojo.Empresa;
import pojo.Usuario;

/**
 *
 * @author Mendieta
 */
public class capacitadores {
    public capacitadores(){
    }
    
    public int newCapacitador(String nombre, String cargo, String tel, String dir, String email, String pass){
        int resp = 0;
        String contra = encriptar.md5(pass);  
        Empresa cpml = new Empresa();
        EmpresaDaoImpl edi = new EmpresaDaoImpl();
        cpml = edi.findByID(1);
        
        Usuario usu = new Usuario(cpml, nombre, cargo, tel, email, dir,2, contra, 1, null, null, null, null, null);
        UsuarioDaoImpl udi = new UsuarioDaoImpl();
        udi.create(usu);
        resp = usu.getIdUsuario();
       return resp;
    
    }
    
}
