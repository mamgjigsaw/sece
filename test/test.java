
import dwrScripts.validate;
import pojo.Usuario;

public class test {

    public static void main(String[] args) {
            validate valid = new validate();                
            Usuario usuario = new Usuario();
            usuario = valid.balanceoCargaCapacitador();
            
            System.out.print("El usuario asignado es: "+ usuario.getIdUsuario());
        }
       
    }
       
    
     

