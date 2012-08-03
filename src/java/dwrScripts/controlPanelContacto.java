/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

import daoImpl.ContratoDaoImpl;
import daoImpl.DelegacionIndiUsuDaoImpl;
import daoImpl.EmpresaDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.RespItemDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.encriptar;
import java.util.ArrayList;
import java.util.List;
import pojo.Contrato;
import pojo.DelegacionIndiUsu;
import pojo.Empresa;
import pojo.Indicador;
import pojo.Usuario;

/**
 *
 * @author wmiguel
 */
public class controlPanelContacto {
  private int resultado;
    public controlPanelContacto() {
    }
    
    public void addDelegado(int idEmpresa,int idIndicador,int idContrato,String name,String tel,String cargo,String dir,String correo,String pass){
        String password = encriptar.md5(pass);
        
        EmpresaDaoImpl daoEmpresa = new EmpresaDaoImpl();
        Empresa empresa = daoEmpresa.findByID(idEmpresa);
        
        Usuario usuario = new Usuario(empresa,name,cargo,tel,correo,dir,4,password,1,null,null,null,null,null);
        UsuarioDaoImpl daoUsuario = new UsuarioDaoImpl();
        daoUsuario.create(usuario);
        
        IndicadorDaoImpl daoIndi = new IndicadorDaoImpl();
        Indicador indicador = daoIndi.findById(idIndicador);
        
        ContratoDaoImpl daoContrato = new ContratoDaoImpl();
        Contrato contrato = daoContrato.findById(idContrato);
        
        DelegacionIndiUsu dele = new DelegacionIndiUsu();
        DelegacionIndiUsuDaoImpl daoDele = new DelegacionIndiUsuDaoImpl();
        dele = daoDele.findByContratoIndicador(indicador, contrato);
        dele.setUsuario(usuario);
        daoDele.update(dele);        
    }
      
    public int AvanceIndicador(int idContrato, int idIndicador){
        //Numero de Items activos                              
        ItemDaoImpl idi = new ItemDaoImpl();
        int numItems = idi.numItemActivosByIndicador(idIndicador);
                
        //numero de item respondidos
        RespItemDaoImpl ridi = new RespItemDaoImpl();        
        int respxContrato = ridi.ItemRespondidosxContratoByIndicador(idContrato, idIndicador);        
       
        return ((respxContrato * 100) / numItems);
    }
    
    public String[][] getRowIndicador (int id_contrato){
        
        Indicador indicador = new Indicador();
        IndicadorDaoImpl daoIndi = new IndicadorDaoImpl();
        int can = daoIndi.getCountIndicador();
        
        String array[][] = new String[can][4];
        
        ContratoDaoImpl daoContrato = new ContratoDaoImpl();
        Contrato contrato = daoContrato.findById(id_contrato);
        
        List<DelegacionIndiUsu> list = new ArrayList<DelegacionIndiUsu>();
        DelegacionIndiUsuDaoImpl daoDel = new DelegacionIndiUsuDaoImpl();
        list = daoDel.delegacionxContrato(contrato);
        
        Usuario usuario = new Usuario();
        UsuarioDaoImpl daoUsu = new UsuarioDaoImpl();
        
        for(int i=0;i<list.size();i++){
            DelegacionIndiUsu delegado = list.get(i);
            indicador = daoIndi.findById(delegado.getIndicador().getIdIndicador());
            usuario = daoUsu.findById(delegado.getUsuario().getIdUsuario());
            
            array[i][0] = indicador.getNombre();
            array[i][1] = usuario.getNombre();                        
            array[i][2] = String.valueOf(AvanceIndicador(id_contrato,indicador.getIdIndicador()));
            array[i][3] = indicador.getIdIndicador().toString();
            
        }       
        
        return array;
    }
    
    public String[][] getContratos(int id_usuario){
        Usuario usuario = new Usuario();
        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        usuario = usuDao.findById(id_usuario);
        
        List<Contrato> listContra = new ArrayList<Contrato>();
        ContratoDaoImpl daoContra = new ContratoDaoImpl();
        listContra = daoContra.contratosxUsuario(usuario);
       
        String array[][] = new String[listContra.size()][4];
        
        
        return array;
    }
    
    public int getCountInd(int id_contrato){
        
        ContratoDaoImpl daoContrato = new ContratoDaoImpl();
        Contrato contrato = daoContrato.findById(id_contrato);
        
        IndicadorDaoImpl daoIndi = new IndicadorDaoImpl();
        int can = daoIndi.getCountIndicador();
        return can;
    }
    
    public int updatePass(int id_usuario, String contraOld,String contraNew, String contraNew2){
        
        
        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();        
        Usuario usuario = usuDao.findById(id_usuario);
        
        String passwordOld = encriptar.md5(contraOld);
        
        if( passwordOld.equals(usuario.getPassword()) ){            
            if(contraNew.equals(contraNew2)){
                String passwordNew = encriptar.md5(contraNew);
                usuario.setPassword(passwordNew);
                usuDao.update(usuario);
                resultado=2;//fue cambio el password
            }else{
                resultado=1;//no coinciden el nuevo pass
            }
        }else{
            resultado=0;//no coincide los passwor anterior
        }
        
        return resultado;
    }
    
    public String[][] getRowDelegado (int id_empresa){
        
        EmpresaDaoImpl empresaDao = new EmpresaDaoImpl();
        Empresa empresa = new Empresa();
        empresa = empresaDao.findByID(id_empresa);
        
        List<Usuario> list = new ArrayList<Usuario>();
        UsuarioDaoImpl daoUsu = new UsuarioDaoImpl();        
        list = daoUsu.findDelegadosByIdEmpresa(empresa);
        
        String arreglo[][] = new String[list.size()][4];                        
        Usuario usuario = new Usuario();        
        
        for(int i=0;i<list.size();i++){
            usuario = list.get(i);            
                       
            arreglo[i][0] = usuario.getNombre();
            arreglo[i][1] = usuario.getCargo();
            arreglo[i][2] = usuario.getEstado().toString();
            arreglo[i][3] = usuario.getIdUsuario().toString();
        }          
         
        return arreglo;
    }
    
    public void updateEmpresa(int id_empresa,String nombre,String descripcion,String telefono,String direccion){
        EmpresaDaoImpl empDao = new EmpresaDaoImpl();
        Empresa empresa = new Empresa();
        empresa = empDao.findByID(id_empresa);
        empresa.setNombre(nombre);
        empresa.setDescripcion(descripcion);
        empresa.setTelefono(telefono);
        empresa.setDireccion(direccion);
        empDao.update(empresa);
    }
    
    public List<String> getEmpresa(int id_empresa){//metodo que obtiene datos de la empresa.
        List<String> list = new ArrayList<String>();
        EmpresaDaoImpl empDao = new EmpresaDaoImpl();
        Empresa empresa = new Empresa();
        empresa = empDao.findByID(id_empresa);
        
        list.add(0, empresa.getNombre() );
        list.add(1, empresa.getDescripcion());
        list.add(2, empresa.getTelefono());
        list.add(3, empresa.getDireccion());               
        
        return list;
    }
    
    public List<String> getUsuario(int id_usuario){//metodo que obtiene datos del usuario.
        List<String> list = new ArrayList<String>();
        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        Usuario usuario = new Usuario();
        usuario = usuDao.findById(id_usuario);
        
        list.add(0, usuario.getNombre() );
        list.add(1, usuario.getCargo());
        list.add(2, usuario.getTelefono());
        list.add(3, usuario.getDireccion());               
        list.add(4, usuario.getCorreo());               
        
        return list;
    }
    
    public void updateUsuario(int id_usuario,String name,String cargo,String telefono,String direccion,String correo){
        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        Usuario usuario = new Usuario();
        usuario = usuDao.findById(id_usuario);
        usuario.setNombre(name);
        usuario.setCargo(cargo);
        usuario.setTelefono(telefono);
        usuario.setDireccion(direccion);
        usuario.setCorreo(correo);
        usuDao.update(usuario);
    }
    
    public String[][] getIndicadores (){
        
        IndicadorDaoImpl indiDao = new IndicadorDaoImpl();
        Indicador indicador = new Indicador();
                
        List<Indicador> list = new ArrayList<Indicador>();
        list =  indiDao.findAllByActive();
        
        String arreglo[][] = new String[list.size()][2];                                
        
        for(int i=0;i<list.size();i++){
            indicador = list.get(i);            
                       
            arreglo[i][0] = indicador.getIdIndicador().toString();
            arreglo[i][1] = indicador.getNombre();            
        }          
         
        return arreglo;
    }
    
    public String[][] getAllDelegado(int id_empresa){//metodo que obtiene datos del usuario.                
        EmpresaDaoImpl empDao = new EmpresaDaoImpl();
        Empresa empresa = new Empresa();
        empresa = empDao.findByID(id_empresa);
        
        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        List<Usuario> listUsuario = new ArrayList<Usuario>();
        listUsuario = usuDao.findDelegadosByIdEmpresa(empresa);
        
        Usuario usuario = new Usuario();
        String arreglo[][] = new String[listUsuario.size()][2];
        
        for(int i=0;i<listUsuario.size();i++){
            usuario = listUsuario.get(i);
            
            arreglo[i][0] = usuario.getIdUsuario().toString();
            arreglo[i][1] = usuario.getNombre();
        }
        
        return arreglo;
    }
    
    public void cambiarResponsableIndicador(int id_indicador,int id_usuario,int id_contrato){
        
        IndicadorDaoImpl indiDao = new IndicadorDaoImpl();
        Indicador indicador = new Indicador();
        indicador = indiDao.findById(id_indicador);
        
        ContratoDaoImpl contraDao = new ContratoDaoImpl();
        Contrato contrato = new Contrato();
        contrato = contraDao.findById(id_contrato);
        
        DelegacionIndiUsuDaoImpl delDao = new DelegacionIndiUsuDaoImpl();
        DelegacionIndiUsu del = new DelegacionIndiUsu();
        del = delDao.findByContratoIndicador(indicador, contrato);
        
        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        Usuario usuario = new Usuario();
        usuario = usuDao.findById(id_usuario);
        
        del.setUsuario(usuario);
        delDao.update(del);
    }
}
