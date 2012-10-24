/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AsignacionCapaContraDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.UsuarioDaoImpl;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import pojo.AsignacionCapaContra;
import pojo.Contrato;
import pojo.Usuario;

/**
 *
 * @author wmiguel
 */
public class test {
    
    public static void main(String arg[]){
           int cantidadContratos = 0;
        
        List<Usuario> listCapa = new ArrayList<Usuario>();
        UsuarioDaoImpl daoUsuario = new UsuarioDaoImpl();
        listCapa = daoUsuario.capacitadoresActivos();
        
        Iterator<Usuario> iterUsu = listCapa.iterator();
        Usuario usuario = new Usuario();
        
        List<AsignacionCapaContra> listAsignacion = new ArrayList<AsignacionCapaContra>();
        AsignacionCapaContraDaoImpl daoAsignacion = new AsignacionCapaContraDaoImpl();
        
        Contrato contrato = new Contrato();
        ContratoDaoImpl daoContra = new ContratoDaoImpl();
        
        String array[][] = new String[listCapa.size()][2];
        int m=0;
        //recorriendo usuario capacitador uno por uno.
        while(iterUsu.hasNext()){
            usuario = iterUsu.next();
            listAsignacion = daoAsignacion.findAllByIdUsuarioCapacitador(usuario);
            array[m][0] = String.valueOf(usuario.getIdUsuario());
            
            System.out.println("La cantidad de asignaciones por usuario son: "+listAsignacion.size());
            Iterator<AsignacionCapaContra> iterAsig  = listAsignacion.iterator();
            
            if(listAsignacion.size()==0){
                //return usuario;// a este usuario le vamos asignar porque no poseia contratos asignados
                System.out.println("El capacitador que no tiene asignacion: "+usuario.getNombre());
            }else{
                // sacamos los contratos realizandose
                while(iterAsig.hasNext()){
                    contrato = daoContra.findById(iterAsig.next().getContrato().getIdContrato());
                    if(contrato.getEstado()==1){
                       cantidadContratos++; 
                       System.out.println("entro: "+cantidadContratos);
                    }
                }
            }
            
            System.out.println("Esta imprimienp: "+cantidadContratos);
            array[m][1] = String.valueOf(cantidadContratos);
            cantidadContratos = 0;//inicializo en cero para comenzar de nuevo
            m++;
        }
        
        //voy ordenar el array por el metodo de la burbuja
        String aux[][] = new String[1][2];//array auxiliar
        
        //Vamos a recorrer la matriz
        for(int i = 0; i < listCapa.size(); i++){
            for (int j = i + 1; j < listCapa.size(); j++){
                if(Integer.parseInt(array[j][1]) < Integer.parseInt(array[i][1])){
                    aux[0][0] = array[i][0]; 
                    aux[0][1] = array[i][1]; 
                    
                    array[i][0] = array[j][0];
                    array[i][1] = array[j][1];
                    
                    array[j][0] = aux[0][0];                    
                    array[j][1] = aux[0][1];                    
                }//fin del if
            }//fin del segundo for j           
        }//fin del primer for i
        
        //aqui busco el primer usuario del array que significaria el que posee mas
        
        for(int n= 0;n<listCapa.size();n++){
            System.out.println(" despuees El capacitador : "+ array[n][0] + " tiene "+ array[n][1] +" asignaciones");
        }
     
    }
    
}
