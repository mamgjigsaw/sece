<%-- 
    Document   : videoChat
    Created on : Dec 28, 2011, 10:06:43 PM
    Author     : Dave
--%>

<%@page import="org.directwebremoting.WebContextFactory"%>
<%@page import="org.directwebremoting.ScriptSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VideoChat</title>           
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script language="javascript" type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>              
        <link href="resources/style.css" rel="stylesheet" type="text/css" />    
        
        <script type="text/javascript" src="/sece/dwr/interface/chat.js"></script>        
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>
        <script type="text/javascript">                       
            $(document).ready(function() {            
                chat.remoteMethod(null, function(){dwr.engine.setActiveReverseAjax(true);});
                
                
                 $("#btnlimpiar").click(function(){
                    $("#chatlog").html("");  
                 });  
                 
                $(document).keypress(function(e) {
                if(e.keyCode == 13) {                   
                    sendMessage();
                    //event.preventDefault();
                    }
                 });                      
            });//fin document
          
            function sendMessage() {
                 var text = dwr.util.getValue("text");
                 dwr.util.setValue("text", "");
                 chat.addMessage(text);
                /*$("#chatlog").append($("#text").val()+ "<br>");
                $("#text").val("");                               */
            }
            
            function receiveMessages(messages) {
              var textoChat = messages;                           
              $("#chatlog").append(textoChat+ "<br>");              
            }            
        </script>
        <style>
            #chat{
                background-color:#6E0A0A; float:left; width: 220px;
            }
            #chatlog{
                background-color: #FFFFFF;
                overflow: auto;
                height: 200px;
                width: 200px;  
                margin-left: 6px;
            }
            #btnlimpiar{
                
            }
            #btnchatear{                
            }
            #text{
                overflow: auto;                
                margin-left: 6px;
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
  
    <div class="body" style="margin-bottom: 2em;">
         
        <div  align="left" style="float: left;">
            <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="737" height="625" id="movie_name" align="middle">
                <param name="movie" value="resources/swf/publicador.swf?usuario=usuario4"/>

                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="resources/swf/publicador.swf?usuario=usuario4" width="737" height="625">
                    <param name="movie" value="resources/swf/publicador.swf?usuario=usuario4"/>
                <!--<![endif]-->
                    <a href="http://www.adobe.com/go/getflash">
                        <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player"/>
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
          </div>
        <div id="chat" style="">               
            <hr/>
            <div id="chatlog"></div><br/>
            <textarea id="text" > </textarea>
            <!--input id="btnchatear" type="button" value="Send" onclick="sendMessage()"/--> <br/>
            <input id="btnlimpiar" type="button" value="Limpiar"/>
        </div> 
         
      </div>
        <!-- Usuario:<input id="usuario" type="text" /><input type="button" value="enviar" onclick="enviar()"/> -->                   
    </div>    
    </body>
</html>
