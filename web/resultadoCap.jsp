<%-- 
    Document   : resultado
    Created on : Oct 4, 2011, 11:57:33 PM
    Author     : Dave
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="pojo.Avance"%>
<%@page import="daoImpl.AvanceDaoImpl"%>
<%@page import="pojo.RespItem"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="daoImpl.RespItemDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Escala"%>
<%@page import="daoImpl.EscalaDaoImpl"%>
<%@page import="pojo.Indicador"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Contrato"%>
<%@page import="daoImpl.ContratoDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Acceso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
%>
<html>
    <head>
        <%
            HttpSession sesion = request.getSession();
            sesion.setMaxInactiveInterval(3600);
            String acc = (String) sesion.getAttribute("idAcc");
            String name;

            int idContrato = Integer.parseInt(request.getParameter("id_contrato"));
            if (acc == null) {
                response.sendRedirect("index.jsp");
            } else {

                AccesoDaoImpl daoAcceso = new AccesoDaoImpl();
                Acceso acceso = daoAcceso.findById(Integer.parseInt(acc));

                int id_usuario = acceso.getUsuario().getIdUsuario();
                UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
                Usuario usuario = new Usuario();
                usuario = usuDao.findById(id_usuario);

                name = usuario.getNombre();

                //para nombre de la empresa cliente
                ContratoDaoImpl cdi = new ContratoDaoImpl();
                Contrato contrato = cdi.findById(idContrato);
                String nomb_Empresa = contrato.getUsuario().getEmpresa().getNombre();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <title>Grafico</title> 
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />         
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>

        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <script src="resources/amcharts/javasscript/amcharts.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/amcharts/javascript/amfallback.js"></script>
        <script src="resources/amcharts/javascript/raphael.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/amcharts/flash/swfobject.js"></script>

        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>        
        <script type="text/javascript" src="/sece/dwr/interface/capacitadoresScripts.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>



        <script type="text/javascript">
            var id_contrato=<%=idContrato%>;  

                 
                   
            var flashVars = {
                settings_file: "resources/settings.xml",
                data_file: "GraficoResultado?idcontrato="+id_contrato
            };           
            ///para grafico 2
            var flashVars2 = {
                settings_file: "resources/settingsGraficoResultadoPuntos.xml",
                data_file: "GraficoResultadoP?idcontrato="+id_contrato
            };
            var flashVars3 = {
                settings_file: "resources/settingsGrafGeneral.xml",
                data_file: "GraficoResultadoGeneral?idcontrato="+id_contrato
            }   
           
            $(document).ready(function(){ 
           
           
                $( "#accordion" ).accordion( {active: 2 });               
           
                $.get("GraficoResultado?idcontrato="+id_contrato, function (data){
                    if (data == null || data== ""){                
                
                        $('.body_resize').prepend("<div class='notification error'><p class='hola'><strong class='hola'>Error al Graficar</strong><p class='hola'>No hay datos para generar la grafica!!</p></div>");
                    }//  fin if
                    else{
                        // change 8 to 80 to test javascript version                 
                        if (swfobject.hasFlashPlayerVersion("10"))
                            swfobject.embedSWF("resources/amcharts/flash/amradar.swf", "chartdiv", "700", "600", "10", "resources/amcharts/flash/expressInstall.swf", flashVars);            
                        else {
                            var amFallback = new AmCharts.AmFallback();
                            amFallback.settingsFile = flashVars.settings_file;  
                            amFallback.dataFile = flashVars.data_file;                    
                            amFallback.type = "radar";
                            amFallback.write("chartdiv");
                        }//fin else            
                    }
                });
        
                ///para grafico 2               
                $.get("GraficoResultadoP?idcontrato="+id_contrato, function (data){
                    if (data == null || data== ""){                
                
                        $('.body_resize').prepend("<div class='notification error'><p class='hola'><strong class='hola'>Error al Graficar</strong><p class='hola'>No hay datos para generar la grafica!!</p></div>");
                    }//  fin if
                    else{
                        // change 8 to 80 to test javascript version                 
                        if (swfobject.hasFlashPlayerVersion("10"))
                            swfobject.embedSWF("resources/amcharts/flash/amradar.swf", "chartdiv2", "700", "600", "10", "resources/amcharts/flash/expressInstall.swf", flashVars2);            
                        else {
                            var amFallback = new AmCharts.AmFallback();
                            amFallback.settingsFile = flashVars2.settings_file;  
                            amFallback.dataFile = flashVars2.data_file;                    
                            amFallback.type = "radar";
                            amFallback.write("chartdiv2");
                        }//fin else            
                    }
                });
                ///para grafico general
                if (swfobject.hasFlashPlayerVersion("10"))
                    swfobject.embedSWF("resources/amcharts/flash/amline.swf", "chartdiv3", "700", "600", "10", "resources/amcharts/flash/expressInstall.swf", flashVars3);            
                else {
                    var amFallback = new AmCharts.AmFallback();
                    amFallback.settingsFile = flashVars3.settings_file;  
                    amFallback.dataFile = flashVars3.data_file;                    
                    amFallback.type = "amline";
                    amFallback.write("chartdiv3");
                }//fin else            
        
                
                //para los botones
		
                $( "#gobackbutton" ).button({			
                    icons: {
                        primary: "ui-icon-circle-arrow-w"
                    }
                })
                .click(function() {			
                    goBack();            
                });
                
                
                $( "#logoutbutton" ).button({			
                    icons: {
                        primary: "ui-icon-gear",
                        secondary: "ui-icon-triangle-1-s"
                    }
                })
                .click(function() {			
                    $("#menuBtnOpciones1").toggle("slow");            
                });	
                $(".mnSalir").hover(
                function(){
                    $(this).css({'color':'#81BEF7','cursor':'pointer', 'font-size':'large'});
                },
                function(){
                    $(this).css({'color':'#015480','font-size':'medium'});    
                }
            );           
                
              
            });  //fin document jquery
            
            function goout(){
                location.href="salir";
            }
            
            function goBack(){
                validacion.saveActionBitacora(<%=acc%>,13,"",<%=id_usuario%>,"resultado.jsp","controlPanel.jsp");
                javascript:history.back();
            } 
        </script>
        <style>
            #vce{
                background-color: #e8e8e8; 
            }
            td{ 
                text-align: center;
            }
            #toolbar {
                padding: 10px 4px;
            }
            /*eliminar padding de style*/
            .body h3{
                padding:0 0;                
            }
        </style>
    </head>
    <body>
        <div class="main">         
            <div class="header">
                <div class="header_resize">     

                    <div class="menu">

                    </div>
                    <div class="clr"></div>
                    <div class="logo"><img src="images/logo.gif" width="293" height="84" border="0" alt="logo" /></div>      
                    <div class="inGo" style=" font-size: 11px;" >
                        <span id="toolbar" class="ui-widget-header ui-corner-all">	
                            <button id="gobackbutton" >Regresar</button>	
                            <button id="logoutbutton" ><%=name%></button>	
                        </span> 
                        <div>
                            <div id="menuBtnOpciones1" style=" float: right;  border-radius: 0 0 5px 5px;  margin-right: 5px; border-color: #69a8d4; border-style: solid;  border-width: 1px; display: none; background: #e7f1fa; width: 100px; height: 20px; color: #015480">
                                <ul id="opciones1" class="mnSalir" style="list-style-image:url(/images/log_out.gif); margin-top: 0px; list-style: none;font-size: medium; text-align:left;">
                                    <li id="mnuBtnSalir" onclick="goout();" > Salir  </li>  
                                </ul>              
                            </div>           
                        </div>

                    </div>
                    <div class="clr"></div>
                </div>
            </div>

            <div class="body">
                <div class="body_resize" align="center" >          
                    <div style="padding: 0 5%;">
                        <div id="accordion">
                            <h3><a>Nivel de Competitividad Relativa de <%= nomb_Empresa%></a></h3>
                            <div>
                                <div id="chartdiv" style="width:700px; height:600px; background-color:#FFFFFF"></div>
                            </div>
                            <h3><a>Nivel de Competitividad Absoluta de <%= nomb_Empresa%></a></h3>
                            <div>
                                <div id="chartdiv2" style="width:700px; height:600px; background-color:#FFFFFF"></div>
                            </div>
                            <h3><a>Rango de Nivel de Competitividad General de <%= nomb_Empresa%></a></h3>                            
                            <div>
                                <h2>El nivel de Competitividad es:<span id="vce"></span> </h2>
                                <div id="chartdiv3" style="width:700px; height:600px; background-color:#FFFFFF">You need to upgrade your Flash Player</div>                    
                                <div id="progxIndicador" style="padding: 5% 0 3% 15%; margin:5% 0;  background-color: #e8e8e8;">
                                    <script>
                                        capacitadoresScripts.testear(id_contrato,{callback:function(data){
                                                $("#progxIndicador").html(data);                                                
                                            }
                                        });  
                                        capacitadoresScripts.getVce(id_contrato,{callback:function(data){
                                                $("#vce").html(data);                                                
                                            }
                                        });   
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div><!-- fin div body!-->

            <div class="footer">
                <div class="footer_resize">


                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
            </div>
    </body>
</html>
<%
    }
%>