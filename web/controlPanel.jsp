<%-- 
    Document   : controlPanel
    Created on : Nov 23, 2011, 8:02:23 PM
    Author     : mamg
--%>

<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Empresa"%>
<%@page import="daoImpl.EmpresaDaoImpl"%>
<%@page import="pojo.Contrato"%>
<%@page import="daoImpl.ContratoDaoImpl"%>
<%@page import="pojo.Avance"%>
<%@page import="daoImpl.AvanceDaoImpl"%>
<%@page import="pojo.DelegacionIndiUsu"%>
<%@page import="daoImpl.DelegacionIndiUsuDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Indicador"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);

response.setHeader("Pragma","no-cache"); //HTTP 1.0
%>
<html>
    <head>
        <%
       HttpSession sesion=request.getSession();
       sesion.setMaxInactiveInterval(3600);
       String acc = (String) sesion.getAttribute("idAcc");
       
       String name,nombre_variable,nombre_indicador,cargo,telefono,correo,direccion;
       int tipo,indi,actual,total_var;
       int idEmpresa =0;       
       int idContrato =0;
       int contratoActivos = 0;
       
       // variable para la empresa
       String nombre_empresa="";
       String descripcion=""; 
       String tel_empresa="";
       String dir_empresa=""; 
       
       if(acc==null){
              response.sendRedirect("index.jsp");
           }else{
       
       AccesoDaoImpl daoAcceso = new AccesoDaoImpl();
       Acceso acceso = daoAcceso.findById(Integer.parseInt(acc));
       
       int id_usuario = acceso.getUsuario().getIdUsuario();
       UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
       Usuario usuario = new Usuario();
       usuario = usuDao.findById(id_usuario);
                     
       //nombre_usuario = usuario.getNombre();
       cargo = usuario.getCargo();
       telefono = usuario.getTelefono();
       correo = usuario.getCorreo();
       direccion = usuario.getDireccion();       
       
       name = usuario.getNombre();
       tipo = usuario.getTipoUsuario();
       
      if(tipo==4){ //si es tipo delegado
           
          DelegacionIndiUsuDaoImpl delimpl = new DelegacionIndiUsuDaoImpl();
          DelegacionIndiUsu dele = new DelegacionIndiUsu(); 
          dele = delimpl.getDelByContCurrentlyandUsu(usuario); 

          //obtenemos el contrato          
          idContrato = dele.getContrato().getIdContrato();
           
       }else if(tipo==3){// si es tipo contacto
           
           ContratoDaoImpl daoContra = new ContratoDaoImpl();
           Contrato contrato = (Contrato) daoContra.findByUsuario(usuario);//donde el estado sea igual 1
           
           if(contrato == null){//significa que todos los contratos estan terminados estado 2
               //response.sendRedirect("index.jsp");
               contratoActivos = 0;
               idContrato = 30;//idContrato por defecto
           }else{
               contratoActivos = 1;
               idContrato = contrato.getIdContrato();          
           }
           EmpresaDaoImpl daoEmpresa = new EmpresaDaoImpl();
           idEmpresa = usuario.getEmpresa().getIdEmpresa();
           Empresa empresa = daoEmpresa.findByID(idEmpresa);

           nombre_empresa = empresa.getNombre();
           descripcion = empresa.getDescripcion();
           tel_empresa = empresa.getTelefono();
           dir_empresa = empresa.getDireccion();

      }else if(tipo==2){
          response.sendRedirect("index.jsp");
      }else if(tipo==1){
          response.sendRedirect("index.jsp");
      }
                 
    %>
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <title>Panel de Control</title>
        
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="resources/jquery/js/jquery.validate.js"></script>            
        
        <script type="text/javascript" src="/sece/dwr/interface/panel.js"></script>        
        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
        <script type="text/javascript" src="/sece/dwr/interface/capacitadoresScripts.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>
        
        <script type="text/javascript" >
            
            var num_item=0;
            var IdEmpresa=0;
            var contraActivos = <%=contratoActivos%>;
            var IdContrato = <%=idContrato%>;
            var tipo = <%=tipo%>;
            var IdUsuario = <%=id_usuario%>;
            var indicadorChange;
            var nombre = "hola";
                        
            $(function() {
		$( "#btnagregar" ).button();  
                $( "#btnupdatInfo" ).button(); 
                $( "#btnupdatContra" ).button(); 
                $( "#btnupdatEmpresa" ).button();
                $( "#btnVCUser" ).button();
                $( "#tabs" ).tabs();  
                                
                if(tipo==4){
                   $("#tabs").tabs( "remove" , 2 );
                   $("#tabs").tabs( "remove" , 2 ); 
                   obtenerDatosUsuario()
                }else{
                    IdEmpresa= <%=idEmpresa%>;
                    obtenerDatosEmpresa();
                    obtenerDatosUsuario();
                    cargarComboIndicador();                      
                    $("#new").click();
                }
                
                //llamar los metodos que cargan las tablas
                getTablestoShow();
                
                $( "#logoutbutton" ).button({			
			icons: {
				primary: "ui-icon-circle-arrow-w",
                                secondary: "ui-icon-triangle-1-s"
			}
		})
		.click(function() {			
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
                
                $( "#box_message" ).hide();//escondo el contenido del div para los mensajes
                
    $( "#dialog:ui-dialog" ).dialog( "destroy" );
    $( "#dialog-confirm" ).dialog({
			autoOpen: false,
                        resizable: false,
			height:250,
			modal: true,
			buttons: {
				Aceptar: function() { 
                                    
                                        if( $("#combo1").is(":checked") ){
                                            //aqui si selecciono un usuario del combo
                                            panel.cambiarResponsableIndicador(indicadorChange,$("#cIndiMod").val(),IdContrato);                                            
                                            //aqui busco el nombre del usuario y lo pongo en la tabla y asi la actualizo
                                            panel.getUsuario($("#cIndiMod").val(),respNombre);
                                        }else{
                                            //aqui si selecciono la opcion "Yo"
                                            panel.cambiarResponsableIndicador(indicadorChange,IdUsuario,IdContrato);    
                                            //aqui busco el nombre del usuario y lo pongo en la tabla y asi la actualizo
                                            panel.getUsuario(IdUsuario,respNombre);                                             
                                        }
                                                                               
                                                                              
					$( this ).dialog( "close" );
				},
				Cancelar: function() {
					$( this ).dialog( "close" );
				}
			}
		});//dialog
                
            });            
            
            function respNombre(data){
                $("#resp"+indicadorChange).html(data[0]);
            }
                        
            function link_indi(){
                $("#tabs-2").html("<p>Nombre</p>");
            }
           
       function solicitar(){
          panel.requestNewContra(IdUsuario, resp_solicitud);  
          
       }  
       
       function resp_solicitud(dato){
           var mensaje = dato;
           
           if(mensaje==1){
               var palabra= "<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Notificacion de solicitud</strong><p class='hola'>Su solicitud ha sido enviada, esto tomara cierto tiempo, mientras el capacitador habilita su nuevo contrato.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);               
               $( "#box_message" ).show("blind",callbackSolicitud);//codigo que muestra el div de mensaje
               
               $("#grafico").hide();
        
           }else{
               var palabra= "<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Notificacion de solicitud</strong><p class='hola'>Lo sentimos la solicitud no fue enviada, intente mas tarde por favor. Si esto continua pongase en contacto con el administrador del sistema.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);               
               $( "#box_message" ).show("blind",callbackSolicitud);//codigo que muestra el div de mensaje
        
           }
           
       }
       
       function getTablestoShow(){
           
           //if(contraActivos == 0){                              
               //panel.getContratoEstaCero(IdUsuario, respContratosEstados); //validar los estado de todos los contratos que posee en el usuario contacto.                         
           //}else if(contraActivos == 1){
               panel.getContratoEstaCero(IdUsuario, respContratosEstados); //validar los estado de todos los contratos que posee en el usuario contacto.                         
          // }
       }
       
       function respContratosEstados(dato){
           var respuestaDato = dato;
           
           if(respuestaDato == -1){
               $("#toolbar1").html("<button id='grafico'  onclick='solicitar();'>Solicitar nuevo contrato</button>");               
               panel.getContratos(IdUsuario, repContratos);
           }else if(respuestaDato == 1){
               $("#toolbar1").hide();
               panel.getContratos(IdUsuario, repContratos);
           }else if(respuestaDato == 2){
               $("#toolbar1").hide();
               panel.getRowIndicador(IdContrato, repIndicador);               
           }
           
       }
       
       function repContratos(data){ 
           var i=0;
           
           if( i != data.length ){
           
                var cadenaTable="";

                cadenaTable = "<table id='table_contratos' style=' font-size: 14px;'><tr style='background-color: #347488;color: #fff;'><td> Contrato </td><td> Fecha Inicio </td><td> Fecha Finalizo </td></tr></table>" ;

                $("#contenidoIndicadores").append("<br><h4>Contratos</h4>" + "<br>" +cadenaTable);

              for(i;i<data.length;i++){
                  addRowContratos(data[i][0],data[i][1],data[i][2],data[i][3]);             
              }         
         }
         
       }   
       
       function addRowContratos(contrato, fechaIni,fechaFin,idContra){
           var cadena="";
           
           if(tipo==4){
               cadena="<tr><td>"+contrato+"</td><td><label for='responsable' id='resp' >"+fechaIni+"</label></td><td><label for='responsable' id='resp' >"+fechaFin+"</label></td><td><p><a href='#' onclick='goGrafico("+ idContra +");'><strong>Grafico de Araña</strong></a></p></td><td><p><a href='#' onclick='goGrafico1("+ idContra +");;'><strong>VCE</strong></a></p></td></tr>";
               
           }else{
               cadena="<tr><td>"+contrato+"</td><td><label for='responsable' id='resp' >"+fechaIni+"</label></td><td><label for='responsable' id='resp' >"+fechaFin+"</label></td><td><p><a href='#' onclick='goGrafico("+ idContra +");'><strong>Grafico de Araña</strong></a></p></td><td><p><a href='#' onclick='goGrafico1("+ idContra +");;'><strong>VCE</strong></a></p></td></tr>";
           }
           
           $("#table_contratos").append(cadena); 
       }   
       
       function repIndicador(data){ 
           var i=0;
           
           var cadenaTable="";
           
           cadenaTable = "<table id='table_indicador' style=' font-size: 14px;'><tr style='background-color: #347488;color: #fff;'><td> Indicador </td><td> Responsable </td><td> Progreso </td><td></td><td></td></tr></table>" ;
           
           $("#contenidoIndicadores").html(cadenaTable);
           
         for(i;i<data.length;i++){
             addRowIndicador(data[i][0],data[i][1],data[i][2],data[i][3]);             
         }
         
         //if(contraActivos == 0){
             panel.getContratos(IdUsuario, repContratos);
         //}
         
       }     
       
       function repDelegado(data){  
           var i=0;
          
         for(i;i<data.length;i++){
            addRowDelegado(data[i][0],data[i][1],data[i][2],data[i][3]);             
         }
       }     

       function goout(){
            location.href="salir";
       }
        
       function cambiarResponsable(indicador){
           indicadorChange = indicador;            
        
            $( "#dialog-confirm" ).dialog( "open" );
            panel.getAllDelegado(IdEmpresa,respIndiMod);
       }
        
       function respIndiMod(data){
           var CadenaResp="";
           var i;
           for(i=0;i<data.length;i++){
               CadenaResp += "<option value="+ data[i][0] +">"+ data[i][1] +"</option>";
           }
           
        $("#cIndiMod").html(CadenaResp);
       }
       
       function addRowIndicador(indicador, responsable,avance,idIndicador){
           var cadena="";
           
           if(tipo==4){
               cadena="<tr><td>"+indicador+"</td><td><label for='responsable' id='resp"+idIndicador+"' >"+responsable+"</label></td><td><div class='progress-bar blue small' style='width:90%; float: left;'><div style='width:"+ avance +"%;'><span style='top:16%;'>"+ avance +"%</span></div> </div></td><td><p><a href='instrument.jsp?indi="+idIndicador+"'><strong>Ir instrumento</strong></a></p></td><td></td></tr>";
           }else{
               cadena="<tr><td>"+indicador+"</td><td><label for='responsable' id='resp"+idIndicador+"' >"+responsable+"</label></td><td><div class='progress-bar blue small' style='width:90%; float: left;'><div style='width:"+ avance +"%;'><span style='top:16%;'>"+ avance +"%</span></div> </div></td><td><p><a href='instrument.jsp?indi="+idIndicador+"'><strong>Ir instrumento</strong></a></p></td><td><p><a href='#' onclick='cambiarResponsable("+idIndicador+");'><strong>Delegar</strong></a></p></td></tr>";
           }
           
           $("#table_indicador").append(cadena); 
       }       
       
       function updateContra(){       
           var contraAnterior = $("#contraOld").val();           
           var contraNueva = $("#contraNew").val();
           var contraNuevaConfirmacion = $("#contraNew2").val();
           
           if(contraAnterior=="") {
              
               var palabra= "<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Llene el campo de contraseña actual, gracias!!</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);               
               $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje
           }else if(contraNueva=="" ){
               var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Llene el campo de la nueva contraseña, gracias!!</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);
               $( "#box_message" ).show("blind",callback);
           }else if(contraNuevaConfirmacion==""){
               var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Llene el campo de confirmacion de la nueva contraseña, gracias!!</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);
               $( "#box_message" ).show("blind",callback);
           }
           else{               
               panel.updatePass(<%=id_usuario%>,contraAnterior,contraNueva,contraNuevaConfirmacion,respUpdate);
               
               validacion.saveActionBitacora(<%=acc%>,24,"modifico contraseña",IdUsuario,contraAnterior,contraNuevaConfirmacion);
           }           
       }
       
       function callback() {//function para esconder el div de mensaje con efecto
			setTimeout(function() {
				$( "#box_message:visible" ).removeAttr( "style" ).slideUp();//fadeOut();
			}, 1000 );
		};
                
       function callbackSolicitud() {//function para esconder el div de mensaje con efecto
			setTimeout(function() {
				$( "#box_message:visible" ).removeAttr( "style" ).slideUp();//fadeOut();
			}, 3500 );
		};         

       function respUpdate(data){
           var respu = data;
                    
            if(respu==0){               
               var palabra="<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Contraseña incorrecta</strong><p class='hola'>Digite correctamente la contraseña anterior.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);
               $( "#box_message" ).show("blind",callback);
           }else if(respu==1){               
               var palabra="<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Contraseña incorrecta</strong><p class='hola'>La nueva contraseña no coincide correctamente.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);
               $( "#box_message" ).show("blind",callback);
           }else if(respu==2){
               var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Modificacion</strong><p class='hola'>Se ha cambiado la nueva contraseña correctamente.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);
               $( "#box_message" ).show("blind",callback);
                $("#contraOld").val("");           
                $("#contraNew").val("");
                $("#contraNew2").val("");
           } 
       }
       
       function doDelegar(){
           alert("Hola");
       }
       
       function addRowDelegado(nombre, cargo,estado,idUsuarioDelegado){
           var cadena="";
           cadena="<tr><td>"+nombre+"</td><td>"+cargo+"</td><td>"+estado+"</td><td><p><a href='#' onclick='editarDelegado("+ idUsuarioDelegado +");' ><strong>Editar</strong></a></p></td></tr>";
           $("#table_delegado").append(cadena); 
       }
       
       function editarDelegado(idUsuarioDel){           
            $("#panel_tab4").html(" <h4>Modificar Delegado</h4><br> <form id='formModificarDelegado' method='post'><div class='div_header_reg'><div class='row_reg'><div class='left_reg'><label for='fandln' >Nombre:</label></div><div ><input type='text' name='txtnameDelegado' id='txtnameDelegado' /><input type='hidden' name='txtidDelegado' id='txtidDelegado' value='"+ idUsuarioDel +"' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Telefono:</div><div ><input type='text' name='txttelDelegado' id='txttelDelegado' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Cargo:</div><div ><input type='text' name='txtcargoDelegado' id='txtcargoDelegado' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Direccion:</div><div ><input type='text' name='txtdirDelegado' id='txtdirDelegado' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Direccion de Correo:</div><div ><input type='text' name='txtcorreoDelegado' id='txtcorreoDelegado' /></div><div class='clear_reg'></div></div></div><p><strong>*Todos los campos son requeridos </strong><br /><p><input type='submit' value='Modificar &raquo;' id='btnmodDelegado' name='btnmodDelegado' /></p></form>");           
            panel.getUsuario($("#txtidDelegado").val(), respuestaFieldDelegado);
           //cargarComboIndicador();
          $( "#btnmodDelegado" ).button();           
           
           ValidateFormDelegado();
       }
       
       function respuestaFieldDelegado(data){
           $("#txtnameDelegado").val(data[0]);
           $("#txttelDelegado").val(data[2]);
           $("#txtcargoDelegado").val(data[1]);
           $("#txtdirDelegado").val(data[3]);
           $("#txtcorreoDelegado").val(data[4]);
       }
       
       function ValidateFormDelegado(){
        $('#formModificarDelegado').validate({
           rules: {           
           'txtnameDelegado': 'required',
           'txttelDelegado': { required: true, number: true },
           'txtcargoDelegado': 'required',
           'txtdirDelegado': 'required',           
           'txtcorreoDelegado': { required: true, email: true }
           },
       messages: {           
           'txtnameDelegado': 'Debe ingresar el nombre',
           'txttelDelegado': { required: 'Debe ingresar el número telefonico', number: 'Debe ingresar un número' },
           'txtcargoDelegado': 'Debe ingresar el cargo',
           'txtdirDelagado': 'Debe ingresar la direccion',                      
           'txtcorreoDelegado': { required: 'Debe ingresar un correo electrónico', email: 'Debe ingresar el correo electrónico con el formato correcto. Por ejemplo: nombre@dominio.com' }
       },
       debug: true,
       /*errorElement: 'div',*/
       //errorContainer: $('#errores'),
       submitHandler: function(form){                      
           panel.updateUsuario($("#txtidDelegado").val(),$("#txtnameDelegado").val(),$("#txtcargoDelegado").val(),$("#txttelDelegado").val(),$("#txtdirDelegado").val(),$("#txtcorreoDelegado").val());
           //$("#resp"+$("#cIndi").val()).html($("#txtname").val());//cambio el nombre del responsable en la tabla
           
           $("#all").click();
           var palabra="<section role='principal' id='message_box'><div class='notification success'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Sastifactorio</strong><p class='hola'>Se ha agregado el nuevo delegado.</p></div><!-- /Notification --></section>";  
           $("#box_message").html(palabra);
           $( "#box_message" ).show("blind",callback);           
           
       }
    });///fin de formDelegado   
       }
       
       function cargarValidateForm(){
        $('#formDelegado').validate({
           rules: {           
           'txtname': 'required',
           'txttel': { required: true, number: true },
           'txtcargo': 'required',
           'txtdir': 'required',           
           'txtcorreo': { required: true, email: true },
           'txtpass': 'required',
           'txtpass2': {required: true,equalTo: "#txtpass"}
           },
       messages: {           
           'txtname': 'Debe ingresar el nombre',
           'txttel': { required: 'Debe ingresar el número telefonico', number: 'Debe ingresar un número' },
           'txtcargo': 'Debe ingresar el cargo',
           'txtdir': 'Debe ingresar la direccion',                      
           'txtcorreo': { required: 'Debe ingresar un correo electrónico', email: 'Debe ingresar el correo electrónico con el formato correcto. Por ejemplo: nombre@dominio.com' },
           'txtpass': 'Debe ingresar un password',
           'txtpass2': {required: 'Debe ingresar el password nuevamente',equalTo: 'Debe de ser el mismo password'}           
       },
       debug: true,
       /*errorElement: 'div',*/
       //errorContainer: $('#errores'),
       submitHandler: function(form){                      
           panel.addDelegado(IdEmpresa,$("#cIndi").val(),IdContrato,$("#txtname").val(),$("#txttel").val(),$("#txtcargo").val(),$("#txtdir").val(),$("#txtcorreo").val(),$("#txtpass").val());
           
           $("#resp"+$("#cIndi").val()).html($("#txtname").val());//cambio el nombre del responsable en la tabla
           
           $("#all").click();
           var palabra="<section role='principal' id='message_box'><div class='notification success'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Sastifactorio</strong><p class='hola'>Se ha agregado el nuevo delegado.</p></div><!-- /Notification --></section>";  
           $("#box_message").html(palabra);
           $( "#box_message" ).show("blind",callback);
           
       }
    });///fin de formDelegado   
       }//fin del metodo cargarValidateForm
       
       function panel_newDel(){           
           $("#panel_tab4").html(" <h4>Agregar Delegado</h4><br> <form id='formDelegado' method='post'><div class='div_header_reg'><div class='row_reg'><div class='left_reg'><label for='fandln' >Indicador:</label></div><div><select name='cIndi' id='cIndi'></select></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'><label for='fandln' >Nombre:</label></div><div ><input type='text' name='txtname' id='txtname' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Telefono:</div><div ><input type='text' name='txttel' id='txttel' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Cargo:</div><div ><input type='text' name='txtcargo' id='txtcargo' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Direccion:</div><div ><input type='text' name='txtdir' id='txtdir' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Direccion de Correo:</div><div ><input type='text' name='txtcorreo' id='txtcorreo' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Digite el password:</div><div ><input type='password' name='txtpass' id='txtpass' /></div><div class='clear_reg'></div></div><div class='row_reg'><div class='left_reg'>Re-enter password:</div><div ><input type='password' name='txtpass2' id='txtpass2' /></div><div class='clear_reg'></div></div></div><p><strong>*Todos los campos son requeridos </strong><br /><p><input type='submit' value='Agregar &raquo;' id='btnagregar' name='btnagregar' /></p></form>");           
           cargarComboIndicador();
           $( "#btnagregar" ).button();           
           
           cargarValidateForm();
       }
       
       function panel_showDel(){
           $("#panel_tab4").html("<h4>Listado de Delegados</h4><br> <table id='table_delegado'  ><tr style='background-color: #347488; color:#fff;'><td> Delegado </td><td> Cargo </td><td> Estado </td><td></td></tr></table>");
           panel.getRowDelegado(IdEmpresa, repDelegado);         
       }     
       
       function modificar_empresa(){            
            
            if($("#txtname_empresa").val()=="" || $("#txtdes_empresa").val()=="" || $("#txttel_empresa").val()=="" || $("#txtdir_empresa").val()=="" ){
               var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio, Informacion de la empresa</strong><p class='hola'>Ningun campo puede estar vacio.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);               
               $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje  
            }else{           
                panel.updateEmpresa(IdEmpresa,$("#txtname_empresa").val(),$("#txtdes_empresa").val(),$("#txttel_empresa").val(),$("#txtdir_empresa").val());
                var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Satisfactorio</strong><p class='hola'>Se ha actualizado los datos de la empresa!!.</p></div><!-- /Notification --></section>";  
                $("#box_message").html(palabra);               
                $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje                  
            }
       }
       
       function obtenerDatosEmpresa(){
           panel.getEmpresa(IdEmpresa, respEmpresa);           
       }
       
       function respEmpresa(data){
           $("#txtname_empresa").val(data[0]);
           $("#txtdes_empresa").val(data[1]);
           $("#txttel_empresa").val(data[2]);
           $("#txtdir_empresa").val(data[3]);
       }
       
       function obtenerDatosUsuario(){
           panel.getUsuario(IdUsuario, respUsuario);           
       }
       
       function respUsuario(data){
           $("#txtname_usuario").val(data[0]);
           $("#txtcargo_usuario").val(data[1]);
           $("#txttel_usuario").val(data[2]);
           $("#txtdir_usuario").val(data[3]);
           $("#txtcorreo_usuario").val(data[4]);
       }
       
       function modificar_usuario(){                                    
            
            if($("#txtname_usuario").val()=="" || $("#txtcargo_usuario").val()=="" || $("#txttel_usuario").val()=="" || $("#txtdir_usuario").val()=="" || $("#txtcorreo_usuario").val()=="" ){
               var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio, Informacion de usuario</strong><p class='hola'>Ningun campo puede estar vacio.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);               
               $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje  
            }else{           
                panel.updateUsuario(IdUsuario,$("#txtname_usuario").val(),$("#txtcargo_usuario").val(),$("#txttel_usuario").val(),$("#txtdir_usuario").val(),$("#txtcorreo_usuario").val());
                var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Satisfactorio</strong><p class='hola'>Se ha actualizado los datos personales!!.</p></div><!-- /Notification --></section>";  
                $("#box_message").html(palabra);               
                $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje                  
            }
       }
       
       function cargarComboIndicador(){
           panel.getIndicadores(respIndi);
       }
       
       function respIndi(data){
           var CadenaResp="";
           var i;
           for(i=0;i<data.length;i++){
               CadenaResp += "<option value="+ data[i][0] +">"+ data[i][1] +"</option>";
           }
           
        $("#cIndi").html(CadenaResp);
       }
       
       function goGrafico(var1){
           //location.href="resultado.jsp";   
           window.open("resultado.jsp?ota8rtn4oc="+var1, "_blank");
           
       }
       
        function goGrafico1(var1){
           //location.href="resultado.jsp";   
           window.open("InformeFinal?idContrato="+var1, "_blank");
           
       }
       
       ////toolsbar
       $(function() {
		$( "#new" ).button({
			text: false,
			icons: {
				primary: "ui-icon ui-icon-document"
			}
		});
		$( "#all" ).button({
			text: false,
			icons: {
				primary: "ui-icon ui-icon-search"
			}
		});						
                $( "#grafico" ).button({
			text: false,
			icons: {
				primary: "ui-icon ui-icon-mail-closed"
			}
		});
                 $( "#grafico1" ).button({
			text: false,
			icons: {
				primary: "ui-icon ui-icon-print"
			}
		});
				
	});
        
                
               function test(){
               capacitadoresScripts.insertarVideoChat(<%=idContrato%>,<%=id_usuario%>,{
                                    callback:function(data){
                                    $("#videoChatUser").html(data);                                           
                                    }//fin callback                                    
                            }); 
                                      
                  $('#videoChatUser').toggle();
                   if ($('#videoChatUser').css('display') == 'none') {                      
                          $('#btnVCUser').val('Iniciar Video Chat');     
                     }
                     else {
                          $('#btnVCUser').val('Cerrar Video Chat');
                     }
               }
	
        </script>
        <style>
	#toolbar {
		padding: 10px 4px;
	}
        </style>
        
    </head>    
    <body>
     <div class="main">
  <div class="header">
    <div class="header_resize">      
      <div class="menu">
                
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logofull.png" width="250" height="70" border="0" alt="logo" /></div>      
      
      <div class="inGo">
       <span id="toolbar" class="ui-widget-header ui-corner-all">	
        <button id="logoutbutton" onclick="mostrarSalir();" ><%=name%></button>	
       </span> 
       
        <div id="menuBtnOpciones1" >
              <ul class="opciones1">
                  <li id="mnuBtnSalir" onclick="location.href='ayuda/ayudaContacto.jsp'" > <img src="images/question_mark.png"/> Ayuda  </li>                   
                  <li id="mnuBtnSalir" onclick="goout();" ><img src="images/salir.gif"/> Salir  </li>  
              </ul>              
          </div>
       

       </div>
       
      <div class="clr"></div>
    </div>
  </div> 
  
  <div class="body">     
    <div class="body_resize">
          <br>
        <div id="box_message" > 
                           
        </div> <%-- finaliza div que muestra los mensajes --%>
        
        <div id="dialog-confirm" title="Modificar Reponsable">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Selecciona al nuevo responsable, o no deleges a ningun usuario haslo tu mismo!</p>
            <form>            
            <input type="radio" name="combo" id="combo1" value="0" checked="true" />
            <select name="cIndiMod" id="cIndiMod">
                <option value="0000">--Seleccione--</option>
            </select><br></br>
            <label for="O" style="padding-left: 50%; " >O</label> <br></br>
            <input type="radio" name="combo" id="combo2" value="1"/>Yo
            </form>
        </div><%-- finaliza div que muestra el dialogo de modificar responsable --%>        
                   
           <%-- <div class="right2"> </div> end div right2 --%> 
       <div id="tabs">
           <ul>
               <li><a href="#tabs-1">Espacio de trabajo</a></li>
               <li><a href="#tabs-2" >Datos Personales</a></li>
               <li><a href="#tabs-3">Datos de la Empresa</a></li>
               <li><a href="#tabs-4">Delegado</a></li>
               <li><a href="#tabs-5">Video Chat</a></li>
           </ul>
           <div id="tabs-1">
               <span id="toolbar1" style="padding: 10px 4px; font-size: 14px;" class="ui-widget-header ui-corner-all">
                  
               </span>
               
               <style>                
                #table_indicador td, table_delegado td,table_contratos td {
                    border-bottom: 1px solid #999; height: 35px;}                                                        
               </style>
               <h4>Avence de los Indicadores</h4>
               
               <div id="contenidoIndicadores" style=" padding-top:2%; " >
                  <img src="resources/icons/ajax_loading_blue.gif" width="24" height="24" border="0" style=" margin-left: 20%; margin-top: 5%;" />
              </div>
               
           </div><%-- End div tabs 1 --%>
           <div id="tabs-2">
               <table>
                   <tr>
                       <td>
                           <div id="informacion_usuario" style=" font-size: 14px;">
                               <div class="ri1">
                                   <div class="clr"></div>
                                   <div class="right_top">
                                       <div class="right_bottom">
                                           <h4>Informacion de usuario</h4>
                                           <table style="padding:10px;">
                                               <tbody>
                                                   <tr>
                                                       <td>Nombre:</td>
                                                       <td><input type="text" id="txtname_usuario" size="28"  /> </td>
                                                   </tr>
                                                   <tr>
                                                       <td>Cargo:</td>
                                                       <td><input type="text" id="txtcargo_usuario" size="28" /></td>
                                                   </tr>
                                                   <tr>
                                                       <td>Telefono:</td>
                                                       <td><input type="text" id="txttel_usuario" size="28" /></td>
                                                   </tr>
                                                   <tr>
                                                       <td>Direccion:</td>
                                                       <td><textarea rows="2" cols="25" id="txtdir_usuario" ></textarea></td>
                                                   </tr>
                                                   <tr>
                                                       <td>Correo:</td>
                                                       <td><input type="text" id="txtcorreo_usuario" size="28" /></td>
                                                   </tr>                                                   
                                               </tbody>
                                           </table>
                                           <p><input type="button" value="Actualizar" id="btnupdatInfo" onclick="modificar_usuario();" ></input></p>  
                                           <div class="clr"></div>
                                       </div><%-- termina div de right_bottom --%>
                                   </div><%-- termina div de right_top --%>
                                           <div class="clr"></div>
                               </div>                              
                           </div><%-- termina div de informacion_usuario --%>               
                       </td>
                       <td>
                           <div id="cambiar_contra" style=" padding-left: 10px; padding-top: 0px; font-size: 14px;">
                               <div class="ri1">
                                   <div class="clr"></div>
                                   <div class="right_top">
                                       <div class="right_bottom">
                                           <h4>Cambiar contraseña</h4>                                            
                                           <table style="padding:10px;" >
                                               <tbody>
                                                   <tr>
                                                       <td>Actual:</td>
                                                       <td><input id="contraOld" type="password" value="" /> </td>
                                                   </tr>
                                                   <tr>
                                                       <td>Nueva:</td>
                                                       <td><input id="contraNew" type="password" value="" /></td>
                                                   </tr>
                                                   <tr>
                                                       <td>Confirmar nueva:</td>
                                                       <td><input id="contraNew2" type="password" value="" /></td>
                                                   </tr>                                                                                                      
                                               </tbody>
                                           </table>
                                           <p><input type="button" value="Actualizar" id="btnupdatContra" onclick="updateContra();" ></input></p>  
                                           <div class="clr"></div>
                                       </div><%-- termina div de rigth_bottom --%> 
                                   </div><%-- termina div de right_top --%> 
                                   <div class="clr"></div>
                               </div><%-- termina div de ri1 --%> 
                           </div><%-- termina div de cambiar_contra --%> 
                       </td>                       
                   </tr>                   
               </table>
                       
           </div><%-- End div tabs 2 --%>
           <div id="tabs-3">
               <div id="informacion_empresa" style=" font-size: 14px;">
                   <div class="ri1">
                       <div class="clr"></div>
                       <div class="right_top">
                           <div class="right_bottom">
                               <h4>Informacion de la empresa</h4>
                               <table style="padding:10px;">
                                   <tbody>
                                       <tr>
                                           <td>Nombre:</td>
                                           <td><input id="txtname_empresa" size="27" type="text" /> </td>
                                       </tr>
                                       <tr>
                                           <td>Descripcion:</td>
                                           <td><input type="text" id="txtdes_empresa" size="27" value=<%=descripcion%> /></td>
                                       </tr>
                                       <tr>
                                           <td>Telefono:</td>
                                           <td><input type="text" id="txttel_empresa" size="27" value=<%=tel_empresa%> /></td>
                                       </tr>
                                       <tr>
                                           <td>Direccion:</td>
                                           <td><textarea rows="2" cols="20" id="txtdir_empresa" ><%=dir_empresa%></textarea></td>
                                       </tr>                                      
                                   </tbody>
                               </table>
                                       <p><input type="button" value="Actualizar" id="btnupdatEmpresa" onclick="modificar_empresa();" ></input></p>  
                                       <div class="clr"></div>
                           </div><%-- termina div de right_bottom --%>
                       </div><%-- termina div de right_top --%>
                       <div class="clr"></div>
                   </div>                              
               </div><%-- termina div de informacion_empresa --%>  
           </div><%-- End div tabs 3 --%>
           <div id="tabs-4">
               <span id="toolbar" style="padding: 10px 4px; font-size: 14px;" class="ui-widget-header ui-corner-all">
                   <button id="new"  onclick="panel_newDel();">Nuevo</button>
                   <button id="all" onclick="panel_showDel();">Ver Todos</button>                   
               </span>
               
               <div id="panel_tab4" style=" font-size: 14px;" >
                   <h4>Agregar Delegado</h4>
                   <br>
                   <form id="formDelegado" method="post">              
                       <div class="div_header_reg">                           
                           <div class="row_reg">
                               <div class="left_reg"><label for="fandln" >Indicador:</label></div>
                               <div><select name="cIndi" id="cIndi">
                                       <option value="0000">--Seleccione--</option>
                                     </select>
                               </div>
                               <div class="clear_reg"></div>                               
                           </div>
                           <div class="row_reg">
                               <div class="left_reg"><label for="fandln" >Nombre y Apellido:</label></div>
                               <div ><input type="text" name="txtname" id="txtname_delegado" /></div>
                               <div class="clear_reg"></div>                               
                           </div>
                           <div class="row_reg">
                               <div class="left_reg">Telefono:</div>
                               <div ><input type="text" name="txttel" id="txttel_delegado" /></div>
                               <div class="clear_reg"></div>                               
                           </div>
                           <div class="row_reg">
                               <div class="left_reg">Cargo:</div>
                               <div ><input type="text" name="txtcargo" id="txtcargo_delegado" /></div>
                               <div class="clear_reg"></div>
                           </div>                                               
                           <div class="row_reg">
                               <div class="left_reg">Direccion:</div>
                               <div ><input type="text" name="txtdir" id="txtdir_delegado" /></div>
                               <div class="clear_reg"></div>
                           </div>                                               
                           <div class="row_reg">
                               <div class="left_reg">Direccion de Correo:</div>
                               <div ><input type="text" name="txtcorreo" id="txtcorreo_delegado" /></div>
                               <div class="clear_reg"></div>
                           </div>                    
                           <div class="row_reg">
                               <div class="left_reg">Digite el password:</div>
                               <div ><input type="password" name="txtpass" id="txtpass_delegado" /></div>
                               <div class="clear_reg"></div>
                           </div>
                           <div class="row_reg">
                               <div class="left_reg">Re-enter password:</div>
                               <div ><input type="password" name="txtpass2" id="txtpass2_delegado" /></div>
                               <div class="clear_reg"></div>
                           </div>  
                       </div><%-- div header_reg End div personal details --%>
                       <p><strong>*Todos los campos son requeridos </strong><br />
                       <p><input type="submit" value="Agregar &raquo;" id="btnagregar" name="btnagregar" /></p>
                   </form>
               </div><%-- End div tabs 4 --%>
           </div><%-- End div tabs 4 --%>
           <div id="tabs-5"  style=" padding:0 0;">
               
               <div id="videoChatUser">
                   
               </div>
               <div align="center"> <input type="button" id="btnVCUser" onclick="test();" value="Iniciar Video Chat"/> </div>  
               
           </div><%-- End div tabs 5 --%>
       </div> <%-- End div tabs --%>
       
      <div class="clr"></div>
    </div>
  </div><%-- end div body rezise --%> 
  
  <div class="clr"></div>
</div>  
    </body>
</html>
<% } %>