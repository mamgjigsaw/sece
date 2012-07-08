<%-- 
    Document   : graficoHistorial
    Created on : Jan 2, 2012, 9:56:41 PM
    Author     : Dave
--%>

<%@page import="java.util.Iterator"%>
<%@page import="pojo.Indicador"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String idempresa = request.getParameter("idempresa");%>
<!DOCTYPE html>
<html>
    <head>
        <% 
        IndicadorDaoImpl idi = new IndicadorDaoImpl();
        List<Indicador> indicadores = idi.findAll();
        Indicador indicador = new Indicador();
        
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Grafico Resultado</title>
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script language="javascript" type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>              
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <script src="resources/amcharts/javascript/amcharts.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/amcharts/javascript/amfallback.js"></script>
        <script src="resources/amcharts/javascript/raphael.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/amcharts/flash/swfobject.js"></script>
        
       
	<script src="resources/jquery/ui/jquery.ui.core.js"></script>
	<script src="resources/jquery/ui/jquery.ui.widget.js"></script>
	<script src="resources/jquery/ui/jquery.ui.mouse.js"></script>
	<script src="resources/jquery/ui/jquery.ui.selectable.js"></script>
         <script type="text/javascript">
        $(function() {
            var idEmpresa = <%=idempresa%>;
		$( "#selectable" ).selectable({
                    selected: function(){
                        $(".ui-selected",this).click(function() {
                            var idIndicador = $(this).find('input:hidden').val();
                            var nomIndicador = $(this).text();
				swfobject.embedSWF("resources/amcharts/flash/amline.swf", "chartdiv", "650", "500", "8.0.0", "resources/amcharts/flash/expressInstall.swf",{path:"resources/amcharts/flash/",settings_file: "settingGraficoHistorial?indicador="+nomIndicador,data_file: encodeURIComponent("GraficoHistorial?idempresa="+idEmpresa+"&&idindicador="+idIndicador)});
                        });                
                    }
                });
	});
           
        
        </script>
        
        <style>
	#feedback { font-size: 1.4em; }        
	#selectable .ui-selecting { background: #fffff; }
	#selectable .ui-selected { background: #385B9B; color: white; }
	#selectable {list-style-type:disc;  margin: 0; padding: 0; width: 100%; }
	#selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
	</style>
    </head>
    <body>              
       <div class="main">         
    <div class="header">
        <div class="header_resize">     
            <a href="javascript:history.back(1)" class="buttonVolver">&LT;&LT; Atras</a>
          <div class="menu">

          </div>
          <div class="clr"></div>
          <div class="logo"><img src="images/logofull.png" width="293" height="84" border="0" alt="logo" /></div>      
          <div class="clr"></div>
        </div>
    </div>
  
      <div class="body">
         
         <div class="demo">
             <ul id="selectable">
                 <%
                    Iterator<Indicador> it = indicadores.iterator();
                    while (it.hasNext()){    
                        indicador = it.next();                    
                    %>                    
                    <li class="ui-widgetcontent"><input type="hidden" value="<%=indicador.getIdIndicador()%>" /><%=indicador.getNombre()%></li>
                    <%}%>
            </ul>
         </div>   
         <div class="" align="center">
             <!-- chart is placed in this div. if you have more than one chart on a page, give unique id for each div -->
             <div id="chartdiv" style="width:650px; height:500px; background-color:#FFFFFF;"></div>            
          </div>
      </div>
      </div>
    </body>
</html>
