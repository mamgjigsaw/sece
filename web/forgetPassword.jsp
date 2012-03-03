<%-- 
    Document   : forgetPassword
    Created on : Jan 27, 2012, 2:27:54 PM
    Author     : wmiguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
           var countError=0;
           var valor1;
           var valor2;
           
            function enviar(){
                valor1 = dwr.util.getValue("txtemail");
                
                
               /* if (valor1==""){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene el campo de email, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);
                }else if(valor2==""){                                                    
                  var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene el campo del password, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);
                }else{
                   validacion.loguearse(valor1,valor2,resultado);                    
                }
                */
                $( "#dialog-message" ).dialog( "open" ); 
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
                                        //location.href = "entrar?txtemail="+ dwr.util.getValue("txtemail") +"&&txtpass="+ dwr.util.getValue("txtpass");
				}
			}
		});//fin dialog-message
	});
           
           function regresar(){
             location.href = "logger.jsp";
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
      <div class="logo"><img src="images/logo.gif" width="250" height="70" border="0" alt="logo" /></div>      
      <div class="clr"></div>
    </div>
  </div>
  
  
  <div class="body">
      
      <div class="hola" id="hola">
	
      </div>
      <div id="dialog-message" title="Bienvenido a SECE">

	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		Su contraseña ha sido reseteada, el correo contiene los pasos a seguir!! .
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
            <h4>Olvidastes tu contraseña????</h4>
            <img src="images/llave.png" alt="picture" width="48" height="48" class="float" />
            <p>Introduce tu correo electronico, para que SECE te envie los pasos para resetear tu contraseña, click en continuar.</p>
            <table style="padding:10px;" >
                    <form id="form_s" method="post">                             
                           <tr><td><label class="tlabel" for="correo">Correo:</label></td><td><input id ="email" name="txtemail" type="text" value="Email" onblur="clearText(this);" onfocus="clearText(this);" /></td></tr>                           
                           <tr><td><input type="button" onclick="enviar();" id="btnOk" value="Continuar" /></td><td><input type="button" onclick="regresar();" id="btnBack" value="Regresar" /></td></tr>
                    </form>
                  </table>             
            <div class="clr"></div>
          </div>
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
