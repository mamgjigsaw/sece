<%-- 
    Document   : index
    Created on : Dec 7, 2010, 11:06:18 AM
    Author     : mamg
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.NoticiasDaoImpl"%>
<%@page import="pojo.Noticias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="resources/css/orbit.css" rel="stylesheet"/>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />     
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery.orbit.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.orbit-1.2.3.js"></script>        
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
        <script type="text/javascript" src="resources/jquery/js/easySlider1.5.js"></script>
        
        <title>Sistema De Evaluacion De Competitividad</title>
        <script type="text/javascript">
            /*$(window).load(function() {
                 $('#featured').orbit();		
                        });*/
        
            $(document).ready(function(){
       
                $( "#msnNoticia" ).dialog({
                    autoOpen: false,
                    modal: true,
                    buttons: {
                        Ok: function() {
                            $( this ).dialog( "close" );
                                        
                        }
                    }
                });//fin dialog-message
                $("#featured").orbit();	
                $("#slider").easySlider({
                    controlsBefore:	'<p id="controls">',
                    controlsAfter:	'</p>',
                    auto: true, 
                    continuous: true
                });	
                if((navigator.userAgent.match(/iPhone/i))) {
                    if (document.cookie.indexOf("iphone_redirect=false") == -1) window.location = "resources/mobil/indexmobil.html";
                }
                else if( (navigator.userAgent.match(/iPad/i)) ){
                    if (document.cookie.indexOf("iphone_redirect=false") == -1) window.location = "resources/mobil/tablets/welcome.jsp";
                }
            });
            function openDialog(tituloN, descN, fechaN){
     
                document.getElementById("lbltitulo").innerHTML = tituloN;
                document.getElementById("lbldescripcion").innerHTML = descN;
                document.getElementById("lblfecha").innerHTML = fechaN;
                $("#msnNoticia").dialog( "open" );
     
            }

            // ]]>
        </script>

    </head>
    <body>
        <div class="main">
            <div class="header">
                <div id="menuBarra" class="header_resize">
                    <a href="logger.jsp" id="btnSession" >Iniciar Sesion / Registrarse</a>                   
                    <div class="menu">
                        <ul>
                            <li><a href="index.jsp" class="active"><span>Inicio</span></a></li>
                            <li><a href="acerca_de.jsp"><span>Acerca de</span></a></li>          
                            <li><a href="contacto.jsp"><span>Contactenos</span></a></li>
                            <li><a href="ayuda.jsp"><span>Ayuda</span></a></li>
                        </ul>
                    </div>
                    <div class="clr"></div>
                    <div class="logo"><img src="images/logofull.png" width="290" height="80" border="0" /></div>

                    <div class="clr"></div>
                </div>
            </div>
            <div class="header_text">
                <div class="header_text_resize">
                    <div id="featured"> 
                        <div class="content" style="">
                            <h1>Orbit does content now.</h1>
                            <h3>Highlight me...I'm text.</h3>
                        </div>
                        <a href=""><img src="images/dummy-images/overflow.jpg" /></a>
                        <img src="images/dummy-images/captions.jpg" data-caption="#htmlCaption" />
                        <img src="images/dummy-images/features.jpg"  />
                    </div> 
                    <div class="clr"></div>
                </div>
            </div>
            <div class="clr"></div>
            <div class="body">
                <div class="body_resize">      
                    <div class="right1">
                        <h2>Cpml-N</h2>
                        El Centro de Producción más Limpia de Nicaragua (CPmL-N), promueve el Desarrollo Sostenible. Se establece en la Universidad Nacional de Ingeniería (UNI) en 1998, por iniciativa de las Naciones Unidas para el Desarrollo Industrial (ONUDI) como parte del Programa “Centro de Producción más Limpia”. Brindamos soluciones técnicas a las empresas para mejorar su competitividad a la vez que se reducen los impactos al ambiente.
                        <a target="_blank" href="http://pml.org.ni/" ><img src="images/cpml.jpg" alt="picture" width="293" /></a>
                        <strong>¿Que es producción más limpia?</strong>
                        "La Producción más Limpia es una estrategia ambiental preventiva integrada que se aplica a los procesos, productos y servicios a fin de aumentar la eficiencia y reducir los riesgos para los seres humanos y el ambiente"
                    </div>
                    <div class="right1">
                        <h2>¿Que es SECE?</h2>
                        Es una herramienta Web de evaluacion de competitividad empresarial, que tiene el proposito de 
                            permitir a las empresas ser autoevaluadas en 4 ejes fundamentales:
                        <ul>
                            <li>Gerencia</li>
                            <li>Finanzas</li>
                            <li>Mercadeo</li>
                            <li>Produccion</li>          
                        </ul>
                        De esta forma, al terminar de llenar los formularios presentados en SECE, el mismo sistema
                            arrojar&aacute un informe en donde se presentar&aacute la situaci&oacuten actual de la empresa
                            y sugerencias para mejorar la Competitividad Empresarial de la misma.

                    </div>
                    <div id="msnNoticia" title="Noticias de CPML" >



                        <h4><p><span id="lbltitulo"></span></p></h4>
                        <p><span id="lbldescripcion"> </span></p>
                        <h5> <p>Fecha: <span id="lblfecha"></span></p></h5>
                    </div>
                    <div class="right1">

                        <h2>¿Que es Internacionalizacion?</h2>
                        Es la necesidad de buscar nuevos mercados como respuesta a la fuerte competencia dentro de nuestro mercado local o nacional, el cual debe abordarse como una actividad estratégica dentro de la PYMES. 

                        Para ello, es necesario utilizar metodologías que sean claras, precisas y fácilmente adaptables a la operación estratégica que involucra todas las áreas funcionales de la empresa. El cual requiere dedicación, entusiasmo y preparación para llegar a ser un exportador exitoso.

                        <h2>Noticias y Notas</h2>
                        <%
                            try {
                                SimpleDateFormat dateConverter = new SimpleDateFormat("dd/MM/yyyy");
                                NoticiasDaoImpl ndi = new NoticiasDaoImpl();
                                List<Noticias> list = ndi.findLastest();
                                Iterator<Noticias> it = list.iterator();
                                int nlist = list.size();
                                Noticias n = new Noticias();
                                String fecha;
                                if (nlist != 0) {
                                    if (nlist <= 5) {
                                        while (it.hasNext()) {

                                            n = it.next();
                                            fecha = dateConverter.format(n.getFecha_evento());

                        %>
                        <a style="cursor: pointer" onclick="openDialog('<%= n.getTitulo()%>', '<%= n.getDescripcion()%>', '<%= fecha%>');" ><strong><%= fecha%></strong></a><br />
                            <%= n.getTitulo()%><a style="cursor: pointer" onclick="openDialog('<%= n.getTitulo()%>', '<%= n.getDescripcion()%>', '<%= fecha%>');" > &gt;&gt;</a>
                        <div class="line"></div>
                        <%    }//fin del while 
                        }// fin del if
                        else {
                            for (int i = 0; i <= 4; i++) {
                                n = list.get(i);
                                fecha = dateConverter.format(n.getFecha_evento());
                        %>
                        <a style="cursor: pointer" onclick="openDialog('<%= n.getTitulo()%>', '<%= n.getDescripcion()%>', '<%= fecha%>');" ><strong><%= fecha%></strong></a><br />
                            <%= n.getTitulo()%><a style="cursor: pointer" onclick="openDialog('<%= n.getTitulo()%>', '<%= n.getDescripcion()%>', '<%= fecha%>');" > &gt;&gt;</a>
                        <div class="line"></div>
                        <%       }//fin del for
                                    }//fin del else
                                }
                            } catch (Exception e) {
                                System.out.println(e.getMessage());
                            }

                        %>   

                    </div> 
                    <div class="clr"></div>
                </div>
            </div>
            <div class="footer">
                <div class="footer_resize">


                    <div class="clr"></div>
                </div>
            </div>
            <div class="clr"></div>
        </div>
    </body>
</html>