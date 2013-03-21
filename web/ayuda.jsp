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
        <title>Ayuda</title>
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
        <script type="text/javascript" src="resources/jquery/js/easySlider1.5.js"></script>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />

        <link type="text/css" href="ayuda/estilosAyuda/ayudaprincipal.css" rel="stylesheet"/>
        <script type="text/javascript" src="/sece/dwr/interface/soporteSece.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>


        <script>
            var urlSistema; 
            $(document).ready(iniciarJQ);              
            function iniciarJQ() {  
                $( "#accordion" ).accordion({
                    autoHeight: false,
                    collapsible: true
                });
                $('.panprincipal li').hover(function(){ $(this).css('background-position','1% 50%');},
                function (){ $(this).css('background-position','0 50%'); });
                $('.right1 a').click(function(){ $('.right1 a').css('background-color','#fff'); $(this).css('background-color','#E7F1FA'); $('#aregresar').addClass('.right1 .conBasisaBack:hover') })
                
            }
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
                            <li><a href="acerca_de.jsp"><span>Acerca de</span></a></li>          
                            <li><a href="contacto.jsp"><span>Contactenos</span></a></li>
                            <li><a href="ayuda.jsp" class="active"><span>Ayuda</span></a></li>  
                        </ul>
                    </div>
                    <div class="clr"></div>
                    <div class="logo"><img src="images/logo.gif" width="290" height="80" border="0" alt="logo" /></div>      
                    <div class="clr"></div>
                </div>
            </div> 

            <div class="body">     
                <div class="body_resize">

                    <div class="right1">                                
                        <h2><img style="padding-right: 20px;" src="ayuda/imagenes/life-buoy.png"/>Ayuda</h2>
                        <div class="caja_Basisa">
                            <p> 
                                <a class="conBasisa" href="javascript: void(0);">Pagina Inicio</a> <br> 
                                <a class="conBasisa" href="javascript: void(0);">Iniciar Sesi&oacute;n</a> <br> 
                                <a class="conBasisa" href="javascript: void(0);">Registrarse</a> <br>
                                <a class="conBasisa" href="javascript: void(0);">Recordar contrase&ntilde;a</a> <br>                                                                                                       
                            </p>
                        </div>
                        <script>
                            $("a").click( function (){
                                var valor = $("p a").index(this);
                                soporteSece.ayudaContacto(valor,{callback:function(str){
                                        $(".right2").html(str);
                                        //alert(valor);
                                    }});          
                            });                                                   
                                   
                        </script>
                    </div>
                    <div class="right2" style="margin-top: 6%;">
                        <div align="center"><h3>P&aacute;gina de Inicio del Sistema</h3></div>
                        <p>Esta es la pantalla que le aparece cuando entre a <a href="#">http://www.sece.pml.org.ni</a> es el index.jsp.<br/> Hay tres pestañas inicio, acerca de y contáctenos.<br/> <b>Inicio</b>, aquí se mostrara información de CPML, que es SECE y noticias o notas acerca de las actividades próximas que realizaran. </p>
                        <img src="ayuda/imagenes/imgC01.jpg"/>
                        <p>En noticias y notas, muestra las actividades que se realizaron hace una semana y las de la próxima. El ingreso de estas notas la realizara el administrador del sistema, más adelante en subsistema el modulo del administrador se explicara y se mostrara el formulario de ingreso. Así como todas las notas hechas.</p> 
                        <img src="ayuda/imagenes/imgC02.jpg"/>
                        <p>Acerca de, muestra información sobre quienes desarrollaron el sistema, como un video explicativo de como registrarse.</p>
                        <!--<img src="ayuda/imagenes/imgC03.jpg"/> -->
                        <p>Contáctenos, hay un formulario donde usuario puede enviar sugerencia, preguntas o consulta a CPLM sobre SECE. También muestra información de CPML como ubicación geográfica, dirección, teléfonos.</p>
                        <p>También en el inicio hay una opción para iniciar sesión en el sistema. Que nos direcciona a <a href="#">http://sece.pml.org.ni/logger.jsp.</a></p>
                    </div>
                    <div class="clr"></div>

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
