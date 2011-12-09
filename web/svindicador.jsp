<%@page import="daoImpl.IndicadorDaoImpl"%>
<%
        String indi = request.getParameter("indicador");
        Double contribucion = Double.parseDouble(request.getParameter("contribucion"));
        Double s4 = Double.parseDouble(request.getParameter("s4"));

        IndicadorDaoImpl idi = new IndicadorDaoImpl();
        idi.create(new pojo.Indicador(indi, contribucion, s4));
%>
<h4> <%= indi%> ha sido guardado exitosamente con contrib <%=contribucion%> y s <%=s4%> </h4>

