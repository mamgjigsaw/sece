<%-- 
    Document   : tablaCapacitadores
    Created on : 27-ene-2012, 13:25:37
    Author     : Mendieta
--%>

<%@page import="pojo.AsignacionCapaContra"%>
<%@page import="daoImpl.AsignacionCapaContraDaoImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript" src="/sece/dwr/interface/updates.js"></script>
         <script type="text/javascript" src="/sece/dwr/engine.js"></script>
         <script type="text/javascript" src="/sece/dwr/util.js"></script>
         <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
         <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
         <script type="text/javascript">
             $(function() 
                 { 
                 $("#tablaCap")
                 .tablesorter({widthFixed: true, widgets: ['zebra']})
                 .tablesorterPager({container: $("#pagerCap")}); 
                 } 
             );
         </script> 
         <script>
             function deleteCapa(idcap, nombre){
                
                 if(confirm('¿Esta seguro que desea eliminar a: ' + nombre + '?')){
                     updates.deleteCapacitador(idcap);
                     location.reload();
                 }else{
                     
                 }
                
                 
             } 
             
         </script>
         
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" /> 
        
        
        
      <div style="padding-top: 20px;" align="center" >  
        
        <table id="tablaCap" class="tablesorter" cellspacing="1" width="100%">
                	<thead>
                    	<tr>                          
                            <th>NOMBRE</th>
                            <th>TELEFONO</th>
                            <th>CORREO</th>
                            <th>DIRECCION</th>
                            
                            <th>EMPRESAS ATENDIDAS</th>
                            <th>ACCIONES</th>
                        </tr>
                        </thead>
                <tbody>    
                <%
                 UsuarioDaoImpl udi = new UsuarioDaoImpl();
                
                 List<Usuario> capacitadores = udi.findAll();  
                 Iterator<Usuario> itc = capacitadores.iterator();
                 Usuario ucap = new Usuario();
                  while(itc.hasNext()){
                    ucap = itc.next();
                    
                    if(ucap.getTipoUsuario() == 2 && ucap.getEstado() == 1){
                    AsignacionCapaContraDaoImpl accdi = new AsignacionCapaContraDaoImpl();
                    List<AsignacionCapaContra> numEmp = accdi.findAllByIdUsuarioCapacitador(ucap);
                    int numero = 0;
                    
                                                            
                   if(numEmp.isEmpty()){
                        //sigue valiendo 0
                    }
                     else {
                    numero = numEmp.size();   
                    }
                String s = String.valueOf(numero);
  
%>
                
            	
                        <tr>                           
                            <td><%= ucap.getNombre() %></td>
                            <td><%= ucap.getTelefono() %></td>
                            <td><%= ucap.getCorreo() %></td>
                            <td><%= ucap.getDireccion() %></td>
                            
                            <td><%= s %></td>
                            <td>
                                
                                <a onclick="deleteCapa(<%= ucap.getIdUsuario().toString() %>, '<%= ucap.getNombre().toString() %>');" title=""><img src="images/icon_delete.png" alt="Approve" /></a>
                                
                                
                            </td>
                            
                        </tr>
                        
                        
                    
                  <%}
}                  
%>
              
                </tbody>
                </table>


                      <div id="pagerCap">
	                 <form>
		                <img src="resources/tablesorter/icons/first.png" class="first"/>
		                <img src="resources/tablesorter/icons/prev.png" class="prev"/>
		                <input type="text" class="pagedisplay"/>
		                <img src="resources/tablesorter/icons/next.png" class="next"/>
		                <img src="resources/tablesorter/icons/last.png" class="last"/>
		                        <select class="pagesize">
			                <option selected="selected"  value="10">10</option>
			                <option value="20">20</option>
			                <option value="30">30</option>
			                <option  value="40">40</option>
		                        </select>
	                  </form>
                       </div>
      </div>


         

