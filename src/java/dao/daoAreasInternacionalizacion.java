/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import pojo.AreasInter;

/**
 *
 * @author Dave
 */
public interface daoAreasInternacionalizacion extends dao<AreasInter> {
    List<AreasInter> areas ();
    AreasInter findById(int idArea);
}
