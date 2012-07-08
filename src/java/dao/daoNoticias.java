/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Noticias;

/**
 *
 * @author Mendieta
 */
public interface daoNoticias extends dao<Noticias> {
    Noticias findbyId(int id);
    List<Noticias> findLastest();
}
