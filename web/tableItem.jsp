<%-- 
    Document   : tableItem
    Created on : 27-ene-2012, 12:24:20
    Author     : Mendieta
--%>

<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
         <script type="text/javascript" src="/sece/dwr/interface/updates.js"></script>
         <script type="text/javascript" src="/sece/dwr/engine.js"></script>
         <script type="text/javascript" src="/sece/dwr/util.js"></script>
           <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
         <script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
           <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
            <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/tablesorter_filter.js"></script>
        <script type="text/javascript">
             $(function() 
                 { 
                 $("#items")
                 .tablesorter({widthFixed: true, widgets: ['jfilterselect','zebra']})
                 .tablesorterPager({container: $("#pagerItem")})
                 ; 
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
            var itemV;
            var variaV;
            function updateIte(idI, nombre, idin, varia){            
            itemV = nombre;
            variaV = varia;
            document.getElementById('idite').value= idI; 
             document.getElementById('ite').value= nombre;              
              document.getElementById('varite').value = idin; 
                 
             document.getElementById('updateI').style.display = 'block';          
            
            };
            function deleteItem(id, i){
                if(confirm('¿Esta seguro que desea eliminar el Item: '+ i +'?')){
                    updates.deleteItem(id);
                    validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 35, "Elimino un Item",id, "Estado Activo", "Estado Inactivo");
                    location.reload();
                }
                
            };  
            function actualizarI(){
               var index = document.getElementById('varite').selectedIndex;
               var varItemN = document.getElementById('varite').options[index].text;
               var id = $("#idite").val();
               var nite = $("#ite").val();
               
               var idva = $("#varite").val();
               if(id == "" || nite == ""|| idva == ""){
                   alert("Llene los campos por favor");
               }else{
                   updates.updateItem(id, nite, idva);
                   validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 8, "Modifico Item",id, itemV + ", " + variaV , nite + ", " + varItemN);
                   location.reload();
               }                
            }
            
        </script>
        
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" /> 
        <div id="pagerItem">
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
            
        <table id="items" class="tablesorter" cellspacing="1">
                                                                 <thead>
                                                                     <tr>
                                                                         <th>Item</th>
                                                                         <th>Estado</th>
                                                                         <th jFilterSelect="1">Variable</th>
                                                                         <th>Acciones</th>
                                                                     </tr>
                                                                 </thead>  
                                                                 <tbody>
                                                                 <% 
                                               Item item = new Item();
                                               ItemDaoImpl itemDI = new ItemDaoImpl();
                                               Variable va = new Variable();                                               
                                               VariableDaoImpl vdim = new VariableDaoImpl();                                                                                                                                         
                                               List<Item> listItem = itemDI.findAll();
                                               Iterator<Item> itItem = listItem.iterator();
                                               while(itItem.hasNext()){
                                               item = itItem.next();
                                               String stateItem = "Inactivo";
                                               if(item.getEstado() == 1){ stateItem = "Activo";}
                                               va = item.getVariable();
                                               String varItem = vdim.findById(va.getIdVariable()).getNombre();
%>
                                                                 <tr>
                                                                     <td><%= item.getDescripcion() %></td>
                                                                     <td><%= stateItem %></td>
                                                                     <td><%= varItem %></td>
                                                                     <td>
                                                                          <a style="cursor: pointer" onclick="updateIte('<%= item.getIdItem().toString() %>', '<%= item.getDescripcion() %>', '<%= va.getIdVariable().toString() %>', '<%= varItem %>');" title="Editar Item"><img src="images/icon_edit.png" alt="Edit" /></a>
                                                                          <a style="cursor: pointer" onclick="deleteItem('<%= item.getIdItem().toString() %>', '<%= item.getDescripcion() %>');" title="Inactivar Item"><img src="images/icon_delete.png" alt="Delete" /></a>
                                                                      </td>
                                                                 </tr>

                                               <%
                                               }%>                                                                               
                                                                 </tbody>
                                                         </table>
                                                                 
        
                                                                 
     <div id="updateI" class="divPanel" style=" margin-top: -40px; display: none; font-size: 13px; padding-top: 5px; width: 900px; height: 65px;" align="center" title="Cambie los datos">
              <form>                 
                     <input type="hidden" id="idite"/>
                     <table>
                          <tr>
                             <td>Item:</td>
                             <td><input id="ite" style="width:40em" value="" type="text"/></td>                             
                             <td>&nbsp; &nbsp;</td>
                              <td>Indicador:</td>
                              <td><select id="varite" style="width:15em">
                                      <% 
                                         List<Variable> listV = vdim.findAll();
                                         Iterator<Variable> itV = listV.iterator();
                                          while(itV.hasNext()){
                                              va = itV.next();
                                               if(va.getEstado() == true){
                                               %>
                                               <option value="<%= va.getIdVariable().toString() %>"><%= va.getNombre() %></option>
                                               <%}
    }                                                                                                                      
%>
                                  </select> 
                              </td>
                          </tr>              
                     </table>
                     <input type="button" onclick="actualizarI();" id="actIte" value="Guardar Cambios"/>
                     <input type="button" onclick="document.getElementById('updateI').style.display= 'none';" id="canIte" value="Cancelar"/>
             </form>
            </div> 
        </div>
                                 