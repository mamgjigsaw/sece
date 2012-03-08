<%-- 
    Document   : register
    Created on : 03-07-2011, 10:09:10 AM
    Author     : server
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Pais"%>
<%@page import="java.util.List"%>
<%-- <%@page import="daoImpl.daoPaisImpl"%> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="Expires" CONTENT="-1" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <title>Register</title>        
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script>
        <script type="text/javascript" src="resources/jquery/js/easySlider1.5.js"></script>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/message.css" rel="stylesheet" type="text/css" /> 
        <script type="text/javascript" >
             $(function() {
                $("#btn").button();
                $( "#datepicker" ).datepicker();
		
            });

              function h(){
               alert($("#txtName").val());
            }

            function validarNick(){
            var texto = $("#txtNick").val();

            $.ajax({
                        url: "valUser.jsp?var=" + texto,
                        cache: false,
                        type: "GET",
                        processData: function(dato){
                                $("#resp").html("procesando..");
                        },
                        success: function(datos){
                                $("#resp").html(datos);
                        }
                });
            }
        </script>
        
     
    </head>
    <body id="body_reg">
        <div align="center">
        <div id="content_reg">
            <div id="addCommentContainer2">
                <div align="left" ><img src="images/logo.png" alt="Control Panel Login" /></div>
            <h1 id="header_main" >Create an Account with us </h1>
            <form action="saveUsuario" method="post">               
                
                 <h2 class="legend">Personal Details</h2>
                
                 <div class="div_header_reg">
                     <div class="row_reg">
                        <div class="left_reg">First and Last Name:</div>
                        <div class="right_reg"><input type="text" autofocus required="required" name="txtName" id="txtName" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Telephone:</div>
                        <div class="right_reg"><input type="text" name="txtTelephone" id="txtTelephone" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Address:</div>
                        <div class="right_reg"><input type="text" name="txtAddress" id="txtAddress" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Country/Region:</div>
                        <div class="right_reg">
                            <select name="cCountry"  id="cCountry">
                                <option value="000">--Select--</option>
                                
                            </select>
                        </div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">State/Province:</div>
                        <div class="right_reg">
                            <div id="comboState" >
                            <select name="cState" id="cState">
                               <option value="0000">--Select--</option>
                            </select>
                            </div>
                         </div>
                        <div class="clear_reg"></div>
                    </div>                      

                <script type="text/javascript">               
                     $(document).ready(function(){
                     $("#cCountry").change(function(){
                                 $.ajax({
                                    url:"loadState.jsp",
                                    type: "POST",
                                    data:"idcountry="+$("#cCountry").val(),
                                    success: function(opciones){
                                    $("#comboState").html(opciones);                                    
                                    $("#cState").change();
                                                          }
                                          })
                                     });
                              });                       
                  </script>

                    <div class="row_reg">
                        <div class="left_reg">City:</div>
                        <div class="right_reg"><input type="text" name="txtCity" id="txtCity" /></div>
                        <div class="clear_reg"></div>
                    </div>

                    <div class="row_reg">
                        <div class="left_reg">Postal Code:</div>
                        <div class="right_reg"><input type="text" name="txtPostal" id="txtPostal" /></div>
                        <div class="clear_reg"></div>
                    </div>
                                
                     <div class="row_reg">
                        <div class="left_reg">Date of Birth:</div>
                        <div class="right_reg"><input type="text" name="datepicker" id="datepicker" size="30"/></div>
                        <div class="clear_reg"></div>
                    </div>

                </div><%-- End div personal details --%>
                
                
                <h2 class="legend">Account Details</h2>
                <div class="div_header_reg" >
                    <div class="row_reg">
                        <div class="left_reg">Choose a Nick:</div>
                        <div class="right_reg"><input type="text" name="txtNick" id="txtNick" onblur="validarNick();" /><div id="resp"></div></div>                        
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">E-mail Address:</div>
                        <div class="right_reg"><input type="text" name="txtEmailAddress1" id="txtEmailAddress1" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Re-enter E-mail Address:</div>
                        <div class="right_reg"><input type="text" name="txtEmailAddress2" id="txtEmailAddress2" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Choose a password:</div>
                        <div class="right_reg"><input type="password" name="txtPassword1" id="txtPassword1" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Re-enter password:</div>
                        <div class="right_reg"><input type="password" name="txtPassword2" id="txtPassword2" /></div>
                        <div class="clear_reg"></div>
                    </div>

                </div><%-- End div account details --%>
               
               
                <h2 class="legend">Verification</h2>
                <div class="div_header_reg" >
                   
                </div><%-- End div verification --%>
                               
                <input type="submit" value="Register &raquo;" id="btn" name="btnSave" />                
            </form>
            </div>
        </div>
     </div>
    </body>
</html>
