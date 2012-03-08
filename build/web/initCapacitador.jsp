<%-- 
    Document   : initAdministrador
    Created on : Aug 13, 2011, 11:40:31 PM
    Author     : Dave
--%>
<%@page import="pojo.Variable"%>
<%@page import="pojo.Indicador"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="daoImpl.RespItemDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="pojo.RespItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.AsignacionCapaContraDaoImpl"%>
<%@page import="pojo.AsignacionCapaContra"%>
<%@page import="pojo.Empresa"%>
<%@page import="daoImpl.EmpresaDaoImpl"%>
<%@page import="daoImpl.EmpresaDaoImpl"%>
<%@page import="pojo.Contrato"%>
<%@page import="daoImpl.ContratoDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SECE</title>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <link href="resources/css/advancedtable.css" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="resources/js/advancedtable.js"></script>
        
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script>
            function hacerlo(){
                window.location.href = "historial.jsp"; 
            }
        $(document).ready(function() {            $("#tabs").tabs();
            $( "#datepicker" ).datepicker();
            $( "#datepicker2" ).datepicker();                       
            $("#tblContratos").advancedtable({searchField: "#search",
                                        loadElement: "#loader",
                                        ascImage: 'images/up.png',
                                        descImage:'images/down.png',
                                        rowsPerPage: 20});
                      
           $("#contenidoContratos tr").click(function() {
              // alert( $(this).text());
              window.location.href = "historial.jsp?empresa="+$(this).find('input:hidden').val();
            });
            
            $("#tblEmpresaAsignada tr").click(function() { 
                var idcontrato = $(this).find('input:hidden').val();
                $.get("delegadoxContrato",{idc:idcontrato},function (data){
                    $("#tbodycontactoEmpresaAsignada").html(data);
                });

            }); 
            
            $("#tblEmpresasNoAsignadas tr").click(function(){
              $.getJSON("datosEmpresas.json", function(datos){
                  alert(datos.empresas[1].nombre);
              });   
            });
                   
        }); 
             
        </script>
               
         <%         
           HttpSession sesion=request.getSession();
           String val = (String) sesion.getAttribute("idUser");
           //id Capacitador
           int idUsuario = Integer.valueOf(val); 
           
                    
           AsignacionCapaContra acaco = new AsignacionCapaContra();        
           AsignacionCapaContraDaoImpl a = new AsignacionCapaContraDaoImpl();
           UsuarioDaoImpl udi = new UsuarioDaoImpl();                      
           Usuario capacitador = udi.findById(idUsuario);  
           Usuario contacto = new Usuario();
          
           ContratoDaoImpl cdi = new ContratoDaoImpl();
           Contrato contra = new Contrato();
           EmpresaDaoImpl edi = new EmpresaDaoImpl();
           Empresa emp = new Empresa();
           
           ItemDaoImpl idi = new ItemDaoImpl();
           RespItemDaoImpl ridi = new RespItemDaoImpl();
                     
           List<AsignacionCapaContra> l = a.findAllByIdUsuarioCapacitador(capacitador);
           Iterator<AsignacionCapaContra> it = l.iterator();

           int respxContrato = 0;
           int avancexContrato = 0;
           //Numero de Items
           int numItems =  idi.numItem();
           
           ////for tab Instrumento
           IndicadorDaoImpl inddi= new IndicadorDaoImpl();
           VariableDaoImpl vardi = new VariableDaoImpl();
           ItemDaoImpl itemdi = new ItemDaoImpl();
        %>
    </head>
    <body>
        
        
  <div class="main">         
    <div class="header">
    <div class="header_resize">      
      <div class="menu">
          
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logo.gif" width="293" height="84" border="0" alt="logo" /></div>      
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="body">
    <div class="body_resize">
     <div id="tabs">
           <ul>
            <li><a href="#tab-1"><span>Espacio de Trabajo</span></a></li>
            <li><a href="#tab-2"><span>Ver Instrumento</span></a></li>
            <li><a href="#tab-3"><span>Historial</span></a></li>
           </ul>

        <div id="tab-1">
            <table width="100%" border="0">
                <tr> </tr>
                <tr>
                    <td>
                     <div align="center" > <!--class="right_bottom" -->
                          <h2>Empresas Asignadas</h2>
                          <table border="0" width ="100%" id="tblEmpresaAsignada">
                              <thead>
                                  <tr>
                                  <th>Empresa</th>
                                  <th>Contacto</th>
                                  <th>Fecha de Asignaci&oacute;n</th>                  
                                  <th>Progreso</th>     
                                 </tr>
                             </thead>
                             <tbody>
                                  <% while (it.hasNext()) {                                       
                                    acaco =  it.next(); 
                                    contra = cdi.findById(acaco.getContrato().getIdContrato()) ;                                   
                                    contacto = udi.findById(contra.getUsuario().getIdUsuario()); 
                                    emp = edi.findByID(contacto.getEmpresa().getIdEmpresa());
                                    respxContrato = ridi.ItemRespondidosxContrato(contra); 
                                    avancexContrato = ((respxContrato *100) / numItems)  ; 
                                    //estado del contrato activo, contrato de esta empresa actualmente trabajandose,                                    
                                    if (acaco.getContrato().getEstado() == 1){                                                                                
                                  %>
                                  <tr style="padding-bottom: 1em; text-align: center">  <input type="hidden" value="<%=acaco.getContrato().getIdContrato()%>"/> <td><%=emp.getNombre() %></td> <td><%= contacto.getNombre() %></td> <td id="contenedorContrato"><%= contra.getFechaInicio() %> </td> <td> <div class="progress-bar blue small" style="width:50px;"><div style="width:<%=avancexContrato%>%;"><span><%=avancexContrato%>%</span></div></div> </td>  </tr> <%}}//finif finwhile%>  
                              </tbody>
                          </table>
                      </div>    
                    </td>

                    <td>
                     <div align="center">
                          <h2>Empresas Pendientes de Asignaci&oacute;n</h2>
                         <table border="0" id="tblEmpresasNoAsignadas" width ="100%">
                          <thead>
                              <tr>
                              <th>Empresa</th>
                              <th>Contacto</th>
                              <th>Fecha de Asignaci&oacute;n</th>                                                   
                             </tr>
                         </thead>
                         <tbody align="center" id="tbodyEmpresaNoAsignada">                                                   
                              <%    
                                    l = a.findAllByIdUsuarioCapacitador(capacitador);    
                                    it = l.iterator();
                                    while (it.hasNext()) {                                       
                                    acaco =  it.next(); 
                                    contra = cdi.findById(acaco.getContrato().getIdContrato()) ;                                   
                                    contacto = udi.findById(contra.getUsuario().getIdUsuario()); 
                                    emp = edi.findByID(contacto.getEmpresa().getIdEmpresa());                                    
                                    //estado del contrato activo, contrato de esta empresa actualmente trabajandose,                                    
                                    if (acaco.getContrato().getEstado() == 0){                                                                                
                              %>
                              <tr> <td> <%= emp.getNombre() %> </td> <td><%= contacto.getNombre() %></td> <td><%= contra.getFechaInicio() %></td> </tr> <%}}//finif finwhile%>  
                         </tbody>
                      </table>                 
                    </div>   
                    </td>
                </tr>
                
                <tr>
                    <td>
                      <table border="0" id="resultTable" width ="100%">
                          <thead>
                              <tr>
                              <th>Delegado</th>
                              <th>Ultimo Acceso</th>
                              <th>Correo</th>                  
                              <th>On-Line</th>     
                             </tr>
                         </thead>
                         <tbody id="tbodycontactoEmpresaAsignada" align="center">
                             <tr><td>Juan</td><td>19/05/2011</td><td>david@gmail.com</td><td>yes</td></tr>
                         </tbody>
                      </table>                  
                    </td>
                    <td>
                      <table border="0" id="resultTable" width ="100%">
                          <thead>
                              <tr>
                              <th>Empresa</th>
                              <th>Tel&eacute;fono</th>
                              <th>Direcci&oacute;n</th>                  
                              <th>Contacto</th>     
                              <th>Acci&oacute;n</th>     
                             </tr>
                         </thead>
                         <tbody align="center" id="tbinfPendientes">
                             <tr><td>Adomar S.A</td><td>22589567</td><td></td><td>yes</td></tr>
                         </tbody>
                      </table>  
                    </td>
                </tr>            
            </table>
         </div>  

        <div id="tab-2">
            <div width="100%" style="margin-bottom: 2%; margin-left: 5%; margin-top: 1%;">
                <label>Indicador</label><select> <option>Elija Indicador</option>  <% List<Indicador> indicadores = inddi.findAll(); Iterator<Indicador> itIndicador = indicadores.iterator(); while(itIndicador.hasNext()) {%> <option><%= itIndicador.next().getNombre() %></option> <%}%></select> <label>Variable</label><select><option>Elija Variable</option> <% List<Variable> variables = vardi.findAll(); Iterator<Variable> itVariable = variables.iterator(); while (itVariable.hasNext()) { %> <option> <%= itVariable.next().getNombre() %> </option> <%}%></select>  
            </div> 
            <div width="100%" style="margin-left: 5%;">
                <label>Elija Item</label> <input type="text" id="searchItem" placeholder="Digite un Item"/>
            </div> 
             <!-- >  
            <div>
                <div style="margin-top: 1%;">
                    <div style="float: left; padding-top: 7px; padding-right: 10px;"><img src="images/step.png"/></div> <div style="font-weight:bold;" >Se implementa mecanismos de mercadeo (correos, telemarketing) para mantener informado a los clientes sobre nuevos productos, servicios post-venta, promociones del producto/servicio y la </div>
                </div>
                <div style="margin-top: 1%;">
                    <div style="float: left; padding-top: 7px;"><img src="images/step.png"/></div> <div style="font-weight:bold;" >Se implementa mecanismos de mercadeo (correos, telemarketing) para mantener informado a los clientes sobre nuevos productos, servicios post-venta, promociones del producto/servicio y la </div>
                </div>
                <div style="margin-top: 1%; vertical-align:sub;">
                    <div style="float: left; vertical-align:sub;"><img src="images/step.png"/></div> <div style="font-weight:bold;" >Se implementa mecanismos de mercadeo (correos, telemarketing) para mantener informado a los clientes sobre nuevos productos, servicios post-venta, promociones del producto/servicio y la </div>
                </div>
            <  -->
             <div>            
                 <table cellpadding="8px">
                     
                         <% List<Item> items = itemdi.findAll(); 
                           Iterator<Item> itItem = items.iterator();
                           while (itItem.hasNext()){  %>
                           <tr><td><img src="images/step.png"/></td>
                           <td><%= itItem.next().getDescripcion() %></td></tr>    
                           <%}//fin while%>
                         
                     
                 </table>
             </div>
            </div>
       
        <div id="tab-3">
            <div align="center">
                <h1>Fecha de Finalizaci&oacute;n</h1>
                <label>Desde: </label><input id="datepicker" type="text"/>    <label>Hasta: </label><input id="datepicker2" type="text"/>
            </div>
            <div>
                <input type="text" id="search" placeholder="Escriba Empresa...." size="35"/> <span id="loader" style="vertical-align: middle"><img src="images/loader.gif" alt="Laoder" /></span>
            </div>                
   <table width="100%" id="tblContratos" border="1">
     <thead>
       <tr>
         <th>Empresa</th>
         <th>Contratos</th>
         <th>Acciones</th>
       </tr>
     </thead>
     <tbody id="contenidoContratos">
      <%  l = a.findAllByIdUsuarioCapacitador(capacitador);    
          it = l.iterator();
          while (it.hasNext()) {
           acaco =  it.next();
           contra = cdi.findById(acaco.getContrato().getIdContrato()) ;                                                     
           //Empresa de ese contrato           
                                  %>
          <tr><input type="hidden" value="<%=contra.getUsuario().getEmpresa().getIdEmpresa()%>"/><td><%=contra.getUsuario().getEmpresa().getNombre()%></td> <td><%=cdi.cantidadContratosxUsuarioFinalizados(acaco.getContrato().getUsuario())%></td> <td></td></tr>
        <%}//fin while %>
       </tbody>
      </table>
            </div>
        </div>
                          
    </div>   
    </div>
    </div>
  </div>  

    </body>
</html>
