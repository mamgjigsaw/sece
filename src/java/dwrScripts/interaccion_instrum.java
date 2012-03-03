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
        listItem = itemDao.findByVariable(variable);
        
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
    
    
    public List<Variable> getListVariable(int id_indicador){
                       
        IndicadorDaoImpl indDao = new IndicadorDaoImpl();
        Indicador indicador = new Indicador();
        indicador = indDao.findById(id_indicador);
        
        VariableDaoImpl varDao = new VariableDaoImpl();
        List<Variable> listVariable = new ArrayList<Variable>();
        listVariable = varDao.findByIndicador(indicador);        
        
        return listVariable;
    }
       
    
}
