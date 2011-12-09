/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import java.util.List;

/**
 *
 * @author mamg
 */
public interface dao <T> {
    void create(T object);
    void delete(T object);
    void update(T object);
    List<T> findAll();

}
