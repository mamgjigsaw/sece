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
        
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />
        <link REL="shortcut icon" type="image/x-icon" href="http://elixir.ematia.de/trac/export/493/elixir/branches/field_inherits_from_column/examples/videostore/videostore/static/images/favicon.ico"/>
        
        <script type="text/javascript" src="/sece/dwr/interface/interaccion.js"></script>        
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>        
        
        <script type="text/javascript" >
            
            var num_item=0;
            var indicador_actual = <%=indi%>;
            var actual_var = <%=actual%>;// va de 0 a n
            var total_vari = <%=total_var%>;// va 1 a n
            
            $(function() {
		$( "#buttonnnext" ).button();  
                $( "#box_message" ).hide();//escondo el contenido del div para los mensajes
                
                $( "#link_actual").html((actual_var+1)+"/"+total_vari);//aqui pongo donde va por ejemplo 5/12
                   
                    if(actual_var == total_vari ){
                        $( "#link_variable").html("");
                        $( "#link_actual").html(actual_var+"/"+total_vari);
                        $("#box").html("");
                        $( "#buttonnnext" ).hide();
                     
                        var palabra="<section role='principal' id='message_box'><div class='notification information'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Completado</strong><p class='hola'>Se ha completado el cuestionario de <%=nombre_indicador%> correctamente!.</p></div><!-- /Notification --></section>";  
                        $("#box_message").html(palabra);
                        $( "#box_message" ).show("blind");
                    }else{
                        obtener(<%=indi%>,<%=actual%>);               
                    }
                
            });            
            
            function obtener(valor1,valor2){                
                interaccion.obtenerCuestionario(valor1,valor2,respuesta);                
            }
            
            function respuesta(data){                 
                
                num_item= data.length;
                var i;
                var strHtml="<table><thead><tr><td>Preguntas</td><td>Si/No</td><td>Observacion</td></tr></thead><tbody>";
           
                for(i=0;i<data.length;i++){
                    strHtml += "<tr><td>"+ (i+1) + ". " + data[i].descripcion +"<input type='hidden' id='pregunta"+ (i+1) +"' value='"+ data[i].idItem +"'/></td><td><input type='checkbox' id='checkbox"+ (i+1) +"' name='resp' /></td><td><input type='text' id='textfield"+ (i+1)+"' /></input></td></tr>";                    
                    
                }
               
                strHtml += "</tbody></table>";
                $("#box").html(strHtml);                
            }
            
            
            function saveAndNext(){                
                
                 if(actual_var < (total_vari -1)){
                     //num_item son el numero de pregunta por variable que hay para guardar
                      for(i=0;i<num_item;i++){
                        if(jQuery("#checkbox"+(i+1)).attr('checked') == true)
                          { //alert("Seleccionada");
                            interaccion.saveandnext(<%=id_usuario%>,<%=contrato%>,$("#pregunta"+(i+1)).val(),1,$("#textfield"+(i+1)).val());                        
                         }else { //alert("No Seleccionada");  
                            interaccion.saveandnext(<%=id_usuario%>,<%=contrato%>,$("#pregunta"+(i+1)).val(),0,$("#textfield"+(i+1)).val());
                            }
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
            }
            
            function respuesta3(data){                 
                 actual_var = data;                                  
                 $( "#link_actual").html(actual_var+"/"+total_vari);//aqui pongo donde va por ejemplo 5/12                 
            }
            
            function getName2(data2){
                $("#link_variable").html(data2);                   
            }
            
            function link_indi(){                
                interaccion.getListVariable(4, respListVar);
            }
            
            function respListVar(dato){
                                
                var j;
                var strHtml2="";
                alert(dato.length);
                //for(j=0;j<dato.length;j++){
                  //  strHtml2 += ""+(j+1) + ". " + dato[j].nombre +"<input type='hidden' id='idVariable"+ (j+1) +"' value='"+ dato[j].idVariable +"'/>";                    
                    
                //}
                               
                //$("#box").html(strHtml2);   
            }
            
            function goout(){
               location.href="salir";
            }
            function goBack(){
               location.href="controlPanel.jsp";
            }
        </script>
    </head>    
    <body>
     <div class="main">
  <div class="header">
    <div class="header_resize">      
      <div class="menu">
        
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logo.gif" width="250" height="70" border="0" alt="logo" /></div>      
      <div class="inGo">
          <a href="#" onclick="goBack();" ><strong>Regresar</strong></a>          
          <a href="#" onclick="goout();" ><strong>Salir</strong></a>
      </div>
      <div class="clr"></div>
    </div>
  </div> 
  
  <div class="body">     
    <div class="body_resize">
        
        <h2>Bienvenido, <%=name%>&nbsp&nbsp<a id="link_indicador" href="#" onclick="link_indi();" ><%=nombre_indicador%></a>  > <a id="link_variable" href="#" ><%=nombre_variable%> </a>&nbsp<a id="link_actual" href="#" > </a></h2>
        
        <div id="box_message" align="center">            
                              
        </div><%-- finaliza div que muestra los mensajes --%> 
        <div id="box" >
            
        </div>
            <input type='button' style=" font-size: 14px;" value='Guardar' id="buttonnnext" onclick="saveAndNext();" />
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