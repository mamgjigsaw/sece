<%-- 
    Document   : initAdministrador
    Created on : Aug 13, 2011, 11:40:31 PM
    Author     : Dave
--%>
<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
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
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
%>
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
        <link REL="shortcut icon" type="image/x-icon" href="images/favicon.png"/>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        
        <script>
            function mostrarMenu(){
                $("#menuBtnOpciones1").toggle("slow");
            }
            
            
            function hacerlo(){
                window.location.href = "historial.jsp"; 
            }
        $(document).ready(function() {
            $(".mnSalir li").hover(
             function(){
                $(this).css({'background':'#e8e8e8','color':'#81BEF7','cursor':'pointer'});
            },
            function(){
                $(this).css({'background':'#81BEF7','color':'#0B3861'});    
            }
            );
       
            $("#btnVC").button();            
            $("#tabs").tabs();
            $( "#datepicker" ).datepicker();
            $( "#datepicker2" ).datepicker();                       
            $("#tblContratos").advancedtable({searchField: "#search",
                                        loadElement: "#loader",
                                        ascImage: 'images/up.png',
                                        descImage:'images/down.png',
                                        rowsPerPage: 20});
                      
           $("#contenidoContratos tr").click(function() {               
              window.location.href = "graficoHistorial.jsp?idempresa="+$(this).find('input:hidden').val();
              
            });
            
            $("#tblEmpresaAsignada tr").click(function() { 
                var idcontrato = $(this).find('input:hidden').val();
                $.get("delegadoxContrato",{idc:idcontrato},function (data){
                    $("#tbodycontactoEmpresaAsignada").html(data);
                });
            }); 
            
            $("#mnuBtnSalir").click(function(){
                location.href="salir";
            });
            
            $("#tblEmpresasNoAsignadas tr").click(function(){
             alert("hola") ;
            });
            
            $("#selectIndicador").change(function() {
                   var nombreIndicador = $("#selectIndicador option:selected").val();
                   $('>option', "#selectVariable").remove()
                   $.get("BusquedaVariables?descIndicador=" +nombreIndicador, function (data) {
                        $("#selectVariable").append(data);  
                    });                             
            });
            
            $("#selectVariable").change(function(){
                var nombreVariable = $("#selectVariable option:selected").val();               
                $.get("BusquedaItems?descVariable="+nombreVariable,function (data){
                    $("#tableItem  tr").remove();
                    $("#tableItem").prepend(data);
                });
            });
            
            $( "#btnOpciones" ).button({
            icons: {
               primary: "ui-icon-gear",
                secondary: "ui-icon-triangle-1-s"
                 },
            text: false
            });
                   
        }); 
             
        </script>
               
         <%     
           HttpSession sesion=request.getSession();
           String acc = (String) sesion.getAttribute("idAcc");            
           //HttpSession sesion=request.getSession();
           //String val = (String) sesion.getAttribute("idUser");
           //id Capacitador
           if(acc==null){
              response.sendRedirect("index.jsp");
           }else{
           
            AccesoDaoImpl daoAcceso = new AccesoDaoImpl();
            Acceso acceso = daoAcceso.findById(Integer.parseInt(acc));
            int idUsuario = acceso.getUsuario().getIdUsuario(); 
           
                    
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
      <div class="clr" align ="right">      
          <style>
              .mnSalir li{
                  padding-left: 5%;
              }
          </style>
          <button id="btnOpciones" onclick="mostrarMenu()">Button with two icons and no text</button>
          <div id="menuBtnOpciones1" style=" display: none; background: #81BEF7; width: 100px; height: 20px; color: #0B3861">
              <ul id="opciones1" class="mnSalir" style="list-style: none;font-size: large; text-align:left;">
                  <li id="mnuBtnSalir" style="list-style-image:url(/images/log_out.gif)"> Salir  </li>  
              </ul>              
          </div>
      </div>
    </div>
  </div>
  
  <div class="body">
    <div class="body_resize">
     <div id="tabs">
           <ul>
            <li><a href="#tab-1"><span>Espacio de Trabajo</span></a></li>
            <li><a href="#tab-2"><span>Ver Instrumento</span></a></li>
            <li><a href="#tab-3"><span>Historial</span></a></li>
            <li><a href="#tab-4"><span>VideoChat</span></a></li>
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
                                  <%while (it.hasNext()) {                                       
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
                <label>Indicador</label><select id="selectIndicador"> <option selected="selected">Elija Indicador</option>  <% List<Indicador> indicadores = inddi.findAll(); Iterator<Indicador> itIndicador = indicadores.iterator(); while(itIndicador.hasNext()) {%> <option><%= itIndicador.next().getNombre() %></option> <%}%></select> <label>Variable</label><select id="selectVariable"><optgroup label="elija Variable"></optgroup> </select>  
            </div> 
            <div width="100%" style="margin-left: 5%;">
                <label>Elija Item</label> <input type="text" id="filterItem" placeholder="Digite un Item"/>
            </div>    
            <script>
                $("#filterItem").bind("keyup", function() {
                    var text = $(this).val().toLowerCase();
                    var items = $(".nombre_item");     
                    //esconder todo:
                    items.parent().hide();
                    //mostrar solamente los que concuerden:
                    items.filter(function () {
                        return $(this).text().toLowerCase().indexOf(text) == 0;
                    }).parent().show();
                });
            </script>
             <div>            
                 <table cellpadding="8px" id="tableItem">
                 
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
          <tr><input type="hidden" value="<%=contra.getUsuario().getEmpresa().getIdEmpresa()%>"/><td style="cursor:pointer;"><%=contra.getUsuario().getEmpresa().getNombre()%></td> <td><%=cdi.cantidadContratosxUsuarioFinalizados(acaco.getContrato().getUsuario())%></td> <td></td></tr>
        <%}//fin while %>
       </tbody>
      </table>
            </div>
       
       <div id="tab-4">
           <div id="vcSelEmpresa" align="center"> <%                                    
                                    l = a.findAllByIdUsuarioCapacitador(capacitador);    
                                    it = l.iterator();
                                    String idcon;        
                                    %>                                    
                                    <select id="selEmpresas"> <option selected="selected">Elija Empresa</option> <% while (it.hasNext()) {                                       
                                    acaco =  it.next(); 
                                    contra = cdi.findById(acaco.getContrato().getIdContrato()) ;                                       
                                    contacto = udi.findById(contra.getUsuario().getIdUsuario()); 
                                    emp = edi.findByID(contacto.getEmpresa().getIdEmpresa());                                    
                                    //estado del contrato activo, contrato de esta empresa actualmente trabajandose                                   
                                                                       if (acaco.getContrato().getEstado() == 1){ idcon = String.valueOf(acaco.getContrato().getIdContrato());%> <option value="<%=idcon%>"><%=emp.getNombre()%></option>  <%}}%></select>                
           </div> 
           <div id="videoChat">
               
           </div>
           
           <div align="center"> <input type="button" id="btnVC" value="Iniciar Video Chat"/> </div>                      
           
             
           <script>
               $("#btnVC").hide();
               $("#vcSelEmpresa").change(function() {
                   $("#btnVC").trigger('click');
                   $("#btnVC").show();
                   $(this).unbind('change');
                   $(this).hide();
               });               
                $("#btnVC").click(function () {  
                  var idcon = $("#selEmpresas option:selected").val();         
                   $.get("InsertarVideoChat",{idc:idcon,iduser:<%=idUsuario%>},function (data){
                            $("#videoChat").html(data);
                        });                         
                  $('#videoChat').toggle();
                   if ($('#videoChat').css('display') == 'none') {                      
                          $('#btnVC').val('Iniciar Video Chat');     
                          $("#vcSelEmpresa").show();
                     }
                     else {
                          $('#btnVC').val('Cerrar Video Chat');
                     }
                });                
           </script>
       </div>
        </div>
                          
    </div>   
    </div>
    </div>
  </div>  

    </body>
</html>
<% } %>
