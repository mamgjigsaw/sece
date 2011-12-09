<%@page import="pojo.Variable"%>
<%@page import="daoImpl.VariableDaoImpl"%>


<%VariableDaoImpl vdi = new VariableDaoImpl();
String dato = request.getParameter("dato2");
Variable var = vdi.findByName(dato);
String nombre = var.getNombre();
Integer pond = var.getPonderacion();
Integer s = 10;
Boolean es = var.getEstado();
String estado = "";
if(es)
    estado = "checked";
%>
<table>
    <tr><th> Variable</th>
        <td><input type="text" name="txtmodnombre" value="<%=nombre%>" /></td> </tr>

    <tr><th>Ponderacion</th>
        <td><input type="text" name="txtmodpond" value="<%=pond%>"  /> </td></tr>

    <tr><th>s</th>
        <td><input type="text" name="txtmods" value="<%=s%>"  /></td></tr>

    <tr><td colspan="2"> <input type="checkbox" name="modchkvar" <%=estado%> /> Activo </td> </tr>

</table>

