<%-- 
    Document   : logger
    Created on : May 2, 2011, 7:21:03 PM
    Author     : mamg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <%-- <script type="text/javascript" src="resources/jquery/js/jquery.corner.js"></script> 
        <script type="text/javascript" src="resources/jquery/js/easySlider1.5.js"></script> --%>
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
       <title>Sistema De Evaluacion De Competitividad</title>
     
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
  </div><%-- termina el div header --%>
  
  <div class="clr"></div>
  <div class="body">
    <div class="body_resize">
      <div class="right">
        <div class="clr"></div>
        <div class="right_top">
          
        </div>
        <div class="clr"></div>
      </div>
      <div class="right">
        <div class="clr"></div>
        <div class="right_top">
          <div class="right_bottom">
            <h4>Crea tu cuenta con nosotro!!</h4>
            
            <p><strong>Datos Personales </strong><br />
               <form action="saveUsuario" method="post">               
                 <div class="div_header_reg">
                     
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Empresa:</label></div>
                        <div class="right_reg"><input type="text" name="txtname_empresa" id="txtname_empresa" /></div>
                        <div class="clear_reg"></div>
                    </div>                     
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Descripcion:</label></div>
                        <div class="right_reg"><input type="text" name="txtdes" id="txtdes" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Telefono de la Empresa:</label></div>
                        <div class="right_reg"><input type="text" name="txttel_empresa" id="txttel_empresa" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Ciudad:</label></div>
                        <div class="right_reg"><input type="text" name="txtciudad" id="txtciudad" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Direccion empresa:</label></div>
                        <div class="right_reg"><input type="text" name="txtdirec_empre" id="txtdirec_empre" /></div>
                        <div class="clear_reg"></div>
                    </div>
                     
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Nombre:</label></div>
                        <div class="right_reg"><input type="text" name="txtname" id="txtname" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Telefono:</div>
                        <div class="right_reg"><input type="text" name="txttel" id="txttel" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Cargo:</div>
                        <div class="right_reg"><input type="text" name="txtcargo" id="txtcargo" /></div>
                        <div class="clear_reg"></div>
                    </div>                                               
                    <div class="row_reg">
                        <div class="left_reg">Direccion:</div>
                        <div class="right_reg"><input type="text" name="txtdir" id="txtdir" /></div>
                        <div class="clear_reg"></div>
                    </div>                                               
                    <div class="row_reg">
                        <div class="left_reg">Direccion de Correo:</div>
                        <div class="right_reg"><input type="text" name="txtcorreo" id="txtcorreo" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Re-enter E-mail Address:</div>
                        <div class="right_reg"><input type="text" name="txtcorreo2" id="txtcorreo2" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Digite su password:</div>
                        <div class="right_reg"><input type="password" name="txtpass" id="txtpass" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Re-enter password:</div>
                        <div class="right_reg"><input type="password" name="txtpass2" id="txtpass2" /></div>
                        <div class="clear_reg"></div>
                    </div>  
               </div><%-- div header_reg End div personal details --%>
               
               <p><input type="submit" value="Register &raquo;" id="btn" name="btnSave" /></p>
            </form>
                <br />              
            </p>
            <p><a href="register.jsp"><strong>Registrarse</strong></a></p>
            <div class="clr"></div>
          </div>
        </div>
        <div class="clr"></div>
      </div>
      <div class="right">
        <div class="right_top">
          
        </div>
        <div class="clr"></div>
      </div>
            
      <div class="clr"></div>
    </div>
  </div><%-- termina el div body --%>
  
  <div class="clr"></div>
</div>
</body>
</html>