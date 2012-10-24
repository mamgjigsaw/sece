<%-- 
    Document   : tablaCapacitadores
    Created on : 27-ene-2012, 13:25:37
    Author     : Mendieta
--%>

<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Acceso"%>
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
          <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
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
               <% Usuario usua = new Usuario();
                              UsuarioDaoImpl usuaDI = new UsuarioDaoImpl();
                               usua = usuaDI.findAdministrador();
                               Acceso ac = new Acceso();
                                 AccesoDaoImpl acDI = new AccesoDaoImpl();
                                ac = acDI.findUltimoAcceso(usua);
                                     %>            
         <script>
             function deleteCapa(idcap, nombre){ 
                  window.location.reload(true);
                 if(confirm('¿Esta seguro que desea desactivar a: ' + nombre + '?')){                    
                     
                     validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 18, "Anulo un Capacitador", idcap,"Estado Activo" , "Estado Inactivo");  
                     updates.deleteCapacitador(idcap);
                     location.reload();
                 }else{
                     
                 }      
             } 
             
             function reactivarCapa(idcap,nombre){
                  window.location.reload(true);
                 if(confirm('¿Esta seguro que desea activar a: ' + nombre + '?')){
                     validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 55, "Reactivar un Capacitador", idcap,"Estado Inactivo" , "Estado Activo");  
                     updates.activateCapacitador(idcap);
                     location.reload();
                 } 
             }   
         </script>
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" /> 
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
			                
		                        </select>
	                  </form>
                       </div>
        
        
      <div align="center" >  
        
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
                    
                    if(ucap.getTipoUsuario() == 2){
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
                
            	
                        <tr id="<%= ucap.getIdUsuario().toString() %>" >                           
                            <td><%= ucap.getNombre() %></td>
                            <td><%= ucap.getTelefono() %></td>
                            <td><%= ucap.getCorreo() %></td>
                            <td><%= ucap.getDireccion() %></td>
                            
                            <td><%= s %></td>
                            <td>
                                <% if (ucap.getEstado() == 1 || ucap.getEstado() == 2){%>
                                    <a style="cursor: pointer" onclick="deleteCapa(<%= ucap.getIdUsuario().toString() %>, '<%= ucap.getNombre().toString() %>');" title=""><img src="images/icon_delete.png" alt="Desactivar" /></a>
                                <%}%>    
                                <% if (ucap.getEstado() == 0){ %>
                                    <a style="cursor: pointer" onclick="reactivarCapa(<%= ucap.getIdUsuario().toString() %>, '<%= ucap.getNombre().toString() %>');" title=""><img src="images/icon_approve.png" alt="Activar" /></a>
                                <% }%>    
                            </td>
                            
                        </tr>
                        
                        
                    
                  <%}
}                  
%>
              
                </tbody>
                </table>


                      
      </div>


         

