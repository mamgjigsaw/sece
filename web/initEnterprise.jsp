<%--
    Document   : initEnterprise
    Created on : 12-10-2010, 12:26:21 PM
    Author     : Personal
--%>

<%@page import="java.lang.reflect.Array"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Indicador"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Variable"%>
<%@page session='true'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
           $("#tabs").tabs();
           $("#accordion1").accordion();
     $("#accordion2").accordion();
      $("#accordion3").accordion();
       $("#accordion4").accordion();
       //$("#btnok").button();
       $("#mitabla").table();
  });  </script>





        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SESE</title>
    </head>
    <body>

        <%
              HttpSession sesion = request.getSession();

              int idUser = (Integer)sesion.getAttribute("idUser");
                  Usuario user = new Usuario();
                  UsuarioDaoImpl udi = new UsuarioDaoImpl();

                  user = udi.findById(idUser);
                  String username = user.getNombre();

        %>

        <h1>Bienvenido Señ@r:<%out.print(username); %>!!!!!</h1>
        <a href="settingUser.jsp">Settings</a>

            <div id="tabs">
    <ul>
        <li><a href="#fragment-1"><span>Gerencia</span></a></li>
        <li><a href="#fragment-2"><span>Finanzas</span></a></li>
        <li><a href="#fragment-3"><span>Produccion</span></a></li>
        <li><a href="#fragment-4"><span>Mercadeo</span></a></li>
    </ul>
    <div id="fragment-1">
        <div id="accordion1">

            <%
                 List<Variable> variables = new ArrayList<Variable>();
                  VariableDaoImpl vdi = new VariableDaoImpl();

                  variables = vdi.findAll();
                  int n = variables.size();

                  for(int i = 0; i<n ; i++){
                         Indicador ind = new Indicador();
                         // IndicadorDaoImpl idi = new IndicadorDaoImpl();
                         ind = variables.get(i).getIndicador();
                         int nind = ind.getIdIndicador();

                        if(nind == 1)
                      {
                            String v = variables.get(i).getNombre();
                            //HttpSession s = request.getSession();
                            //int idVari[0] = variables.get(i).getIdVariable();

                            //s.setAttribute("idvariable", idVari[i]);

                       %>
            <h3><a href="#"><%out.print(v); %></a></h3>
	<div>

            <form action="saveRespItem" method="post">
                <table id="mitabla"  >
                <tr>
                    <td>Pregunta </td>
                    <td>Si/No</td>
                    <td>Observaciones</td>
                </tr>

                            <%
                                    List<Item> item = new ArrayList<Item>();
                                     ItemDaoImpl idim = new ItemDaoImpl();
                                         item = idim.findAll();
                                         int ci = item.size();

                                              for(int mi = 0; mi<ci; mi++){
                                                  Variable var = new Variable();
                                                  var = item.get(mi).getVariable();
                                                   int nvar = var.getIdVariable();
                                                   int idv = variables.get(i).getIdVariable();
                                                       //VariableDaoImpl vdim = new VariableDaoImpl();

                                                   //var = vdim.findByIndicador(nvar);
                                                   //String varn = var.getNombre();
                                                  if(nvar == idv){

                                                                // HttpSession s = request.getSession();
                                                                 //int idVari = variables.get(i).getIdVariable();

                                                                 //s.setAttribute("idvariable", idVari);

                                                                 String itemout = item.get(mi).getDescripcion();
                                                               int iditem = item.get(mi).getIdItem();
                                                      %>

                                                          <tr>
                                                              <td><label id="item" ><%out.print(itemout); %></label></td>
                                                              <td><input id="check<% out.print(iditem); %>" name="check<%=iditem%>" type="checkbox"/> </td>
                                                          <td><input id="obser<%  out.print(iditem); %>" name="obser<%=iditem%>" value="HOLA<%=iditem%>" type="textbox"/> </td>
                                                          <td><input id="var" style=" visibility: hidden  " name="idvariable" value="<%= variables.get(i).getIdVariable() %>"  /></td>
                                                      </tr>
                                                                <%

                                                  }

                                                  }
                              %>
            </table>
            <br>

                 <input id="btnok" type="submit" value="Listo"/>
          </form>
         </div>


            <%
                        }
                  }





        %>

            <%-- De aqui para aalla--%>



            </div>
    </div>
  <%-- De aqui para aalla--%>
    <div id="fragment-2">
                <div id="accordion2">

            <%
            //     List<Variable> variables = new ArrayList<Variable>();
              //    VariableDaoImpl vdi = new VariableDaoImpl();

                  variables = vdi.findAll();
                //  int n = variables.size();

                  for(int i = 0; i<n ; i++){
                         Indicador ind = new Indicador();
                         // IndicadorDaoImpl idi = new IndicadorDaoImpl();
                         ind = variables.get(i).getIndicador();
                         int nind = ind.getIdIndicador();

                        if(nind == 2)
                      {
                            String v = variables.get(i).getNombre();
                            //HttpSession s = request.getSession();
                            //int idVari[0] = variables.get(i).getIdVariable();

                            //s.setAttribute("idvariable", idVari[i]);

                       %>
            <h3><a href="#"><%out.print(v); %></a></h3>
	<div>

            <form action="proof.jsp" method="get">
                <table id="mitabla"  >
                <tr>
                    <td>Pregunta </td>
                    <td>Si/No</td>
                    <td>Observaciones</td>
                </tr>

                            <%
                                    List<Item> item = new ArrayList<Item>();
                                     ItemDaoImpl idim = new ItemDaoImpl();
                                         item = idim.findAll();
                                         int ci = item.size();

                                              for(int mi = 0; mi<ci; mi++){
                                                  Variable var = new Variable();
                                                  var = item.get(mi).getVariable();
                                                   int nvar = var.getIdVariable();
                                                   int idv = variables.get(i).getIdVariable();
                                                       //VariableDaoImpl vdim = new VariableDaoImpl();

                                                   //var = vdim.findByIndicador(nvar);
                                                   //String varn = var.getNombre();
                                                  if(nvar == idv){


                                                               String itemout = item.get(mi).getDescripcion();
                                                               int iditem = item.get(mi).getIdItem();
                                                      %>

                                                          <tr>
                                                              <td><label id="item<% out.print(iditem); %>" ><%out.print(itemout); %></label></td>
                                                          <td><input id="check<% out.print(iditem); %>" type="checkbox"/> </td>
                                                          <td><input id="obser<%  out.print(iditem); %>" type="textbox"/> </td>

                                                      </tr>
                                                                <%

                                                  }

                                                  }
                              %>
            </table>
            <br>

                 <input id="btnok" type="submit" value="Listo"/>
          </form>
         </div>


            <%
                        }
                  }





        %>

         </div>
    </div>

    <div id="fragment-3">
       <div id="accordion3">

<%
                 //List<Variable> variables = new ArrayList<Variable>();
                  //VariableDaoImpl vdi = new VariableDaoImpl();

                  variables = vdi.findAll();
                  //int n = variables.size();

                  for(int i = 0; i<n ; i++){
                         Indicador ind = new Indicador();
                         // IndicadorDaoImpl idi = new IndicadorDaoImpl();
                         ind = variables.get(i).getIndicador();
                         int nind = ind.getIdIndicador();

                        if(nind == 3)
                      {
                            String v = variables.get(i).getNombre();
                            //HttpSession s = request.getSession();
                            //int idVari[0] = variables.get(i).getIdVariable();

                            //s.setAttribute("idvariable", idVari[i]);

                       %>
            <h3><a href="#"><%out.print(v); %></a></h3>
	<div>

            <form action="saveRespItem" method="post">
                <table id="mitabla"  >
                <tr>
                    <td>Pregunta </td>
                    <td>Si/No</td>
                    <td>Observaciones</td>
                </tr>

                            <%
                                    List<Item> item = new ArrayList<Item>();
                                     ItemDaoImpl idim = new ItemDaoImpl();
                                         item = idim.findAll();
                                         int ci = item.size();

                                              for(int mi = 0; mi<ci; mi++){
                                                  Variable var = new Variable();
                                                  var = item.get(mi).getVariable();
                                                   int nvar = var.getIdVariable();
                                                   int idv = variables.get(i).getIdVariable();
                                                       //VariableDaoImpl vdim = new VariableDaoImpl();

                                                   //var = vdim.findByIndicador(nvar);
                                                   //String varn = var.getNombre();
                                                  if(nvar == idv){

                                                                // HttpSession s = request.getSession();
                                                                 //int idVari = variables.get(i).getIdVariable();

                                                                 //s.setAttribute("idvariable", idVari);

                                                                 String itemout = item.get(mi).getDescripcion();
                                                               int iditem = item.get(mi).getIdItem();
                                                      %>

                                                          <tr>
                                                              <td><label id="item" ><%out.print(itemout); %></label></td>
                                                              <td><input id="check<% out.print(iditem); %>" name="check<%=iditem%>" type="checkbox"/> </td>
                                                          <td><input id="obser<%  out.print(iditem); %>" name="obser<%=iditem%>" value="HOLA<%=iditem%>" type="textbox"/> </td>
                                                          <td><input id="var" style=" visibility: hidden  " name="idvariable" value="<%= variables.get(i).getIdVariable() %>"  /></td>
                                                      </tr>
                                                                <%

                                                  }

                                                  }
                              %>
            </table>
            <br>

                 <input id="btnok" type="submit" value="Listo"/>
          </form>
         </div>


            <%
                        }
                  }





        %>

            <%-- De aqui para aalla--%>


    </div>
    </div>
                <div id="fragment-4">


        <div id="accordion4">

<%
                 //List<Variable> variables = new ArrayList<Variable>();
                  //VariableDaoImpl vdi = new VariableDaoImpl();

                  variables = vdi.findAll();
                  //int n = variables.size();

                  for(int i = 0; i<n ; i++){
                         Indicador ind = new Indicador();
                         // IndicadorDaoImpl idi = new IndicadorDaoImpl();
                         ind = variables.get(i).getIndicador();
                         int nind = ind.getIdIndicador();

                        if(nind == 4)
                      {
                            String v = variables.get(i).getNombre();
                            //HttpSession s = request.getSession();
                            //int idVari[0] = variables.get(i).getIdVariable();

                            //s.setAttribute("idvariable", idVari[i]);

                       %>
            <h3><a href="#"><%out.print(v); %></a></h3>
	<div>

            <form action="saveRespItem" method="post">
                <table id="mitabla"  >
                <tr>
                    <td>Pregunta </td>
                    <td>Si/No</td>
                    <td>Observaciones</td>
                </tr>

                            <%
                                    List<Item> item = new ArrayList<Item>();
                                     ItemDaoImpl idim = new ItemDaoImpl();
                                         item = idim.findAll();
                                         int ci = item.size();

                                              for(int mi = 0; mi<ci; mi++){
                                                  Variable var = new Variable();
                                                  var = item.get(mi).getVariable();
                                                   int nvar = var.getIdVariable();
                                                   int idv = variables.get(i).getIdVariable();
                                                       //VariableDaoImpl vdim = new VariableDaoImpl();

                                                   //var = vdim.findByIndicador(nvar);
                                                   //String varn = var.getNombre();
                                                  if(nvar == idv){

                                                                // HttpSession s = request.getSession();
                                                                 //int idVari = variables.get(i).getIdVariable();

                                                                 //s.setAttribute("idvariable", idVari);

                                                                 String itemout = item.get(mi).getDescripcion();
                                                               int iditem = item.get(mi).getIdItem();
                                                      %>

                                                          <tr>
                                                              <td><label id="item" ><%out.print(itemout); %></label></td>
                                                              <td><input id="check<% out.print(iditem); %>" name="check<%=iditem%>" type="checkbox"/> </td>
                                                          <td><input id="obser<%  out.print(iditem); %>" name="obser<%=iditem%>" value="HOLA<%=iditem%>" type="textbox"/> </td>
                                                          <td><input id="var" style=" visibility: hidden  " name="idvariable" value="<%= variables.get(i).getIdVariable() %>"  /></td>
                                                      </tr>
                                                                <%

                                                  }

                                                  }
                              %>
            </table>
            <br>

                 <input id="btnok" type="submit" value="Listo"/>
          </form>
         </div>


            <%
                        }
                  }





        %>

            <%-- De aqui para aalla--%>



        </div>

                </div>


            </div>










    </body>
</html>
