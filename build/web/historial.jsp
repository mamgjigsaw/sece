<%-- 
    Document   : historial.jsp
    Created on : Sep 30, 2011, 12:36:22 AM
    Author     : Dave
--%>

<%@page import="java.util.Iterator"%>
<%@page import="daoImpl.ContratoDaoImpl"%>
<%@page import="java.util.Set"%>
<%@page import="daoImpl.EmpresaDaoImpl"%>
<%@page import="pojo.Empresa"%>
<%@page import="pojo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>SECE</title>
           
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script language="javascript" type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
        <script language="javascript" type="text/javascript" src="resources/jquery/js/jquery.flot.js"></script>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            $(function () {
                var d1 = [];
                for (var i = 0; i < 14; i += 0.5)
                        d1.push([i, Math.sin(i)]);
                var d2 = [[0, 3], [4, 8], [8, 5], [9, 13]];
                // a null signifies separate line segments
                var d3 = [[0, 12], [7, 12], null, [7, 2.5], [12, 2.5]];
                
                var d4 = [[0, 1], [2, 4], [7, 6], [10, 11]];
                $.plot($("#placeholder1"), [
                     {
                       label:"Indicador", data:d1,color:1,points:{show:true},lines:{show:true},hoverable:false
                     } 
                     ]);
                  $.plot($("#placeholder2"), [
                 {
                   label:"Indicador", data:d2,color:2,points:{show:true},lines:{show:true},hoverable:true
                 } 
                     ]);
                  $.plot($("#placeholder3"), [
                     {
                       label:"Indicador", data:d3,color:3,points:{show:true},lines:{show:true},hoverable:true
                     } 
                     ]);
                  $.plot($("#placeholder4"), [
                 {
                   label:"Indicador", data:d4,color:4,points:{show:true},lines:{show:true},hoverable:true
                 } 
                     ]);    
            });
        </script>
        <style>
            td{ 
               text-align: center;
            }
        </style>
        
        <%  
           Usuario user = new Usuario();          
           Empresa emp = new Empresa();                    
           EmpresaDaoImpl edi = new EmpresaDaoImpl();
           emp = edi.findByID(12);
           Set usuarios = emp.getUsuarios();
           ContratoDaoImpl cdi = new ContratoDaoImpl();
           Iterator<Usuario> it =usuarios.iterator();
           
        %>
    </head>
    <body>
              
  <div class="main">         
    <div class="header">
    <div class="header_resize">     
        
      <div class="menu">
     
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logo.gif" width="293" height="84" border="0" alt="logo" /></div>      
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="body">
      <div class="body_resize" align="center">
        <h2>Arroz El Bueno</h2>
        <%out.print(request.getParameter("empresa"));%>
        <table width="100%" id="table1" border="0" >
                 <thead>
                     <tr>
                     <th>Contrato</th>
                     <th>Fecha de Inicio</th>
                     <th>Fecha de Finalizaci&oacute;n</th>
                   </tr>
                 </thead>
                 <tbody>
                 <%
                 while(it.hasNext()){
                     
                                    }
                 %>
                 </tbody>   
        </table>        
                        
                                        
    
        <div style="padding-top: 5%;">
          <div id="placeholder1" style="width:450px;height:300px; float: left"></div>
          <div id="placeholder2" style="width:450px;height:300px; float:left"></div>
          <div id="placeholder3" style="width:450px;height:300px; float: left"></div>
          <div id="placeholder4" style="width:450px;height:300px; float: left"></div>
      </div>
      
     </div>
  </div>
    </body>
</html>
