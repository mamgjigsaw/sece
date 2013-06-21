<%-- 
    Document   : activeAccount
    Created on : 03-22-2013, 03:29:28 PM
    Author     : Prestigeusa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession sesion = request.getSession();
            sesion.setMaxInactiveInterval(3600);
            String acc = (String) sesion.getAttribute("idAcc");

            UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
            List<Usuario> list = new ArrayList<Usuario>();
            list = usuarioDao.findByPassBloqueado();

        %>       
        <title>SECE</title>

        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>        
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>

        <script type="text/javascript" >
            function activar(codigo) {
                validacion.activarPasswordBloqueado(codigo, resp);                
            }            
            
            function resp(dato){
                document.location.reload(true);
            }
        </script>
    </head>
    <body>

        <h4>Usuario Capacitadores con Password Bloqueado por intentos fallidos!!</h4>                                            
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
                    <td><%= usuario.getNombre()%></td>            
                    <td><%= usuario.getCorreo()%></td>
                    <td><button  onclick="activar(<%= usuario.getIdUsuario()%>);">Activar Password</button> </td>                   
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>