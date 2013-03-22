<%-- 
    Document   : ayudaAdministrador
    Created on : Jul 19, 2012, 11:32:10 PM
    Author     : Dave
--%>

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
                               <h2><img style="padding-right: 20px;" src="imagenes/group.png"/>Panel Capacitador</h2>
                               <div class="caja_Basisa">
                               <p>                                     
                                   <a class="conBasisa" href="javascript: void(0);">Empresa</a> <br/> 
                                   <a class="conBasisa" href="javascript: void(0);">Capacitadores</a> <br/>
                                   <a class="conBasisa" href="javascript: void(0);">Notas</a> <br>                                    
                                   <a class="conBasisa" href="javascript: void(0);">Reportes</a><br/>
                                   <a class="conBasisa" href="javascript: void(0);">Perfil</a><br/><br/>
                                 
                                   <a class="conBasisa" href="javascript: void(0);">Instrumento</a>                                   
                               </p>
                               </div> 
                               <script>
                                   $("a").click( function (){
                                       var valor = $("a").index(this);                                       
                                        soporteSece.ayudaUsuarioAdministrador(valor,{callback:function(str){
                                          $(".right2").html(str);
                                        }});          
                                       });                                                   
                                   
                               </script>
                            </div>
                            <div class="right2" style="margin-top: 6%;">
                                <p>El módulo del Usuario-Administrador de SECE, posee 2 páginas principales, cada una de ellas con 5 pestañas diferentes para que el Administrador pueda interactuar con el Sistema.
                                    La página principal posee las funcionalidades más comunes que podrá realizar, vamos a comenzar con la Barra de Menú:
                                </p>
                                <div align="center"><img src="imagenes/imgA01.png"/></div>
                                <p>Dicha barra se encuentra en la parte superior de las dos páginas principales del Módulo, ella nos permitirá navegar por 3 páginas, la principal (Inicio), la página que permitirá editar el Instrumento de Evaluaci&oacute;n (Instrumento), la página de ayuda para el administrador (Ayuda) y el último botón donde aparecerá el nombre del usuario administrador, en este caso “Kenny Mendieta”, presionando dicho bot&oacute;n, se desplegará otro botón para salir de sesión. </p>
                                <p>La segunda p&aacute;gina del m&oacute;dulo administrador es referido al Instrumento, en dicha p&aacute;gina, puede agregar nuevos indicadores, nuevas variables, nuevos ítems, nuevas escalas para cada variable y puede agregar sugerencias para uno o mas ítems, las formas para agregar un elemento o modificar uno, es muy parecida a la de la pestaña capacitador de la p&aacute;gina principal, la interfaz es bastante intuitiva, por ac&aacute; est&aacute;n las im&aacute;genes.</p>
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
</html>
