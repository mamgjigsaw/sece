/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;
import pojo.Empresa;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public interface daoUsuario extends dao<Usuario>{
    Usuario findByEmail(String email);
    Usuario findById(int id);
    //--------agregado por david
    List<Usuario> usuariosxEmpresa (Empresa empresa);

}
