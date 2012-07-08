<%-- 
    Document   : resultado
    Created on : Oct 4, 2011, 11:57:33 PM
    Author     : Dave
--%>

<%@page import="dwrScripts.initCapacitadores"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="pojo.Avance"%>
<%@page import="daoImpl.AvanceDaoImpl"%>
<%@page import="pojo.RespItem"%>
<%@page import="pojo.Item"%>
<%@page import="daoImpl.ItemDaoImpl"%>
<%@page import="daoImpl.RespItemDaoImpl"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="pojo.Escala"%>
<%@page import="daoImpl.EscalaDaoImpl"%>
<%@page import="pojo.Indicador"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Contrato"%>
<%@page import="daoImpl.ContratoDaoImpl"%>
<%@page import="pojo.Usuario"%>
<%@page import="daoImpl.UsuarioDaoImpl"%>
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
        <%
        HttpSession sesion=request.getSession();
        sesion.setMaxInactiveInterval(3600);
        String acc = (String) sesion.getAttribute("idAcc");
        String name;
        int sh = 0; //variable para mostrar el mensaje de que no ha terminado el instrumento cuando vale 1
        
        int idContrato =0;
        if(acc==null){
              response.sendRedirect("index.jsp");
       }else{
            
         AccesoDaoImpl daoAcceso = new AccesoDaoImpl();
         Acceso acceso = daoAcceso.findById(Integer.parseInt(acc));
       
         int id_usuario = acceso.getUsuario().getIdUsuario();
         UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
         Usuario usuario = new Usuario();
         usuario = usuDao.findById(id_usuario);
         
         name = usuario.getNombre();
         
         ContratoDaoImpl daoContra = new ContratoDaoImpl();
         Contrato contrato = (Contrato) daoContra.findByUsuario(usuario);//donde el estado sea igual 1
         idContrato = contrato.getIdContrato();
         
         //revisar si ya termino de llenar cada indicador, si no falta que termine el instrumento por lo tant no puede ver el grafico de araña.
         
         initCapacitadores init = new initCapacitadores();
         
         int av = init.AvancePorcXcontrato(contrato); 
         
         if(av==100){
              //calculo para guardar en avence en el campo resultado
                               
             int respPositiva=0;
             int valoracion=0;
             double promedio = 0.0;
             double eva;            

             IndicadorDaoImpl daoIndi = new IndicadorDaoImpl();
             List<Indicador> listIndi = new ArrayList<Indicador>();
             listIndi = daoIndi.findAllByActive();

             Indicador indicador = new Indicador();
             Variable variable = new Variable();
             Item item = new Item();

             RespItemDaoImpl daoRespItem = new RespItemDaoImpl();
             RespItem resp = new RespItem();

             EscalaDaoImpl daoEsc = new EscalaDaoImpl();
             Escala escala = new Escala();

             AvanceDaoImpl daoAvance = new AvanceDaoImpl();
             Avance avance = new Avance();

             DecimalFormat formateador = new DecimalFormat("##.##");

             for (int i=0;listIndi.size() > i;i++){//4 indicadores
                 indicador = listIndi.get(i);
                 //System.out.println(">><><><><> indicador " + indicador.getNombre());

                 VariableDaoImpl daoVariable = new VariableDaoImpl();
                 List<Variable> listVariable = new ArrayList<Variable>();
                 listVariable = daoVariable.findByIndicador(indicador);

                 for(int j=0;listVariable.size() > j ;j++){ 

                     variable = listVariable.get(j);
                     //System.out.println("<><> variable " + variable.getNombre());

                     ItemDaoImpl daoItem = new ItemDaoImpl();
                     List<Item> listItem = new ArrayList<Item>();
                     listItem = daoItem.findByVariableActivo(variable);

                     for (int m=0;listItem.size() > m; m++){
                         item = listItem.get(m);

                         resp = daoRespItem.findByContratoItem(idContrato, item.getIdItem());

                         if(resp.getResBoolean()==1){
                             respPositiva = respPositiva + 1;
                         }
                     }

                         escala = daoEsc.findByVarRango(variable.getIdVariable(),respPositiva);
                         //System.out.println("La variable " + variable.getIdVariable() + " el rango "+ respPositiva +" la escala " + escala.getValoracion() );

                     respPositiva = 0;
                     valoracion = valoracion + escala.getValoracion();
                     //ponderacionTotal = ponderacionTotal + variable.getPonderacion();
                 }//fin ciclo variable

                 promedio = (double) valoracion / listVariable.size();

                 //System.out.println("><<<<?????????? promedio por indicador " + Double.valueOf(formateador.format(promedio)) +" valoracion "+ valoracion + " con num variable " + listVariable.size());

                 //System.out.println(Double.valueOf(formateador.format(promedio*0.25*100)));

                 eva = Double.valueOf(formateador.format(promedio*0.25*100));

                 avance = daoAvance.findByIndiAndContra(indicador.getIdIndicador(), idContrato);             
                 avance.setResultado((float) eva);
                 daoAvance.update(avance);

                 promedio = 0.0;
                 valoracion = 0;            
             }        
         }else{
             sh = 1;
         }
           
                          
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
        <title>Grafico</title> 
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <script src="resources/amcharts/javascript/amcharts.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/amcharts/javascript/amfallback.js"></script>
        <script src="resources/amcharts/javascript/raphael.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/amcharts/flash/swfobject.js"></script>
        
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>        
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>
        
        <script type="text/javascript">
                 var id_contrato=<%=idContrato%>;  
                 var mostrar = <%=sh%>;
                   
           var flashVars = {
                settings_file: "resources/settings.xml",
                data_file: "GraficoResultado?idcontrato="+id_contrato
           };
           
           $(document).ready(function(){ 
               
               if(mostrar==1){
                   var palabra= "<section role='principal' id='message_box'><div class='notification error'><a href='#' class='close-notification' title='Hide Notification' rel='tooltip'>x</a><p class='hola'><strong class='hola'>Completar Instrumento</strong><p class='hola'>El instrumento no ha sido llenado todavia, despues de finalizado podra ver el Grafico de Araña!!</p></div><!-- /Notification --></section>";  
                   $("#messageBox").html(palabra);
               }else{
               
                 // change 8 to 80 to test javascript version
            if (swfobject.hasFlashPlayerVersion("90")){
                swfobject.embedSWF("resources/amcharts/flash/amradar.swf", "chartdiv", "700", "600", "8.0.0", "resources/amcharts/flash/expressInstall.swf", flashVars);
            }
            else {
                var amFallback = new AmCharts.AmFallback();
                amFallback.settingsFile = flashVars.settings_file;  
                amFallback.dataFile = flashVars.data_file;                    
                amFallback.type = "radar";
                amFallback.write("chartdiv");
            }
                }
              
              //para los botones
		
                $( "#gobackbutton" ).button({			
			icons: {
				primary: "ui-icon-circle-arrow-w"
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
           
           
            });  
            
            function goout(){
               location.href="salir";
            }
            
            function goBack(){
               validacion.saveActionBitacora(<%=acc%>,13,"",<%=id_usuario%>,"resultado.jsp","controlPanel.jsp");
               location.href="controlPanel.jsp";
            }           
           
	 </script>
        <style>
            td{ 
               text-align: center;
            }
            #toolbar {
		padding: 10px 4px;
	}
        </style>
    </head>
    <body>
        <div class="main">         
    <div class="header">
    <div class="header_resize">     
        
      <div class="menu">
     
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logo.gif" width="293" height="84" border="0" alt="logo" /></div>      
      <div class="inGo" style=" font-size: 11px;" >
       <span id="toolbar" class="ui-widget-header ui-corner-all">	
        <button id="gobackbutton" >Regresar</button>	
        <button id="logoutbutton" ><%=name%></button>	
       </span> 
       <div>
        <div id="menuBtnOpciones1" style=" float: right;  border-radius: 0 0 5px 5px;  margin-right: 5px; border-color: #69a8d4; border-style: solid;  border-width: 1px; display: none; background: #e7f1fa; width: 100px; height: 20px; color: #015480">
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
      <div class="body_resize" align="center">
          <div id="messageBox"></div>
          <div id="chartdiv" style="width:700px; height:600px; background-color:#FFFFFF"></div>          
      </div>
      
  </div>
        <div class="footer">
    <div class="footer_resize">
      
      
      <div class="clr"></div>
    </div>
  </div>
       
        </div>
    </body>
</html>
<%
}
%>