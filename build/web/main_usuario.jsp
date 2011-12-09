<%-- 
    Document   : main_usuario
    Created on : Dec 10, 2010, 3:40:14 PM
    Author     : mamg
--%>

<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          HttpSession sesion=request.getSession();
          int user = (Integer) sesion.getAttribute("usuario");

          UsuarioDaoImpl UsuDao = new UsuarioDaoImpl();
          Usuario Usu= UsuDao.findById(user);

          out.print("Welcome "+Usu.getNombre());


        %>
    </body>
</html>
