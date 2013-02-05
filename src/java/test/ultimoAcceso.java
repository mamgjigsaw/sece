/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import daoImpl.AsignacionCapaContraDaoImpl;
import daoImpl.ContratoDaoImpl;
import pojo.AsignacionCapaContra;
import pojo.Contrato;
import pojo.Usuario;

/**
 *
 * @author Dave
 */
public class ultimoAcceso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Contrato con = new Contrato();
        ContratoDaoImpl cdi = new ContratoDaoImpl(); 
        con = cdi.findById(41);
        
       
        AsignacionCapaContraDaoImpl asi = new AsignacionCapaContraDaoImpl();
        
        Usuario user = asi.findUsByContra(con);
        
        System.out.print("Nombre: " + user.getNombre() + "Correo: " + user.getCorreo() + "Direccion: " + user.getDireccion() + "Cargo: " + user.getCargo() + "Telefono: " + user.getTelefono());
        
        
    }
}
