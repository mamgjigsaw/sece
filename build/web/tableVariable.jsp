<%-- 
    Document   : tableVariable
    Created on : 27-ene-2012, 12:14:56
    Author     : Mendieta
--%>

<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Indicador"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
         <script type="text/javascript" src="/sece/dwr/interface/updates.js"></script>
         <script type="text/javascript" src="/sece/dwr/engine.js"></script>
         <script type="text/javascript" src="/sece/dwr/util.js"></script>
          <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
        <script type="text/javascript">
             $(function() 
                 { 
                 $("#variables")
                 .tablesorter({widthFixed: true, widgets: ['zebra']})
                 .tablesorterPager({container: $("#pagerVariables")}); 
                     
             } 
             );
        </script> 
                              <% Usuario usua = new Usuario();
                              UsuarioDaoImpl usuaDI = new UsuarioDaoImpl();
                               usua = usuaDI.findAdministrador();
                               Acceso ac = new Acceso();
                                 AccesoDaoImpl acDI = new AccesoDaoImpl();
                                ac = acDI.findUltimoAcceso(usua);
                                     %>
        <script>           
            var variV;
            var ponV;
            var indiV;
            function updateVar(idvar, nombre, pon, idin, nombreIndi){            
              variV = nombre;          
              ponV = pon;
              indiV = nombreIndi;
            document.getElementById('idvari').value= idvar; 
             document.getElementById('vari').value= nombre; 
              document.getElementById('pond').value= pon;
              document.getElementById('indvari').value = idin; 
                 
             document.getElementById('updateV').style.display = 'block';          
            
            };
            function deleteVar(idv, v){
                if(confirm('¿Esta seguro que desea eliminar la Variable: '+ v +'?')){
                    updates.deleteVariable(idv);
                    validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 33, "Elimino una Variable",idv, "Estado Activo", "Estado Inactivo");
                    location.reload();
                }
                
            };  
            function actualizarV(){
                var index = document.getElementById('indvari').selectedIndex;
                var IndicadorVarNew = document.getElementById('indvari').options[index].text;
               var id = $("#idvari").val();
               var nVar = $("#vari").val();
               var p = $("#pond").val();
               var idI = $("#indvari").val();
               
               if(id == "" || nVar == ""|| p == ""){
                   alert("Llene los campos por favor");
               }else{
                   updates.updateVariables(id, nVar, p, idI);
                   validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 4, "Modifico Variable",id, variV + ", " + ponV + ", " + indiV, nVar + ", " + p + ", " + IndicadorVarNew);
                   location.reload();
               }     
            }
            
        </script>
        
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" />
                   <div id="pagerVariables">
	                 <form>
		                <img src="resources/tablesorter/icons/first.png" class="first"/>
		                <img src="resources/tablesorter/icons/prev.png" class="prev"/>
		                <input type="text" class="pagedisplay"/>
		                <img src="resources/tablesorter/icons/next.png" class="next"/>
		                <img src="resources/tablesorter/icons/last.png" class="last"/>
		                        <select class="pagesize">
			                <option selected="selected"  value="10">10</option>
			                <option value="20">20</option>			                
		                        </select>
	                  </form>
                       </div>
        <div align="center">
        <div  align="center" >
                  <table id="variables" class="tablesorter" cellspacing="1" >
                                                                 <thead>
                                                                     <tr>
                                                                         <th>Variable</th>
                                                                         <th>Ponderaci&oacuten</th>
                                                                         <th>Estado</th>
                                                                         <th>Indicador</th>
                                                                         <th>Acciones</th>
                                                                     </tr>
                                                                 </thead>  
                                                                 <tbody>
                                                               <%
                                           Variable va = new Variable();
                                           VariableDaoImpl vdim = new VariableDaoImpl();                                                                                                         
                                           
                                           Indicador indi = new Indicador();
                                           IndicadorDaoImpl idimp = new IndicadorDaoImpl();
                                           List<Variable> listVar = vdim.findAll();
                                           Iterator<Variable> iterVar = listVar.iterator();
                                           while(iterVar.hasNext()){
                                             va = iterVar.next();
                                             String stateVar = "Inactivo";
                                             if(va.getEstado() == true){ stateVar = "Activo"; }
                                             indi = va.getIndicador();
                                             int idindi = indi.getIdIndicador();   
                                             
                                              String indiVar = idimp.findById(idindi).getNombre();
%>
                                                                  <tr>
                                                                      <td><%= va.getNombre() %></td>
                                                                      <td><%= va.getPonderacion().toString() %></td>
                                                                      <td><%= stateVar %></td>
                                                                      <td><%= indiVar %></td>
                                                                      <td>
                                                                          <a style="cursor: pointer" onclick="updateVar('<%= va.getIdVariable().toString() %>', '<%= va.getNombre().toString() %>', '<%= va.getPonderacion().toString() %>', '<%= idindi %>', '<%= indiVar %>');" title="Editar Variable"><img src="images/icon_edit.png" alt="Edit" /></a>
                                                                          <a style="cursor: pointer" onclick="deleteVar('<%= va.getIdVariable().toString() %>', '<%= va.getNombre().toString() %>');" title="Inactivar Variable"><img src="images/icon_delete.png" alt="Delete" /></a>
                                                                      </td>
                                                                  </tr>

<%                                                                                                                                                                                                                  
                                           }
%>
                                                                     
                                                                     
                                                                 </tbody>                                                                                                                                 
                                                             </table>
                        
        </div>
   
         <div id="updateV" class="divPanel" style=" margin-top: -40px; display: none; font-size: 13px; padding-top: 5px; width: 900px; height: 65px;" align="center" title="Cambie los datos">
              <form>                 
                     <input type="hidden" id="idvari"/>
                     <table>
                          <tr>
                             <td>Variable:</td>
                             <td><input id="vari" style="width:25em" value="" type="text"/></td>
                             <td>&nbsp; &nbsp;</td>
                              <td>Ponderaci&oacuten:</td>
                             <td><input id="pond" style="width:5em" value="" type="text"/></td>
                             <td>&nbsp; &nbsp;</td>
                              <td>Indicador:</td>
                              <td><select id="indvari" style="width:15em">
                                      <% 
                                         List<Indicador> listI = idimp.findAll();
                                         Iterator<Indicador> itI = listI.iterator();
                                          while(itI.hasNext()){
                                              indi = itI.next();
                                               if(indi.getEstado() == true){
                                               %>
                                               <option value="<%= indi.getIdIndicador().toString() %>"><%= indi.getNombre() %></option>
                                               <%}
    }                                                                                                                      
%>
                                  </select> 
                              </td>
                          </tr>              
                     </table>
                     <input type="button" onclick=" actualizarV();" id="actVar" value="Guardar Cambios"/>
                     <input type="button" onclick="document.getElementById('updateV').style.display= 'none';" id="canVar" value="Cancelar"/>
             </form>
            </div> 
        </div>