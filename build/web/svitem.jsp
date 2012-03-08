<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Variable"%>
<% 
String vari = request.getParameter("selvariable");
String item = request.getParameter("txtitem");
Boolean estado = Boolean.parseBoolean(request.getParameter("chkitem"));
if (!estado)
    estado = false;

VariableDaoImpl vdi = new VariableDaoImpl();
Variable variable = vdi.findByName(vari);
ItemDaoImpl idi = new ItemDaoImpl();
idi.create(new pojo.Item(variable, item, new java.util.Date(), estado));


%>

<h4>Variable: <%=variable%> <br> item: <%=item%> <br> fecha:<%=new java.util.Date()%>  </h4>
