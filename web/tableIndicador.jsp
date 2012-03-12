<%-- 
    Document   : tableInstrument
    Created on : 27-ene-2012, 11:05:55
    Author     : Mendieta
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Indicador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
          <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>           
          <script type="text/javascript" src="/sece/dwr/interface/updates.js"></script>
         <script type="text/javascript" src="/sece/dwr/engine.js"></script>
         <script type="text/javascript" src="/sece/dwr/util.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
        <script type="text/javascript">
             $(function() 
                 { 
                 $("#tableIndicador")
                 .tablesorter({widthFixed: true, widgets: ['zebra']})
                 .tablesorterPager({container: $("#pagerIndicador")}); 
                
             }              
             );
            
        </script>
       
        
        <script>           
            function updateInd(idind, nombre, cont){            
             document.getElementById('idIndi').value= idind;
             document.getElementById('indi').value= nombre;
              document.getElementById('contri').value= cont;
                 
             document.getElementById('updateI').style.display = 'block';          
            
            };
            function deleteInd(idind, indi){
                if(confirm('¿Esta seguro que desea eliminar el Indicador: '+ indi +'?')){
                    updates.deleteIndicador(idind);
                    location.reload();
                }
                
            };  
            function actualizarI(){
               var id = $("#idIndi").val();
               var nInd = $("#indi").val();
               var c = $("#contri").val();
               
               if(id == "" || nInd == ""|| c == ""){
                   alert("Llene los campos por favor");
               }else{
                   updates.updateIndicador(id, nInd, c);
                   location.reload();
               }                
            }
            
        </script>        
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" />
        <div id="pagerIndicador">
	                 <form>
		                <img src="resources/tablesorter/icons/first.png" class="first"/>
		                <img src="resources/tablesorter/icons/prev.png" class="prev"/>
		                <input type="text" class="pagedisplay"/>
		                <img src="resources/tablesorter/icons/next.png" class="next"/>
		                <img src="resources/tablesorter/icons/last.png" class="last"/>
		                        <select class="pagesize">
			                <option selected="selected" value="10">10</option>
			                <option value="20">20</option>			                
		                        </select>
	                  </form>
                       </div>
        <div align="center">
        <div align="center" >
        <table id="tableIndicador" class="tablesorter" cellspacing="1"> 
                          <thead>
                    	    <tr>                             
                              <th>Indicador</th>
                              <th>Contribuci&oacuten</th>
                              <th>Estado</th>
                              <th>Acciones</th>
                            </tr>
                         </thead>
                         <tbody>
                                                                    <%
                                      Indicador indi = new Indicador();
                                      IndicadorDaoImpl idimp = new IndicadorDaoImpl();
                             
                                       List<Indicador> listaIndicadores = idimp.findAll();
                                       Iterator<Indicador> iteratorInd = listaIndicadores.iterator();
                                       while(iteratorInd.hasNext()){
                                        indi = iteratorInd.next();                    
                                        String estateInd = "Inactivo";
                                        if(indi.getEstado() == true){
                                              estateInd = "Activo";        
                                        }                             
%>                               <tr>                                     
                                     <td><%= indi.getNombre() %></td>
                                     <td><%= indi.getContribucion().toString() %></td>
                                     <td><%= estateInd %></td>
                                     <td>
                                         <a onclick="updateInd('<%= indi.getIdIndicador().toString() %>', '<%= indi.getNombre().toString() %>', '<%= indi.getContribucion().toString() %>');" title="Editar Indicador"><img src="images/icon_edit.png" alt="Edit" /></a>
                                         <a onclick="deleteInd('<%= indi.getIdIndicador().toString() %>', '<%= indi.getNombre().toString() %>');" title="Inactivar un Indicador"><img src="images/icon_delete.png" alt="Delete" /></a>
                                     </td>
                                </tr>
            <%
            }    %>                                                        
                        </tbody> 
        </table> 
                        
                     
        </div>
            <div id="updateI" class="divPanel" style=" margin-top: -40px; display: none; font-size: 13px; padding-top: 5px; width: 600px; height: 60px;" align="center" title="Cambie los datos">
              <form>                 
                     <input type="hidden" id="idIndi"/>
                     <table>
                          <tr>
                             <td>Indicador:</td>
                             <td><input id="indi" style="width:15em" maxlength="50" value="" type="text"/></td>
                             <td>&nbsp; &nbsp;</td>
                              <td>Contribuci&oacuten:</td>
                             <td><input id="contri" style="width:15em" value="" type="text"/></td>
                          </tr>              
                     </table>
                     <input type="button" onclick=" actualizarI();" id="actIndi" value="Guardar Cambios"/>
                     <input type="button" onclick="document.getElementById('updateI').style.display= 'none';" id="canIndi" value="Cancelar"/>
             </form>
            </div>  
        </div>