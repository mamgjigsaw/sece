/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AccesoDaoImpl;
import daoImpl.BitacoraDaoImpl;
import daoImpl.OperacionDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.encriptar;
import java.sql.Timestamp;
import java.util.Date;
import pojo.Acceso;
import pojo.Bitacora;
import pojo.Operacion;
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
    
    public void saveActionBitacora(int id_acceso,int id_operacion, String descripcion,int id_elemento,String anterior,String actual){
        
        OperacionDaoImpl opeDao = new OperacionDaoImpl();
        Operacion operacion = new Operacion();
        
        operacion = opeDao.findById(id_operacion);
        
        AccesoDaoImpl accDao = new AccesoDaoImpl();
        Acceso acceso = new Acceso();
        
        acceso = accDao.findById(id_acceso);
        
        Date fecha = new Date();        
        Timestamp momentoTimestamp = new Timestamp(fecha.getTime());
        
        Bitacora bitacora = new Bitacora(operacion,acceso,descripcion,id_elemento,anterior,actual,momentoTimestamp);
        BitacoraDaoImpl bitaDao = new BitacoraDaoImpl();
        bitaDao.create(bitacora);
           
    }            
    
}
