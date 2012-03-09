<%-- 
    Document   : admin_instrument
    Created on : 24-ene-2012, 15:32:57
    Author     : Mendieta
--%>

<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Indicador"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Acceso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <title>SECE</title>  
         <% HttpSession sesion=request.getSession();
        
           String val = (String)sesion.getAttribute("idAcc");
           if(val==null){
              response.sendRedirect("index.jsp");
           } else{     
                %> 
        <link rel="stylesheet" type="text/css" href="resources/css/styles.css"/>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
         <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" /> 
         <link type="text/css" href="resources/jquery/css/redmond/jquery.multiselect.css" rel="stylesheet" />
         <link href="resources/style.css" rel="stylesheet" type="text/css" />
           <link href="resources/css/message.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="/sece/dwr/interface/instrumentoDWR.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>        
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
         <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
         <script type="text/javascript" src="resources/jquery/js/jquery.multiselect.js"></script>
          <script type="text/javascript" src="resources/jquery/js/jquery.multiselect.filter.js"></script>
       <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" />   
              
        
        <script> 
           $(function(){
              $("#tabs").tabs();   
              $("#guardarIndi").button();
              $("#clearIndi").button();
              $("#guardarVar").button();
              $("#clearVar").button();
               $("#guardarItem").button();
               $("#guardarSuger").button();
              $("#clearSugerencia").button();
              $("#clearItem").button();
              
              $("#selectItem").multiselect().multiselectfilter();
            }); 
             function callback() {//function para esconder el div de mensaje con efecto
			setTimeout(function() {
				$( "#box_message:visible" ).removeAttr( "style" ).slideUp();//fadeOut();
			}, 1000 );
		};
            $( "#box_message" ).hide();//escondo el contenido del div para los mensajes
         </script>
         <script>
             //Javascript para Indicador
             function guardarIndicador(){
                var indicador = $("#nindicador").val();
                var contrib = $("#ncontri").val();
                       if(indicador == "" || contrib == ""){
                           var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Todos los datos son requeridos.</p></div><!-- /Notification --></section>";  
                       $("#box_message").html(palabra);               
                      $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje
                       }else if(!(/\d/.test(contrib))){
                        var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Dato Incorrecto</strong><p class='hola'>La contribución debe de ser un número real</p></div><!-- /Notification --></section>";  
                        $("#box_message").html(palabra);               
                        $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje 
                        }
                       else{                          
                          instrumentoDWR.newIndicador(indicador, contrib);                         
                          document.getElementById("fraIndi").src = "tableIndicador.jsp";
                          limpiarIndicador();
                       }                
             }
             
             function limpiarIndicador(){
                 document.getElementById("nindicador").value = "";
                 document.getElementById("ncontri").value = "";
             }
         </script>
         <script>
             //Javascript para Variable
             function guardarVariable(){
                var variable = $("#nvariable").val();
                var ponderacion = $("#nvarpon").val();
                var indicadorVar = $("#indNewVar").val();
                var esca4 = $("#escala4").val();
                var rmenor4 = $("#rm4").val();
                var rmayor4 = $("#rM4").val();
                var esca3 = $("#escala3").val();
                var rmenor3 = $("#rm3").val();
                var rmayor3 = $("#rM3").val();
                var esca2 = $("#escala2").val();
                var rmenor2 = $("#rm2").val();
                var rmayor2 = $("#rM2").val();
                var esca1 = $("#escala1").val();
                var rmenor1 = $("#rm1").val();
                var rmayor1 = $("#rM1").val();
                var esca0 = $("#escala0").val();
                var rmenor0 = $("#rm0").val();
                var rmayor0 = $("#rM0").val();
                                
                       if(variable == "" || ponderacion == "" || esca4 == "" || esca3 =="" || esca2== "" || esca1=="" || esca0 =="" || rmenor4 =="" || rmayor4 =="" || rmenor3 =="" || rmayor3 =="" || rmenor2 =="" || rmayor2 =="" || rmenor1 =="" || rmayor1 =="" || rmenor0 =="" || rmayor0 ==""){
                        var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Todos los datos son requeridos.</p></div><!-- /Notification --></section>";  
                       $("#box_message").html(palabra);               
                      $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje
                       }else if(!(/\d/.test(ponderacion, rmenor4, rmayor4, rmenor3, rmayor3, rmenor2, rmayor2, rmenor1, rmayor1, rmenor0, rmayor0))){
                        var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Dato Incorrecto</strong><p class='hola'>La Ponderacion y los rangos de respuestas deben de ser un número real</p></div><!-- /Notification --></section>";  
                        $("#box_message").html(palabra);               
                        $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje 
                        }
                       else{                          
                          instrumentoDWR.newVariable(variable, indicadorVar, ponderacion, esca4, esca3, esca2, esca1, esca0, rmenor4, rmayor4, rmenor3, rmayor3, rmenor2, rmayor2, rmenor1, rmayor1, rmenor0, rmayor0);                         
                          document.getElementById("fraVar").src = "tableVariable.jsp";
                          limpiarVariable();
                       }                
             }
             
             function limpiarVariable(){
                 document.getElementById("nvariable").value = "";
                 document.getElementById("nvarpon").value = "";
                 document.getElementById("escala4").value = "";
                 document.getElementById("escala3").value = "";
                 document.getElementById("escala2").value = "";
                 document.getElementById("escala1").value = "";
                 document.getElementById("escala0").value = "";
                 document.getElementById("rm4").value = "";
                 document.getElementById("rM4").value = "";
                 document.getElementById("rm3").value = "";
                 document.getElementById("rM3").value = "";
                 document.getElementById("rm2").value = "";
                 document.getElementById("rM2").value = "";
                 document.getElementById("rm1").value = "";
                 document.getElementById("rM1").value = "";
                 document.getElementById("rm0").value = "";
                 document.getElementById("rM0").value = "";
             }
         </script>
         <script>
             //Javascript para Item
             function guardarIt(){
                  
                var newitem = $("#newItemDesc").val();
                var variableItem = $("#varItem").val();
                
                       if(newitem == ""){
                         var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Favor, ingrese el Item.</p></div><!-- /Notification --></section>";  
                       $("#box_message").html(palabra);               
                      $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje
                       }
                       else{                            
                          instrumentoDWR.newItem(newitem, variableItem);                          
                          document.getElementById("fraItem").src = "tableItem.jsp";
                          limpiarItem();
                       }                
             }
             
             function limpiarItem(){
                 document.getElementById("newItemDesc").value = "";                 
             }
         </script>
         <script>
             //Javascript para Sugerencia
             function guardarSugerencia(){
                 var selecteds = $("#selectItem").val();
                 var suge = $("#txtsuge").val();
                 if(selecteds == null || suge == ""){
                    var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Ingrese los datos correctamente</p></div><!-- /Notification --></section>";  
                       $("#box_message").html(palabra);               
                      $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje 
                 }else{     
                            instrumentoDWR.newSugerencia(suge, selecteds);
                            document.getElementById("fraSug").src = "tableSugerencias.jsp";
                            limpiarSugerencia();                            
                        }
             }
             
             function limpiarSugerencia(){
                 document.getElementById("txtsuge").value = "";
                                  
             }
         </script>
 
        
         <%
           Acceso acc = new Acceso();
           AccesoDaoImpl adi = new AccesoDaoImpl();
           acc = adi.findById(Integer.valueOf(val));
          
        
           Usuario usu = new Usuario();
           UsuarioDaoImpl udi = new UsuarioDaoImpl();
           usu = acc.getUsuario(); 
           int iduser = usu.getIdUsuario();
           usu = udi.findById(iduser);
                   if(usu.getTipoUsuario()!= 1){
                       response.sendRedirect("index.jsp"); 
                   }
            sesion.setAttribute("idAcc", val);          
           
                                                 
        %>
                <style>
	#toolbar {
		padding: 10px 4px;
	}
	</style>
	<script>
	$(function() {
		$( "#home" ).button({
			//text: false,
			icons: {
				primary: "ui-icon-home"
			}
                    }).click(function(){
                       location.href = "main_admin.jsp";
                    });
		$( "#instrument" ).button({
			//text: false,
			icons: {
				primary: "ui-icon-clipboard"
			}
		}).click(function(){
                        location.href = "admin_instrument.jsp";
                    });
		$( "#logoutbutton" ).button({			
			icons: {
				primary: "ui-icon-gear",
                                secondary: "ui-icon-triangle-1-s"
			}
		})
		.click(function() {			
                $("#menuBtnOpciones1").toggle("slow");            
		});	
                $(".mnSalir").hover(
                function(){
                $(this).css({'color':'#81BEF7','cursor':'pointer', 'font-size':'large'});
                 },
                function(){
                $(this).css({'color':'#015480','font-size':'medium'});    
                   }
                 );
            });
            function goout(){
            location.href="salir";
        } 
       
	</script>
         
    </head>
    <body>
       <div class="main">
  <div class="header">
    <div class="header_resize">      
      <div class="menu" style=" height: 100px">
        
      </div>
      <div class="clr"></div>
        <div style="float:right; margin-top: -12px; margin-bottom: 5px;  margin-right: -135px  ">

       <span id="toolbar" class="ui-widget-header ui-corner-all">
	<button id="home">Inicio</button>
	<button id="instrument">Instrumento</button>
        <button id="logoutbutton" onclick="mostrarSalir();" ><%= usu.getNombre() %></button>	
	  <div id="menuBtnOpciones1" style=" float: right;  border-radius: 0 0 5px 5px;  margin-right: 7px; border-color: #69a8d4; border-style: solid;  border-width: 1px; display: none; background: #e7f1fa; width: 153px; height: 20px; color: #015480">
              <ul id="opciones1" class="mnSalir" style="list-style-image:url(/images/log_out.gif); margin-top: 0px; list-style: none;font-size: medium; text-align:left;">
                  <li id="mnuBtnSalir" onclick="goout();" > Salir  </li>  
              </ul>              
          </div>
        </span>

       </div>
      <div class="clr"></div>
      
      
    </div>
  </div>
          <div id="box_message" >                           
        </div>
            <div id="tabs" style="margin-left: 1%; margin-right: 1%;" >
                <ul>
                    <li><a href="#tabIndicador"><span>INDICADOR</span></a></li>
                    <li><a href="#tabVariable"><span>VARIABLE</span></a></li>
                    <li><a href="#tabItem"><span>ITEM</span></a></li>
                    <li><a href="#tabEscala"><span>ESCALA</span></a></li>
                    <li><a href="#tabSugerencia"><span>SUGERENCIA</span></a></li>
                </ul>
                
                <div id="tabIndicador" style="height: 55em;" >
                   <div>
                       <br>
                       <div align="center">
                           <div class="divPanel" style="width: 500px; height: 150px;">
                           <h2 align =" center"> Nuevo Indicador</h2>
                           <form id="newindicador" >
                               <table>
                                   <tr>
                                       <td>Indicador:</td>
                                       <td><input id="nindicador" maxlength="50" type="text"/></td>
                                       <td>&nbsp; &nbsp;</td>
                                       <td>Contribuci&oacuten:</td>
                                       <td><input id="ncontri" type="text"/></td>
                                   </tr>
                               </table>
                               <br>
                               <input type="button" id="guardarIndi" onclick="guardarIndicador();" value="Guardar"/>
                               <input type="button" id="clearIndi" onclick="limpiarIndicador();" value="Limpiar"/>
                           </form>
                           </div><br>
                       </div>
                       
                      <iframe src="tableIndicador.jsp" style=" width: 100%; height: 495px;" frameborder="0" scrolling="false"  id="fraIndi"></iframe>                             
                   </div>
                </div>
                <div id="tabVariable" style="height: 75em;">
                    <div>                       
                        <div align="center">
                            <div class="divPanel" style="width: 90%; height: 402px;">
                            <h2>Nueva Variable</h2>
                            <form id="newVar">
                                <table>
                                       <tr>
                                           <td>Variable:</td>
                                           <td><input id="nvariable" maxlength="200" type="text" size="50em" /></td>
                                           <td>&nbsp; &nbsp;</td>
                                           <td>Indicador:</td>
                                           <td><select id="indNewVar" style="width: 15em">
                                                    <% 
                                                   Indicador indi = new Indicador();
                                                   IndicadorDaoImpl idimp = new IndicadorDaoImpl();
                             
                                                   List<Indicador> listaIndicadores = idimp.findAll(); 
                                                   Iterator<Indicador> iteratorInd = listaIndicadores.iterator();                                                                             
                                                   iteratorInd = listaIndicadores.iterator();
                                                                             
                                                   while(iteratorInd.hasNext()){
                                                       indi = iteratorInd.next();
                                                       if(indi.getEstado() == true){
                                                     %>
                                                     <option value="<%= indi.getIdIndicador().toString() %>"><%= indi.getNombre() %></option>
                                                                                 
                                                     <% }                                                                                 
                                                        } %>                                                                                                                                                               
                                           </select></td>   
                                           <td>&nbsp; &nbsp;</td>
                                           <td>Ponderaci&oacuten:</td>
                                           <td><input id="nvarpon" type="text" /></td>
                                       </tr>                          
                                </table>
                                <h3>Escalas de Variable</h3>                      
                                <table style="width: 60%; margin-bottom: 1px;" class="tablesorter" cellspacing="1">
                                    <thead>                                         
                                          <tr>
                                              <th>Descripci&oacuten</th>
                                              <th style="width: 100px" >Rango de Respuestas Positivas</th>
                                              <th>Valor</th>
                                          </tr>                              
                                    </thead>
                                    <tbody>
                                          <tr>
                                              <td><input id="escala4" maxlength="100" type="text" style=" width: 98%" /> </td>
                                              <td>De: <input id="rm4" type="text" style="width: 30px"/>  a: <input id="rM4" type="text" style="width: 30px"/></td>
                                              <td>4</td>
                                          </tr>
                                          <tr>
                                              <td><input maxlength="100" id="escala3" type="text" style=" width: 98%"/></td>
                                              <td>De:  <input id="rm3" type="text" style="width: 30px"/> a: <input id="rM3" type="text" style="width: 30px"/> </td>
                                              <td>3</td>
                                          </tr>
                                          <tr>
                                              <td><input id="escala2" maxlength="100" type="text" style=" width: 98%"/></td>
                                              <td>De:  <input id="rm2" type="text" style="width: 30px"/> a: <input id="rM2" type="text" style="width: 30px"/></td>
                                              <td>2</td>
                                          </tr>
                                          <tr>
                                              <td><input id="escala1" type="text" maxlength="100" style=" width: 98%"/></td>
                                              <td>De: <input id="rm1" type="text" style="width: 30px"/> a: <input id="rM1" type="text" style="width: 30px"/></td>
                                              <td>1</td>
                                          </tr>
                                          <tr>
                                              <td><input maxlength="100" id="escala0" type="text" style=" width: 98%"/></td>
                                              <td>De:  <input id="rm0" type="text" style="width: 30px"/> a: <input id="rM0" type="text" style="width: 30px"/> </td>
                                              <td>0</td>
                                          </tr>                                          
                                    </tbody>                                    
                                </table>                                                               
                                        <input type="button" id="guardarVar" onclick="guardarVariable();" value="Guardar"/>
                                        <input type="button" id="clearVar" onclick="limpiarVariable();" value="Limpiar"/>          
                            </form>
                            </div><br>
                        </div>
                        <iframe src="tableVariable.jsp" style=" width: 100%; height: 500px;" frameborder="0" scrolling="false"  id="fraVar"></iframe>                      
                    </div>
                </div>
                <div id="tabItem" style="height: 70em;">
                    <div>
                        <br>
                        <div align="center">
                            <div class="divPanel" style="width: 90%; height: 200px;">
                            <h2>Nuevo Item</h2>
                            <form id="newItem">
                                <table>
                                    <tr>
                                        <td>Item:</td>
                                        <td><textarea id="newItemDesc" maxlength="200" cols="40" rows="5"></textarea> </td>
                                        <td>&nbsp; &nbsp;</td>
                                        <td>Variable:</td>
                                        <td><select id="varItem" style="width: 35em">
                                                    <% 
                                                   Variable var = new Variable();
                                                   VariableDaoImpl vdi = new VariableDaoImpl();
                             
                                                   List<Variable> listaVar = vdi.findAll(); 
                                                   Iterator<Variable> iteratorVar = listaVar.iterator();                                                                             
                                                   iteratorVar = listaVar.iterator();
                                                                             
                                                   while(iteratorVar.hasNext()){
                                                       var = iteratorVar.next();
                                                       if(var.getEstado() == true){
                                                     %>
                                                     <option value="<%= var.getIdVariable().toString() %>"><%= var.getNombre() %></option>
                                                                                 
                                                     <% }                                                                                 
                                                        } %>                                                                                                                                                               
                                           </select></td>
                                    </tr>
                                </table>
                                           <input type="button" id="guardarItem" value="Guardar" onclick="guardarIt();"/>
                                           <input type="button" id="clearItem" value="Limpiar" onclick="limpiarItem();"/>
                            </form>
                            </div><br>
                        </div>
                        <iframe src="tableItem.jsp" style=" width: 100%; height: 600px;" frameborder="0" scrolling="false"  id="fraItem"></iframe>                                                                  
                    </div>
                </div>
                <div id="tabEscala" style="height: 50em;">
                 <iframe src="tableEscala.jsp" style=" width: 100%; height: 100%;" frameborder="0" scrolling="false"  id="fraEscala"></iframe>                                                                          
                </div>
                <div id="tabSugerencia" style="height: 70em;">
                    <div>
                        <div align="center">
                            <div class="divPanel" style="width: 99%; height: 170px;">
                            <h2>Nueva Sugerencia</h2>
                            <form id="sugItem">
                                <table style="width: 100%" >
                                    <tr>
                                        <td style="width: 60px" >Sugerencia:</td>
                                        <td style="width: 300px"><textarea id="txtsuge" cols="30" style="width: 300px" maxlength="200" rows="3"></textarea></td>
                                        
                                        <td style="width: 80px">Items Relacionados:</td>
                                        <td style="width: 330px">
                                            <select id="selectItem" style="width: 325px;"  multiple="multiple">
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
                                </table><br>
                                        <input type="button" id="guardarSuger" onclick="guardarSugerencia();" value="Guardar"/>
                                        <input type="button" id="clearSugerencia" onclick="limpiarSugerencia();" value="Limpiar"/> 
                            </form><br><br>
                            </div><br>
                      <iframe src="tableSugerencias.jsp" style=" width: 100%; height: 600px;" frameborder="0" scrolling="false"  id="fraSug"></iframe>                                
                        </div>              
                    </div>   
                </div>
           
            </div>
           
         
       </div>
                                            
  <div class="footer">
    
      <p>Copyright © Sitename.com. <a href="http://dreamtemplate.com/">dreamtemplate.com</a>. All Rights Reserved</p>
     
    
  </div>                                     
                                            
    </body>
</html>
<% } %>