<%-- 
    Document   : proof
    Created on : 25-abr-2012, 11:31:56
    Author     : Mendieta
--%>

<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.NoticiasDaoImpl"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="pojo.Noticias"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <% 
          Usuario u = new Usuario();
          UsuarioDaoImpl udi = new UsuarioDaoImpl();
          AccesoDaoImpl adi = new AccesoDaoImpl();
          u = udi.findById(1);
         List<Acceso> l = adi.findByUser(u);            
            int num = l.size();
%>
       <%= num %>
    </body>
</html>
