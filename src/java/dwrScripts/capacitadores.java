/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AsignacionCapaContraDaoImpl;
import daoImpl.EmpresaDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.encriptar;
import java.util.Iterator;
import java.util.List;
import pojo.AsignacionCapaContra;
import pojo.Empresa;
import pojo.Usuario;

/**
 *
 * @author Mendieta
 */
public class capacitadores {
    public capacitadores(){
    }
    
    public String[] newCapacitador(String nombre, String cargo, String tel, String dir, String email, String pass){
        String res[] = new String[6];
        String contra = encriptar.md5(pass);  
        Empresa cpml = new Empresa();
        EmpresaDaoImpl edi = new EmpresaDaoImpl();
        cpml = edi.findByID(1);
        UsuarioDaoImpl udi = new UsuarioDaoImpl();
        Usuario usu = new Usuario();
        usu = udi.findByEmail(email);
        if (usu == null){
        usu = new Usuario(cpml, nombre, cargo, tel, email, dir,2, contra, 1, null, null, null, null, null);
        udi.create(usu);
        res[0] = usu.getIdUsuario().toString();
        res[1] = usu.getNombre();
        res[2] = usu.getCargo();
        res[3] = usu.getTelefono();
        res[4] = usu.getCorreo();
        res[5] = usu.getDireccion();                
       
        }
        else{
           res[0] = "Error, el E-mail ya esta registrado";
           res[1] = "Error, el E-mail ya esta registrado";
           res[2] = "Error, el E-mail ya esta registrado";
           res[3] = "Error, el E-mail ya esta registrado";
           res[4] = "Error, el E-mail ya esta registrado";
           res[5] = "Error, el E-mail ya esta registrado";
        }
        
         return res;
    }
    public String[][] cargarCapacitadores(String idCelda){
            UsuarioDaoImpl udi = new UsuarioDaoImpl();
            List<Usuario> listCap = udi.capacitadoresActivos();
            //idCelda es el id de la celda d la tabla para poder ubicar la fila
            String cap[][] = new String[listCap.size() + 1][2];
                   cap[0][0] = idCelda;
                   cap[0][1] = idCelda;
            for(int i = 1; i < listCap.size() + 1; i++ ){
              cap[i][0]= listCap.get(i-1).getIdUsuario().toString();   
              cap[i][1]= listCap.get(i-1).getNombre();   
            }
            return cap;
    }
    public String[] guardarCambiarCapacitador(int idAs, int idCap){
         String retorno[] = new String[2];
         Usuario u = new Usuario();
         UsuarioDaoImpl ud = new UsuarioDaoImpl();
         u = ud.findById(idCap);
         AsignacionCapaContra acc = new AsignacionCapaContra();
         AsignacionCapaContraDaoImpl accdi = new AsignacionCapaContraDaoImpl();
         acc = accdi.findbyId(idAs);
         acc.setUsuario(u);
         accdi.update(acc);
         retorno[0] = String.valueOf(idAs);
         retorno[1] = u.getNombre();
         return retorno;
    }
    
}
