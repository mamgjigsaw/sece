<%-- 
    Document   : acerca_de
    Created on : Jan 26, 2011, 12:51:01 PM
    Author     : mamg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acerca de</title>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
        <script type="text/javascript" src="resources/jquery/js/easySlider1.5.js"></script>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript" >
             $(function() {
		$( "#btnsend" ).button();
            });
        </script>  
    </head>
     <body>    
<div class="main">
  <div class="header">
    <div class="header_resize">      
      <div class="menu">
         <ul>
          <li><a href="index.jsp"><span>Inicio</span></a></li>
          <li><a href="acerca_de.jsp" class="active"><span>Acerca de</span></a></li>          
          <li><a href="contacto.jsp"><span>Contactenos</span></a></li>
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
        <h2>Contactenos</h2>
        
        <form action="contact.php" method="post" id="contactform">
          <ol>
            <li>
              <label for="name">Nombre <span class="red">*</span></label>
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
              <label for="subject">Subject</label>
              <input id="subject" name="subject" class="text" />
            </li>
            <li>
              <label for="message">Mensaje <span class="red">*</span></label>
              <textarea id="message" name="message" rows="6" cols="50"></textarea>
            </li>
            <li>
                <input type="button" id="btnsend" value="Enviar Mensaje" />
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
          <strong>E-mail</strong>:            pml@pml.org.ni</p>
        <div class="line"></div>
        <p><img src="images/map.jpg" alt="picture" width="286" height="203" /></p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="clr"></div>
</div>
</body>
</html>
