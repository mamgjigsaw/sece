<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Indicador"%>

<script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
<script type="text/javascript" src="resources/jquery/js/jquery.form.js"></script>
<script type="text/javascript">
function cambioVar(){
$("#selvariable2 option:selected").each(function(){
    var str = $(this).text();    
    $.ajax({
        type: "POST",
        url: "cambioVariable.jsp?dato2="+str,
        success: function(data){$('#ModVariable2').html(data);}
    });
});
}
</script>

<%String indicador = request.getParameter("dato1");
 VariableDaoImpl vdi = new VariableDaoImpl();
 IndicadorDaoImpl idi = new IndicadorDaoImpl();
 Indicador indi = idi.findByName(indicador);
 List variables = vdi.findAllInd(indi.getIdIndicador());

%>

<select id="selvariable2" name="selvariable2" onchange="cambioVar()"> <option></option> <%for(int i=0;i<variables.size();i++) { Variable vari = (Variable) variables.get(i);%> <option><%=vari.getNombre()%></option><%}%></select>
<div id="ModVariable2"></div>