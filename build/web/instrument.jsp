<%-- 
    Document   : instrument
    Created on : Aug 1, 2011, 5:22:02 PM
    Author     : mamg
--%>

<%@page import="daoImpl.ContratoDaoImpl"%>
<%@page import="pojo.Contrato"%>
<%@page import="pojo.Acceso"%>
<%@page import="daoImpl.AccesoDaoImpl"%>
<%@page import="pojo.Avance"%>
<%@page import="daoImpl.AvanceDaoImpl"%>
<%@page import="pojo.DelegacionIndiUsu"%>
<%@page import="daoImpl.DelegacionIndiUsuDaoImpl"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Indicador"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
%>
<html>
    <head>
        <%
       HttpSession sesion=request.getSession();
       sesion.setMaxInactiveInterval(3600);
       String acc = (String) sesion.getAttribute("idAcc");
       String IDIndicador;
       int tipo,indi,contrato,actual,total_var;
       String name,nombre_variable,nombre_indicador;
       
       if(acc==null){
              response.sendRedirect("index.jsp");
           }else{
       
       IDIndicador = request.getParameter("indi");

       if(IDIndicador.equals("")){
           response.sendRedirect("index.jsp");
       }else{              
        
       AccesoDaoImpl daoAcceso = new AccesoDaoImpl();
       Acceso acceso = daoAcceso.findById(Integer.parseInt(acc));
       
       int id_usuario = acceso.getUsuario().getIdUsuario();
       UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
       Usuario usuario = new Usuario();
       usuario = usuDao.findById(id_usuario);
                    
       name = usuario.getNombre();
       tipo = usuario.getTipoUsuario();
       
       indi = Integer.parseInt(IDIndicador);//indi el Indicador en el cual estamos
       IndicadorDaoImpl indiDao = new IndicadorDaoImpl();
       Indicador indicador = indiDao.findById(indi);                                
       nombre_indicador = indicador.getNombre();
          
       actual=0;
       total_var=0;
       contrato=0;
       nombre_variable="";
       
       Contrato contra = new Contrato();
       ContratoDaoImpl daoContra = new ContratoDaoImpl();
                      
      if(tipo==4){
            
           //como es tipo delegado, obtengo que indicador esta trabajando y el contrato al que pertenece
           DelegacionIndiUsuDaoImpl delimpl = new DelegacionIndiUsuDaoImpl();
           DelegacionIndiUsu dele = new DelegacionIndiUsu(); 
           dele = delimpl.getDelByContCurrentlyandUsu(usuario); 

           //obtenemos el contrato
           contra = dele.getContrato();
           
       }else if(tipo==2){
          response.sendRedirect("index.jsp");
       }else if(tipo==1){
          response.sendRedirect("index.jsp");
       }else if(tipo==3){           
           contra = daoContra.findByUsuario(usuario);           
       }   
       
       contrato = contra.getIdContrato();
       //miro donde quedo la ultima vez
       AvanceDaoImpl avaDao = new AvanceDaoImpl();
       Avance avance = new Avance();
       avance = avaDao.findByIndiAndContra(indi, contrato);              
       actual = avance.getVar();//actual representa a la Variable actual lo que obtiene va de 0 a n 
       
       //buscar el nombre de la variable
       VariableDaoImpl varDao = new VariableDaoImpl();
       List<Variable> listVariable = new ArrayList<Variable>();
       listVariable = varDao.findByIndicador(indicador);
       Variable variable = new Variable();
       total_var = listVariable.size();//numero total de variable de ese indicador, comienza de 1
       
       if(actual == total_var){// aqui confirmo si ya se realizo todo el cuestionario del indicador correspondiente
           nombre_variable = "";
       }else{
           variable = listVariable.get(actual);
           nombre_variable = variable.getNombre();
       }       
                 
    %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <title>Cuestionario</title>
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>        
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript" src="/sece/dwr/interface/interaccion.js"></script> 
        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>        
        
        <script type="text/javascript" >
            
            var num_item=0;
            var indicador_actual = <%=indi%>;
            var actual_var = <%=actual%>;// va de 0 a n
            var total_vari = <%=total_var%>;// va 1 a n
            var contra = <%=contrato%>;
            
            $(function() {
		
                $( "#gobackbutton" ).button({			
			icons: {
				primary: "ui-icon-gear"
			}
		})
		.click(function() {			
                     goBack();            
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
                
                                
                //$( "#buttonnnext" ).button();  
                $( "#box_message" ).hide();//escondo el contenido del div para los mensajes
                
                $( "#link_actual").html((actual_var+1)+"/"+total_vari);//aqui pongo donde va por ejemplo 5/12
                   
                    if(actual_var == total_vari ){
                        $( "#link_variable").html("");
                        $( "#link_actual").html(actual_var+"/"+total_vari);
                        $("#box").html("");
                        $( "#buttonnnext" ).hide();
                     
                        var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Finalizado</strong><p class='hola'>Se ha finalizado el cuestionario de <%=nombre_indicador%> correctamente!.</p></div><!-- /Notification --></section>";  
                        $("#box_message").html(palabra);
                        $( "#box_message" ).show("blind");
                    }else{
                        obtener(indicador_actual,actual_var);
                    }
                
            });            
            
            function obtener(valor1,valor2){                
                interaccion.obtenerCuestionario(valor1,valor2,respuesta);                
            }
            
            function respuesta(data){                 
                
                num_item= data.length;
                
                var i;
                var strHtml="<table><thead><tr><td>Preguntas</td><td> &nbspSi</td><td> &nbspNo</td><td>&nbspObservacion</td></tr></thead><tbody>";
           
                for(i=0;i<data.length;i++){
                    strHtml += "<tr><td>"+ (i+1) + ". " + data[i].descripcion +"<input type='hidden' id='pregunta"+ (i+1) +"' value='"+ data[i].idItem +"'/></td><td><input type='radio' name='group"+ (i+1) +"' value='1' ></input></td><td><input type='radio' name='group"+ (i+1) +"' value='0' checked ></input></td><td><input type='text' id='textfield"+ (i+1)+"' /></input></td></tr>";                    
                    
                    
                }
               
                strHtml += "</tbody></table><input type='button' style=' font-size: 14px; margin-left: 4%;margin-bottom: 2%; ' value='Guardar' id='buttonnnext' onclick='saveAndNext();' />";
                $("#box").html(strHtml);
                $( "#buttonnnext" ).button();
            }
            
            
            function saveAndNext(){                
                
                 if(actual_var < (total_vari -1)){
                     //num_item son el numero de pregunta por variable que hay para guardar
                     $("#buttonnnext").hide();
                      for(i=0;i<num_item;i++){
                        
                        // alert($("input:radio[name=group"+ (i+1) +"]:checked").val());
                         interaccion.saveandnext(<%=id_usuario%>,<%=contrato%>,$("#pregunta"+(i+1)).val(),$("input:radio[name=group"+ (i+1) +"]:checked").val(),$("#textfield"+(i+1)).val());   
                        
                       }//fin del ciclo for para guardar las respuesta item.
                     
                       $("#box").html("");
                     
                       var palabra="<section role='principal' id='message_box'><div class='notification success'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Sastifactorio</strong><p class='hola'>Se ha guardado las respuestas correctamente!!!.</p></div><!-- /Notification --></section>";  
                       $("#box_message").html(palabra);
                       $( "#box_message" ).show("blind",callback);//en el metodo callbak mando a llamar a la funcion que aumenta en 1 var en avance
                      
                 }else if (actual_var == (total_vari -1)){
                     for(i=0;i<num_item;i++){
                        if(jQuery("#checkbox"+(i+1)).attr('checked') == true)
                          { //alert("Seleccionada");                             
                             interaccion.saveandnext(<%=id_usuario%>,<%=contrato%>,$("#pregunta"+(i+1)).val(),1,$("#textfield"+(i+1)).val());                        
                          }else { //alert("No Seleccionada");  
                             interaccion.saveandnext(<%=id_usuario%>,<%=contrato%>,$("#pregunta"+(i+1)).val(),0,$("#textfield"+(i+1)).val());
                            }
                     }//fin del ciclo for para guardar las respuesta item.
                     
                     $( "#link_variable").html("");                     
                     $("#box").html("");
                     $( "#buttonnnext" ).hide();
                     
                     var palabra="<section role='principal' id='message_box'><div class='notification success'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Sastifactorio</strong><p class='hola'>Se ha completado el cuestionario de <%=nombre_indicador%> satisfactoriamente!.</p></div><!-- /Notification --></section>";  
                     $("#box_message").html(palabra);
                     $( "#box_message" ).show("blind");
                     interaccion.aunm(<%=indi%>,<%=contrato%>, respuesta3);//aumenta en uno la variable var de la tabla avance                                                                                  
                 }                 
                                  
            } 
            
             function callback() {//function para esconder el div de mensaje con efecto
			setTimeout(function() {                                 
				$( "#box_message:visible" ).removeAttr( "style" ).slideUp();//fadeOut();                                
                                interaccion.aunm(<%=indi%>,<%=contrato%>, respuesta2);//aumenta en uno la variable var de la tabla avance                                                                                  
			}, 1000 );
		};
            
                       
            function respuesta2(data){                 
                 actual_var = data;                 
                 interaccion.getNameVariable(actual_var,indicador_actual, getName2);//obtengo el nombre de la nueva variable
                 $( "#link_actual").html((actual_var+1)+"/"+total_vari);//aqui pongo donde va por ejemplo 5/12
                 obtener(<%=indi%>,data);//muestra los item de la nueva variable
                 $("#buttonnnext").show();
            }
            
            function respuesta3(data){                 
                 actual_var = data;                                  
                 $( "#link_actual").html(actual_var+"/"+total_vari);//aqui pongo donde va por ejemplo 5/12                 
            }
            
            function getName2(data2){
                $("#link_variable").html(data2);                   
            }
            
            function ver_contestadas(){
                $("#box").html("<img src='resources/icons/ajax_loading_blue.gif' width='24' height='24' border='0' style=' margin-left: 50%; margin-top: 5%;margin-bottom: 4%;' />");                
                interaccion.getListVariable(indicador_actual, contra, respListVar);
            }
           
           function mostrarActual(){
               obtener(indicador_actual,actual_var);
           }
           
            function respListVar(dato){
                                
                var j;
                var stringBody="<table id='variableList' style=' font-size: 16px;'><thead><tr style='background-color: #347488;color: #fff;'><td>No.</td><td> Variable</td><td> Estado</td></tr></thead><tbody>";
                //alert(dato[10][1]);
                
                 for(j=0;j<dato.length;j++){
                    //stringBody += "<tr><td>"+(j+1) + ".</td><td><a id='link_go_variable' href='#' onclick='ver_esta_variable("+ dato[j][0] +");' >" + dato[j][1] + "</a></td><td>  " + dato[j][2] + "</td></tr>";
                    stringBody += "<tr><td>"+(j+1) + ".</td><td><a id='link_go_variable' href='#' onclick='ver_esta_variable("+ j +");' >" + dato[j][1] + "</a></td><td>  " + dato[j][2] + "</td></tr>";
                    
                }
                stringBody += "</tbody></table>";
                               
                $("#box").html(stringBody); 
                
            }
            
            function ver_esta_variable(parametro){
                var cadena="";
                 //alert(parametro);                
               $("#box").html("<img src='resources/icons/ajax_loading_blue.gif' width='24' height='24' border='0' style=' margin-left: 50%; margin-top: 5%;margin-bottom: 4%;' />");                
               
               
                
            }
            
            function goout(){
               location.href="salir";
            }
            function goBack(){
               validacion.saveActionBitacora(<%=acc%>,13,"",<%=id_usuario%>,"instrument.jsp","controlPanel.jsp");
               location.href="controlPanel.jsp";
            }
        </script>
        <style>
	#toolbar {
		padding: 10px 4px;
	}
        #variableList td{
                    border-bottom: 1px solid #999; height: 35px;}
        </style>
    </head>    
    <body>
     <div class="main">
  <div class="header">
    <div class="header_resize">      
      <div class="menu">
        
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logofull.png" width="250" height="70" border="0" alt="logo" /></div>      
      <div class="inGo" style=" font-size: 11px;" >
       <span id="toolbar" class="ui-widget-header ui-corner-all">	
        <button id="gobackbutton" >Panel De control</button>	
        <button id="logoutbutton" ><%=name%></button>	
       </span> 
       <div>
        <div id="menuBtnOpciones1" style=" float: right;  border-radius: 0 0 5px 5px;  margin-right: 3%; border-color: #69a8d4; border-style: solid;  border-width: 1px; display: none; background: #e7f1fa; width: 100px; height: 20px; color: #015480">
              <ul id="opciones1" class="mnSalir" style="list-style-image:url(/images/log_out.gif); margin-top: 0px; list-style: none;font-size: medium; text-align:left;">
                  <li id="mnuBtnSalir" onclick="goout();" > Salir  </li>  
              </ul>              
          </div>           
       </div>

       </div>
      <div class="clr"></div>
    </div>
  </div> 
  
  <div class="body">     
    <div class="body_resize">
        
        <h2>Bienvenido, &nbsp&nbsp<a id="link_indicador" href="#" onclick="ver_contestadas();" ><%=nombre_indicador%></a>  > <a id="link_variable" href="#" onclick="mostrarActual();" ><%=nombre_variable%> </a>&nbsp<a id="link_actual"  > </a></h2>
        
        <div id="box_message" align="center">            
                              
        </div><%-- finaliza div que muestra los mensajes --%> 
        <div  id="box" style=" margin-bottom: 5%; padding-top:2%; padding-left: 2%; "  >
            
        </div>
            
           <%-- <div class="right2"> </div> end div right2 --%> 
       
      <div class="clr"></div>
    </div>
  </div><%-- end div body rezise --%> 
  
  <div class="clr"></div>
</div>  
    </body>
</html>
<% 
      }//fin del else de validar parametro enviado
           }//fin del else de la variable de sesion %>