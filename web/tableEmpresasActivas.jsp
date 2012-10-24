<%-- 
    Document   : tableEmpresasActivas
    Created on : 30-jun-2012, 22:37:37
    Author     : Mendieta
--%>

<%@page import="daoImpl.RespItemDaoImpl"%>
<%@page import="daoImpl.ItemDaoImpl"%>
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
         <script type="text/javascript" src="/sece/dwr/interface/capacitadoresDWR.js"></script>
          <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" />
      <script type="text/javascript">
             $(function() 
                 { 
                 //Empresas que estan llenando el Instrumento
      $("#empActivas").tablesorter({widthFixed: true, widgets: ['zebra']}).tablesorterPager({container: $("#pager")});  
             } 
             );
                 function changeCap(idAC){                   
                     document.getElementById("lblC"+idAC).style.display = 'none';
                     document.getElementById("btnC"+idAC).style.display = 'none';
                     document.getElementById("btnG"+idAC).style.display = 'block';                     
                     document.getElementById("btnX"+idAC).style.display = 'block';
                     capacitadoresDWR.cargarCapacitadores(idAC, listaCap);                     
                 }
                 function cancelar(idAC){                   
                     document.getElementById("lblC"+idAC).style.display = 'inline';
                     document.getElementById("btnC"+idAC).style.display = 'inline';
                     document.getElementById("btnX"+idAC).style.display = 'none';
                     document.getElementById("btnG"+idAC).style.display = 'none';  
                     $("#capaSelect"+idAC).remove();                     
                                          
                 }
                 function listaCap(data){                    
                     var strSelect = "<select id = 'capaSelect"+ data[0][0] +"'>";
                     var i;
                     var tr = data[0][0];
                     
                     for(i = 1; i < data.length ; i++){
                         strSelect += "<option value = '"+ data[i][0] +"'>"+ data[i][1] +"</option>"
                     }
                     strSelect += "</select>";
                     
                     var trCell = document.getElementById(tr).getElementsByTagName("td");                     
                     $(trCell[1]).append(strSelect);                     
                     
                 }
                 function guardarCap(data){
                     var selec = $("#capaSelect"+ data +"").val();
                     //alert("valor: " + selec);
                     capacitadoresDWR.guardarCambiarCapacitador(data, selec);
                     location.reload();
                 }
                 
                 
                 
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
                                     <table style="width: 100%" id="empActivas" class="tablesorter" cellspacing="1" >
                                                                 <thead>
                                                                     <tr>
                                                                         <th>Empresa</th>
                                                                         <th style="width: 250px ">Capacitador</th>                                                                        
                                                                         <th>Fecha de Suscripci&oacuten</th>
                                                                         <th>Avance</th>
                                                                     </tr>
                                                                 </thead>  
                                                                 <tbody>
                                                               <%
                                                               ItemDaoImpl itemImpl = new ItemDaoImpl();
                                                               int numTotalItems = itemImpl.numItemActivos();
                                                               RespItemDaoImpl ridimpl = new RespItemDaoImpl();
                                                               int respxcontra = 0;                                                                                                                             
                                                               Contrato c = new Contrato();
                                                               Usuario cap = new Usuario(); 
                                                                ContratoDaoImpl cdi = new ContratoDaoImpl();
                                                                AsignacionCapaContra accont = new AsignacionCapaContra();
                                                                 AsignacionCapaContraDaoImpl accdi = new AsignacionCapaContraDaoImpl();
                                                                 EmpresasContratos ec = new EmpresasContratos();                                       
                                                                daoEmpresasContratosImpl ecdi = new daoEmpresasContratosImpl(); 
                                                                List<EmpresasContratos> epact = ecdi.findAllByEstado(1);                                                                                               
                                                               Iterator<EmpresasContratos> ite = epact.iterator();                                                               
                                                               
                                                               while(ite.hasNext()){
                                                               ec = ite.next();
                                                               int idc = ec.getIdContrato();
                                                               c = cdi.findById(idc);
                                                               respxcontra = ridimpl.ItemRespondidosxContrato(c);
                                                              int avancexContrato = ((respxcontra * 100) / numTotalItems);                                                                                                                                               
                                                        try{
                                                              accont = accdi.findbyIdContrato(c);                                                                                    
                                                              cap = accont.getUsuario();                              
                                                           %>
                                                           <tr id="<%= accont.getIdAsignacion().toString() %>">
                                                               <td><%= ec.getEmpresaNombre() %></td>
                                                               <td><label id="lblC<%= accont.getIdAsignacion().toString() %>" ><%= cap.getNombre() %></label>
                                                               <a id="btnC<%= accont.getIdAsignacion().toString() %>" style="cursor: pointer; float: right" onclick="changeCap('<%= accont.getIdAsignacion().toString() %>');" title="Cambiar Capacitador"><img src="images/arrow_switch.png" alt="Edit" /></a>
                                                               <a id="btnG<%= accont.getIdAsignacion().toString() %>" style="cursor: pointer; float: right; display: none" onclick="guardarCap('<%= accont.getIdAsignacion().toString() %>');" title="Guardar"><img src="images/icon_approve.png" alt="Edit" /></a>
                                                               <a id="btnX<%= accont.getIdAsignacion().toString() %>" style="cursor: pointer; float: right; display: none" title="Cancelar"> <img src="images/cancelar-icono-16.png" onclick="cancelar('<%= accont.getIdAsignacion().toString() %>')" alt="Cancelar"/></a>
                                                               </td>                                                               
                                                               <td><%= ec.getContratoFecha().toString() %></td>
                                                               <td>
                                                                <div class="progress-bar blue small" style="width:50%; float: left;"><div style="width:<%=avancexContrato + "%"%>;"><span style="top:16%;"><%=avancexContrato + "%"%></span></div> </div>   
                                                               </td>
                                                           </tr>
                                                                     <%                              
                                                       }catch(NullPointerException e) {
                                                                                       }
                                                               }
                                                               %>      
                                                                 </tbody>
                  </table>