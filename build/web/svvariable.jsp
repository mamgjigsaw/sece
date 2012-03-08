<%@page import="java.util.Enumeration"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Indicador"%>
<%

String indi = request.getParameter("selindicador");
IndicadorDaoImpl idi = new IndicadorDaoImpl();
Indicador indicador = idi.findByName(indi);


String variable = request.getParameter("txtvariable");
int ponderacion = Integer.parseInt(request.getParameter("txtponderacion"));
int s = Integer.parseInt(request.getParameter("txts"));
Boolean estado  = Boolean.parseBoolean(request.getParameter("chkok"));
    if(estado == null)
        estado = false;

VariableDaoImpl vdi = new VariableDaoImpl();
vdi.create(new pojo.Variable(indicador, variable,estado, ponderacion, s ));
    


/*Enumeration params = request.getParameterNames();
if (params != null){
    while(params.hasMoreElements()){
        String parametro = (String) params.nextElement();
        valor = request.getParameter(parametro);

    }

}*/

%>

<h4>La variable es: <%=variable%> <br> indicador: <%=indi%> <br> ponderacion: <%=ponderacion%> <br> s:  <%=s%> <br> estado: <%=estado%></h4>


