/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Producto;

/**
 *
 * @author davidalmanza
 */
public interface daoProducto extends dao<Producto> {
    Producto findById( int idproducto );
    List<Producto> findListbyempresa (int idempresa);
}
