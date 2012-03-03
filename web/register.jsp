<%-- 
    Document   : logger
    Created on : May 2, 2011, 7:21:03 PM
    Author     : mamg
--%>

<%@page import="daoImpl.PaisDaoImpl"%>
<%@page import="pojo.Pais"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="resources/jquery/js/jquery.validate.js"></script>
       <title>Sistema De Evaluacion De Competitividad</title>
       <script type="text/javascript">               
              $(document).ready(function(){
                $("#comboPais").change(function(){
                      $.ajax({
                              url:"loadZone.jsp",
                              type: "POST",
                              data:"idcountry="+$("#comboPais").val(),
                              success: function(opciones){
                              $("#comboState").html(opciones);                                    
                              $("#cState").change();
                                   }
                                 })
                             });
                                              
                      });    
                      
               $(function() {
		            $( "#btnregister" ).button();
                            $( "#btngoBack" ).button();
                            
                            $( "#dialog:ui-dialog" ).dialog( "destroy" );
	
		$( "#dialog-message" ).dialog({
			autoOpen: false,
                        modal: true,
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
                                        location.href="saveUsuario?txtname_empresa=" + $("#txtname_empresa").val() +"&&txtdes="+ $("#txtdes").val() +"&&txttel_empresa="+ $("#txttel_empresa").val() +"&&cState="+ $("#cState").val() +"&&txtdirec_empre="+ $("#txtdirec_empre").val() +"&&txtname="+ $("#txtname").val() +"&&txtcargo="+ $("#txtcargo").val() +"&&txttel="+ $("#txttel").val() +"&&txtcorreo="+ $("#txtcorreo").val() +"&&txtdir="+ $("#txtdir").val() +"&&txtpass="+ $("#txtpass").val();         
				}
			}
		});//fin dialog-message
                
               });  
                  
    
    $(function(){
       $('#formRegister').validate({
           rules: {
           'txtname_empresa': 'required',
           'txtdes': 'required',
           'txttel_empresa': { required: true, number: true },
           'txtdirec_empre': 'required',
           'txtname': 'required',
           'txttel': { required: true, number: true },
           'txtcargo': 'required',
           'txtdir': 'required',           
           'txtcorreo': { required: true, email: true },
           'txtpass': 'required',
           'txtpass2': {required: true,equalTo: "#txtpass"}
           },
       messages: {
           'txtname_empresa': 'Ingrese el nombre de una empresa',
           'txtdes': 'Ingrese una descripcion de la empresa',
           'txttel_empresa': { required: 'Ingrese el número telefonico de la empresa', number: 'Debe ingresar un número' },
           'txtdirec_empre': 'Debe ingresar la direccion de la empresa',
           'txtname': 'Debe ingresar su nombre',
           'txttel': { required: 'Debe ingresar su número telefonico', number: 'Debe ingresar un número' },
           'txtcargo': 'Debe ingresar su cargo',
           'txtdir': 'Debe ingresar su direccion',                      
           'txtcorreo': { required: 'Debe ingresar un correo electrónico', email: 'Debe ingresar el correo electrónico con el formato correcto. Por ejemplo: nombre@dominio.com' },
           'txtpass': 'Debe ingresar un password',
           'txtpass2': {required: 'Debe ingresar el password nuevamente',equalTo: 'Debe de ser el mismo password'}           
       },
       debug: true,
       /*errorElement: 'div',*/
       //errorContainer: $('#errores'),
       submitHandler: function(form){
         $( "#dialog-message" ).dialog( "open" ); 
       }
    });
});

    function go_back(){
        location.href = "logger.jsp"; 
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
      <div class="logo"><img src="images/logo.gif" width="250" height="70" border="0" alt="logo" /></div>      
      <div class="clr"></div>
    </div>
  </div><%-- termina el div header --%>
  
  <div class="clr"></div>
  <div class="body">
      <div id="dialog-message" title="Bienvenido a SECE">          
	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		Gracias por registrarte en SECE, ahora puedes comenzar a evaluar tu empresa desde varios indicadores y asi establecer metas para el mejoramiento.
	</p>
	<p>
		Aplicar el instrumento a tu empresa de una manera <b>facil y sencilla</b>.
	</p>
      </div>
    <div class="body_resize">
      
           <h4>Crea tu cuenta con nosotros!!</h4>
            
            <p><strong>Hablanos acerca de ti!!! </strong><br />
            <form id="formRegister" method="post">               
                 <div class="div_header_reg">
                     
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Empresa:</label></div>
                        <div ><input type="text" name="txtname_empresa" id="txtname_empresa" /></div>
                        <div class="clear_reg"></div>
                    </div>                     
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Descripcion:</label></div>
                        <div ><input type="text" name="txtdes" id="txtdes" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Telefono de la Empresa:</label></div>
                        <div ><input type="text" name="txttel_empresa" id="txttel_empresa" /></div>
                        <div class="clear_reg"></div>
                    </div>
                     <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Pais:</label></div>
                        <div >
                            <select name="comboPais" id="comboPais" >
                                <option value="000">--Seleccione--</option>
                                <%
                                   List<Pais> list = new ArrayList<Pais>();
                                   PaisDaoImpl daopais = new PaisDaoImpl();
                                   list = daopais.findAll();

                                   String name;
                                   int id;
                                   for(int i=0;i<list.size();i++){
                                       Pais pais = (Pais) list.get(i);
                                       id= pais.getIdPais();
                                       name= pais.getNombre();
                                 %>
                                  <option value="<%=id%>"><%=name%></option>
                                 <%
                                  }
                                  %>
                            </select> 
                        </div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Ciudad:</label></div>
                        <div >
                            <div id="comboState" >
                            <select name="cState" id="cState">
                               <option value="0000">--Seleccione--</option>
                            </select>
                            </div>
                        </div>
                        <div class="clear_reg"></div>
                    </div>                    
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Direccion empresa:</label></div>
                        <div ><input type="text" name="txtdirec_empre" id="txtdirec_empre" /></div>
                        <div class="clear_reg"></div>
                    </div>
                           
                    <div class="row_reg">
                        <div class="left_reg"><label for="fandln" >Nombre:</label></div>
                        <div ><input type="text" name="txtname" id="txtname" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Telefono:</div>
                        <div ><input type="text" name="txttel" id="txttel" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Cargo:</div>
                        <div ><input type="text" name="txtcargo" id="txtcargo" /></div>
                        <div class="clear_reg"></div>
                    </div>                                               
                    <div class="row_reg">
                        <div class="left_reg">Direccion:</div>
                        <div ><input type="text" name="txtdir" id="txtdir" /></div>
                        <div class="clear_reg"></div>
                    </div>                                               
                    <div class="row_reg">
                        <div class="left_reg">Direccion de Correo:</div>
                        <div ><input type="text" name="txtcorreo" id="txtcorreo" /></div>
                        <div class="clear_reg"></div>
                    </div>                    
                    <div class="row_reg">
                        <div class="left_reg">Digite su password:</div>
                        <div ><input type="password" name="txtpass" id="txtpass" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Re-enter password:</div>
                        <div ><input type="password" name="txtpass2" id="txtpass2" /></div>
                        <div class="clear_reg"></div>
                    </div>  
               </div><%-- div header_reg End div personal details --%>
               <p><strong>*Todos los campos son requeridos </strong><br />
               <p><input type="submit" value="Continuar &raquo;" id="btnregister" name="btnregister" /><input type="button" style=" margin-left: 5px;" value="Regresar" id="btngoBack" name="btngoBack" onclick="go_back();" /></p>
            </form>
                <br />                                      
            
      <div class="clr"></div>
    </div>
  </div><%-- termina el div body --%>
  
  <div class="clr"></div>
</div>
</body>
</html>