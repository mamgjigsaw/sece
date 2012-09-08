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
        <style>
            .caja_Basisa p a:first-child {background-color:#E7F1FA; }
        </style>
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
                                   <a class="conBasisa" href="javascript: void(0);">¿Qu&eacute; es Usuario contacto y delegado?</a> <br> 
                                   <a class="conBasisa" href="javascript: void(0);">Espacio de Trabajo</a> <br> 
                                   <a class="conBasisa" href="javascript: void(0);">Llenado del Instrumento</a> <br/>                                   
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
                                <p><strong>Antes de iniciar, vamos a definir que es un usuario contacto y que un delegado.</strong></p>
                                <p>Un usuario contacto es el representante de una empresa una vez que ha registrado dicha empresa, por ejemplo cuando una determinada empresa se interesa en aplicar la herramienta de evaluaci&oacute;n de competitividad empresarial, en conocer su situaci&oacute;n actual a trav&eacute;s de SECE es decir su nivel de competitividad empresarial.</p> 
                                <p>El primer usuario que se registre e ingrese a la empresa se convierte en el contacto, los demás usuarios de la misma empresa que deseen interactuar con el sistema tendr&iacute;an que abocarse al contacto, el cual los ingresara como usuarios de tipos delegados asignándoles un indicador y para su posterior llenado, m&aacute;s adelante se explicara el ingreso de un usuario tipo delegado. </p>
                                <p>En otras palabras un usuario delegado, ser&iacute;a otro empleado de la empresa que se le ha sido asignado un indicador.</p>
                                <p>Una vez que el usuario cliente se halla ingresa al sistema, lo primero que vera sea contacto o delegado ser&acute; un panel de control que tendr&acute; 5 pesta&ntilde;as para el caso del contacto.</p>
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

