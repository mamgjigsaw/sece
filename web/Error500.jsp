<%-- 
    Document   : Error500
    Created on : Feb 26, 2012, 4:34:03 PM
    Author     : mamg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oopss!</title>
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
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
           var countError=0;
           var valor1;
           var valor2;
           
            function enviar(){
                valor1 = dwr.util.getValue("txtemail");
                valor2 = dwr.util.getValue("txtpass");
                
                if (valor1==""){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene el campo de email, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);
                }else if(valor2==""){                                                    
                  var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene el campo del password, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);
                }else{
                   validacion.loguearse(valor1,valor2,resultado);                    
                }
            }
            
            function resultado(data){
                var resp = data;
               
                if(resp==0){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Error Correo</strong><p class='hola'>Digite correctamente el email y si no <a href='register.jsp'><strong>registrese</strong></a>, porfavor!!</p></div><!-- /Notification --></section>";                    
                }else if(resp==1){                    
                    $("#hola").html("");
                    $( "#dialog-message" ).dialog( "open" );                    
                }else if(resp==2){
                    if(countError==2){
                       var palabra="<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Cuenta bloqueada</strong><p class='hola'>Su cuenta ha sido bloqueada, dirijase al administrador para activarla, gracias!!</p></div><!-- /Notification --></section>"; 
                       validacion.bloquear(valor1);
                    }else{                       
                       var palabra="<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Error Contraseña</strong><p class='hola'>Digite correctamente la contraseña, porfavor!!</p></div><!-- /Notification --></section>";
                       countError= countError + 1;   
                    }                    
                }else if(resp==3){
                    var palabra="<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Cuenta bloqueada</strong><p class='hola'>Su cuenta fue bloqueada, por favor dirijase al administrador para activarla, gracias!!</p></div><!-- /Notification --></section>";  
                }
                $("#hola").html(palabra);
            }
            
            $(function() {
		$( "#btnOk" ).button();
                $( "#create-user" ).button();
                //captura del eventto con el teclado 'enter
                $("#pass").bind('keypress', function(e) { 
                     if(e.keyCode==13){
                         $("#btnOk").click();  
                     }                    
                });

                //$( "#link_register").click(function() { return false; });
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
	
		$( "#dialog-message" ).dialog({
			autoOpen: false,
                        modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
                                        location.href = "entrar?txtemail="+ dwr.util.getValue("txtemail") +"&&txtpass="+ dwr.util.getValue("txtpass");
				}
			}
		});//fin dialog-message
	});
           
           function go_register(){
             location.href = "register.jsp";
           }           
           
        </script>
</head>
<body>    
<div class="main">
  <div class="header">
    <div class="header_resize">      
        <a href="javascript:history.back(1)" class="buttonVolver">&LT;&LT; Atras</a>
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
		Sistema de Evaluacion de Competitividad Empresarial.
	</p>
	<p>
		Descubra los <b>beneficios de utilizar el sistema!!</b>.
	</p>
      </div>
    <div class="body_resize">
       
     
        <div align="center">
     
              <a title="descripcion"><img src="images/error 500.png" alt="descripcion" /></a>
         </div>         
            
      <div class="clr"></div>
    </div>
  </div>
  <div class="clr"></div>
  
</div>
</body>
</html>
