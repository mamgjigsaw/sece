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
         <%
        
        String cadena;
        int mostrar=2;
        int idUsuariocapa=-1;
        
        cadena = request.getParameter("rodaticapacdi");
        
        
        if (cadena.equalsIgnoreCase("mJH83fas2{}4")){            
            //System.out.print("email=='odadivlo' && codigo=='ssap'");                       
            mostrar =0;
        }else if (cadena==""){
            response.sendRedirect("index.jsp");            
        }else {
            //System.out.print(codigo);   
            mostrar = 1;                    
            idUsuariocapa= Integer.parseInt(cadena);                
                
        }
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link REL="shortcut icon" type="image/x-icon" href="images/flavicon.png"/>
        <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
        <link type="text/css" href="resources/Nuestro_CSS.css" rel="stylesheet"/>
	<script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
        <link href="resources/style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="resources/jquery/js/jquery.validate.js"></script>
        
        <script type="text/javascript" src="/sece/dwr/interface/validacion.js"></script>
        <script type="text/javascript" src="/sece/dwr/engine.js"></script>
        <script type="text/javascript" src="/sece/dwr/util.js"></script>             
        
       <title>Sistema De Evaluacion De Competitividad</title>
       <script type="text/javascript"> 
           var capa =<%=mostrar%>;
           var passEncriptado="";
           var usuCapa = <%=idUsuariocapa%>;
           
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
                                        
                                        if(capa==1){     
                                            validacion.encrypt($("#txtpass").val(),passEncript);
                                            location.href = "entrar?cV5VDde7H0l="+ $("#txtcorreo").val() +"&&K3JR5YpwQ8="+ passEncriptado;    
                                        }else if(capa==0){
                                            limpiar();
                                        }                                        
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
           validacion.guardarUsuario($("#txtname_empresa").val(),$("#txtdes").val(),$("#txttel_empresa").val(),$("#cState").val(),$("#txtdirec_empre").val(),$("#txtname").val(),$("#txtcargo").val(),$("#txttel").val(),$("#txtcorreo").val(),$("#txtdir").val(),$("#txtpass").val(),usuCapa);                      
           validacion.EnviarCorreo("sece@pml.org.ni",$("#txtcorreo").val(),"Cuenta SECE","<strong>Estimado "+ $("#txtname").val() +",</strong> <p> <strong>Gracias por registrarse</strong>, un responsable de SECE va ponerse en contacto con usted y asi activar su cuenta.</p><p> El proceso puede tomar unos dias, se enviara un correo cuando se ha activada.</p> <p><strong>Por favor no reinvie este correo, Gracias SECE TEAM.</strong></p>");
         $( "#dialog-message" ).dialog( "open" ); 
       }
    });
});

    function go_back(){
        location.href = "logger.jsp"; 
    } 
    
     
   function passEncript(data){
         passEncriptado = data;
   }
    
    function limpiar(){
        $("#txtname_empresa").val("");
        $("#txtdes").val("");
        $("#txttel_empresa").val("");
        $("#cState").val("");
        $("#txtdirec_empre").val("");
        $("#txtname").val("");
        $("#txtcargo").val("");
        $("#txttel").val("");
        $("#txtcorreo").val("");
        $("#txtdir").val("");
        $("#txtpass").val("");                      
        $("#txtpass2").val("");
        //$("#comboPais").val("");
    }
        </script>    
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize"> 
        
      <style type="text/css">
.buttonIniciarSesion {
	-moz-box-shadow:inset 0px 0px 12px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 0px 12px 0px #97c4fe;
	box-shadow:inset 0px 0px 12px 0px #97c4fe;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(50, #006092), color-stop(100, #006092) );
	background:-moz-linear-gradient( center top, #006092 5%, #1e62d0 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006092', endColorstr='#006092');
	background-color:#006092;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #006092;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
       outline-style: none;
	
	text-shadow:1px 1px 0px #1570cd;
        float: right; margin:0; margin-top: 35px; 
         text-decoration:none;
}.buttonIniciarSesion:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #016aa1), color-stop(1, #016aa1) );
	background:-moz-linear-gradient( center top, #016aa1 5%, #016aa1 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#016aa1', endColorstr='#016aa1');
	background-color:#1e62d0;
         text-decoration:none;
}.buttonIniciarSesion:active {
	position:relative;
	top:1px;
}
/* This imageless css button was generated by CSSButtonGenerator.com */
</style>
        
      <div class="menu">
       
      </div>
      <div class="clr"></div>
      <div class="logo"><img src="images/logofull.png" width="250" height="70" border="0" alt="logo" /></div>      
      <div class="clr"></div>
    </div>
  </div><%-- termina el div header --%>
  
  <div class="clr"></div>
  <div class="body">
      <div id="dialog-message" title="Gracias por registrarte en SECE">          
	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		Se le ha enviado un correo con la informacion sobre la activacion de su cuenta, y asi aplicar el instrumento a tu empresa de una manera <b>facil y sencilla</b>.	
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
                        <div ><textarea name="txtdir" id="txtdir" cols="30" rows="3"></textarea></div>
                        <div class="clear_reg"></div>
                    </div>                                               
                    <div class="row_reg">
                        <div class="left_reg">Direccion de Correo:</div>
                        <div ><input type="text" name="txtcorreo" id="txtcorreo" /></div>
                        <div class="clear_reg"></div>
                    </div>                    
                    <div class="row_reg">
                        <div class="left_reg">Digite su Contraseña:</div>
                        <div ><input type="password" name="txtpass" id="txtpass" /></div>
                        <div class="clear_reg"></div>
                    </div>
                    <div class="row_reg">
                        <div class="left_reg">Repetir Contraseña:</div>
                        <div ><input type="password" name="txtpass2" id="txtpass2" /></div>
                        <div class="clear_reg"></div>
                    </div>
                            <br>
                            <br><br>
                            <br><br>
               </div><%-- div header_reg End div personal details --%>
               <p><strong>*Todos los campos son requeridos </strong><br />
               <p><input type="submit" value="Continuar &raquo;" id="btnregister" name="btnregister" /><input type="button" style=" margin-left: 5px;" value="Regresar" id="btngoBack" name="btngoBack" onclick="go_back();" /></p>
            </form>
                <br />                                      
            
      <div class="clr"></div>
    </div>
  </div><%-- termina el div body --%>
  <div class="footer">
    <div class="footer_resize">
      
      
      <div class="clr"></div>
    </div>
  </div>
  <div class="clr"></div>
</div>
</body>
</html>