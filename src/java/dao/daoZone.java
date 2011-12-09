/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.Zone;

/**
 *
 * @author mamg
 */
public interface daoZone extends dao<Zone> {
    Zone findById_Zone(int id_zone);    
}
