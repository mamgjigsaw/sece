<%-- 
    Document   : settingUser
    Created on : 12-12-2010, 09:06:34 PM
    Author     : Personal
--%>

<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page session='true'%>
<html>
    <head>
        <link href="Resources/Nuestro_CSS.css" rel="stylesheet" type="text/css" media="screen" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="Resources/jquery/js/jquery-1.4.4.min.js"></script>
        <script type="text/javascript" src="Resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
      <script type="text/javascript">
			$(function(){


				$('#dialog').dialog({
					autoOpen: false,
					modal:true,
					width: 500,
					buttons: {
						"Si": function() {

        $("#f1").submit();
                                                           
						//$(this).dialog("close");
                                                           
						}
					}
				});

				// Dialog Link RIO
				$('#dialog_link').click(function(){
					$('#dialog').dialog('open');
					return false;
				});

			});
		</script>

        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
                 HttpSession s = request.getSession();
                   int idUser = (Integer)s.getAttribute("idUser");
                  Usuario user = new Usuario();
                  UsuarioDaoImpl udi = new UsuarioDaoImpl();

                  user = udi.findById(idUser);

                  String username = user.getNombre();
                  String dir = user.getDireccion();
                  String cargo = user.getCargo();
                  String email = user.getCorreo();
                  String tel = user.getTelefono();

         %>
         <div align="left" class="micenter"  style=" background-color: #ffffff; margin-left: 200px; margin-right: 200px;  margin-top: 100px; height: 500px; width: 850px; "  >

                        <table>
                <tr>
                    <td>Nombre:</td>
                    <td><% out.print(username); %></td>
                </tr>
                <tr>
                    <td>Cargo:</td>
                    <td><% out.print(cargo); %></td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><% out.print(dir); %></td>
                </tr>
                <tr>
                    <td>Correo:</td>
                    <td><% out.print(email); %></td>
                </tr>
                <tr>
                    <td>Telefono/Celular:</td>
                    <td><% out.print(tel); %></td>
                </tr>



            </table>
                <input type="button" id="dialog_link" name="hola" value="Modificar" />
        </div>
       <div id="dialog" title="Modificar">
        <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
        <form id="f1" method="post" action="modifUser">

                <table>
                <tr>
                    <td>Nombre:</td>
                    <td><input id="user" name="user" value="<% out.print(username); %>" type="textbox" /> </td>
                </tr>
                <tr>
                    <td>Cargo:</td>
                    <td><input id="cargo" name="cargo" value="<% out.print(cargo); %>" type="textbox" /> </td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td><input id="dir" name="dir" value="<% out.print(dir); %>" type="textbox" /></td>
                </tr>
                <tr>
                    <td>Correo Electronico:</td>
                    <td><input id="email" name="email" value="<% out.print(email); %>"type="textbox" /></td>
                </tr>
                <tr>
                    <td>Telefono/Celular:</td>
                    <td><input id="tel" name="tel" value="<% out.print(tel); %>"type="textbox" /></td>
                </tr>



            </table>
                  
                </form>
		</div>

    </body>
</html>
