<%-- 
    Document   : forgetPassword
    Created on : Jan 27, 2012, 2:27:54 PM
    Author     : wmiguel
--%>

<%@page import="daoImpl.EmailSentDaoImpl"%>
<%@page import="pojo.EmailSent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
%>
<html>
    <head>
        <%
        String email;
        String codigo;
        int mostrar=2;
        int idUsuario=0;
        
        email = request.getParameter("liame");
        codigo= request.getParameter("ogidoc");
        
        if (email.equalsIgnoreCase("odadivlo") && codigo.equalsIgnoreCase("ssap")){            
            //System.out.print("email=='odadivlo' && codigo=='ssap'");                       
            mostrar =0;
        }else if (email=="" || codigo==""){
            response.sendRedirect("index.jsp");            
        }else {
            //System.out.print(codigo);            
                EmailSent emailSent = new EmailSent();
                EmailSentDaoImpl emailDao = new EmailSentDaoImpl();
                emailSent = emailDao.findByCodigo(codigo);
                
                if(emailSent==null ){                    
                    response.sendRedirect("index.jsp");
                    //System.out.print("entro aqui null");
                }else{
                    mostrar=1;               
                    idUsuario = emailSent.getUsuario().getIdUsuario();
                }                          
        }
       
        
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <title>SECE</title>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
        <script type="text/javascript" src="resources/jquery/js/easySlider1.5.js"></script>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />        
        
        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>        
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>
         
       <script type="text/javascript" >
           var whatShow = <%=mostrar%>;
           var usuario = <%=idUsuario%>;
           var correo="";
           var countError=0;
           var valor1;
           var valor2;
           var passEncriptado="";
         
            function enviar(){
                valor1 = dwr.util.getValue("txtemail");                
                
                if (valor1==""){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene el campo de email, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);                
                }else{                     
                   $("#hola").html("");
                   validacion.passwordOlvidado(valor1,resultado);                   
                   $( "#dialog-message" ).dialog( "open" ); 
                }
            }
            
            function resultado(data){
                var resp = data;
               
                if(resp==0){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Error Correo</strong><p class='hola'>Digite correctamente el email y si no <a href='register.jsp'><strong>registrese</strong></a>, porfavor!!</p></div><!-- /Notification --></section>";                    
                }else if(resp==1){                    
                    //$("#hola").html("");
                    //$( "#dialog-message" ).dialog( "open" );                    
                }
                $("#hola").html(palabra);
               
            }
            
            $(function() {
                var body="";
                if(whatShow==0){
                    body= "<h4>Olvidastes tu contraseña????</h4><img src='images/llave.png' alt='picture' width='48' height='48' class='float' /><p>Introduce tu correo electronico, para que SECE te envie los pasos para resetear tu contraseña, click en continuar.</p><table style='padding:10px;' ><form id='form_s' method='post'><tr><td><label class='tlabel' for='correo'>Correo:</label></td><td><input id ='email' name='txtemail' type='text' /></td></tr><tr><td><input type='button' onclick='enviar();' id='btnOk' value='Continuar' /></td><td><input type='button' onclick='regresar();' id='btnBack' value='Regresar' /></td></tr></form></table><div class='clr'></div>"
                    $("#divContra").html("Se ha enviado un correo que contiene los pasos a seguir!!.");
                }else if(whatShow==1){
                    $("#divContra").html("Su contraseña ha sido reseteada satisfactoriamente!!.");
                    body= "<h4>Restablecer contraseña</h4><img src='images/llave.png' alt='picture' width='48' height='48' class='float' /><p>Introduzca su nuevo contraseña, click en continuar.</p><table style='padding:10px;' ><form id='form_s' method='post'><tr><td><label class='tlabel' for='Contraseña'>Nueva Contraseña:</label></td><td><input id ='pass' name='txtpass' type='password' /></td></tr><tr><td><label class='tlabel' for='pass2'>Repitir Contraseña:</label></td><td><input id ='pass2' name='txtpass2' type='password' /></td></tr><tr><td><input type='button' onclick='enviar_new();' id='btnOk' value='Continuar' /></td><td><input type='button' onclick='regresar_home();' id='btnBack' value='Cancelar' /></td></tr></form></table><div class='clr'></div>"                  
                }
                
                $("#show_context").html(body);
                
		$( "#btnOk" ).button();
                $( "#btnBack" ).button();                
                $( "#create-user" ).button();
                //$( "#link_register").click(function() { return false; });
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
	
		$( "#dialog-message" ).dialog({
			autoOpen: false,
                        modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
                                        if(whatShow==1){
                                           location.href = "entrar?cV5VDde7H0l="+ correo +"&&K3JR5YpwQ8="+ passEncriptado; 
                                        }else{
                                           limpiar();                                        
                                        }
				}
			}
		});//fin dialog-message
	});
           
           function enviar_new(){
                valor1 = dwr.util.getValue("txtpass"); 
                valor2 = dwr.util.getValue("txtpass2"); 
                
                if (valor1==""){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene el campo de nueva contraseña, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);                
                }else if(valor2==""){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene otra ves el campo de la nueva contraseña, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);
                }else if(valor1!=valor2){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Contraseñas no validas</strong><p class='hola'>Las contraseñas no coinciden, revisela porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);
                }else if(valor1==valor2){ 
                   $("#hola").html("");
                   validacion.cambiarPasswordByID(usuario,valor1, respPass);
                   validacion.encrypt(valor1,passEncript);
                   $( "#dialog-message" ).dialog( "open" ); 
                }
            }
            
            function passEncript(data){
                passEncriptado = data;
            }
           
           function respPass(data){
               correo = data;
            }
            
           function regresar(){
             location.href = "logger.jsp";
           }
           
           function regresar_home(){
             location.href = "index.jsp";
           }
           
           function limpiar(){
               $("#email").val("");
           }
        </script>
</head>
<body>    
<div class="main">
  <div class="header">
    <div class="header_resize">      
      <div class="menu">
        
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logofull.png" width="250" height="70" border="0" alt="logo" /></div>      
      <div class="clr"></div>
    </div>
  </div>
  
  
  <div class="body">
      
      <div class="hola" id="hola">
	
      </div>
      <div id="dialog-message" title="Bienvenido a SECE">

	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
        <div id="divContra"></div>
	</p>
	<p>
		Gracias!!.
	</p>
      </div>
    <div class="body_resize">
       
      <div class="right">
        <div class="clr"></div>
        <div class="right_top">
         
        </div>
        <div class="clr"></div>
      </div>
        
      <div class="right">
        <div class="clr"></div>
        <div class="right_top">
          <div class="right_bottom">
              <div id="show_context" >
              
              </div>
          </div><%-- end right_bottom --%>
        </div>
        <div class="clr"></div>
      </div>
        
      <div class="right">
        <div class="right_top">
          
        </div>
        <div class="clr"></div>
      </div>
            
      <div class="clr"></div>
    </div>
  </div>
  <div class="clr"></div>
  
</div>
</body>
</html>
