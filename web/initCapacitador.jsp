<%-- 
    Document   : initAdministrador
    Created on : Aug 13, 2011, 11:40:31 PM
    Author     : Dave
--%>
<%@page import="java.util.Properties"%>
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
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <link href="resources/css/message.css" rel="stylesheet" type="text/css"/>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <link href="resources/css/advancedtable.css" rel="stylesheet" type="text/css" />
        <link href="resources/style.css" rel="stylesheet" type="text/css"/>
        
        
        <script type="text/javascript" src="resources/jquery/js/jquery.busy.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="resources/js/advancedtable.js"></script>                
               
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        
        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>        
        <script type="text/javascript" src="/sece/dwr/interface/capacitadoresScripts.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>
        
          <%     
           HttpSession sesion=request.getSession();
           String acc = (String) sesion.getAttribute("idAcc");                      
           if(acc==null){
              response.sendRedirect("index.jsp");
           }else{
           
           AccesoDaoImpl daoAcceso = new AccesoDaoImpl();
           Acceso acceso = daoAcceso.findById(Integer.parseInt(acc));
           int idUsuario = acceso.getUsuario().getIdUsuario();
           int tipousuario = acceso.getUsuario().getTipoUsuario();
           
           if (tipousuario != 2){
               System.out.print("Intento de cruce a pagina por usuario sin permisos pero con acceso al sistema");               
               response.sendRedirect("index.jsp");
             } else {
                    
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
           int numItems =  idi.numItemActivos();
           
           ////for tab Instrumento
           IndicadorDaoImpl inddi= new IndicadorDaoImpl();
           VariableDaoImpl vardi = new VariableDaoImpl();
           ItemDaoImpl itemdi = new ItemDaoImpl();

        %>
        
        <script>
                //variables globales
           var idCapacitador = <%=idUsuario%>
           // url del sistema sece
           var urlSistema;             
           //numero de correos enviados a usauarios inactivos
           var num_correosEnviados = 0;
            
            //funcion enviar correo de tab-Invitar usuarios
            function enviarCorreo(){               
                var correo_destinatario = dwr.util.getValue("txtCDest");                                
                var asunto = "Peticion de Registro a Sece";
                var cuerpo =" <p> <strong>Solicitud de Registro</strong>,\n\
                 Estimado, de click en el siguiente <a href='"+urlSistema+"register.jsp?rodaticapacdi="+idCapacitador+"'>link</a> para dirigirse al formulario de registro del sistema.</p>\n\
                 Por favor no reinvie a este correo.</p><p><strong>Gracias SECE TEAM.</strong></p>";
                                    
                if (correo_destinatario == "" || correo_destinatario==null){
                    $("#notDiv").html("");
                    $("#notDiv").prepend("<div class='notification attention'><a href='JavaScript:void(0);' onclick= '$(this).parent().hide();' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Ingrese el correo del destinatario!!</p></div>");
                }
                else{ 
                    validacion.EnviarCorreo("sece@pml.org.ni",correo_destinatario,asunto,cuerpo,result);
                    $(".body_resize").hide();
                    $(".body").prepend("<img id='imgBi' src='images/bi.gif' style='padding-left: 50%;padding-top: 20%; padding-bottom:25%;'/>");
                }
                $('input[name$="txtCDest"]').val('');
            }//fin funcion enviar correo            
            function result(data){
                if (data==1){
                    //envio satisfactorio
                    $("#tab-5").prepend("<div class='notification success'><a href='JavaScript:void(0);' onclick= '$(this).parent().hide();' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Correo Enviado</strong><p class='hola'>El correo fue enviado satisfactoriamente!!</p></div>");
                }
                else if(data==0){
                    $("#tab-5").prepend("<div class='notification error'><a href='JavaScript:void(0);' onclick= '$(this).parent().hide();' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Envio Fallado</strong><p class='hola'>No se envio el correo!!</p></div>");
                }
                $("#imgBi").remove();
                $(".body_resize").show();
            }//fin result
            
            
        $(document).ready(iniciarJQ);
        function iniciarJQ() {  
            
            $.ajaxSetup({
                beforeSend:function(){
                $(".body_resize").hide();
                $(".body").prepend("<img id='imgBi' src='images/bi.gif' style='padding-left: 50%;padding-top: 20%; padding-bottom:25%;'/>");
                },
                complete:function(){
                $("#imgBi").remove();
                $(".body_resize").show();    
                }
            });
            
                       
            $("#imgFinalizado").click(function(){
                var idc =  $(this).parent().parent().find('input:hidden').val();
                location.href = "resultadoCap.jsp?id_contrato="+idc;
            });
            $( "#dialog" ).dialog({
			autoOpen: false,
			show: "blind",
                        modal: true                                              
	    });
            $("#btnVC").button();            
            $("#tabs").tabs({selected:0});
            $( "#datepicker" ).datepicker();
            $( "#datepicker2" ).datepicker();                       
            $("#tblContratos").advancedtable({searchField: "#search",
                                        loadElement: "#loader",
                                        ascImage: 'images/up.png',
                                        descImage:'images/down.png',
                                        rowsPerPage: 20});
           $("#tblContratosFin").advancedtable({searchField: "#searchCFin",
                                        loadElement: "#loader",
                                        ascImage: 'images/up.png',
                                        descImage:'images/down.png',
                                        rowsPerPage: 20});    
           
            
            $("#tblEmpresaAsignada tbody tr").click(function() {    
                //idcontrato de la tabla seleccionada
                var idcontrato = $(this).find('input:hidden').val();
                capacitadoresScripts.getDelegadoxContrato(idcontrato,{
                                        callback:function(data){
                                          $("#tdcXd").html(data);
                                          if (data == ""){   
                                              $( "#dialog" ).dialog( "open" );                        
                                              $( "#dialog" ).html("<p> <b>No hay ningun usuario asignado como delegado.</b>  <p>");
                                          }
                                          //boton enviar correo inactividad
                                          $( ".btnSentEmail" ).button({ icons: { primary: "ui-icon-mail-closed" }, text: false });                                            
                                          $( ".btnSentEmail" ).click( function(){ 
                                              var notCorreosEnviados = $(this).parent().find('.cant_emailEnviados');
                                              var spanVal = notCorreosEnviados.text();
                                              if (spanVal == null)
                                                  num_correosEnviados = 0;
                                               ++spanVal ;
                                               //idusuario del usuario delegado
                                               idu = $(this).parent().parent().find('input:hidden').val()                                               
                                               fechaAcceso = $(this).parent().parent().children('.tdFechaAcc').text();
                                               // envia correo al usuario  ....(idContrato,idUsuario,ultima fecha de acceso de Usuario)                                                 
                                               capacitadoresScripts.enviarCorreoUsuarioDormido(idcontrato,idu,fechaAcceso);
                                               // actualiza la cantidad de correos informacion mostrada en el span .cant_emailEnviados
                                               capacitadoresScripts.actualizarCantCorreosEnviados(idu,spanVal,{callback:function() { $( ".btnSentEmail" ).removeAttr("disabled");  }} );
                                               notCorreosEnviados.text(spanVal);
                                               //desabilitar el boton para evitar multiples clicks
                                               $(this).attr("disabled","disabled");
                                          });
                                        }
                                    });        
            });
            
            //metodo que cambia el color al detectar el evento hover sobre la tablas asignadas
            $("#tblEmpresaAsignada tbody tr, #tblEmpresasNoAsignadas tbody tr, #tblContratos tbody tr, #tblContratosFin tbody tr").hover(function () {
                             $(this).addClass("hover");},
                         function (){$(this).removeClass("hover");
            });
            
           
            
            $("#selectIndicador").change(function() {
                   var nombreIndicador = $("#selectIndicador option:selected").val();
                   
                   var indexSel = $("#selectIndicador option").index($("#selectIndicador option:selected"));
                   if (!( indexSel == 0 )){
                   
                   $("#tableItem").html("");
                   $("#filterItem").val("");
                   $('>option', "#selectVariable").remove()
                   $.get("BusquedaVariables?descIndicador=" +nombreIndicador, function (data) {
                        $("#selectVariable").append(data);  
                    });                    
                   }//fin if
                   else {
                       $("#tableItem  tr").remove();
                       $("#selectVariable").find('option').remove();
                   }
            });
            
            $("#selectVariable").change(function(){
                var nombreVariable = $("#selectVariable option:selected").val();                     
                $.get("BusquedaItems?descVariable="+nombreVariable,function (data){
                    $("#tableItem  tr").remove();
                    $("#tableItem").prepend(data);
                });
            });
            
          $("#logoutbutton").button({			
			icons: {
				primary: "ui-icon-gear",
                                secondary: "ui-icon-triangle-1-s"
			}
		}).click(function() {			
                   $("#menuBtnOpciones1").toggle("slow");            
		});	
                    $(".mnSalir").hover(
                function(){
                    $(this).css({'color':'#81BEF7','cursor':'pointer', 'font-size':'large'});
                 },
                function(){
                    $(this).css({'color':'#015480','font-size':'medium'});    
                }
                );
                esconderIDContrato_Usuario();
                capacitadoresScripts.quitarConFin( idCapacitador,3);
                
                capacitadoresScripts.obtenerURLSist({callback:function(str){
                    urlSistema = str;
                 }});
            
              capacitadoresScripts.getEmpreContratoFin(idCapacitador , {callback:function (data) {
                      $("#tbodyContratosFin").html(data);                      
                      $("#tbodyContratosFin tr").hover(function(){$(this).addClass("hover"); }, function(){$(this).removeClass("hover")});
                       $("#tbodyContratosFin tr").click(function(){
                          idc =  $(this).find('input:hidden').val()
                          location.href = "resultadoCap.jsp?id_contrato="+idc;
                       });
                      
              }});              
            
                      
        }//fin iniciar 
        
        function esconderIDContrato_Usuario(){
            //esconde columna de tabla de empreas no Asignadas                       
                $('#tblEmpresasNoAsignadas th:nth-child(6),#tblEmpresasNoAsignadas th:nth-child(5)').hide();
                //$('#tblEmpresasNoAsignadas td:nth-child(6),#tblEmpresasNoAsignadas td:nth-child(5)').hide();              
              //$('#tblEmpresasNoAsignadas td:nth-child(5),#tblEmpresasNoAsignadas th:nth-child(5)').hide();              
              //$('#tblEmpresasNoAsignadas td:nth-child(6),#tblEmpresasNoAsignadas th:nth-child(4)').hide();              
              //$('#tblContratos th:nth-child(3),#tblContratos th:nth-child(2),#tblContratos th:nth-child(1)').hide();
              //$('#tblContratosFin th:nth-child(3),#tblContratosFin th:nth-child(2),#tblContratosFin th:nth-child(1)').hide();
        }
         
          
                                            
            
        </script>
               
       
    </head>
    <body>
        
        
        <div class="main"> 
            
            <div id="dialog">          
            </div>
                
            <div class="header">
                <div class="header_resize">      
                    <div class="menu">
                        
                    </div>
                    <div class="clr"> </div>
                    <div class="logo"><img src="images/logofull.png" width="293" height="84" border="0" alt="logo" /></div>      
                       
                        <div class="inGo" style=" font-size: 11px;" >
                             <span id="toolbar" class="ui-widget-header ui-corner-all">	
                            <button id="logoutbutton"><%= acceso.getUsuario().getNombre()%></button>	
                        </span>
                            <div id="menuBtnOpciones1">
                                <ul class="opciones1">                                                                        
                                    <li id="mnuBtnSalir" onclick="location.href='ayuda/ayudaCapacitador.jsp'" > <img src="images/question_mark.png"/> Ayuda  </li>                   
                                    <li id="mnuBtnSalir" onclick="location.href='salir'" ><img src="images/salir.gif"/> Salir  </li>                                        
                                </ul>              
                            </div>
                        </div>
                        <div class="clr"></div>      
                    </div>
                </div><!-- fin div header!-->
           
                
            <div class="body">      
                <div class="body_resize">
                    
                    <div id="tabs" style="margin-bottom: 5%; height: 100%;">
                        <ul>
                            <li><a href="#tab-1"><span>Espacio de Trabajo</span></a></li>
                            <li><a href="#tab-2"><span>Ver Instrumento</span></a></li>
                            <li><a href="#tab-3"><span>Historial</span></a></li>
                            <li><a href="#tab-4"><span>Finalizados</span></a></li>
                            <li><a href="#tab-5"><span>Invitar Empresa</span></a></li>
                            <li><a href="#tab-6"><span>VideoChat</span></a></li>
                        </ul>
                            
                        <div id="tab-1">                           
                            <table width="100%" border="0" >                
                                <tr>
                                    <td>
                                        <div align="center" > <!--class="right_bottom" -->
                                            <h2>Empresas Asignadas</h2>
                                            <style>
                                                .hover{ background-color: #e7f1fa; cursor:pointer;}
                                                #tblEmpresaAsignada td, #tblEmpresasNoAsignadas td, #tblContratos td, #tblContratosFin td {
                                                    border-bottom: 1px solid #999;}
                                                .btnSentEmail{
                                                    width: 19px;
                                                    height: 19px;
                                                }
                                            </style>
                                            
                                            <table class="tablaStilizada" border="0" width ="100%" id="tblEmpresaAsignada">
                                                <thead >
                                                    <tr>
                                                        <th>Empresa</th>
                                                        <th>Contacto</th>
                                                        <th>Fecha de Asignaci&oacute;n</th>                  
                                                        <th>Progreso</th>     
                                                    </tr>
                                                </thead>                                                
                                                <tbody id="tbodyEmpresaAsignada">
                                                    <%while (it.hasNext()) {
                                                            acaco = it.next();
                                                            contra = cdi.findById(acaco.getContrato().getIdContrato());
                                                            contacto = udi.findById(contra.getUsuario().getIdUsuario());
                                                            emp = edi.findByID(contacto.getEmpresa().getIdEmpresa());
                                                            respxContrato = ridi.ItemRespondidosxContrato(contra);
                                                            avancexContrato = ((respxContrato * 100) / numItems);
                                                            //estado del contrato activo, contrato de esta empresa actualmente trabajandose,                                    
                                                            if (acaco.getContrato().getEstado() == 1) {
                                                    %>
                                                    <tr style="padding-bottom: 1em; text-align: center; "> <input type="hidden" value="<%=acaco.getContrato().getIdContrato()%>"/> 
                                                <td><%=emp.getNombre()%></td> 
                                                <td><%= contacto.getNombre()%></td>
                                                <td id="contenedorContrato"><%= contra.getFechaInicio()%> </td> 
                                                <td> <div class="progress-bar blue small" style="width:50%; float: left;"><div style="width:<%=avancexContrato + "%"%>;"><span style="top:16%;"><%=avancexContrato + "%"%></span></div> </div> <% if (avancexContrato == 100) {
                                            out.println("<img id ='imgFinalizado' title='Finalizo!!' style='vertical-align: -93%;' src='images/prizeicon16.png'/>");%> <%}%> </td>
                                                </tr> <%}
                                      }//finif finwhile%>  
                                      
                                                </tbody>
                                            </table>
                                        </div>    
                                    </td>
                                </tr>
                                    
                                <tr>
                                    <td id="tdcXd">                                      
                                    </td>                   
                                </tr> 
                                <tr>
                                    <td>
                                        <div align="center">
                                            <h2>Empresas Pendientes de Asignaci&oacute;n</h2>
                                            <table border="0" id="tblEmpresasNoAsignadas" width ="100%">
                                                <thead>
                                                    <tr style="background-color: #347488; color:#fff;">
                                                        <th>Empresa</th>
                                                        <th>Contacto</th>
                                                        <th>Correo</th>
                                                        <th>Fecha de Asignaci&oacute;n</th>                                                   
                                                        <th>Contrato</th> 
                                                        <th>IdContacto</th>
                                                    </tr>
                                                </thead>
                                                <tbody align="center" id="tbodyEmpresaNoAsignada">                                                   
                                                    
                                                <script>
                                                    capacitadoresScripts.getListaENA(idCapacitador,{callback:function(data){
                                                            $("#tbodyEmpresaNoAsignada").html(data);
                                                            $("#tbodyEmpresaNoAsignada tr").hover(function(){$(this).addClass("hover")}, function(){$(this).removeClass("hover")});
                                                            //accion disparada cuando se da click sobre la tabla de empresas no Asignadas
                                                            $("#tblEmpresasNoAsignadas tbody tr").click(function(){
                                                                var idempresa = $(this).find("#tdEmpresa").text();
                                                                var idcontrato = $(this).find("#tdContrato").text();
                                                                var idcontacto = $(this).find("#tdContacto").text();
                                                                
                                                                capacitadoresScripts.empresaNoAsignada(idempresa,{
                                                                    callback:function(data){
                                                                       
                                                                        $("#tdeNa").html(data);
                                                                         //dar apariencia a los botones
                                                                        $( "#btnImgAprobar" ).button({ icons: { primary: "ui-icon-check" }, text: false });
                                                                        $( "#btnImgEliminar" ).button({ icons: { primary: "ui-icon-cancel" }, text: false });
                                                                        
                                                                        $("#btnImgAprobar").click(function (){
                                                                            $.get("aprobarContrato", {id:1,idu:idcontacto,idc:idcontrato,iduc:idCapacitador},success);
                                                                            function success(){window.location.reload(true);}
                                                                        });
                                                                        //agregar funcionalidad al boton eliminar
                                                                        $("#btnImgEliminar").click(function (){
                                                                            $.get("aprobarContrato", {id:2,idu:idcontacto,idc:idcontrato,iduc:idCapacitador},success);                                        
                                                                            function success(){window.location.reload(true);}
                                                                        });           
                                                                        
                                                                    }//fin callback function                                                                    
                                                                });    
                                                            });
                                                            
                                                        }});
                                                </script>
                                                    
                                                    
                                                </tbody>
                                            </table>                 
                                        </div>   
                                    </td>                     
                                </tr>
                                <tr>
                                    <td id="tdeNa">                                             
                                    </td>
                                </tr>
                            </table>
                        </div>  
                            
                        <div id="tab-2">
                            <div width="100%" style="margin-bottom: 2%; margin-left: 5%; margin-top: 1%;">
                                <label>Indicador</label><select id="selectIndicador"> <option selected="selected">Elija Indicador</option>  <% List<Indicador> indicadores = inddi.findAll();
                    Iterator<Indicador> itIndicador = indicadores.iterator();
                    while (itIndicador.hasNext()) {%> <option><%= itIndicador.next().getNombre()%></option> <%}%></select> <label>Variable</label><select id="selectVariable"><option></option> </select>  
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
                            <div align="center" style="paddig-left: 15%;">
                                <h1>Historial de Contratos</h1>
                                <!-- <label>Desde: </label><input id="datepicker" type="text"/>    <label>Hasta: </label><input id="datepicker2" type="text"/> !-->
                            </div>
                            <div>
                                <input type="text" id="search" placeholder="Escriba Empresa...." size="35"/> <span id="loader" style="vertical-align: middle"><img src="images/loader.gif" alt="Laoder" /></span>
                            </div>                
                            <table width="100%" id="tblContratos" border="0">
                                
                                <thead>
                                    <tr style="background-color: #347488;color: #fff;">
                                        <th>Empresa</th>
                                        <th>Contratos</th>                                        
                                    </tr>
                                </thead>
                                <tbody id="contenidoContratos">
                                   <script>
                                            capacitadoresScripts.getHistorialContratosFinalizados(idCapacitador,{callback:function(data){
                                                    $("#contenidoContratos").html(data);
                                                    $("#contenidoContratos tr").hover(function(){$(this).addClass("hover")}, function(){$(this).removeClass("hover")});
                                                    $("#contenidoContratos tr").click(function() {               
                                                      window.location.href = "graficoHistorial.jsp?idempresa="+$(this).find('input:hidden').val();              
                                                    });
                                            }});
                                   </script>                     
                                </tbody>
                            </table>
                        </div>
                        <div id="tab-4" style="position:relative;"> 
                            <div align="center" >
                                <h1>Contratos Finalizados</h1>
                            </div>
                            <div>
                                <input type="text" id="searchCFin" placeholder="Escriba Empresa...." size="35"/> <span id="loader" style="vertical-align: middle"><!--img src="images/loader.gif" alt="Laoder" /!--></span>
                            </div>                
                            <table width="100%" id="tblContratosFin" border="0">
                                <thead>
                                    <tr style="background-color: #347488; color:#fff;">
                                        <th>Empresa</th>
                                        <th>Fecha de Finalizacion</th>                                        
                                    </tr>
                                </thead>
                                <tbody id="tbodyContratosFin">
                                    
                                </tbody>
                            </table>
                        </div>
                        <div id="tab-5" style="position:relative;">                               
                            <div id="notDiv"  ></div>
                            <div align="center" style="padding:10% 35% 5%"><p>Digite el correo del <b>contacto</b> de la empresa que desee invitar a registrarse.</p><input style=" font-size:18px; width:300px; height: 30px; text-align:center;"  type="text" name="txtCDest" id="filterItem" placeholder="Digite el Correo"/></div>
                            <div style="padding-left:40%"><a style="color:#fff;" href="JavaScript:void(0);" onclick="enviarCorreo();" class="btnEC">Enviar Correo</a></div>
                        </div>
                        <div id="tab-6">
                            <div id="vcSelEmpresa" align="center">
                             <p>Elija la empresa con la que desea iniciar el videoChat</p>  
                                <%
                                l = a.findAllByIdUsuarioCapacitador(capacitador);
                                it = l.iterator();
                                String idcon;
                                %>                                    
                                <select id="selEmpresas"> <option selected="selected">Elija Empresa</option> <% while (it.hasNext()) {
                                        acaco = it.next();
                                        contra = cdi.findById(acaco.getContrato().getIdContrato());
                                        contacto = udi.findById(contra.getUsuario().getIdUsuario());
                                        emp = edi.findByID(contacto.getEmpresa().getIdEmpresa());
                                        //estado del contrato activo, contrato de esta empresa actualmente trabajandose                                   
                                            if (acaco.getContrato().getEstado() == 1) {
                                                idcon = String.valueOf(acaco.getContrato().getIdContrato());%> <option value="<%=idcon%>"><%=emp.getNombre()%></option>  <%}
                                                                           }%></select>                
                            </div> 
                            <div id="videoChat">
                                
                            </div>
                                
                            <div align="center"> <input type="button" id="btnVC" value="Cerrar Video Chat"/> </div>                      
                                
                                
                            <script>
                                $("#btnVC").hide();
                                
                                $("#vcSelEmpresa").change(function() {                                    
                                    
                                    $(this).hide();
                                    var idcon = $("#selEmpresas option:selected").val();                                      
                                    capacitadoresScripts.insertarVideoChatCapac(idcon,idCapacitador,{
                                        callback:function(data){
                                         $("#videoChat").html(data);   
                                         $("#btnVC").show();
                                        }//fin callback                                    
                                }); 
                                
                                $("#btnVC").click(function () {  
                                       $("#videoChat").html("");
                                       $("#vcSelEmpresa").show();
                                       $("#selEmpresas").val('-1');
                                       $('#btnVC').hide();
                                    });
                                    
                                }); 
                                
                                  
                            </script>
                        </div>
                    </div> <!-- fin div tabs!-->
                        
                </div>   
            </div><!-- fin div body!-->
            
            <div class="footer">
                <div class="footer_resize">
                    
                    
                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
            </div>
                
        </div><!-- fin div main!-->
            
            
       
            
    </body>
</html>
<% }/*fin else tipo usaurio*/ } %>
