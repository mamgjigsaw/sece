<%
  String id = request.getParameter("id");
  String nombre = request.getParameter("dato1");
  Boolean es = Boolean.parseBoolean(request.getParameter("estado1"));
  String estado ="";
  if (es)
       estado = "checked";  

%>
<form id="modificarItem" method="post" action="updateItem">
<table>
    <tr><th> ID</th>
        <td><input name="txtmodid" value="<%=id%>" readonly/></td> </tr>
    <tr><th> Descripcion</th>
        <td><textarea name="txtmoditem" cols="30" rows="5"><%=nombre%></textarea></td> </tr>
    <tr><td colspan="2"> <input type="checkbox" name="modchkitem" <%=estado%>/> Activo </td> </tr>
    <tr> <td colspan="2"> <button type="submit">Modificar</button></td> </tr>
</table>
</form>
