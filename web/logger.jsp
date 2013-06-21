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
        <title>Iniciar Sesion</title>
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
           var passEncriptado ="";
           var capa="";
           
            function enviar(){
                valor1 = dwr.util.getValue("txtemail");
                valor2 = dwr.util.getValue("txtpass");
                
                if (valor1==""){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a onclick='$(this).parent().hide()' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene el campo de email, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);
                }else if(valor2==""){                                                    
                  var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification attention'><a onclick='$(this).parent().hide()' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>LLene el campo del password, porfavor!!</p></div><!-- /Notification --></section>";                                        
                    $("#hola").html(palabra);
                }else{
                   validacion.loguearse(valor1,valor2,resultado);                    
                }
            }
            
            function resultado(data){
                var resp = data;
               //alert(resp);
                 if(resp==0){
                    var palabra="<section role='principal' id='message_box'><!-- Notification --><div class='notification error'><a onclick='$(this).parent().hide()' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Error Correo</strong><p class='hola'>Digite correctamente el email y si no <a href='register.jsp?rodaticapacdi=mJH83fas2{}4'><strong>registrese</strong></a>, porfavor!!</p></div><!-- /Notification --></section>";                    
                }else if(resp==1){                    
                    $("#hola").html("");
                    //validacion.encrypt(dwr.util.getValue("txtpass"),passEncript); 
                    location.href = "entrar?cV5VDde7H0l="+ dwr.util.getValue("txtemail") +"&&K3JR5YpwQ8="+ dwr.util.getValue("txtpass");
                }else if(resp==2){
                    if(countError==2){
                       var palabra="<section role='principal' id='message_box'><div class='notification error'><a onclick='$(this).parent().hide()' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Cuenta bloqueada</strong><p class='hola'>Su cuenta ha sido bloqueada, dirijase al administrador para activarla, gracias!!</p></div><!-- /Notification --></section>"; 
                       validacion.bloquear(valor1);
                    }else{                       
                       var palabra="<section role='principal' id='message_box'><div class='notification error'><a onclick='$(this).parent().hide()' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Error Contraseña</strong><p class='hola'>Digite correctamente la contraseña, porfavor!!</p></div><!-- /Notification --></section>";
                       countError= countError + 1;   
                    }                    
                }else if(resp==3){
                    var palabra="<section role='principal' id='message_box'><div class='notification note'><a onclick='$(this).parent().hide()' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Activacion de Cuenta</strong><p class='hola'>Su cuenta no ha sido activa todavia, en su correo aparece la informacion de activacion, gracias!!</p></div><!-- /Notification --></section>";  
                }else if(resp==4){
                    var palabra="<section role='principal' id='message_box'><div class='notification error'><a onclick='$(this).parent().hide()' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Cuenta bloqueada</strong><p class='hola'>Su cuenta fue bloqueada, por favor dirijase al administrador para activarla, gracias!!</p></div><!-- /Notification --></section>";  
                }
                $("#hola").html(palabra); 
            }
            
            function passEncript(data){
                passEncriptado = data;
                location.href = "entrar?cV5VDde7H0l="+ dwr.util.getValue("txtemail") +"&&K3JR5YpwQ8="+ passEncriptado;
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
                                        location.href = "entrar?cV5VDde7H0l="+ dwr.util.getValue("txtemail") +"&&K3JR5YpwQ8="+ passEncriptado;
                                        //location.href = "entrar";
                                        
                                        //request.setAttribute("cV5VDde7H0l",dwr.util.getValue("txtemail"));     
                                        //request.setAttribute("K3JR5YpwQ8",passEncriptado);     
                                       
				}
			}
		});//fin dialog-message
	});
           
           function go_register(){
             location.href = "register.jsp?rodaticapacdi=mJH83fas2{}4";
           }           
           
        </script>
</head>
<body>    
<div class="main">
  <div class="header">
    <div class="header_resize">  
        <a href="index.jsp" id="btnRegresar">Regresar a Inicio</a>
      <style type="text/css">
.buttonVolver {
	-moz-box-shadow:inset 0px 0px 12px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 0px 12px 0px #97c4fe;
	box-shadow:inset 0px 0px 12px 0px #97c4fe;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(50, #006092), color-stop(100, #006092) );
	background:-moz-linear-gradient( center top, #006092 5%, #1e62d0 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006092', endColorstr='#006092');
	background-color:#006092;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #006092;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
       outline-style: none;
	
	text-shadow:1px 1px 0px #1570cd;
        float: right; margin:0; margin-top: 35px; 
         text-decoration:none;
}.buttonVolver:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #016aa1), color-stop(1, #016aa1) );
	background:-moz-linear-gradient( center top, #016aa1 5%, #016aa1 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#016aa1', endColorstr='#016aa1');
	background-color:#1e62d0;
         text-decoration:none;
}.buttonVolver:active {
	position:relative;
	top:1px;
}
/* This imageless css button was generated by CSSButtonGenerator.com */
</style>
        
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
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      
    <div class="body_resize">
       
      <div class="right">
        <div class="clr"></div>
        <div class="right_top">
         
        </div>
        <div class="clr"></div>
      </div>
        
      <div id="divLogin" >
            <h2 >Iniciar Sesion</h2>
            
            <table style=" padding-left: 18px; padding-top: 0px; padding-right: 5px;" >
                    <form id="form_s" method="post">                             
                        <tr><td><label class="tlabel" for="correo">Correo:</label></td><td><input class="txtLogin" id ="email" name="txtemail" type="text"  /></td></tr>
                           <tr><td><label class="tlabel" for="contra">Contraseña:</label></td><td><input class="txtLogin" id ="pass" name="txtpass" type="password"  /></td></tr>
                           <tr><td><input type="button" onclick="enviar();" id="btnOk" value="Entrar" /></td><td><input type="button" id="create-user" onclick="go_register();" value="Registrarse"/></td></tr>                           
                    </form>
                  </table> 
            <img style="margin: 3%;" src="images/lock.png" alt="picture" width="30%" height="10%" />
            <div><p style="padding-left: 18px;"><a id="link_register" href="forgetPassword.jsp?liame=odadivlo&&ogidoc=ssap"><strong>Olvide mi contraseña???</strong></a></p></div>
        
      </div>
        
      <div class="right">
        <div class="right_top">
          
        </div>
        <div class="clr"></div>
      </div>
           
      <div class="clr"></div>
    </div>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br> 
      <br>
      <br>
      <br>
      <br>
      <br>
      <br> 
      <br>
      <br>
      <br>
      <br>
      <br> 
  </div>
  <div class="clr"></div>
  <div class="footer">
    <div class="footer_resize">
      
      
      
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>