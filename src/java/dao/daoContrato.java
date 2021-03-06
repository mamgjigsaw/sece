/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import pojo.Contrato;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public interface daoContrato extends dao<Contrato> {
    Contrato findById_Empresa(int id_empresa);
    Contrato findByEstado(int estado);
    Contrato findById(int id_contrato);
    //---------------------------added by David
    //---------------------------added by David     
    int cantidadContratosxUsuarioFinalizados(Usuario usuario);
    List<Contrato> contratosxUsuario (Usuario usuario);
    List<Contrato> contratosDifeCero (Usuario usuario);//contratos diferente de cero
    Contrato findByUsuario(Usuario usuario);//muestra el contrato actual del contacto
    Contrato findByContrato_usuario(int contrato, Usuario usuario);    
    Contrato findByEstado(int estado,Usuario usuario);//by miguel
    int cantidadContratosByUsuario(Usuario usuario);
}
