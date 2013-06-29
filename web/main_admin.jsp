<%--
    Document   : main_admin
    Created on : Dec 10, 2010, 3:40:24 PM
    Author     : mamg
--%>


<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.EscalaDaoImpl"%>
<%@page import="pojo.Escala"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.SugerenciaDaoImpl"%>
<%@page import="pojo.Sugerencia"%>
<%@page import="daoImpl.AsignacionCapaContraDaoImpl"%>
<%@page import="pojo.AsignacionCapaContra"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Indicador"%>
<%@page import="daoImpl.encriptar"%>
<%@page import="daoImpl.EmpresaDaoImpl"%>
<%@page import="pojo.Empresa"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
%>
<html>
    <head>        
        <title>SECE</title>
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <% HttpSession sesion=request.getSession();
        
           String val = (String)sesion.getAttribute("idAcc");
           if(val==null){
              response.sendRedirect("index.jsp");
           } else{     
                %>       
        <link rel="stylesheet" type="text/css" href="resources/css/styles.css"/>        
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
         <link href="resources/css/message.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="/sece/dwr/interface/updating.js"></script>  
         <script type="text/javascript" src="/sece/dwr/interface/instrumentoDWR.js"></script>
         <script type="text/javascript" src="/sece/dwr/interface/capacitadoresDWR.js"></script>
          <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>        
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
         <script type="text/javascript" src="resources/jquery/js/jquery.validate.js"></script> 
        <style type="text/css">
            label, input { display:block; }
		input.text { margin-bottom:12px; width:95%; padding: .4em; }
		fieldset { padding:0; border:0; margin-top:25px; }
		h1 { font-size: 1.2em; margin: .6em 0; }
		div#users-contain { width: 350px; margin: 20px 0; }
		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
            
        </style>
        
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <%
           Acceso acc = new Acceso();
           AccesoDaoImpl adi = new AccesoDaoImpl();
           acc = adi.findById(Integer.valueOf(val));
          
        
           Usuario usu = new Usuario();
           UsuarioDaoImpl udi = new UsuarioDaoImpl();
           usu = acc.getUsuario(); 
           int iduser = usu.getIdUsuario();
           usu = udi.findById(iduser);
                   if(usu.getTipoUsuario()!= 1){
                       response.sendRedirect("index.jsp"); 
                   }
            sesion.setAttribute("idAcc", val);          
           
                                                 
        %>       
        <script>
            $(function(){
                //Botones
              $("#tabs").tabs();              
               $("#btnClearCap").button();
               $("#btnpassBloqueado").button();
               $("#btnNewCapacitador").button(); 
               $("#btnRepEPA").button();               
               $("#saveNota").button();
      $("#btnRepEHE").button();
      $("#btnRepERE").button();
      $("#btnRepCap").button();
      $("#btnRepUsers").button(); 
     $("#btnFormato").button();
     $("#btnBitacoraG").button();
        $( "#datepicker" ).datepicker({
			changeMonth: true,
			changeYear: true,
                        dateFormat: 'dd/mm/yy',
                        showAnim: "slideDown"
		});
                $('#datepicker').datepicker($.datepicker.regional['es']);
                //Barra------------------------------
                $( "#home" ).button({
			//text: false,
			icons: {
				primary: "ui-icon-home"
			}
                    }).click(function(){                        
                       location.href = "main_admin.jsp";
                    });
		$( "#instrument" ).button({
			//text: false,
			icons: {
				primary: "ui-icon-clipboard"
			}
                        
		}).click(function(){
                        validacion.saveActionBitacora(<%= val %>, 13, "El Administrador ha redireccionado a otra pagina",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Pagina de Instrumento(admin_instrument.jsp)");
                        location.href = "admin_instrument.jsp";
                    });
                    $( "#help" ).button({
			//text: false,
			icons: {
				primary: "ui-icon-info"
			}
		}).click(function(){
                        validacion.saveActionBitacora(<%= val %>, 13, "El Administrador ha abierto la Ayuda",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Pagina de Ayuda(ayudaAdmin.jsp)");
                        window.open("ayuda/ayudaAdministrador.jsp", "_blank");
                    });
		$( "#logoutbutton" ).button({			
			icons: {
				primary: "ui-icon-gear",
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
                //Fin Barra------------------------
        
  }); 
    
  
               function callback() {//function para esconder el div de mensaje con efecto
			setTimeout(function() {
				$( "#box_message:visible" ).removeAttr( "style" ).slideUp();//fadeOut();
			}, 1000 );
		};
            $( "#box_message" ).hide();//escondo el contenido del div para los mensajes
       
            
             
        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        
        <%--     aqui empieza el modal para actualizar   --%>
        	<script>
      //Codigo javaScript para Actualizar datos personales del Administrador               
	$(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		
		  $( "#dialog:ui-dialog" ).dialog( "destroy" );
		var updatenombre = $( "#updatenombre" ),
                    updatecargo = $("#updatecargo"),
                    updatetel = $("#updatetel"),
                    updatemail = $("#updatemail"),
                    updatedir = $("#updatedir"),
			/*email = $( "#email" ),
			password = $( "#password" ),*/
        allFields = $( [] ).add(updatenombre).add(updatecargo).add(updatetel).add(updatemail).add(updatedir),
			tips = $( ".validateTips" );

		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

		function checkLength( o, n, min, max ) {
			if ( o.val().length > max || o.val().length < min ) {
				o.addClass( "ui-state-error" );
				updateTips( "El " + n + " debe de contener entre " +
					min + " y " + max + " caracteres." );
				return false;
			} else {
				return true;
			}
		}

		function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
		}
		
                                
		$( "#dialog-formUpdate" ).dialog({
			
                        autoOpen: false,
			height:350,
			width: 300,
			modal: true,
                        show: "slide",
                        hide: "scale",
			buttons: {
				"Actualizar": function() {
                                       
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					bValid = bValid && checkLength( updatenombre, "Nombre", 5, 50 );
					bValid = bValid && checkLength( updatecargo, "Cargo", 5, 30 );
					bValid = bValid && checkLength( updatemail, "E-Mail", 8, 50 );
                                        bValid = bValid && checkLength( updatetel, "Telefono", 7, 8 );
                                        bValid = bValid && checkLength( updatedir, "Direccion", 5, 200 );
                                        
					//bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
					// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
					bValid = bValid && checkRegexp( updatemail, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "El E-Mail debe de ser válido" );
					//bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
                                         var id;
                                         var nombre;
                                         var cargo;
                                         var mail;
                                         var tele;
                                         var dire;
                                         
					if ( bValid ) {
                                              id = dwr.util.getValue("idAdmin");
                                              nombre = dwr.util.getValue("updatenombre");
                                              cargo = dwr.util.getValue("updatecargo");
                                              tele = dwr.util.getValue("updatetel");
                                              mail = dwr.util.getValue("updatemail");
                                              dire = dwr.util.getValue("updatedir");
                                              var datosN = nombre + "," + cargo + "," + tele + "," + mail + "," + dire;                                               
                                              
                                              updating.datosPersonales(id,nombre, cargo, tele, mail, dire, resultado);
                                              validacion.saveActionBitacora(<%= val %>, 24, "Ha modificado sus datos personales", id, '<%= usu.getNombre() %>,<%= usu.getCargo() %>,<%= usu.getTelefono() %>,<%= usu.getCorreo() %>,<%= usu.getDireccion() %>', datosN);  
                                                                                                                                       
                                              $('#dialog-formUpdate').dialog( 'close' );
					}
				},
                                
                                
                                
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
			}
                        
                        
		});
                
                function resultado(data){
                          var resp = data
                          if(resp != null){//recarga el panel con los datos actualizado atraves de dwr
                              document.getElementById("lblnombre").innerHTML = resp[0];
                              document.getElementById("lblcargo").innerHTML = resp[1];
                              document.getElementById("lbltel").innerHTML = resp[2];
                              document.getElementById("lblmail").innerHTML = resp[3];
                              document.getElementById("lbldir").innerHTML = resp[4];
                              document.getElementById("updatenombre").innerHTML = resp[0];
                              document.getElementById("updatecargo").innerHTML = resp[1];
                              document.getElementById("updatetel").innerHTML = resp[2];
                              document.getElementById("updatemail").innerHTML = resp[3];
                              document.getElementById("updatedir").innerHTML = resp[4];
                              document.getElementById("logoutbutton").innerText = resp[0];

                          }                                   
                                }
                

		$( "#updateButton" )
			.button()
			.click(function() {
				$( "#dialog-formUpdate" ).dialog( "open" );
			});
                       
                        
	});</script>
                <%--     aqui termina el modal para actualizar   --%>
                <script>
                    $(function(){
                        $( "#dialog:ui-dialog" ).dialog( "destroy" );
                        
                        var pasAct = $("#actContra"),
                         ncontra1 = $("#nContra1"),
                         ncontra2 = $("#nContra2"),
                     
                        allFields = $( [] ).add(pasAct).add(ncontra1).add(ncontra2),
                        tips = $( ".validateTips2" );
                        
                        function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

		function checkLength( o, n, min, max ) {
			if ( o.val().length > max || o.val().length < min ) {
				o.addClass( "ui-state-error" );
				updateTips( "El " + n + " debe de contener entre " +
					min + " y " + max + " caracteres." );
				return false;
			} else {
				return true;
			}
		}
                             
                function checkPassword(nc1, nc2){
                    if(nc1.val() == nc2.val()){
                        return true;
                    }else{
                        nc1.addClass("ui-state-error");
                        nc2.addClass("ui-state-error");
                        updateTips("Las Contraseñas no coinciden, verifique.");
                        return false;
                    }
                    
                }
                        
                        
                        $("#dialogUpdatePassword").dialog({
                             autoOpen: false,
			     height:300,
			     width: 350,
			     modal: true,
                             show: "slide",
                             hide: "scale",
                             buttons: {
                                "Actualizar": function(){
                                      var bValid = true;
				      allFields.removeClass( "ui-state-error" ); 
                                      
                                       bValid = bValid && checkLength(pasAct, "Contraseña Actual", 4, 50);
                                       bValid = bValid && checkLength(ncontra1, "Nueva Contraseña", 5, 50);
                                       bValid = bValid && checkLength(ncontra2, "Nueva Contraseña Repetida", 5, 50);
                                       bValid = bValid && checkPassword(ncontra1, ncontra2);
                                       
                                       var id;
                                       var p;
                                       var np1;
                                      
                                        if(bValid){
                                          id = dwr.util.getValue("idAdmin");                                         
                                          p = dwr.util.getValue("actContra");                                         
                                          np1 = dwr.util.getValue("nContra1");                                       
                                           
                                          updating.password(id, p, np1, resultado);
                                          validacion.saveActionBitacora(<%= val %>, 24, "modifico contraseña", id, p, np1);  
                                       }                                       
                                 },                       
                               
                               
                              Cancel: function() {
					$( this ).dialog( "close" );
				}   
                             },   
                              
                             close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}
                            
                        });
                            
                        function resultado(data){
                            var resp = data;
                            
                            if(resp == 0){
                                pasAct.addClass("ui-state-error");
                                updateTips("La contraseña no coincide con la de la Base de datos, verifique.");
                            }else{
                                $("#dialogUpdatePassword").dialog("close");
                                allFields.removeClass( "ui-state-error" );
                                alert("La contraseña se cambió correctamente");
                            }
                        }    
                        
                        
                        
                         $("#chagepass").button().click(function(){  
                            
                             $("#dialogUpdatePassword").dialog("open"); });
                    });
                    
                </script>        
                
         <script>
	 function newCapacitador(){
            var nombre = $("#nNomCap").val();
            var cargo = $("#nCarCap").val();
            var telefono = $("#nTelCap").val();
            var email = $("#nCorCap").val();
            var dire = $("#nDirCap").val();
            var contra = $("#nConCap").val();          
                
           
               if(nombre == ""|| cargo == "" || telefono == "" || email == "" || dire == "" || contra == "" ){
                var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Todos los datos son requeridos.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);               
               $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje 
                   
               }
               else if(!ValidaMail(email)){
                   var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>E-mail incorrecto</strong><p class='hola'>El E-mail no es válido.</p></div><!-- /Notification --></section>";  
                $("#box_message").html(palabra);               
                $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje 
            } else if(!(/\d/.test(telefono))){
                   var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Teléfono Incorrecto</strong><p class='hola'>El numero telefonico no es valido.</p></div><!-- /Notification --></section>";  
                $("#box_message").html(palabra);               
                $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje 
               }
               else{                      
                   capacitadoresDWR.newCapacitador(nombre, cargo, telefono, dire, email, contra, resultado);
                   
               }            
         }
         function resultado(data){
             if(data[0] != "Error, el E-mail ya esta registrado"){
                 validacion.saveActionBitacora(<%= val %>, 17, "Agrego un nuevo capacitador",data[0], "Nuevo Capacitador", "Nuevo");
                  var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Capacitador</strong><p class='hola'>El Capacitador Ha sido guardado</p></div><!-- /Notification --></section>";  
                   $("#box_message").html(palabra);
                   $( "#box_message" ).show("blind",callback);
                 $("#cap").attr("src", "tablaCapacitadores.jsp");                 
                 clearCapacitador();       
             }else{
                 $("#nCorCap").focus(); 
                  var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>E-mail incorrecto</strong><p class='hola'>Ese E-Mail ya está registrado.</p></div><!-- /Notification --></section>";  
                                  
               $("#box_message").html(palabra);               
                $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje
             }
           
         }
         
         function clearCapacitador(){
             document.getElementById("nNomCap").value = "";
             document.getElementById("nCarCap").value = "";
             document.getElementById("nTelCap").value = "";
             document.getElementById("nCorCap").value = "";
             document.getElementById("nDirCap").value = "";
             document.getElementById("nConCap").value = "";
         }
         
         function passwordBloqueado(){
             location.href = "activeAccount.jsp";
         }
         
         function guardarNota(){
            
             var titu = $("#titulo").val();
             var descri = $("#txtDesc").val();
             var fecha = $("#datepicker").val();
             if(titu == "" || descri == "" || fecha == "" ){
                var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Nota</strong><p class='hola'>Asegurese de haber llenado todos los campos correctamente.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);
               $( "#box_message" ).show("blind",callback); 
             }else{
             instrumentoDWR.newNota(<%= iduser %>, titu, descri, fecha, notaRes);
            
             document.getElementById("titulo").value = "";
             document.getElementById("txtDesc").value = "";
             document.getElementById("datepicker").value = "";
               var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Nota</strong><p class='hola'>La Nota ha sido Guardada.</p></div><!-- /Notification --></section>";  
               $("#box_message").html(palabra);
               $( "#box_message" ).show("blind",callback);}
            
         }
        function notaRes(data){
         validacion.saveActionBitacora(<%= val %>, 0, "Agrego una nueva Nota",data, "Nueva Nota", "Nueva Nota");
           $("#notasIframe").attr("src","tableNotas.jsp");
         }
         function ValidaMail(mail) {
         var exr = /^[0-9a-z_\-\.]+@[0-9a-z\-\.]+\.[a-z]{2,4}$/i;
          return exr.test(mail);
          }
    function reporteEPA(){
        validacion.saveActionBitacora(<%= val %>, 28, "Reporte de Empresas Pendientes de Activacion",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Reporte");
        window.open("generadorReport?tipo=0&user=<%= usu.getNombre() %>", "_blank");
    }
    function reporteEHE(){
        validacion.saveActionBitacora(<%= val %>, 28, "Reporte de Empresas Haciendo Evaluacion",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Reporte");
        window.open("generadorReport?tipo=1&user=<%= usu.getNombre() %>", "_blank");
    }
    function reporteERE(){
        validacion.saveActionBitacora(<%= val %>, 28, "Reporte de Empresas que han terminado evaluacion",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Reporte");
        window.open("generadorReport?tipo=2&user=<%= usu.getNombre() %>", "_blank");
    }
    function reporteCap(){
        validacion.saveActionBitacora(<%= val %>, 28, "Reporte de Capacitadores Activos",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Reporte");
        window.open("listaCap?user=<%= usu.getNombre() %>", "_blank");
    }
    function reporteUsers(){
        validacion.saveActionBitacora(<%= val %>, 28, "Reporte de todos los Usuarios",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Reporte");
        window.open("reportUsers?user=<%= usu.getNombre() %>", "_blank");
    }
    function reporteFormato(){
      validacion.saveActionBitacora(<%= val %>, 28, "Vio Formato de Instrumento",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Reporte");
      window.open("verFormatoInstrumento", "_blank");        
    }
     function reporteBitacoraG(){
      validacion.saveActionBitacora(<%= val %>, 28, "Reporte de Bitacora General",<%= iduser %>, "Pagina Principal(main_admin.jsp)", "Reporte");
      window.open("bitacoraReporte", "_blank");   
     }

	</script>
    
    <style>
	#toolbar {
		padding: 10px 4px;
	}
	</style>
	<script>
	
            function goout(){               
            
            location.href="salir";
        } 
       
	</script>
    
    
    </head>
    <body>
        
        <div class="main">
            
  <div class="header"> 
      
    <div class="header_resize">         
        <div class="menu"  >        
          
          
      </div>
      <div class="clr" ></div>
      <div class="logo"><img src="images/logofull.png" width="250" height="70" border="0" alt="logo" /></div>      
            
       
       <div class="inGo" style=" font-size: 11px;" > 
       <span id="toolbar" class="ui-widget-header ui-corner-all">
	<button id="home">Inicio</button>
	<!--<button id="instrument">Instrumento</button> -->
        <button id="help">Ayuda</button>
        <button id="logoutbutton" onclick="mostrarSalir();" ><%= usu.getNombre() %></button>	
       </span> 
       <div>
        <div id="menuBtnOpciones1" style=" float: right;  border-radius: 0 0 5px 5px;  margin-right: 7px; border-color: #69a8d4; border-style: solid;  border-width: 1px; display: none; background: #e7f1fa; width: 153px;  color: #015480">
               <ul id="opciones1" class="mnSalir" style=" margin-top: 0px; height: 100%; list-style:none; font-size: medium; text-align:left;">                   
                   <li style="float:left" id="mnuBtnSalir" onclick="goout();" > &RightArrow;Salir  </li>  
              </ul>              
          </div>
       </div>

       </div>
      <div class="clr"></div>
       
       </div>
       <div class="clr"></div>
       
        
   </div>
      
  </div>
  <div id="box_message" >                           
        </div>
           
            <div id="tabs" style="padding-top: 5px; margin-left: 1%; margin-right: 1%; height: 55em" >
                <ul>
                    <li><a href="#tabEmpresas"><span>EMPRESAS</span></a></li>
                    <li><a href="#tabCapacitadores"><span>CAPACITADORES</span></a></li>
                    <li><a href="#tabNoticias"><span>NOTAS</span></a></li>
                    <li><a href="#tabReportes"><span>REPORTES</span></a></li>
                    <li><a href="#tabPerfil"><span>PERFIL</span></a></li>
                    
                    
                </ul>
                <div id="tabEmpresas" style=" width: 98%;">
       
                    <div style=" width: 48%; float: left;" ><h3>Empresas Pendientes de Activaci&oacute;n</h3><div class="line"></div>
                  <iframe src="tableEmpresasNuevas.jsp" style="width: 100%; height: 300px" frameborder="0" scrolling="false"  id="eNueva"></iframe>   
                    </div> 
                    <div style="width: 48%; float: right " > <h3>Empresas en Progreso de Evaluaci&oacute;n</h3><div class="line"></div>
                   <iframe src="tableEmpresasActivas.jsp" style="width: 100%; height: 300px" frameborder="0" scrolling="false"  id="eActiva"></iframe>     
                    </div>
                    <div style=" width: 98%;"> <h3>&Uacuteltimas 5 Empresas que Finalizaron Intrumento</h3><div class="line"></div>
                        <iframe src="tableEmpresasFinal.jsp" style="width: 100%; height: 250px;" frameborder="0" scrolling="false"  id="eFinal"></iframe>     
                    
        </div>
                </div>          
                <%-- Fin Empresas, Inicio capacitadores --%>                

                        <div id="tabCapacitadores">
                            <div align="center">
                                <div class="divPanel" style="width: 500px; height: 180px;">
                                 <h2 align="center" >Nuevo Capacitador</h2>                     
                                <form id="newCapacitador">
                                <table align="center" >
                                    <tr>
                                        <td>Nombre Completo:</td>
                                        <td><input type="text" id="nNomCap" maxlength="50" /><label></label></td>
                                        <td>Correo:</td>
                                        <td><input type="text" id="nCorCap" maxlength="50" /><label></label></td>
                                    </tr>
                                    <tr>
                                        <td>Cargo:</td>
                                        <td><input type="text" id="nCarCap" maxlength="30" /></td>
                                        <td>Direcci&oacuten:</td>
                                        <td><input type="text" id="nDirCap" maxlength="200" /></td>
                                    </tr>
                                    <tr>
                                        <td>Tel&eacutefono:</td>
                                        <td><input type="text" id="nTelCap" maxlength="8"  /></td>
                                        <td>Contrase&ntildea:</td>
                                        <td><input type="password" id="nConCap" maxlength="50"/></td>
                                    </tr>                          
                                </table>
                                    <div align="center" ><input id="btnNewCapacitador" onclick="newCapacitador();" type="button" value="Guardar"/>
                                     <input id="btnClearCap" onclick="clearCapacitador();" type="button" value="Limpiar"/>                                     
                                     <input id="btnpassBloqueado" onclick="passwordBloqueado();" type="button" value="Password Bloqueado"/> 
                                    </div>                   

                                 </form>
                                      
                                  </div><br>
                                                         
                            
                             <iframe src="tablaCapacitadores.jsp" style=" width: 100%; height: 420px" frameborder="0" scrolling="false"  id="cap"></iframe> 
                        </div>
                            </div>  
                <div id="tabReportes" align="center" style=" padding-top: 200px " >
                    <div class="divPanel" style="width: 100%; padding-top: 5px; height: 80px;">
                        
                        <table style="width: 99%" >
                            <tr style="width: 98%" >
                                <td><input id="btnRepEPA" onclick="reporteEPA();" type="button" value="Empresas Pendientes de Activación"/></td>
                                <td><input id="btnRepEHE" onclick="reporteEHE();" type="button" value="Empresas Haciendo Evaluación"/></td>
                                <td><input id="btnRepERE" onclick="reporteERE();" type="button" value="Empresas que terminaron Evaluación"/></td>
                                <td><input id="btnRepCap" onclick="reporteCap();" type="button" value="Capacitadores"/></td>
                                
                            </tr>
                            <tr>
                                <td><input id="btnRepUsers" onclick="reporteUsers();" type="button" value="Usuarios de SECE"/></td>
                                <td><input id="btnFormato" onclick="reporteFormato();" type="button" value="Ver Formato para imprimir"/></td>
                                <td><input id="btnBitacoraG" onclick="reporteBitacoraG();" type="button" value="Ver Bitacora General"/></td>
                                <td></td>
                            </tr>
                        </table>
                    
                    </div>
                    
                </div>

                <div id="tabPerfil" style="height: 5em;" align="center" >
                    
         <%--      Formulario Modal Actualizar Password     --%>                   
         <div id="dialogUpdatePassword" title="Cambie su contraseña">
             <p class="validateTips2">Aseg&uacuterese de ingresar bien la contraseña</p>
             <form>
                 <fieldset>
                     <table>
                          <tr>
                             <td>Contrase&ntildea Actual:</td>
                             <td><input id="actContra" style="width:15em" value="" type="password"/></td>
                          </tr>
                          <tr>
                             <td>Nueva Contrase&ntildea:</td>
                             <td><input id="nContra1" style="width:15em" value="" type="password"/></td>
                          </tr>
                          <tr>
                             <td>Repita Nueva Contrase&ntildea:</td>
                             <td><input id="nContra2" style="width:15em" value="" type="password"/></td>
                          </tr>
                         
                     </table>
                     
                 </fieldset>                 
             </form>
         </div>                     
                            
         <%--      Formulario Modal Actualizar Datos Personales     --%>
     <div id="dialog-formUpdate" title="Actualice sus Datos">
	<p class="validateTips">Todos los campos son requeridos.</p>

        <form>
	<fieldset>
            <input id="idAdmin" type="hidden" value="<%= iduser %>"/>
	        <table>
                                <tr>
                                    <td>Nombre:</td>
                                    <td><input id="updatenombre" style="width:15em" value="<% out.print(usu.getNombre()); %>"/></td>
                                </tr>
                                <tr>
                                    <td>Cargo:</td>
                                    <td><input id="updatecargo" style="width:15em" value="<% out.print(usu.getCargo()); %>"/></td>
                                </tr>
                                <tr>
                                    <td>Telefono:</td>
                                    <td><input id="updatetel" style="width:15em" value="<% out.print(usu.getTelefono()); %>"/></td>
                                </tr>
                                <tr>
                                    <td>Correo:</td>
                                    <td><input id="updatemail" style="width:15em" value="<% out.print(usu.getCorreo()); %>"/></td>
                                </tr>
                                <tr>
                                    <td>Direccion:</td>
                                    <td><input id="updatedir" style="width:15em" value="<% out.print(usu.getDireccion()); %>"/></td>
                                </tr>
                                                               
                  </table>   	
	</fieldset>
	</form>
     </div> 
         <%--      Formulario Modal      --%>  
         <br>
         <br>
         <br>
         <br>
         <br>
         <br>
         <br>
         <br>
         <div align="center" style="width: 350px; height: 250px;" class="divPanel"><br>
                            <h2>Puede modificar sus Datos</h2>
                            <table>
                                <tr>
                                    <td>Nombre:</td>
                                    <td><label id="lblnombre"><% out.print(usu.getNombre()); %></label></td>
                                </tr>
                                <tr>
                                    <td>Cargo:</td>
                                    <td><label id="lblcargo"><% out.print(usu.getCargo()); %></label></td>
                                </tr>
                                <tr>
                                    <td>Telefono:</td>
                                    <td><label id="lbltel"><% out.print(usu.getTelefono()); %></label></td>
                                </tr>
                                <tr>
                                    <td>Correo:</td>
                                    <td><label id="lblmail"><% out.print(usu.getCorreo()); %></label></td>
                                </tr>
                                <tr>
                                    <td>Direccion:</td>
                                    <td><label id="lbldir"><% out.print(usu.getDireccion()); %></label></td>
                                </tr>
                           </table> <br>
                                    <button id="updateButton">Editar Información</button>
                                    <button id="chagepass">Cambiar Contraseña</button>
                                
                                
                            
                      </div> 
                </div>
                                
                                <div id="tabNoticias">
                                    <div align="center">                                      
                                   <div class="divPanel" style="width: 100%; height: 180px;">
                                      <h2 align="center" >Nueva Nota</h2>
                                      <h5 align="center" style=" margin-top: -10px;color: #cd0a0a " >Recuerde que esta nota se vera en la pagina de inicio de SECE</h5>
                                      <table style="width: 100%" >
                                          <tr>
                                              <td>T&iacutetulo:</td>
                                              <td><input type="text" id="titulo" name="titulo" size="55" maxlength="100"/> </td>
                                              <td>Descripci&oacuten:</td>
                                              <td rowspan="2" ><textarea id="txtDesc" cols="30" style="width: 98%" maxlength="400" rows="4"></textarea></td>
                                          </tr>    
                                          <tr >
                                              <td >Fecha de Evento:</td>
                                              <td ><input type="text" id="datepicker" size="55"/> </td>
                                          </tr>
                                      </table>
                                                             
                                      <button id="saveNota" onclick="guardarNota();">Guardar</button>
                                   </div>
                                        <br>
                                        <iframe src="tableNotas.jsp" style=" width: 100%; height: 420px" frameborder="0" scrolling="false"  id="notasIframe"></iframe> 
                                        </div>
                                </div>
                                

        </div>       
        
            <div class="footer">
    
      
     
    
  </div>  
   

    </body>
</html>

<% } %>