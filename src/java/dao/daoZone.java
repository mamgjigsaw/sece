/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.Zone;

/**
 *
 * @author mamg
 */
public interface daoZone extends dao<Zone> {
    Zone findById_Zone(int id_zone);  
    List<Zone> findById_pais(int id_pais);
}
