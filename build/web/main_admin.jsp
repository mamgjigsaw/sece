<%--
    Document   : main_admin
    Created on : Dec 10, 2010, 3:40:24 PM
    Author     : mamg
--%>


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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SECE</title>
        <% HttpSession sesion=request.getSession();
                       String val = (String)sesion.getAttribute("idUser");
             
                   /* password: kenny */
                %>
       
        <link rel="stylesheet" type="text/css" href="resources/css/layout.css"/>
       
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
       
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <script>
            $(function(){
              $("#tabs").tabs();  
            });
        </script>
               
        
        <script>
	function mensaje() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
	
		$( "#dialog-modal" ).dialog({
			height: 140,
			modal: true
		});
	};
	</script>
        <%--     aqui empieza el modal para actualizar   --%>
        	<script>
	$(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
		var name = $( "#name" ),
			email = $( "#email" ),
			password = $( "#password" ),
			allFields = $( [] ).add( name ).add( email ).add( password ),
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
				updateTips( "Length of " + n + " must be between " +
					min + " and " + max + "." );
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
			height: 300,
			width: 350,
			modal: true,
			buttons: {
				"Create an account": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					bValid = bValid && checkLength( name, "username", 3, 16 );
					bValid = bValid && checkLength( email, "email", 6, 80 );
					bValid = bValid && checkLength( password, "password", 5, 16 );

					bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
					// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
					bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
					bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );

					if ( bValid ) {
						$( "#users tbody" ).append( "<tr>" +
							"<td>" + name.val() + "</td>" + 
							"<td>" + email.val() + "</td>" + 
							"<td>" + password.val() + "</td>" +
						"</tr>" ); 
						$( this ).dialog( "close" );
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

		$( "#updateButton" )
			.button()
			.click(function() {
				$( "dialog-formUpdate" ).dialog( "open" );
			});
	});
	</script>
                <%--     aqui termina el modal para actualizar   --%>
    </head>
    <body>
        <%
           Usuario usu = new Usuario();
           UsuarioDaoImpl udi = new UsuarioDaoImpl();
           int iduser = Integer.valueOf(val);

           usu = udi.findById(iduser);
                                        
%>
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
            <div id="tabs" style="margin-left: 15%; margin-right: 15%" >
                <ul>
                    <li><a href="#tabCapacitadores"><span>CAPACITADORES</span></a></li>
                    
                    <li><a href="#tabPerfil"><span>PERFIL</span></a></li>
                </ul>
                <div id="tabCapacitadores">
                    <div class="contentcontainer">
            <div class="headings altheading">
                <h2>Capacitadores Activos</h2>
            </div>
            <div class="contentbox">
                <table width="100%">
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
                                <a href="#" onclick="mensaje();" title=""><img src="images/icon_edit.png" alt="Edit" /></a>
                            	<a href="#" onclick="mensaje();" title=""><img src="images/icon_approve.png" alt="Approve" /></a>
                                <a href="#" onclick="mensaje();" title=""><img src="images/icon_unapprove.png" alt="Unapprove" /></a>
                                <a href="#" onclick="mensaje();" title=""><img src="images/icon_delete.png" alt="Delete" /></a>
                            </td>
                            
                        </tr>
                        
                        
                    
                  <%}
}                  
%>
              
                </tbody>
                </table>
      <div id="dialog-modal" title="SECE">
	<p>Aun en construccion</p>
        
       </div>
<div class="extrabottom">
                	<ul>
                    	<li><img src="images/icon_edit.png" alt="Edit" /> Edit</li>
                        <li><img src="images/icon_approve.png" alt="Approve" /> Approve</li>
                        <li><img src="images/icon_unapprove.png" alt="Unapprove" /> Unapprove</li>
                        <li><img src="images/icon_delete.png" alt="Delete" /> Remove</li>
                    </ul>
                </div>
               
                <div style="clear: both;"></div>
            </div>
            
        </div>
                </div>

                <div id="tabPerfil">
                    <div class="contentcontainer">                              
                        
                        <div class="headings alt"><h2>DATOS PERSONALES</h2></div>
                        <div class="contentbox">
         <%--      Formulario Modal      --%>
     <div id="dialog-formUpdate" title="Create new user">
	<p class="validateTips">All form fields are required.</p>

	<form>
	<fieldset>
		<label for="name">Name</label>
		<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
		<label for="email">Email</label>
		<input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" />
		<label for="password">Password</label>
		<input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
     </div> 
         <%--      Formulario Modal      --%>  
                            
                            
                            <h3>Puede modificar sus Datos</h3>
                            <table>
                                <tr>
                                    <td>Nombre:</td>
                                    <td><% out.print(usu.getNombre()); %></td>
                                </tr>
                                <tr>
                                    <td>Cargo:</td>
                                    <td><% out.print(usu.getCargo()); %></td>
                                </tr>
                                <tr>
                                    <td>Telefono:</td>
                                    <td><% out.print(usu.getTelefono()); %></td>
                                </tr>
                                <tr>
                                    <td>Correo:</td>
                                    <td><% out.print(usu.getCorreo()); %></td>
                                </tr>
                                <tr>
                                    <td>Direccion:</td>
                                    <td><% out.print(usu.getDireccion()); %></td>
                                </tr>
                                <tr>
                                    <td><button id="updateButton">Editar Información</button></td>
                                    <td><button id="chagepass">Cambiar Contraseña</button></td>
                                </tr>
                                
                            </table>
                        </div>
                    </div>
                    
                </div>
                                
                               
                
            </div>
            

    </body>
</html>

