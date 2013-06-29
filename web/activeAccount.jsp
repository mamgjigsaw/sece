<%-- 
    Document   : controlPanel
    Created on : Nov 23, 2011, 8:02:23 PM
    Author     : mamg
--%>

<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Empresa"%>
<%@page import="daoImpl.EmpresaDaoImpl"%>
<%@page import="pojo.Contrato"%>
<%@page import="daoImpl.ContratoDaoImpl"%>
<%@page import="pojo.Avance"%>
<%@page import="daoImpl.AvanceDaoImpl"%>
<%@page import="pojo.DelegacionIndiUsu"%>
<%@page import="daoImpl.DelegacionIndiUsuDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Indicador"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);

    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
%>
<html>
    <head>
        <%
            try {


                HttpSession sesion = request.getSession();
                sesion.setMaxInactiveInterval(3600);
                String acc = (String) sesion.getAttribute("idAcc");

                if (acc == null) {
                    response.sendRedirect("index.jsp");
                } else {

                    UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
                    List<Usuario> list = new ArrayList<Usuario>();
                    list = usuarioDao.findByPassBloqueado();
                    
                    List<Usuario> listEmpresa = new ArrayList<Usuario>();
                    listEmpresa = usuarioDao.findByPassBloqueadoEmpresa();



        %>
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <title>Panel de Control</title>
        <title>Activar cuentas de los Capacitadores!!</title>


        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />       

        <style>
            .letra{
                font-size: 12px;
            }
            
            .letra2
            {
                font-size: 14px;                
            }

            #btnRegresar {    
                background: #dfeffc url(images/ui-bg_glass_85_dfeffc_1x400.png) 50% 50% repeat-x;
                border: 1px solid #c5dbec;
                border-radius: 5px; 
                color: #2e6e9e;
                font-family: Arial;
                font-size: 1.4em;       
                padding: 0.5em;
                position: absolute;
                left:70%;
                top:3%;
                text-decoration: none;
                transition: all 0.5s ease;    
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
            }

            #btnRegresar:hover { 
                color: #2e6e9e;
                font-family: Arial;   
                border: #79b7e7;
                transform: scale(1.1) ;
                -webkit-transform: scale(1.1);
                -moz-transform: scale(1.1) ;
                -o-transform: scale(1.1) ;
            }
            
            #encabezado{
                text-align: left;
               color:#5f5f5f; 
               font:bold 18px  Arial, Helvetica, sans-serif; padding:10px 15px;
               
            }
        </style>
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.validate.js"></script>  

        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>        
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>

        <script type="text/javascript" >

            $(document).ready(function() {
                $("input").button();
            });

            function activar(codigo) {
                validacion.activarPasswordBloqueado(codigo, resp);
            }

            function resp(dato) {
                document.location.reload(true);
            }
        </script>
    </head>    
    <body>    
        <div class="main">
            <div class="header">
                <div class="header_resize">  
                    <a href="main_admin.jsp" id="btnRegresar">Regresar al Panel de Admin</a>
                    <div class="menu">

                    </div>
                    <div class="clr"></div>
                    <div class="logo"><img src="images/logofull.png" width="250" height="70" border="0" alt="logo" /></div>      
                    <div class="clr"></div>
                </div>
            </div>


            <div class="body">

               

                <div class="body_resize">

                    <div class="right">
                        <div class="clr"></div>
                        <div class="right_top">

                        </div>
                        <div class="clr"></div>
                    </div>

                    
                            <br/>
                     <div id="activeAccountCapa" >
                        <div id="encabezado">Capacitadores Bloqueados por intentos fallidos!!</div>                                            
                        <table style="padding:10px;" >
                            <thead>
                                <tr>
                                    <th>Nombre </th>
                                    <th>Correo </th>
                                    <th>Accion </th>  
                                </tr>                     
                            </thead>
                            <tbody>
                                <%
                                    for (Usuario usuario : list) {

                                %>
                                <tr>
                                    <td class="letra2"><%= usuario.getNombre()%></td>            
                                    <td class="letra2"><%= usuario.getCorreo()%></td>
                                    <td><input class="letra" onclick="activar(<%= usuario.getIdUsuario()%>);" value="Activar Password" /> </td>                   
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                    </div>
                            <br/>
                    <div id="activeAccountEmpresa" >
                        <div id="encabezado">Empresas bloqueadas por intentos fallidos!!</div>                                            
                        <table style="padding:10px;" >
                            <thead>
                                <tr>
                                    <th>Nombre </th>
                                    <th>Correo </th>
                                    <th>Accion </th>  
                                </tr>                     
                            </thead>
                            <tbody>
                                <%
                                    for (Usuario usuario : listEmpresa) {

                                %>
                                <tr>
                                    <td class="letra2"><%= usuario.getNombre()%></td>            
                                    <td class="letra2"><%= usuario.getCorreo()%></td>
                                    <td><input class="letra" onclick="activar(<%= usuario.getIdUsuario()%>);" value="Activar Password" /> </td>                   
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>

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
<% }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
%>