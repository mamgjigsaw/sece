
import daoImpl.ContratoDaoImpl;
import daoImpl.EmpresaDaoImpl;
import daoImpl.UsuarioDaoImpl;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import pojo.Contrato;
import pojo.Empresa;
import pojo.Usuario;



public class test {
    private static ContratoDaoImpl cdi = new ContratoDaoImpl();


    private static void imprimirContratos(Usuario user) {
        Contrato con = new Contrato();
       List<Contrato> contratos = cdi.contratosxUsuario(user);
       Iterator<Contrato> it = contratos.iterator();
       while(it.hasNext()){
           con = it.next();
           System.out.println(con.getFechaInicio()+" codigo: "+con.getIdContrato()+" contacto: "+con.getUsuario().getIdUsuario());
       }
    }

    public test(){}

    public static void main(String[] args) {
       
           Usuario user = new Usuario();          
           Empresa emp = new Empresa();                    
           EmpresaDaoImpl edi = new EmpresaDaoImpl();
           emp = edi.findByID(12);
           Set usuarios = emp.getUsuarios();
           Iterator<Usuario> it =usuarios.iterator();
           while (it.hasNext()){
               user = it.next();
               if (user.getTipoUsuario() == 3)
                   imprimirContratos(user);               
                   //System.out.print(user.getIdUsuario()+user.getNombre());
           }
           
           
           }
       
    }
    
     

