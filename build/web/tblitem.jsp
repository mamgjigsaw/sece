<%@page import="pojo.Item"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Variable"%>
<%@page import="daoImpl.VariableDaoImpl"%>
<%@page import="daoImpl.ItemDaoImpl"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<% ItemDaoImpl idi = new ItemDaoImpl();
   VariableDaoImpl vdi = new VariableDaoImpl(); %>
<html>
<head>

        
        <script type="text/javascript" src="resources/jquery/js/jquery.js"></script>
        <script type="text/javascript" src="resources/jquery/js/jTPS.js"></script>
        <link type="text/css" href="resources/jquery/css/jTPS.css" rel="stylesheet" />



        <script type="text/javascript">

                $(document).ready(function () {


                        $('#demoTable').jTPS( {perPages:[5,10,15,50,'ALL'],scrollStep:1,scrollDelay:30,
                                clickCallback:function () {
                                        // target table selector
                                        var table = '#demoTable';
                                        // store pagination + sort in cookie
                                        document.cookie = 'jTPS=sortasc:' + $(table + ' .sortableHeader').index($(table + ' .sortAsc')) + ',' +
                                                'sortdesc:' + $(table + ' .sortableHeader').index($(table + ' .sortDesc')) + ',' +
                                                'page:' + $(table + ' .pageSelector').index($(table + ' .hilightPageSelector')) + ';';
                                }
                        });

                        // reinstate sort and pagination if cookie exists
                        var cookies = document.cookie.split(';');
                        for (var ci = 0, cie = cookies.length; ci < cie; ci++) {
                                var cookie = cookies[ci].split('=');
                                if (cookie[0] == 'jTPS') {
                                        var commands = cookie[1].split(',');
                                        for (var cm = 0, cme = commands.length; cm < cme; cm++) {
                                                var command = commands[cm].split(':');
                                                if (command[0] == 'sortasc' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click();
                                                } else if (command[0] == 'sortdesc' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click().click();
                                                } else if (command[0] == 'page' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .pageSelector:eq(' + parseInt(command[1]) + ')').click();
                                                }
                                        }
                                }
                        }

                        // bind mouseover for each tbody row and change cell (td) hover style
                        $('#demoTable tbody tr:not(.stubCell)').bind('mouseover mouseout click',
                                function (e) {
                                        // hilight the row
                                        e.type == 'mouseover' ? $(this).children('td').addClass('hilightRow') : $(this).children('td').removeClass('hilightRow');
                                        //evento para cargar con el click los datos de item
                                        if (e.type == 'click'){
                                            var id = $(this).children('#idI').text();
                                            var desc_item = $(this).children('#desc').text()
                                            var estado_item = $(this).children('#estado').text()
                                            //alert(estado_item);
                                             $.ajax({
                                                type: "post",
                                                url: "mditem.jsp?dato1="+desc_item +"&estado1="+estado_item+"&id="+id,
                                                success: function(data1){$('#items').html(data1);}
                                                });
                                        }
                                }
                        );

                });


        </script>
        <style>
                body {
                        font-family: Tahoma;
                        font-size: 9pt;
                }
                #demoTable thead th {
                        white-space: nowrap;
                        overflow-x:hidden;
                        padding: 3px;
                }
                #demoTable tbody td {
                        padding: 3px;
                }
        </style>

</head>
<body>

<table id="demoTable" style="border: 1px solid #ccc;" cellspacing="0" width="700">
        <thead>
                <tr>
                        <th sort="item">Id</th>
                        <th sort="item">Item</th>
                        <th sort="date">Ultimo Cambio</th>
                        <th sort="estado">Estado</th>
                        
                </tr>
        </thead>
        <tbody>
            
            <% String d = request.getParameter("var");
            System.out.println(d);
               Variable var = vdi.findByName(d);
     //  System.out.println(var.getIdVariable());
        List items = idi.findAllByInd(var.getIdVariable());

       for(int i=0;i<items.size();i++){
           Item item = (Item) items.get(i);
           %>
           <tr>
               <td id="idI"><%=item.getIdItem()%></td>
               <td id="desc"><%=item.getDescripcion()%></td>
               <td id="uc"><%=item.getUltimoCambio()%></td>
               <td id="estado"><%=item.getEstado()%></td>
                        
                </tr>

        <%}%>
                

        </tbody>
        <tfoot class="nav">
                <tr>
                        <td colspan=7>
                                <div class="pagination"></div>
                                <div class="paginationTitle">Page</div>
                                <div class="selectPerPage"></div>
                                <div class="status"></div>
                        </td>
                </tr>
        </tfoot>
</table>
        <div id="items"></div>
</body>
</html>