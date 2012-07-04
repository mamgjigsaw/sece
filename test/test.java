
import daoImpl.AsignacionCapaContraDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.DelegacionIndiUsuDaoImpl;
import daoImpl.UsuarioDaoImpl;
import java.util.Iterator;
import java.util.List;
import pojo.Contrato;
import pojo.Empresa;
import pojo.Usuario;

public class test {

    public static void main(String[] args) {
           int idusuario = 63;
           ContratoDaoImpl cdi = new ContratoDaoImpl();
           Contrato contrato = cdi.findById(25);
           String idusuario1 = null, idusuario2 = null, idusuario3 = null; 
           String idcapacitador = null;
                      
           AsignacionCapaContraDaoImpl accdi = new AsignacionCapaContraDaoImpl();
           Usuario capacitador = accdi.findUsByContra(contrato);
           idcapacitador = String.valueOf(capacitador.getIdUsuario());                      
           
           DelegacionIndiUsuDaoImpl diud = new DelegacionIndiUsuDaoImpl();
           UsuarioDaoImpl udi = new UsuarioDaoImpl();
           Usuario user = udi.findById(idusuario);
           Empresa empresa = user.getEmpresa();
           System.out.println("Empresa "+empresa.getNombre());
           String nombreUsuario =  user.getNombre();
           System.out.println("Yo soy "+user.getIdUsuario());
          
           Usuario user2 = new Usuario();
           List<Usuario>usuarios = diud.usuariosSNRepetirdelegacionxContrato(contrato,user); 
           Iterator<Usuario> it = usuarios.iterator();
           while (it.hasNext()){
               user2 = it.next();               
                   System.out.println(user2.getIdUsuario());
           }
//           try{ 
//             System.out.println (usuarios.get(0).getIdUsuario()) ;
//             System.out.println (usuarios.get(1).getIdUsuario()) ;
//             System.out.println (usuarios.get(2).getIdUsuario()) ;               
//           }catch (IndexOutOfBoundsException ie) { System.out.println(ie.getMessage());}
    }
       
    }
       
    
     

