<%-- 
    Document   : ayudaUsuario
    Created on : 07-20-2012, 12:18:35 PM
    Author     : david
--%>

<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ayuda Capacitador</title>
        <link REL="shortcut icon" type="image/x-icon" href="../images/logoAyuda.png"/>
        <link type="text/css" href="estilosAyuda/ayudaprincipal.css" rel="stylesheet"/>
        <link href="../resources/style.css" rel="stylesheet" type="text/css"/>          
         <script type="text/javascript" src="/sece/dwr/interface/soporteSece.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>
        <script type="text/javascript" src="../resources/jquery/js/jquery-1.4.4.min.js"></script>
        
        <script type="text/javascript" src="../resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <link type="text/css" href="../resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <%
           HttpSession sesion=request.getSession();
           String acc = (String) sesion.getAttribute("idAcc");                      
           if(acc==null){
              response.sendRedirect("index.jsp");
           }else{
           AccesoDaoImpl daoAcceso = new AccesoDaoImpl();
           Acceso acceso = daoAcceso.findById(Integer.parseInt(acc));
           int idUsuario = acceso.getUsuario().getIdUsuario();
           int tipousuario = acceso.getUsuario().getTipoUsuario();
           
           if (tipousuario != 3){
               response.sendRedirect("http://localhost:8080/sece/index.jsp");
             } else {
        %>
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
            <div id="dialog">          
            </div>
            

            <div class="header">
                <div class="header_resize">  
                    <a href="javascript:history.back(1)" class="buttonVolver">&LT;&LT; Atras</a>
                    <div class="menu">

                    </div>
                    <div class="clr"> </div>
                    <div class="logo"><img src="../images/logofull.png" width="293" height="84" border="0" alt="logo" /></div>                     
                    <div class="clr"></div>      

                    <div class="clr"></div>                   
                    </div><!-- fin div header resize!-->            
                </div><!-- fin div header !-->
                    <div class="clr"></div>
                     <div class="body">
                        <div class="body_resize">      
                            <div class="right1">                                
                               <h2><img style="padding-right: 20px;" src="imagenes/panel.png"/>Panel Contacto</h2>
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
                                       var valor = $("a").index(this);
                                        soporteSece.ayudaContacto(valor,{callback:function(str){
                                          $(".right2").html(str);
                                        }});          
                                       });                                                   
                                   
                               </script>
                            </div>
                            <div class="right2" style="margin-top: 6%;">
                                <div align="center"><h3>P&aacute;gina de Inicio del Sistema</h3></div>
                                <p>Esta es la pantalla que le aparece cuando entre a <a href="#">http://www.sece.org.ni.com</a> es el index.jsp.<br/> Hay tres pestañas inicio, acerca de y contáctenos.<br/> <b>Inicio</b>, aquí se mostrara información de CPML, que es SECE y noticias o notas acerca de las actividades próximas que realizaran. </p>
                                <img src="imagenes/imgC01.jpg"/>
                                <p>En noticias y notas, muestra las actividades que se realizaron hace una semana y las de la próxima. El ingreso de estas notas la realizara el administrador del sistema, más adelante en subsistema el modulo del administrador se explicara y se mostrara el formulario de ingreso. Así como todas las notas hechas.</p> 
                                <img src="imagenes/imgC02.jpg"/>
                                <p>Acerca de, muestra información sobre quienes desarrollaron el sistema, como un video explicativo de como registrarse.</p>
                                <img src="imagenes/imgC03.jpg"/>
                                <p>Contáctenos, hay un formulario donde usuario puede enviar sugerencia, preguntas o consulta a CPLM sobre SECE. También muestra información de CPML como ubicación geográfica, dirección, teléfonos.</p>
                                <p>También en el inicio hay una opción para iniciar sesión en el sistema. Que nos direcciona a <a href="#">http://sece.org.ni.com/logger.jsp.</a></p>
                            </div>
                             <div class="clr"></div>
                            
                        </div>
                         

                            
                     </div><!-- fin div body!-->               
                     <div class="footer">
                         <div class="footer_resize">
                             <div class="clr"></div>
                         </div>
                     </div>
                     <div class="clr"></div>       
            </div><!-- fin div main!-->
    </body>
    <%}}%>
</html>

