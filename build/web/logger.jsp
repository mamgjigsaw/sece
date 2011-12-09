<%-- 
    Document   : logger
    Created on : May 2, 2011, 7:21:03 PM
    Author     : mamg
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
                valor2 = dwr.util.getValue("txtpass");
                
                if (valor1==""){
                    alert("LLene el campo de email, porfavor!!");
                }else if(valor2==""){                                                    
                  alert("LLene el campo del password, porfavor!!");                  
                }else{
                   validacion.loguearse(valor1,valor2,resultado);                    
                }
            }
            
            function resultado(data){
                var resp = data;
               
                if(resp==0){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Error email</strong><p class='hola'>Digite correctamente el email y si no <a href='register.jsp'><strong>registrese</strong></a>, porfavor!!</p></div><!-- /Notification --></section>";                    
                }else if(resp==1){                    
                    $("#hola").html("");
                    $( "#dialog-message" ).dialog( "open" );                    
                }else if(resp==2){
                    if(countError==2){
                       var palabra="<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Cuenta bloqueada</strong><p class='hola'>Su cuenta ha sido bloqueada, dirijase al administrador para activarla, gracias!!</p></div><!-- /Notification --></section>"; 
                       validacion.bloquear(valor1);
                    }else{                       
                       var palabra="<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Error password</strong><p class='hola'>Digite correctamente el password, porfavor!!</p></div><!-- /Notification --></section>";
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
		});
	});
           
        </script>
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
      
      <div class="hola" id="hola">
	
      </div>
      <div id="dialog-message" title="Bienvenido a SECE">

	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		Your files have downloaded successfully into the My Downloads folder.
	</p>
	<p>
		Currently using <b>36% of your storage space</b>.
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
            <h4>Iniciar Sesion</h4>
            <img src="images/img_3.jpg" alt="picture" width="92" height="92" class="float" />
            <p><strong>Fusce vehicula dignissim ligula. </strong><br />
              <table>
                    <form id="form_s" method="post">                             
                           <tr><td><label class="tlabel" for="correo">Email:</label></td><td><input id ="email" name="txtemail" type="text" value="Email" onblur="clearText(this);" onfocus="clearText(this);" /></td></tr>
                           <tr><td><label class="tlabel" for="correo">Password:</label></td><td><input id ="pass" name="txtpass" type="password" value="password" onblur="clearText(this);" onfocus="clearText(this);" /></td></tr>
                           <tr><td><input type="button" onclick="enviar();" id="btnOk" value="Entrar" /></td><td><input type="button" id="create-user" onclick="hello();" value="Registrarse"/></td></tr>
                    </form>
                  </table> <br />              
            </p>
            <p><a id="link_register" href="register.jsp"><strong>Registrarse</strong></a></p>
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