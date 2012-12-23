/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.AsignacionCapaContraDaoImpl;
import daoImpl.AvanceDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.EscalaDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.RespItemDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.ValoracionDaoImpl;
import daoImpl.VariableDaoImpl;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import pojo.AsignacionCapaContra;
import pojo.Avance;
import pojo.Contrato;
import pojo.Escala;
import pojo.Indicador;
import pojo.Item;
import pojo.RespItem;
import pojo.Usuario;
import pojo.Valoracion;
import pojo.Variable;

/**
 *
 * @author wmiguel
 */
public class test {
    
    public static void main(String arg[]){
        System.out.println("entro////");
      
        int id_contrato =42;
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
             
             Valoracion valoracionPojo = new Valoracion();
             ValoracionDaoImpl valDao = new ValoracionDaoImpl();
             Usuario usuario = new Usuario();
             UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
             usuario = usuDao.findById(contrato.getUsuario().getIdUsuario());

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
                     
                     //para guardar en la pojo valoracion
                     
                     Date fecha = new Date();        
                     Timestamp momentoTimestamp = new Timestamp(fecha.getTime());
        
                     valoracionPojo.setContrato(contrato);
                     valoracionPojo.setUsuario(usuario);
                     valoracionPojo.setVariable(variable);
                     valoracionPojo.setEscalaObtenida(escala.getValoracion());
                     valoracionPojo.setPonderacion(variable.getPonderacion());
                     valoracionPojo.setContribucion(indicador.getContribucion());
                     valoracionPojo.setFecha(momentoTimestamp);
                     
                     valDao.create(valoracionPojo);
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
        
        
       System.out.println("paso////");
    }
    /*
           int cantidadContratos = 0;
        
        List<Usuario> listCapa = new ArrayList<Usuario>();
        UsuarioDaoImpl daoUsuario = new UsuarioDaoImpl();
        listCapa = daoUsuario.capacitadoresActivos();
        
        Iterator<Usuario> iterUsu = listCapa.iterator();
        Usuario usuario = new Usuario();
        
        List<AsignacionCapaContra> listAsignacion = new ArrayList<AsignacionCapaContra>();
        AsignacionCapaContraDaoImpl daoAsignacion = new AsignacionCapaContraDaoImpl();
        
        Contrato contrato = new Contrato();
        ContratoDaoImpl daoContra = new ContratoDaoImpl();
        
        String array[][] = new String[listCapa.size()][2];
        int m=0;
        //recorriendo usuario capacitador uno por uno.
        while(iterUsu.hasNext()){
            usuario = iterUsu.next();
            listAsignacion = daoAsignacion.findAllByIdUsuarioCapacitador(usuario);
            array[m][0] = String.valueOf(usuario.getIdUsuario());
            
            System.out.println("La cantidad de asignaciones por usuario son: "+listAsignacion.size());
            Iterator<AsignacionCapaContra> iterAsig  = listAsignacion.iterator();
            
            if(listAsignacion.size()==0){
                //return usuario;// a este usuario le vamos asignar porque no poseia contratos asignados
                System.out.println("El capacitador que no tiene asignacion: "+usuario.getNombre());
            }else{
                // sacamos los contratos realizandose
                while(iterAsig.hasNext()){
                    contrato = daoContra.findById(iterAsig.next().getContrato().getIdContrato());
                    if(contrato.getEstado()==1){
                       cantidadContratos++; 
                       System.out.println("entro: "+cantidadContratos);
                    }
                }
            }
            
            System.out.println("Esta imprimienp: "+cantidadContratos);
            array[m][1] = String.valueOf(cantidadContratos);
            cantidadContratos = 0;//inicializo en cero para comenzar de nuevo
            m++;
        }
        
        //voy ordenar el array por el metodo de la burbuja
        String aux[][] = new String[1][2];//array auxiliar
        
        //Vamos a recorrer la matriz
        for(int i = 0; i < listCapa.size(); i++){
            for (int j = i + 1; j < listCapa.size(); j++){
                if(Integer.parseInt(array[j][1]) < Integer.parseInt(array[i][1])){
                    aux[0][0] = array[i][0]; 
                    aux[0][1] = array[i][1]; 
                    
                    array[i][0] = array[j][0];
                    array[i][1] = array[j][1];
                    
                    array[j][0] = aux[0][0];                    
                    array[j][1] = aux[0][1];                    
                }//fin del if
            }//fin del segundo for j           
        }//fin del primer for i
        
        //aqui busco el primer usuario del array que significaria el que posee mas
        
        for(int n= 0;n<listCapa.size();n++){
            System.out.println(" despuees El capacitador : "+ array[n][0] + " tiene "+ array[n][1] +" asignaciones");
        }
     */
    //}
    
}
