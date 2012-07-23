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
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
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
        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>        
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
         <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
         <script type="text/javascript" src="resources/jquery/js/jquery.multiselect.js"></script>
          <script type="text/javascript" src="resources/jquery/js/jquery.multiselect.filter.js"></script>
       <link href="resources/tablesorter/styles.css" rel="stylesheet" type="text/css" />   
          
        
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
              //------------Barra-------------------------//
              $( "#home" ).button({
			//text: false,
			icons: {
				primary: "ui-icon-home"
			}
                    }).click(function(){
                        validacion.saveActionBitacora(<%= val %>, 13, "El Administrador ha redireccionado a otra pagina",<%= iduser %>, "Pagina de Instrumento(admin_instrument.jsp)", "Pagina Principal(main_admin.jsp)");
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
                    $( "#help" ).button({
			//text: false,
			icons: {
				primary: "ui-icon-info"
			}
		}).click(function(){
                       validacion.saveActionBitacora(<%= val %>, 13, "El Administrador ha abierto la Ayuda",<%= iduser %>, "Pagina Principal(admin_instrument.jsp)", "Pagina de Ayuda(ayudaAdmin.jsp)");
                        window.open("ayudaAdmin.jsp", "_blank");
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
              
              //-----------Fin Barra---------------------//
              
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
                          instrumentoDWR.newIndicador(indicador, contrib, res);                         
                           var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Indicador</strong><p class='hola'>El nuevo Indicador se ha guardado correctamente.</p></div><!-- /Notification --></section>";  
                           $("#box_message").html(palabra);
                           $( "#box_message" ).show("blind",callback);
                          limpiarIndicador();
                       }                
             }
             function res(data){
                 validacion.saveActionBitacora(<%= val %>, 1, "Se agrego un nuevo indicador al Instrumento",data, "Nuevo Indicador", "Nuevo Indicador");
                  $("#fraIndi").attr("src","tableIndicador.jsp");
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
                var suger4 = $("#sug4").val();
                var esca3 = $("#escala3").val();
                var rmenor3 = $("#rm3").val();
                var rmayor3 = $("#rM3").val();
                var suger3 = $("#sug3").val();
                var esca2 = $("#escala2").val();
                var rmenor2 = $("#rm2").val();
                var rmayor2 = $("#rM2").val();
                var suger2 = $("#sug2").val();
                var esca1 = $("#escala1").val();
                var rmenor1 = $("#rm1").val();
                var rmayor1 = $("#rM1").val();
                var suger1 = $("#sug1").val();
                var esca0 = $("#escala0").val();
                var rmenor0 = $("#rm0").val();
                var rmayor0 = $("#rM0").val();
                var suger0 = $("#sug0").val();
                                
                       if(variable == "" || ponderacion == "" || esca4 == "" || esca3 =="" || esca2== "" || esca1=="" || esca0 =="" || rmenor4 =="" || rmayor4 =="" || rmenor3 =="" || rmayor3 =="" || rmenor2 =="" || rmayor2 =="" || rmenor1 =="" || rmayor1 =="" || rmenor0 =="" || rmayor0 =="" || suger4 =="" || suger3 =="" || suger2 =="" || suger1 =="" || suger0 ==""){
                        var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Campo Vacio</strong><p class='hola'>Todos los datos son requeridos.</p></div><!-- /Notification --></section>";  
                       $("#box_message").html(palabra);               
                      $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje
                       }else if(!(/\d/.test(ponderacion, rmenor4, rmayor4, rmenor3, rmayor3, rmenor2, rmayor2, rmenor1, rmayor1, rmenor0, rmayor0))){
                        var palabra="<section role='principal' id='message_box'><div class='notification attention'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Dato Incorrecto</strong><p class='hola'>La Ponderacion y los rangos de respuestas deben de ser un número real</p></div><!-- /Notification --></section>";  
                        $("#box_message").html(palabra);               
                        $( "#box_message" ).show("blind",callback);//codigo que muestra el div de mensaje 
                        }
                       else{                          
                          instrumentoDWR.newVariable(variable, indicadorVar, ponderacion, esca4, esca3, esca2, esca1, esca0, rmenor4, rmayor4, rmenor3, rmayor3, rmenor2, rmayor2, rmenor1, rmayor1, rmenor0, rmayor0, suger4, suger3, suger2, suger1, suger0, resul);                         
                          var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Variable</strong><p class='hola'>La nueva Variable se ha guardado junto a su respectivas Escalas correctamente.</p></div><!-- /Notification --></section>";  
                           $("#box_message").html(palabra);
                           $( "#box_message" ).show("blind",callback);
                          limpiarVariable();
                       }                
             }
             function resul(data){
                 validacion.saveActionBitacora(<%= val %>, 3, "Nueva Variable",data[0], "Nueva Variable", "Nueva Variable");
                 validacion.saveActionBitacora(<%= val %>, 5, "Nueva Escala",data[1], "Nueva Escala", "Nueva Escala");
                 validacion.saveActionBitacora(<%= val %>, 5, "Nueva Escala",data[2], "Nueva Escala", "Nueva Escala");
                 validacion.saveActionBitacora(<%= val %>, 5, "Nueva Escala",data[3], "Nueva Escala", "Nueva Escala");
                 validacion.saveActionBitacora(<%= val %>, 5, "Nueva Escala",data[4], "Nueva Escala", "Nueva Escala");
                  validacion.saveActionBitacora(<%= val %>, 5, "Nueva Escala",data[5], "Nueva Escala", "Nueva Escala");
                   $("#fraVar").attr("src","tableVariable.jsp");
                  $("#fraEscala").attr("src","tableEscala.jsp");
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
                 document.getElementById("sug4").value = "";
                 document.getElementById("rm3").value = "";
                 document.getElementById("rM3").value = "";
                 document.getElementById("sug3").value = "";
                 document.getElementById("rm2").value = "";
                 document.getElementById("rM2").value = "";
                 document.getElementById("sug2").value = "";
                 document.getElementById("rm1").value = "";
                 document.getElementById("rM1").value = "";
                 document.getElementById("sug1").value = "";
                 document.getElementById("rm0").value = "";
                 document.getElementById("rM0").value = "";
                 document.getElementById("sug0").value = "";
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
                          instrumentoDWR.newItem(newitem, variableItem, respIG); 
                          var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Item</strong><p class='hola'>El nuevo Item se ha guardado correctamente.</p></div><!-- /Notification --></section>";  
                           $("#box_message").html(palabra);
                           $( "#box_message" ).show("blind",callback);                         
                          limpiarItem();
                       }                
             }
             function respIG(data){
                validacion.saveActionBitacora(<%= val %>, 7, "Nuevo Item",data, "Nueva Item", "Item");
                  $("#fraItem").attr("src","tableItem.jsp");
             }
             function limpiarItem(){
                 document.getElementById("newItemDesc").value = "";                 
             }
         </script>        
 
                <style>
	#toolbar {
		padding: 10px 4px;
	}
        textarea {
	resize: none;
}
	</style>
	<script>
	
            function goout(){
            location.href="salir";
        } 
       
	</script>
         
    </head>
    <body>
       <div class="main">
  <div class="header">
    <div class="header_resize">      
      <div class="menu">
        
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logofull.png" width="250" height="70" border="0" alt="logo" /></div>      
            
       
       <div class="inGo" style=" font-size: 11px;" > 
       <span id="toolbar" class="ui-widget-header ui-corner-all">
	<button id="home">Inicio</button>
	<button id="instrument">Instrumento</button>
        <button id="help">Ayuda</button>
        <button id="logoutbutton" onclick="mostrarSalir();" ><%= usu.getNombre() %></button>	
        </span>
        <div>
         <div id="menuBtnOpciones1" style="float: right; border-radius: 0 0 5px 5px;  margin-right: 7px; border-color: #69a8d4; border-style: solid;  border-width: 1px; display: none; background: #e7f1fa; width:153px; height: 20px; color: #015480">
              <ul id="opciones1" class="mnSalir" style=" margin-top: 0px; list-style:none; font-size: medium; text-align:left;">
                  
                   <li style="float:left" id="mnuBtnSalir" onclick="goout();" > &RightArrow;Salir  </li>  
                  
              </ul>              
          </div>
            </div>
        
          </div>
      <div class="clr"></div>
         
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
                <div id="tabVariable" style="height: 90em;">
                    <div>                       
                        <div align="center">
                            <div class="divPanel" style="width: 90%; height: 550px;">
                            <h2>Nueva Variable</h2>
                            <form style="width:100%" id="newVar">
                                <table style="width:100%" >
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
                                              <th >Rango de Respuestas Positivas</th>
                                              <th>Valor</th>
                                              <th>Sugerencia</th>
                                          </tr>                              
                                    </thead>
                                    <tbody>
                                          <tr>
                                              <td><textarea id="escala4" rows="3" cols="30" maxlength="100"></textarea></td>
                                              <td>De: <input id="rm4" type="text" style="width: 30px"/> <br>  a:  &nbsp; <input id="rM4" type="text" style="width: 30px"/></td>
                                              <td>4</td>
                                              <td><textarea id="sug4" rows="3" cols="70" maxlength="500"></textarea></td>
                                          </tr>
                                          <tr>
                                              <td><textarea maxlength="100" rows="3" cols="30" id="escala3"></textarea></td>
                                              <td>De:  <input id="rm3" type="text" style="width: 30px"/> <br>  a:  &nbsp; <input id="rM3" type="text" style="width: 30px"/> </td>
                                              <td>3</td>
                                              <td><textarea id="sug3" rows="3" cols="70" maxlength="500"></textarea></td>
                                          </tr>
                                          <tr>
                                              <td><textarea id="escala2" rows="3" cols="30" maxlength="100"></textarea></td>
                                              <td>De:  <input id="rm2" type="text" style="width: 30px"/><br>  a:  &nbsp; <input id="rM2" type="text" style="width: 30px"/></td>
                                              <td>2</td>
                                              <td><textarea id="sug2" rows="3" cols="70" maxlength="500"></textarea></td>
                                          </tr>
                                          <tr>
                                              <td><textarea id="escala1" maxlength="100" rows="3" cols="30" ></textarea></td>
                                              <td>De: <input id="rm1" type="text" style="width: 30px"/><br>  a:  &nbsp; <input id="rM1" type="text" style="width: 30px"/></td>
                                              <td>1</td>
                                              <td><textarea id="sug1" rows="3" cols="70" maxlength="500"></textarea></td>
                                          </tr>
                                          <tr>
                                              <td><textarea maxlength="100" id="escala0" rows="3" cols="30" ></textarea></td>
                                              <td>De:  <input id="rm0" type="text" style="width: 30px"/><br> a:  &nbsp; <input id="rM0" type="text" style="width: 30px"/> </td>
                                              <td>0</td>
                                              <td><textarea id="sug0" rows="3" cols="70" maxlength="500"></textarea></td>
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
           
            </div>
           
         
       </div>
                                            
  <div class="footer">
    
      
     
    
  </div>                                     
                                            
    </body>
</html>
<% } %>