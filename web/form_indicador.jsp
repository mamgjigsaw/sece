<%-- 
    Document   : form_indicador
    Created on : Dec 10, 2010, 3:47:53 PM
    Author     : mamg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="saveIndicador" method="post">
            <table>
                   Nuevo Indicador
                 <tr><td>Nombre</td><td><input id ="email" name="txtname" type="text"/></td></tr>
                 <tr><td><input id ="btnOk" value="Entrar" name="btnOk" type="submit"/></td></tr>
             </table>
        </form>
    </body>
</html>
