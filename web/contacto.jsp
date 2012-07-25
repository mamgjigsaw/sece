<%-- 
    Document   : contacto
    Created on : Jan 26, 2011, 12:51:45 PM
    Author     : mamg
--%>

<%@page import="daoImpl.encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactenos</title>
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
             $(function() {
		$( "#btnsend" ).button();
                
                $( "#dialog:ui-dialog" ).dialog( "destroy" );
	
		$( "#dialog-message" ).dialog({
			autoOpen: false,
                        modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
                                        limpiar();
				}
			}
		});//fin dialog-message
                
                
            });
            
            
            function EnviarMensaje(){
               //var nombre = $( "#name").val();
               var email = $( "#email").val();
               //var company = $( "#company").val();
               var subject = $( "#subject").val();
               var message = "Mi nombre es " +$( "#name").val() + ", de la compañia " + $( "#company").val()+ ". " +$( "#message").val();
                  
                              
               $( "#dialog-message" ).dialog( "open" );
               validacion.EnviarCorreo(email,"sece@pml.org.ni",subject,message);
            }
            
            function limpiar(){
                $("#name").val("");
                $("#email").val("");
                $("#company").val("");
                $("#subject").val("");
                $("#message").val("");
            }
            
        </script>        
    </head>
    <body>    
<div class="main">
  <div class="header">
    <div class="header_resize">      
      <div class="menu">
         <ul>
          <li><a href="index.jsp" ><span>Inicio</span></a></li>
          <li><a href="acerca_de.jsp"><span>Acerca de</span></a></li>          
          <li><a href="contacto.jsp" class="active"><span>Contactenos</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logo.gif" width="290" height="80" border="0" alt="logo" /></div>      
      <div class="clr"></div>
    </div>
  </div> 
  
  <div class="body">     
    <div class="body_resize">
        <div class="right2">
            
        <div id="dialog-message" title="Mensaje enviado a SECE">

	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		Sistema de Evaluacion de Competitividad Empresarial.
	</p>
	<p>
		Su mensaje fue envio al administrador del sistema, el cual le dara seguimiento a la sugerencia, comentario  o peticion gracias!.
	</p>
      </div>
            
            
        <h2>Contactenos</h2>
        
        <form action="sendMail" method="post" id="contactform">
          <ol>
            <li>
              <label for="name">Nombre</label>
              <input id="name" name="name" class="text" />
            </li>
            <li>
              <label for="email">E-mail<span class="red">*</span></label>
              <input id="email" name="email" class="text" />
            </li>
            <li>
              <label for="company">Compañia</label>
              <input id="company" name="company" class="text" />
            </li>
            <li>
              <label for="subject">Subject<span class="red">*</span></label>
              <input id="subject" name="subject" class="text" />
            </li>
            <li>
              <label for="message">Mensaje<span class="red">*</span></label>
              <textarea id="message" name="message" rows="6" cols="50"></textarea>
            </li>
            <li>
                <input type="button" id="btnsend" value="Enviar Mensaje" onclick="EnviarMensaje();" />
            </li>
          </ol>
        </form>
        </div>   <%-- end div body rezise --%> 
        <div class="right1">
        <h2>Detalle</h2>
        <p><strong>Centro de Producción más Limpia de Nicaragua</strong>
        <p><strong>Direccion</strong>:      Universidad Nacional de Ingeniería | Recinto Universitario "Simón Bolivar"
Avenida Universitaria. Managua, Nicaragua<br />
          <strong>Telefono</strong>:   (505) 2278-3136 | (505) 8887-9286 <br />          
          <strong>E-mail</strong>:            sece@pml.org.ni</p>
        <div class="line"></div>
        <p><iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=12.130761,-86.268901&amp;daddr=&amp;hl=es-419&amp;geocode=&amp;sll=12.130949,-86.270506&amp;sspn=0.012482,0.013797&amp;dirflg=w&amp;doflg=ptk&amp;mra=mift&amp;mrsp=0&amp;sz=16&amp;ie=UTF8&amp;t=m&amp;ll=12.130949,-86.270506&amp;spn=0.012482,0.013797&amp;output=embed"></iframe><br /><small>Ver <a href="https://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=12.130761,-86.268901&amp;daddr=&amp;hl=es-419&amp;geocode=&amp;sll=12.130949,-86.270506&amp;sspn=0.012482,0.013797&amp;dirflg=w&amp;doflg=ptk&amp;mra=mift&amp;mrsp=0&amp;sz=16&amp;ie=UTF8&amp;t=m&amp;ll=12.130949,-86.270506&amp;spn=0.012482,0.013797" style="color:#0000FF;text-align:left">CPML</a> en un mapa ampliado</small></p>
      </div>
      <div class="clr"></div>
      <br>
      <br>
      <br> 
      <br>
      <br>
      <br>
      <br>
       
    </div>
  </div>
  
  
        <div class="clr"></div>
        <div class="clr"></div>
        <div class="clr"></div>
   <div class="footer">
    <div class="footer_resize">
      
      
      
      <div class="clr"></div>
    </div>
  </div>
  <div class="clr"></div>
</div>
</body>
</html>
