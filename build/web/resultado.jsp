<%-- 
    Document   : resultado
    Created on : Oct 4, 2011, 11:57:33 PM
    Author     : Dave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <title>SECE</title>           
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script language="javascript" type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
              
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <script src="resources/amcharts/javascript/amcharts.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/amcharts/javascript/amfallback.js"></script>
        <script src="resources/amcharts/javascript/raphael.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/amcharts/flash/swfobject.js"></script>
        <script type="text/javascript">
                       
           var flashVars = {
                settings_file: "resources/settings.xml",
                data_file: "GraficoResultado"
           };
           
           $(document).ready(function(){ 
                 // change 8 to 80 to test javascript version
            if (swfobject.hasFlashPlayerVersion("80")){
                swfobject.embedSWF("resources/amcharts/flash/amradar.swf", "chartdiv", "700", "600", "8.0.0", "resources/amcharts/flash/expressInstall.swf", flashVars);
            }
            else {
                var amFallback = new AmCharts.AmFallback();
                amFallback.settingsFile = flashVars.settings_file;  
                amFallback.dataFile = flashVars.data_file;                    
                amFallback.type = "radar";
                amFallback.write("chartdiv");
            }
                
                
            });       
           
	 </script>
        <style>
            td{ 
               text-align: center;
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
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="body">
      <div class="body_resize" align="center">
          <div id="chartdiv" style="width:700px; height:600px; background-color:#FFFFFF"></div>
      </div>
    </body>
</html>
