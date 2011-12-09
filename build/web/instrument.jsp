<%-- 
    Document   : instrument
    Created on : Aug 1, 2011, 5:22:02 PM
    Author     : mamg
--%>

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
       String user = (String) sesion.getAttribute("idUser");
       
       int id_usuario = Integer.parseInt(user);
       UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
       Usuario usuario = new Usuario();
       usuario = usuDao.findById(id_usuario);
       
       String name,nombre_variable,nombre_indicador;
       int tipo,indi,contrato,actual,total_var;
       
       
       name = usuario.getNombre();
       tipo = usuario.getTipoUsuario();
       
      //if(tipo==4){
            
           //como es tipo delegado, obtengo que indicador esta trabajando y el contrato al que pertenece
           DelegacionIndiUsuDaoImpl delimpl = new DelegacionIndiUsuDaoImpl();
           DelegacionIndiUsu dele = new DelegacionIndiUsu(); 
           dele = delimpl.findByUsuario(usuario); 

           IndicadorDaoImpl indiDao = new IndicadorDaoImpl();
           Indicador indicador = indiDao.findById(dele.getIndicador().getIdIndicador());                         
           indi = indicador.getIdIndicador();//indi el Indicador en el cual estamos
           nombre_indicador = indicador.getNombre();
           contrato = dele.getContrato().getIdContrato();//id_contrato
           
           //miro donde quedo la ultima vez
           AvanceDaoImpl avaDao = new AvanceDaoImpl();
           Avance avance = new Avance();
           avance = avaDao.findByIndiAndContra(indi, contrato);              
           actual = avance.getVar();//actual representa a la Variable actual 
       
           //buscar el nombre de la variable
           VariableDaoImpl varDao = new VariableDaoImpl();
           List<Variable> listVariable = new ArrayList<Variable>();
           listVariable = varDao.findByIndicador(dele.getIndicador());
           Variable variable = new Variable();
           variable = listVariable.get(actual);
           nombre_variable = variable.getNombre();
           total_var = listVariable.size();//numero total de variable de ese indicador, comienza de 1          
           
       //}       
                 
    %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <title>SECE</title>
        
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
            var actual_var = <%=actual%>;
            var total_vari = <%=total_var%>;
            
            $(function() {
		$( "#buttonnnext" ).button();  
                   
                    if(actual_var == (total_vari -1)){
                        alert("Es la ultima");
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
                var strHtml="<table><thead><tr><td>Pregunta</td><td>Si/No</td><td>Observacion</td></tr></thead><tbody>";
           
                for(i=0;i<data.length;i++){
                    strHtml += "<tr><td>"+ (i+1) + ". " + data[i].descripcion +"<input type='hidden' id='pregunta"+ (i+1) +"' value='"+ data[i].idItem +"'/></td><td><input type='checkbox' id='checkbox"+ (i+1) +"' name='resp' /></td><td><input type='text' id='textfield"+ (i+1)+"' /></input></td></tr>";                    
                    
                }
               
                strHtml += "</tbody></table>";
                $("#box").html(strHtml);                
            }
            
            
            function saveAndNext(){                
                
                 if(actual_var < (total_vari -1)){
                     
                      for(i=0;i<num_item;i++){
                        if(jQuery("#checkbox"+(i+1)).attr('checked') == true)
                          { //alert("Seleccionada");
                             
                          
                         }else { //alert("No Seleccionada");  
                             
                            }
                     }
            
                     interaccion.aunm(<%=indi%>,<%=contrato%>, respuesta2);//aumenta en uno la variable var de la tabla avance                                                                                  
                 }else{
                     alert("NO hay mas");
                 }                  
                                  
            } 
            
            function getName2(data2){
                $("#link_variable").html(data2);
                //alert("Entre name "+ actual_var);
            }
            
            function respuesta2(data){                 
                 actual_var = data;                 
                 interaccion.getNameVariable(actual_var,<%=indi%>, getName2);//obtengo el nombre de la nueva variable
                 obtener(<%=indi%>,data);
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
      <div class="logo"><img src="images/logo.gif" width="293" height="84" border="0" alt="logo" /></div>      
      <div class="clr"></div>
    </div>
  </div> 
  
  <div class="body">     
    <div class="body_resize">
        
        <h2>Welcome <%=name%>&nbsp&nbsp<a id="link_indicador" href="#" onclick="link_indi();" ><%=nombre_indicador%></a>  > <a id="link_variable" href="#" ><%=nombre_variable%></a></h2>
        
        <div id="cuestionario" align="center">            
            <%
              /*IndicadorDaoImpl indDao = new IndicadorDaoImpl();
              List<Indicador> listIndicador = new ArrayList<Indicador>();
              listIndicador = indDao.findAll();
              
              Indicador indicador = new Indicador();
              for(int i=0;i<listIndicador.size();i++){
                  indicador = listIndicador.get(i);
                 out.println("<button  name='"+ indicador.getIdIndicador() +"' id='"+ indicador.getIdIndicador() +"' type='button' onclick='obtener("+ indicador.getIdIndicador() +");' >"+ indicador.getNombre() +"</button>");
              }
               */
            %>
                              
        </div> 
        <div id="box" >
            
        </div>
            <input type='button' value='save' id="buttonnnext" onclick="saveAndNext();" />
           <%-- <div class="right2"> </div> end div right2 --%> 
       
      <div class="clr"></div>
    </div>
  </div><%-- end div body rezise --%> 
  
  <div class="clr"></div>
</div>  
    </body>
</html>