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
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
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
                
                        <script>
                          updates.getCapacitadores({callback:function(data){
                             $("#tablaCap tbody").html(data);   
                             $(".imgdel").click( function(){ 
                                 idcap = $(this).parent().parent().attr("id");
                                 if(confirm('¿Esta seguro que desea desactivar al usuario?')){                                         
                                     validacion.saveActionBitacora(<%= ac.getIdAcceso().toString()%>, 18, "Anulo un Capacitador", idcap,"Estado Activo" , "Estado Inactivo");                                       
                                     updates.deleteCapacitador(idcap,success);                                     
                                     function success(){window.location.reload(true);}
                                }                                                
                             });
                             
                             $(".imgapp").click( function(){
                                 idcap = $(this).parent().parent().attr("id");
                                 if(confirm('¿Esta seguro que desea activar al usuario?')){
                                     validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 55, "Reactivar un Capacitador", idcap,"Estado Inactivo" , "Estado Activo");  
                                     updates.activateCapacitador(idcap,success);                                     
                                     function success(){window.location.reload(true);}
                                 }                                                  
                             });                             
                          }});
                                             
                        </script>
                </tbody>
                </table>


                      
      </div>


         

