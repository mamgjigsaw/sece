/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AvanceDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.EscalaDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.RespItemDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.VariableDaoImpl;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import pojo.Avance;
import pojo.Contrato;
import pojo.Escala;
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
    
    public void update(int id_item, int id_contrato, int respuesta, String observacion){
        
        RespItemDaoImpl respDao = new RespItemDaoImpl();
        RespItem resp = new RespItem();
        resp = respDao.findByContratoItem(id_contrato, id_item);
        
        resp.setObservacion(observacion);
        resp.setResBoolean(respuesta);
        respDao.update(resp);        
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
        
        System.out.print("The varible is: "+ id_variable +" and the contrato is: "+id_contrato);
        
         Variable variable = new Variable();
         VariableDaoImpl varDao = new VariableDaoImpl();
         variable = varDao.findById(id_variable);
         
         System.out.print("name variable: " + variable.getNombre());
         Item item = new Item();
         ItemDaoImpl itemDao = new ItemDaoImpl();
         List<Item> listItem = new ArrayList<Item>();
         listItem = itemDao.findByVariable(variable);
         
         Iterator<Item> iterItem = listItem.iterator();
         
         RespItem resp = new RespItem(); 
         RespItemDaoImpl respDao = new RespItemDaoImpl();
         
         String array[][] = new String[20][4];
         int i=0;
         while(iterItem.hasNext()){
             item = iterItem.next();
             
             resp = respDao.findByContratoItem(id_contrato, item.getIdItem());
             
             if(resp != null){
                 array[i][0] = itemDao.findById(resp.getItem().getIdItem()).getDescripcion();             
                 array[i][1] = String.valueOf(resp.getResBoolean());
                 array[i][2] = resp.getObservacion();
                 array[i][3] = String.valueOf(resp.getItem().getIdItem());
                 i++;
             }
             
         }
         return array;
    }
    
    public void setCompletedInstrument(int  id_contrato){
        //con este metodo miro si el contrato ya llego a 100, si es asi cambio su estado a completado
         Contrato contrato = new Contrato();
         ContratoDaoImpl daoContra = new ContratoDaoImpl();
         contrato = daoContra.findById(id_contrato);
        
         initCapacitadores init = new initCapacitadores();
         int av = init.AvancePorcXcontrato(contrato); 
         
         if (av==100){
             contrato.setEstado(2);
             daoContra.update(contrato);
             
             //calculo para guardar en avence en el campo resultado
                               
             int respPositiva=0;
             int valoracion=0;
             double promedio = 0.0;
             double eva;
             int ponderacion=0;
             double v=0;
             double vs=0.0;

             IndicadorDaoImpl daoIndi = new IndicadorDaoImpl();
             List<Indicador> listIndi = new ArrayList<Indicador>();
             listIndi = daoIndi.findAllByActive();

             Indicador indicador = new Indicador();
             Variable variable = new Variable();
             Item item = new Item();

             RespItemDaoImpl daoRespItem = new RespItemDaoImpl();
             RespItem resp = new RespItem();

             EscalaDaoImpl daoEsc = new EscalaDaoImpl();
             Escala escala = new Escala();

             AvanceDaoImpl daoAvance = new AvanceDaoImpl();
             Avance avance = new Avance();

             DecimalFormat formateador = new DecimalFormat("##.##");

             for (int i=0;listIndi.size() > i;i++){//4 indicadores
                 indicador = listIndi.get(i);
                 //System.out.println(">><><><><> indicador " + indicador.getNombre());

                 VariableDaoImpl daoVariable = new VariableDaoImpl();
                 List<Variable> listVariable = new ArrayList<Variable>();
                 listVariable = daoVariable.findByIndicador(indicador);

                 for(int j=0;listVariable.size() > j ;j++){ 

                     variable = listVariable.get(j);
                     //System.out.println("<><> variable " + variable.getNombre());

                     ItemDaoImpl daoItem = new ItemDaoImpl();
                     List<Item> listItem = new ArrayList<Item>();
                     listItem = daoItem.findByVariableActivo(variable);

                     for (int m=0;listItem.size() > m; m++){
                         item = listItem.get(m);

                         resp = daoRespItem.findByContratoItem(id_contrato, item.getIdItem());

                         if(resp.getResBoolean()==1){
                             respPositiva = respPositiva + 1;
                         }
                     }

                         escala = daoEsc.findByVarRango(variable.getIdVariable(),respPositiva);
                         //System.out.println("La variable " + variable.getIdVariable() + " el rango "+ respPositiva +" la escala " + escala.getValoracion() );

                     respPositiva = 0;
                     valoracion = valoracion + escala.getValoracion();
                     
                     ponderacion = ponderacion + variable.getPonderacion();
                     //ponderacionTotal = ponderacionTotal + variable.getPonderacion();
                 }//fin ciclo variable

                 promedio = (double) valoracion / listVariable.size();

                 //System.out.println("><<<<?????????? promedio por indicador " + Double.valueOf(formateador.format(promedio)) +" valoracion "+ valoracion + " con num variable " + listVariable.size());

                 //System.out.println(Double.valueOf(formateador.format(promedio*0.25*100)));

                 eva = Double.valueOf(formateador.format(promedio*0.25*100));
                 v = ponderacion * indicador.getContribucion();
                 vs = v * promedio * 0.25;

                 avance = daoAvance.findByIndiAndContra(indicador.getIdIndicador(), id_contrato);             
                 avance.setV((int) v);
                 avance.setVs((float)vs);
                 avance.setResultado((float) eva);               
                 daoAvance.update(avance);

                 //inicializar las variables
                 promedio = 0.0;
                 valoracion = 0;
                 ponderacion = 0;
                 v = 0.0;
                 vs =0.0;
             
         }
       }//fin del if av==100
    }   
    
}
