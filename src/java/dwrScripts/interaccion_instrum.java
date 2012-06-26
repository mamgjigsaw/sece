/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AvanceDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.RespItemDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.VariableDaoImpl;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import pojo.Avance;
import pojo.Contrato;
import pojo.Indicador;
import pojo.Item;
import pojo.RespItem;
import pojo.Usuario;
import pojo.Variable;

/**
 *
 * @author mamg
 */
public class interaccion_instrum {
    
    public interaccion_instrum() {
    }
   
    public int prueba(){
        return 2;        
    }
    public List<Item> obtenerCuestionario(int id_indicador,int var){
                       
        IndicadorDaoImpl indDao = new IndicadorDaoImpl();
        Indicador indicador = new Indicador();
        indicador = indDao.findById(id_indicador);
        
        VariableDaoImpl varDao = new VariableDaoImpl();
        List<Variable> listVariable = new ArrayList<Variable>();
        listVariable = varDao.findByIndicador(indicador);
        Variable variable = new Variable();
        variable = listVariable.get(var);
        
        ItemDaoImpl itemDao = new ItemDaoImpl();
        List<Item> listItem = new ArrayList<Item>();
        listItem = itemDao.findByVariableActivo(variable);
        
        return listItem;
    }
    
    public void saveandnext(int id_usuario,int id_contrato, int id_item,int respuesta,String obser){
        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        Usuario usuario = usuDao.findById(id_usuario);
        
        ContratoDaoImpl contraDao = new ContratoDaoImpl();
        Contrato contrato = contraDao.findById(id_contrato);
        
        ItemDaoImpl itemD = new ItemDaoImpl();
        Item item = itemD.findById(id_item);
        
        RespItemDaoImpl respDao = new RespItemDaoImpl();
        RespItem resp = new RespItem(usuario,item,contrato,respuesta,obser);
        respDao.create(resp);        
        
    }
    
    public int aunm(int id_indicador,int id_contrato){
        int ac;
        AvanceDaoImpl avanDao = new AvanceDaoImpl();
        Avance avance = avanDao.findByIndiAndContra(id_indicador, id_contrato);
        ac = avance.getVar();
        ac++; 
        avance.setVar(ac);        
        avanDao.update(avance);        
        return ac;
    }
    
    public String getNameVariable(int actual,int id_indicador){
        //actual= actual +1;
        String nombre;    
        IndicadorDaoImpl indDao = new IndicadorDaoImpl();
        Indicador indicador = new Indicador();
        indicador = indDao.findById(id_indicador);
        
        VariableDaoImpl varDao2 = new VariableDaoImpl();
        List<Variable> listVariable2 = new ArrayList<Variable>();
        listVariable2 = varDao2.findByIndicador(indicador);
        Variable variable2 = new Variable();
        variable2 = listVariable2.get(actual);
              
        nombre = variable2.getNombre();
        return nombre;                
    }
    
    public String[][] getItemAnswered(){
        String array[][] = new String[1][2];
        
        
        return array;
    }
    
    public String[][] getListVariable(int id_indicador, int id_contrato){
       
       // try{           
        
        int finalizado = 0;
        int fila = 0;
        
        IndicadorDaoImpl indDao = new IndicadorDaoImpl();
        Indicador indicador = new Indicador();
        indicador = indDao.findById(id_indicador);
        
        VariableDaoImpl varDao = new VariableDaoImpl();
        List<Variable> listVariable = new ArrayList<Variable>();
        listVariable = varDao.findByIndicador(indicador);   
        
        String array[][] = new String[listVariable.size()][3];
        
        Variable variable = new Variable();
        Iterator<Variable> iteratorVar = listVariable.iterator(); 
        
        ItemDaoImpl daoItem = new ItemDaoImpl();
        List<Item> listItem = new ArrayList<Item>();
        Item item = new Item();
        
        
        RespItemDaoImpl daoResp = new RespItemDaoImpl();
        RespItem resp = new RespItem();
        
        while(iteratorVar.hasNext()){
            variable = iteratorVar.next();
            listItem = daoItem.findByVariableActivo(variable); //revisar que el item no importa su estado si esta activo o inactivo
            
            Iterator<Item> iteratorItem = listItem.iterator();
            
            while(iteratorItem.hasNext()){
                item = iteratorItem.next();
                
                resp = daoResp.findByContratoItem(id_contrato, item.getIdItem());
                
                if(resp != null ){
                    finalizado = finalizado + 1;
                }
            }
            
            if(finalizado ==0){                 
                 array[fila][0] = String.valueOf(variable.getIdVariable()); 
                 array[fila][1] = variable.getNombre();
                 array[fila][2] = "No esta Finalizado";
                 fila = fila + 1;
                 finalizado = 0;
            }else{
                 array[fila][0] = String.valueOf(variable.getIdVariable()); 
                 array[fila][1] = variable.getNombre();
                 array[fila][2] = "Finalizado";
                 fila = fila + 1;
                 finalizado = 0;
            }
            
            
        }
        //}catch(Exception e){System.out.println(e.getMessage());}
        
        return array;
    }
    
    public String[][] getVariableFinished(int id_variable, int id_contrato){
         String array[][] = new String[2][3];
         
         VariableDaoImpl daoVar = new VariableDaoImpl();
         
         
         return array;
    }
       
    
}
