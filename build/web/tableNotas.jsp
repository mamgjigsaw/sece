<%-- 
    Document   : tableNotas
    Created on : 02-may-2012, 14:58:43
    Author     : Mendieta
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.NoticiasDaoImpl"%>
<%@page import="pojo.Noticias"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/sece/dwr/interface/updates.js"></script>
         <script type="text/javascript" src="/sece/dwr/engine.js"></script>
         <script type="text/javascript" src="/sece/dwr/util.js"></script>
          <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
          <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
         <script type="text/javascript" src="resources/tablesorter/js/jquery.js"></script> 
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.js"></script>
        <script type="text/javascript" src="resources/tablesorter/js/jquery.tablesorter.pager.js"></script>
        <script type="text/javascript">
             
            
            $(function() 
                 { 
                 $("#notas")
                 .tablesorter({widthFixed: true, widgets: ['zebra']})
                 .tablesorterPager({container: $("#pagerNotas")}); 
             
         } 
                 
                 
                
                 
             );
                 
                  $( "#dateUpdate" ).datepicker({
			changeMonth: true,
			changeYear: true,
                        dateFormat: 'dd/mm/yy',
                        showAnim: "slideDown"
		})
        </script> 
        <%                    Usuario usua = new Usuario();
                              UsuarioDaoImpl usuaDI = new UsuarioDaoImpl();
                               usua = usuaDI.findAdministrador();
                               Acceso ac = new Acceso();
                               AccesoDaoImpl acDI = new AccesoDaoImpl();
                                ac = acDI.findUltimoAcceso(usua);
                                     %>
<script>           
            var tit;
            var descr;
            var datef;
            function updateNot(idnot, titulo, desc, fecha){            
              tit = titulo;          
              descr = desc;
              datef = fecha;
            document.getElementById('idnoti').value= idnot; 
             document.getElementById('titu').value= titulo; 
              document.getElementById('descrip').value= desc;
              document.getElementById('dateUpdate').value = fecha;
                 
             document.getElementById('updateN').style.display = 'block';        
            
            };
            function deleteNot(idn, n){
                if(confirm('¿Esta seguro que desea eliminar la Nota con titulo: '+ n +'?')){
                    updates.deleteNota(idn);
                    validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 29, "Elimino una Nota",idn, "La Nota ha sido Eliminada", "Eliminada");
                    location.reload();
                }
                
            };  
            function actualizarN(){
                
               var id = $("#idnoti").val();
               var nNot = $("#titu").val();
               var uDesc = $("#descrip").val();
               var uDate = $("#dateUpdate").val();
               
               if(uDesc == "" || nNot == ""|| uDate == ""){
                   alert("Llene los campos por favor");
               }else{
                   updates.updateNoticias(id, nNot, uDesc, uDate);
                   validacion.saveActionBitacora(<%= ac.getIdAcceso().toString() %>, 30, "Modifico Nota",id, tit + ", " + descr + ", " + datef, nNot + ", " + uDesc + ", " + uDate);
                   location.reload();
               }     
            }
            
        </script>                                     
                                     
        <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" /> 
                    <div id="pagerNotas">
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
        <div style="" align="center" >
            <table id="notas" class="tablesorter" cellspacing="1">
                                                                 <thead>
                                                                     <tr>
                                                                         <th>T&iacutetulo</th>
                                                                         <th>Descripci&oacuten</th>
                                                                         <th>Fecha de Evento</th>                                                                         
                                                                         <th>Editar</th>
                                                                     </tr>
                                                                 </thead>  
                                                                 <tbody>
                                     <% 
                                              Noticias not = new Noticias();
                                               NoticiasDaoImpl notDI = new NoticiasDaoImpl();
                                                SimpleDateFormat dateConverter = new SimpleDateFormat("dd/MM/yyyy");                                                                                                                                       
                                               List<Noticias> listNot = notDI.findAll();
                                               Iterator<Noticias> itNot = listNot.iterator();
                                               while(itNot.hasNext()){
                                               not = itNot.next();  
                                               String fechaNE = dateConverter.format(not.getFecha_evento());                                                                               
%>                                             
                                                                 <tr>
                                                                     <td><%= not.getTitulo() %></td>
                                                                     <td><%= not.getDescripcion() %></td>
                                                                     <td><%= fechaNE %></td>                                                                     
                                                                     <td><a style="cursor: pointer" href="#" title="Editar Nota" onclick="updateNot('<%= not.getIdNoticias().toString() %>','<%= not.getTitulo() %>', '<%= not.getDescripcion() %>', '<%= fechaNE %>')"><img src="images/icon_edit.png" alt="Edit" /></a> 
                                                                         <a style="cursor: pointer" href="#" title="Eliminar Nota" onclick="deleteNot('<%= not.getIdNoticias().toString() %>','<%= not.getTitulo() %>')"><img src="images/icon_delete.png" alt="Edit" /></a> 
                                                                     </td>
                                                                 </tr>

                                               <%
                                               }%>    
                                                                 </tbody>
            </table>
                                                                 
                                                                 
                                                                 
      <div id="updateN" class="divPanel" style=" margin-top: -40px; display: none; font-size: 13px; padding-top: 5px; width: 900px; height: 65px;" align="center" title="Cambie los datos">
              <form>                 
                     <input type="hidden" id="idnoti"/>
                     <table>
                          <tr>
                              <td>T&iacutetulo:</td>
                             <td><input id="titu" style="width:15em" value="" type="text"/></td>
                             <td>&nbsp; &nbsp;</td>
                             <td>Descripci&oacuten:</td>
                             <td><input id="descrip" style="width:25em" value="" type="text"/></td>
                             <td>&nbsp; &nbsp;</td>
                              <td>Fecha:</td>
                              <td><input type="text" id="dateUpdate"/> </td>
                          </tr>              
                     </table>
                     <input type="button" onclick=" actualizarN();" id="actVar" value="Guardar Cambios"/>
                     <input type="button" onclick="document.getElementById('updateN').style.display= 'none';" id="canVar" value="Cancelar"/>
             </form>
     </div> 
</html>
