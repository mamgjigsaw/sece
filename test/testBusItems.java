

import daoImpl.ItemDaoImpl;
import daoImpl.VariableDaoImpl;
import java.util.Iterator;
import java.util.List;
import pojo.Item;
import pojo.Variable;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Dave
 */
public class testBusItems {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         String nombreVariable = "Existe control de la relación con los socios estratégicos. No aplica.";
         VariableDaoImpl vdi = new VariableDaoImpl();
         ItemDaoImpl idi = new ItemDaoImpl();
         Item item = new Item();
         Variable var = vdi.findById(10);
         List<Item> items = idi.findByVariable(var);
         Iterator<Item> it = items.iterator();
          
          while(it.hasNext()){
           System.out.println(it.next().getDescripcion());               
    }
    }
}
