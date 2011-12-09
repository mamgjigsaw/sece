

<%@page import="pojo.Variable"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="daoImpl.IndicadorDaoImpl"%>
<%@page import="pojo.Indicador" %>
<%IndicadorDaoImpl idi = new IndicadorDaoImpl();
 Indicador indi;%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <title>Ingreso de Indicadores</title>
        <link type="text/css" href="resources/jquery/css/redmond/jquery-ui-1.8.7.custom.css" rel="stylesheet" />
         <script type="text/javascript" src="resources/jquery/js/jquery-1.4.4.min.js"></script>
	 <script type="text/javascript" src="resources/jquery/js/jquery-ui-1.8.7.custom.min.js"></script>
         <script type="text/javascript" src="resources/jquery/js/jquery.form.js"></script>





  <script type="text/javascript">
      //apariencia al boton
    $(document).ready(function() {
    $("button").button();
  });

  $(document).ready(function() {

    $("#accordion").accordion({ header: "h3" });
    $("#tabs").tabs();
  });


    $(document).ready(function() {
      $("#Indicador").ajaxForm(function(){
       alert("Datos Ingresados");
        });
     });

      $(document).ready(function() {
        $("#Variable").ajaxForm({
          type: "POST",
           success: showResponse
         });
      });

      $(document).ready(function() {
         $("#Item").ajaxForm({
          type: "POST",
          success: showResponse
         });
      });

      function showResponse(responseText, statusText, xhr, $form){
          $('#dialog').dialog('open'); }

      $(function(){
          $( "#dialog:ui-dialog" ).dialog( "destroy" );
          $('#dialog').dialog({
             autoOpen: false,
              modal:true,
              width: 400,
              buttons: {
               "Ok": function() {
                  $(this).dialog("close");
                }
              }
          });
      });

//funcion de cambio del select en modificar indicador
   function cambioIndi(){
      $("#selectIndicador option:selected").each(function () {
         var str = $(this).text();
         $.ajax({
          type: "POST",
          url: "datos.jsp?dato="+str,
          success: function(data){$('#modIndicador').html(data);}
         });
       });
   }

    function ShowtableModInd(){

           var dato = $("#selvariable option:selected").text();
           $.ajax({
           type: "post",
           url: "tblitem.jsp?var="+dato,
           success: function(data1){$('#pagItem').html(data1);}
      });

    }
   //funcion del select en pestaña variable, cargar la variable en modificar
   function cambioIndiVar(){

           var indi = $("#selindicador option:selected").text();

           $.ajax({
           type: "post",
           url: "mdvariable.jsp?dato1="+indi,
           success: function(data1){$('#ModVariable').html(data1);}
      });

}

//funcion del boton modificar en la pestaña Variable
   function modify(){

       $('#ModInd').dialog('open');
   }

  $(function(){
               $( "#dialog:ui-dialog" ).dialog( "destroy" );
               $('#ModInd').dialog({
			autoOpen: false,
			height: 270,
			width: 200,
                        autosize: false,
			modal: true,
                        buttons:{
                            "Guardar": function(){ $('#modifyIndi').submit();}
                        }

		});
               });
//evento que hace aparecer el dialogo
   function modifyVar(){

      $('#ModVar').dialog('open');

           var indi = $("#selindicador option:selected").text();
           $.ajax({
           type: "post",
           url: "mdvariable.jsp?dato1="+indi,
           success: function(data1){$('#ModVariable').html(data1);}
      });
   }

   $(function(){
                $( "#dialog:ui-dialog" ).dialog( "destroy" );
               $('#ModVar').dialog({
			autoOpen: false,
			height: 270,
			width: 230,
                        autosize: false,
			modal: true,
                        buttons:{
                            "Guardar": function(){ $('#FormmodifyVar').submit();}
                        }

		});

   });

  </script>
         <style type="text/css">
             .redondeado { background:  #AFB407 ; /* #F0EDE0 Elementos de los que se puede prescindir*/margin-left:auto;margin-right:auto;/*Aquí empieza la parte importante*/border: 1px solid #749114; /*definición del borde*/-moz-border-radius:10px; /*Para que funcione en Mozilla*/-khtml-border-radius:10px; /*Para Konqueror y Safari */-webkit-border-radius:10px;border-radius:10px; /*Forma normalizada*/}
         </style>



    </head>
    <body style="font-size:70.5%;">

<table align="center"  width="500" heigth="800">
 <tr><td></td>
     <td><div style=" background: #2e6e9e;" class="redondeado" align="center">
      <table> <tr><td>

        <div id="tabs">

            <ul>
                <li><a href="#fragment-1"><span>Indicador</span></a></li>
                <li><a href="#fragment-2"><span>Variable</span></a></li>
                <li><a href="#fragment-3"><span>Item</span></a></li>
            </ul>

                <div id="fragment-1">
                    <form id="Indicador" action="svindicador.jsp">
                    <table>
                    <tr><th>Indicador: </th> <td><input type="text" name="indicador"/> </td></tr>
                    <tr><th>Contribucion</th> <td> <input type="text" name="contribucion" /> </td></tr>
                    <tr><th>s4</th> <td> <input type="text" name="s4" /> </td></tr>
                    </table>
                    <table>
                        <tr><td ><button id="create-user" name="btnindicador" type="submit">Guardar</button> </td> <td> <button id="create-user" name="resetButton" type="reset" >Limpiar</button> </td> <td> <button id="create-user" name="Modificar" type="button" onclick="modify()">Modificar</button> </td></tr>
                    </table>
                    </form>
                </div>

                <div id="fragment-2">
                    <form id="Variable" action="svvariable.jsp">
                    <table>
                        <%List indicadores =  idi.findAll();%>
                        <tr><th>Indicador</th><td><select name="selindicador" id="selindicador" > <%for(int i=0;i<idi.findAll().size();i++) {  indi = (Indicador) indicadores.get(i);%> <option><%=indi.getNombre()%></option><%}%></select></td></tr>
                        <tr><th>Variable</th><td><input type="text" name="txtvariable"/></td></tr>
                        <tr><th>Ponderacion</th><td><input type="text" name="txtponderacion"/></td></tr>
                        <tr><th>s</th><td><input type="text" name="txts"/></td></tr>
                        <tr><th>Estado</th><td><input type="checkbox" name="chkok" value="true"/>Activo</td></tr>
                    </table>
                    <table>
                        <tr><td><button id="create-user" name="btnindicador" type="submit">Guardar</button> </td> <td> <button id="create-user" name="resetButton" type="reset" >Limpiar</button> </td> <td> <button id="create-user" name="Modificar" type="button" onclick="modifyVar()">Modificar</button> </td> </tr>

                    </table>
                    </form>
                </div>

                <div id="fragment-3">
                    <form id="Item" action="svitem.jsp">
                    <table>
                         <%VariableDaoImpl vdi = new VariableDaoImpl();
                           List variables = vdi.findAll();%>
                        <tr><th>Variable</th><td><select id="selvariable" name="selvariable"> <%for(int i=0;i<vdi.findAll().size();i++) { Variable vari = (Variable) variables.get(i);%> <option><%=vari.getNombre()%></option><%}%></select></td></tr>
                        <tr><th>Item</th><td><textarea name="txtitem" cols="30" rows="5"></textarea></td></tr>
                        <tr><th>Estado</th><td><input type="checkbox" name="chkitem" value="true"/>Activo</td></tr>
                    </table>
                    <table>
                        <tr><td><button id="create-user" name="btnitem" type="submit">Guardar</button> </td> <td> <button id="create-user" name="resetButton" type="reset" >Limpiar</button> </td> <td> <button id="create-user" name="Modificar" type="button" onclick="ShowtableModInd()">Modificar</button> </td> </tr>
                    </table>
                    </form>
                </div>
        </div>


      </td></tr></table>

    </div></td>
 <td></td></tr>
</table>
   <div style=" font-size: 12px"  id="dialog" title="SECE">La informacion ha sido guardada</div>

   <div id="ModInd" title="Modificar Indicador">
       <form id="modifyIndi" method="post" action="updateIndicdor">
           <select id="selectIndicador" name="selectIndicador" onchange="cambioIndi()"> <option selected></option><%for(int i=0;i<idi.findAll().size();i++) {  indi = (Indicador) indicadores.get(i);%> <option><%=indi.getNombre()%></option><%}%></select><br/><br/>
       <hr/>
       <div id="modIndicador"></div>
       </form>
   </div>

       <div id="ModVar" title="Modificar Variable">
        <form id="FormmodifyVar" method="post" action="updateVariable">
            <div id="ModVariable"></div>

        </form>
       </div>

       <div align="center" id="pagItem"></div>
    </body>
</html>
