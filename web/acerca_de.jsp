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
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
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
                    <a href="logger.jsp" class="buttonIniciarSesion">Iniciar Sesion!</a>
                    <div class="menu">
                        <ul>
                            <li><a href="index.jsp"><span>Inicio</span></a></li>
                            <li><a href="acerca_de.jsp" class="active"><span>Acerca de</span></a></li>          
                            <li><a href="contacto.jsp"><span>Contactenos</span></a></li>
                            <li><a href="ayuda.jsp"><span>Ayuda</span></a></li>
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

                        <h2>SECE</h2>
                        <p>SECE(Sistema de Evaluaci&oacuten de Competitividad Empresarial) es un Sistema Web que hace uso de un Instrumento
                            de evaluaci&oacuten empresarial, dicho instrumento tiene el fin de evaluar a las empresas que lo llenen, permitiendo a su vez
                            que &eacutesta pueda superar sus debilidades (si las hubiera) y tener mayor competencia en el mercado. </p>
                        <p><strong>¿Como me registro?</strong></p>
                        <div class="line"></div>
                        <iframe width="640" height="480" src="http://www.youtube.com/embed/MjnaaMnRqgk" frameborder="0" allowfullscreen></iframe>

                    </div>   <%-- end div body rezise --%>  
                    <div class="right1">





                    </div> 
                    <div class="clr"></div>
                </div>
            </div>
            <div class="footer">
                <div class="footer_resize">


                    <div class="clr"></div>
                    <div class="clr"></div>
                    <div class="clr"></div>
                    <div class="clr"></div>
                </div>
            </div>
            <div class="clr"></div>
        </div>
    </body>
</html>
