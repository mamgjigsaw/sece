<%-- 
    Document   : tableSugerencias
    Created on : 31-ene-2012, 15:27:58
    Author     : Mendieta
--%>

<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="daoImpl.SugerenciaDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page import="pojo.Sugerencia"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.AsignacionSugItemDaoImpl"%>
<%@page import="pojo.AsignacionSugItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript" src="/sece/dwr/interface/updates.js"></script>
         <script type="text/javascript" src="/sece/dwr/interface/instrumentoDWR.js"></script>
         <script type="text/javascript" src="/sece/dwr/engine.js"></script>
         <script type="text/javascript" src="/sece/dwr/util.js"></script>
          <script type="text/javascript" src="resources/jquery/js/jquery.multiselect.js"></script>
          <script type="text/javascript" src="resources/jquery/js/jquery.multiselect.filter.js"></script>
           <link type="text/css" href="resources/jquery/css/redmond/jquery.multiselect.css" rel="stylesheet" />
          <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
        <script type="text/javascript">
             $(function() 
                 { 
                     
                 
                 $("#sugerencias")
                 .tablesorter({widthFixed: true, widgets: ['zebra']})
                 .tablesorterPager({container: $("#pagerSugerencia")}); 
               
            } 
             );
                 $(document).ready(function(){
                      $("#selectI").multiselect().multiselectfilter();
                 });
        </script> 
        <script>           
            function updateSuge(id, suger){            
            
            document.getElementById('idS').value= id; 
             document.getElementById('sugerencia').value= suger; 
             
             document.getElementById('updateS').style.display = 'block';          
            
            };
            function deleteSuge(id, i, s){
                if(confirm('¿Esta seguro que desea eliminar la relación entre: '+ i + ' y ' + s +'?')){
                    updates.deleteAsignacionS(id);
                    
                    location.reload();
                }
                
            };  
            function actualizarS(){
               var ids = $("#idS").val();
               var sI = $("#selectI").val();
                              
                   instrumentoDWR.newAsigSug(ids,sI);
                   location.reload();
                             
            }
            
        </script>
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" />
        
        <div id="pagerSugerencia">
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
        <div align="center" >
            <table id="sugerencias" class="tablesorter" cellspacing="1">
                                                                 <thead>
                                                                     <tr>
                                                                         <th>Items</th>
                                                                         <th>Sugerencias</th> 
                                                                         <th>Acciones</th>
                                                                     </tr>
                                                                 </thead>  
                                                                 <tbody>
                 <%           AsignacionSugItem asi = new AsignacionSugItem();
                              AsignacionSugItemDaoImpl asidi = new AsignacionSugItemDaoImpl();                                           
                              List<AsignacionSugItem> listAsignacion = asidi.findAll();                                           
                              Iterator<AsignacionSugItem> iteratorA = listAsignacion.iterator();        
                              Sugerencia s = new Sugerencia();
                              Item item = new Item();
                             while(iteratorA.hasNext()){
                                  asi = iteratorA.next();
                                  ItemDaoImpl itdi = new ItemDaoImpl();
                                   SugerenciaDaoImpl sdi = new SugerenciaDaoImpl();                                                                                                   
                                  item = asi.getItem();
                                  String itemSug = itdi.findById(item.getIdItem()).getDescripcion();
                                  s = asi.getSugerencia();
                                  String sugerencia = sdi.findById(s.getIdSugerencia()).getDescripcion();
                          %>
                                  <tr>
                                      <td><%= itemSug %></td>
                                      <td><%= sugerencia %></td>
                                      <td>
                                           <a style="cursor: pointer" onclick="updateSuge('<%= s.getIdSugerencia().toString() %>', '<%= sugerencia  %>');" title="Editar Sugerencia"><img src="images/icon_edit.png" alt="Edit" /></a>
                                           <a style="cursor: pointer" onclick="deleteSuge('<%= asi.getIdAsignSug() %>', '<%= itemSug %>', '<%= sugerencia %>');" title="Eliminar Relación"><img src="images/icon_delete.png" alt="Delete" /></a>
                                      </td>
                                  </tr>       
                             <%}
                                                               
%>  
                                                                 </tbody>  
        
            </table>
        
            
                                                                 
                  
            <div id="updateS" class="divPanel" style=" margin-top: -40px; display: none; font-size: 13px; padding-top: 5px; width: 920px; height: 80px;" align="center" title="Cambie los datos">
              <form>                 
                     <input type="hidden" id="idS"/>
                     <table>
                          <tr>
                             <td>Sugerencia:</td>
                             <td><input id="sugerencia" disabled="true" style="width:250px" value="" type="text"/></td>
                             <td>&nbsp; &nbsp;</td>
                             <td>Asociar a Items:</td>
                             <td><select id="selectI" style="width: 450px;">
                                                <%
                                                 Item it = new Item();
                                                 ItemDaoImpl idi = new ItemDaoImpl();
                                                 
                                                 List<Item> listIt = idi.findAll();
                                                 Iterator<Item> itit = listIt.iterator();
                                                 while(itit.hasNext()){
                                                     it = itit.next();
                                                     if(it.getEstado()==1){%>
                                                     <option value="<%= it.getIdItem().toString() %>"><%= it.getDescripcion() %></option> 
                                                     
                                                     <%}                                             
 }                                                                                                                                                                                                                                                
%>
                                            </select>
                             </td>                            
                          </tr>              
                     </table>
                     <input type="button" onclick=" actualizarS();" id="actS" value="Guardar Cambios"/>
                     <input type="button" onclick="document.getElementById('updateS').style.display= 'none';" id="canS" value="Cancelar"/>
             </form>
            </div> 
                                                                 
                                                                 
        </div>
