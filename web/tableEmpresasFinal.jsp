<%-- 
    Document   : tableEmpresasFinal
    Created on : 30-jun-2012, 22:49:18
    Author     : Mendieta
--%>

<%@page import="daoImpl.ContratoDaoImpl"%>
<%@page import="pojo.Contrato"%>
<%@page import="daoImpl.AsignacionCapaContraDaoImpl"%>
<%@page import="pojo.AsignacionCapaContra"%>
<%@page import="daoImpl.daoEmpresasContratosImpl"%>
<%@page import="pojo.EmpresasContratos"%>
<%@page import="daoImpl.EmpresaDaoImpl"%>
<%@page import="pojo.Empresa"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
         <script type="text/javascript" src="/sece/dwr/interface/updates.js"></script>
         <script type="text/javascript" src="/sece/dwr/engine.js"></script>
         <script type="text/javascript" src="/sece/dwr/util.js"></script>
          <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript">
             $(function() 
                 { 
                 //Empresas que estan llenando el Instrumento
      $("#empFinal").tablesorter({widthFixed: true, widgets: ['zebra']}).tablesorterPager({container: $("#pager")});  
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
                                     <div id="pager">
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
                  <table style="width: 100%" id="empFinal" class="tablesorter" cellspacing="1" >
                                                                 <thead>
                                                                     <tr>
                                                                         <th>Empresa</th>
                                                                         <th>Capacitador</th>                                                                        
                                                                         <th>Fecha de Suscripci&oacuten</th>
                                                                         <th>Fecha de Finalizaci&oacuten</th>
                                                                     </tr>
                                                                 </thead>  
                                                                 <tbody>
                                                               <%
                                                               Contrato c = new Contrato();
                                                               Usuario cap = new Usuario(); 
                                                                ContratoDaoImpl cdi = new ContratoDaoImpl();
                                                                AsignacionCapaContra accont = new AsignacionCapaContra();
                                                                 AsignacionCapaContraDaoImpl accdi = new AsignacionCapaContraDaoImpl();
                                                                 EmpresasContratos ec = new EmpresasContratos();                                       
                                                                daoEmpresasContratosImpl ecdi = new daoEmpresasContratosImpl(); 
                                                                List<EmpresasContratos> epact = ecdi.findAllByEstado(2);                                                                                               
                                                               Iterator<EmpresasContratos> ite = epact.iterator();                                                               
                                                               
                                                               while(ite.hasNext()){
                                                               ec = ite.next();
                                                               int idc = ec.getIdContrato();
                                                               c = cdi.findById(idc);                   
                                                        try{
                                                              accont = accdi.findbyIdContrato(c);                                                                                    
                                                              cap = accont.getUsuario();                              
                                                           %>
                                                           <tr>
                                                               <td><%= ec.getEmpresaNombre() %></td>
                                                               <td><%= cap.getNombre() %></td>                                                               
                                                               <td><%= ec.getContratoFecha().toString() %></td>
                                                               <td><%= ec.getContratoFechaFinalizo().toString() %></td>
                                                           </tr>
                                                                     <%                              
                                                       }catch(NullPointerException e) {
                                                                                       }
                                                               }
                                                               %>      
                                                                 </tbody>
                  </table>
