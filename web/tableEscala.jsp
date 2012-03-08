<%-- 
    Document   : tableEscala
    Created on : 31-ene-2012, 0:11:21
    Author     : Mendieta
--%>


        <%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.EscalaDaoImpl"%>
<%@page import="pojo.Escala"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript" src="/sece/dwr/interface/updates.js"></script>
         <script type="text/javascript" src="/sece/dwr/engine.js"></script>
         <script type="text/javascript" src="/sece/dwr/util.js"></script>
          <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
         <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
        <script type="text/javascript">
             $(function() 
                 { 
                 $("#escalas")
                 .tablesorter({widthFixed: true, widgets: ['zebra']})
                 .tablesorterPager({container: $("#pagerEscala")}); 
                 } 
             );
        </script> 
        <script>           
            function updateEsc(idE, desc, val, variab, rm, rM){            
            
            document.getElementById('idEsc').value= idE; 
             document.getElementById('varia').value= variab;              
              document.getElementById('escala').value = desc; 
              document.getElementById('v').value = val; 
              document.getElementById('rmen').value = rm; 
              document.getElementById('rmay').value = rM; 
                 
             document.getElementById('updateE').style.display = 'block';          
            
            };            
            function actualizarE(){
               var id = $("#idEsc").val();
               var esca = $("#escala").val();
               var rangomenor = $("#rmen").val();
               var rangomayor = $("#rmay").val();
               
               if(esca == "" || rangomenor =="" || rangomayor =="" ){
                   alert("Llene los campos por favor");
               }else{
                   updates.updateEscala(id,esca, rangomenor, rangomayor);
                   location.reload();
               }                
            }
            
        </script>
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" /> 
        <div style="padding-top: 20px;" align="center" >
            <table id="escalas" class="tablesorter" cellspacing="1">
                                                                 <thead>
                                                                     <tr>
                                                                         <th>Escala/Descripci&oacuten</th>
                                                                         <th>Variable</th>
                                                                         <th>Rango Menor</th>
                                                                         <th>Rango Mayor</th>
                                                                          <th>Valoraci&oacuten</th>
                                                                         <th>Editar</th>
                                                                     </tr>
                                                                 </thead>  
                                                                 <tbody>
                                     <% 
                                               Escala esc = new Escala();
                                               EscalaDaoImpl edimp = new EscalaDaoImpl();
                                               Variable va = new Variable();                                               
                                               VariableDaoImpl vdim = new VariableDaoImpl();                                                                                                                                         
                                               List<Escala> listEscala = edimp.findAll();
                                               Iterator<Escala> itEscala = listEscala.iterator();
                                               while(itEscala.hasNext()){
                                               esc = itEscala.next();                                 
                                               va = esc.getVariable();
                                               String varEscala = vdim.findById(va.getIdVariable()).getNombre();
                                               String ranMen = esc.getRangoMenor().toString();
                                               String ranMay = esc.getRangoMayor().toString();
%>
                                                                 <tr>
                                                                     <td><%= esc.getDescripcion() %></td>
                                                                     <td><%= varEscala %></td>
                                                                     <td><%= ranMen %></td>
                                                                     <td><%= ranMay %></td>
                                                                     <td><%= esc.getValoracion() %></td>
                                                                     <td><a href="#" title="Editar Escala" onclick="updateEsc('<%= esc.getIdEscala().toString() %>', '<%= esc.getDescripcion() %>', '<%= esc.getValoracion() %>','<%= varEscala %>','<%= ranMen %>','<%= ranMay %>' )">Editar</a> </td>
                                                                 </tr>

                                               <%
                                               }%>    
                                                                 </tbody>
            </table>
                        <div id="pagerEscala">
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
            
                     
            <div id="updateE" class="divPanel" style=" margin-top: -40px; display: none; font-size: 13px; padding-top: 5px; width: 1030px; height: 70px;" align="center" title="Cambie los datos">
              <form>                 
                     <input type="hidden" id="idEsc"/>
                     <table>
                          <tr>
                             <td>Variable:</td>
                             <td><input id="varia" disabled="true" style="width:15em" value="" type="text"/></td>
                             <td>&nbsp; &nbsp;</td>
                             <td>Escala/Descripci&oacuten:</td>
                             <td><input id="escala" style="width:30em" value="" type="text"/></td>
                             <td>Rango Menor:</td>
                             <td><input id="rmen" style="width:25px" value="" type="text"/></td>
                             <td>Rango Mayor:</td>
                             <td><input id="rmay" style="width:25px" value="" type="text"/></td>
                             <td>&nbsp; &nbsp;</td>
                             <td>Valor:</td>
                             <td><input id="v" disabled="true" style="width:20px" value="" type="text"/></td>
                          </tr>              
                     </table>
                     <input type="button" onclick=" actualizarE();" id="actE" value="Guardar Cambios"/>
                     <input type="button" onclick="document.getElementById('updateE').style.display= 'none';" id="canE" value="Cancelar"/>
             </form>
            </div> 
                                                                 
            
        </div>
