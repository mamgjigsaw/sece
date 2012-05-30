<%-- 
    Document   : loadZone
    Created on : Dec 12, 2011, 4:39:02 PM
    Author     : wmiguel
--%>

<%@page import="daoImpl.ZoneDaoImpl"%>
<%@page import="pojo.Zone"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <select name="cState" id="cState">
           <option value="0000">--Select--</option>
         <%
         int id_pais = Integer.parseInt(request.getParameter("idcountry"));          

         List<Zone> list = new ArrayList<Zone>();
         ZoneDaoImpl daoestado = new ZoneDaoImpl();
         list= daoestado.findById_pais(id_pais);

         int id_estado;
         String name_estado;
         for(int i=0; i<list.size();i++){
             Zone estado = (Zone) list.get(i);
             id_estado = estado.getIdZone();
             name_estado = estado.getNombre();

             out.print("<option value='"+ id_estado  + "'>" + name_estado + "</option>");
         }
        %>
      </select>
    </body>
</html>
