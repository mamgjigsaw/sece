<%-- 
    Document   : form_usuario
    Created on : Dec 10, 2010, 11:24:49 AM
    Author     : mamg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
         <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	 <script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>	<script type="text/javascript">
			$(function(){
				$('#dialog').dialog({
					autoOpen: false,
					modal:true,
					width: 400,
					buttons: {
						"Si": function() {
							$(this).dialog("close");
						}
					}
				});

				// Dialog Link RIO
				$('#dialog_link').click(function(){
					$('#dialog').dialog('open');
					//return false;
				});

			});
		</script>
         <script type="text/javascript">
            function go_back(){
                location.href="index.jsp";
            }
        </script>
    </head>
    <body>
        <div align="center">
        <form method="post" action="saveUsuario">
           <table>
                 Nueva Cuente de Usuario
                 <tr><td>Nombre: </td><td><input id ="name" name="txtname" type="text"/></td></tr>
                 <tr><td>Cargo: </td><td><input id ="desc" name="txtcargo" type="text"/></td></tr>
                 <tr><td>Telefono: </td><td><input id ="prec" name="txttel" type="text"/></td></tr>
                 <tr><td>Correo:</td><td><input id ="cant" name="txtcorreo" type="text"/></td></tr>
                 <tr><td>Direccion: </td><td><input id ="cost" name="txtdir" type="text"/></td></tr>
                 <tr><td>Password: </td><td><input id ="cost" name="txtpass" type="text"/></td></tr>
                 <tr><td><input type="submit" id="dialog_link" value="Aceptar" /></td><td align="center"><input id="btngo_back" type="button" value="Regresar" onclick="go_back();" /></td></tr>
             </table>
	</form>
        </div>
        <div style="font-size:14px" id="dialog" title="SECE">

            Se ha guardo Correctamente!!
       </div>
    </body>
</html>
