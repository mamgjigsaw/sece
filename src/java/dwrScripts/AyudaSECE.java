/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dwrScripts;

/**
 *
 * @author Dave
 */
public class AyudaSECE {
    
    public AyudaSECE(){
      
    }
    
    public String ConBasis( int opcion ){
    String resultado = "";
        switch (opcion){
            case 0: resultado = "Un contrato es el vinculo entre una empresa, los usuarios que responden la evaluacion, un capacitador, y las respuestas y resultados de dicha evaluacion. Cuando el mismo usuario desee volver a realizar otra evaluaci&oacuten este tendra un nuevo contrato.";
                break;
            case 1: resultado = "El usuario <b>contacto</b> es la persona, la cual representa a una empresa, que se registra en el sistema.Una vez que la cuenta del usuario sea aceptada, &eacutel se  encargara de responder el cuestionario o agregar usuarios delegados para que ellos los contesten. <br> <a>&#191;c&oacutemo responder el cuestionario?</a>";
                break;
            case 2: resultado = "Los <b>delegados</b> son los usuario asociados a un indicador, ellos se encargaran de contestar las secciones de la evaluacion correspondientes. Los usuarios <a>contactos</a> pueden agregar, y modificar su asociaci&oacuten a los indicadores en el sistema en cualquier momento.";
                    break;
            case 3: resultado = "Un <b>capacitador</b> es la persona encargada de llevar un monitoreo directo con los usuarios clientes. Ellos siguen el progreso del las empresas  los cuales estan a un nivel de <a href='javascript: void(0);'>delegado</a> y de <a href='javascript: void(0);'>contacto</>. ";
                break;
            default: resultado = "";
                break;
        }
    
    return resultado;
    }
    
    public String ayudaInitCapacitador(int opcion) {
    String resultado = "";
        switch (opcion){
            case 0 : resultado = "";
                break;
            case 1: resultado = "<p>La primer pantalla del Sistema que vera el capacitador al ingresar es el tab de Espacio de trabajo, el cual estar&acute; esta dividido en 2 secciones, la primera muestra informaci&oacute;n sobre empresas asignadas.</p>"
                                +"<img src='imagenes/image3001.jpg'></img><br><br>"
                                +"<p>Esta primer secci&oacute;n esta compuesta por una tabla que muestra informaci&oacute;n , sobre las empresas que est&acute;n bajo la tutela de este capacitador. La tabla muestra informaci&oacute;n de la empresa por fila, Nombre de la empresa, Contacto de la empresa, fecha en la cual la empresa fue asignada al capacitador y el porcentaje de avance del proyecto. Cada fila es interactiva y al dar un click sobre ella esta detalla mas informaci&oacute;n.</p>"
                                +"<img width='719' src='imagenes/image3131.jpg'/><br><br>"
                                +"<p>La informaci&oacute;n detallada muestra los delegados de esa empresa, su ultimo acceso al sistema, el email de cada uno y por ultimo su estado en el sistema, es decir si esta conectado, disponible para video chat o si esta desconectado.</p>"
                                +"<img width='719' src='imagenes/image3061.jpg'/>";
                break;
            case 2: resultado = "<p>El tab “Ver Instrumento” presenta una interfaz rápida para localizar cualquier ítem de la evaluación. Busca mediante un filtro de Indicador y Variable, la lista de ítems actuales de la evaluación. Sencillo y dinámico, evitara buscar documentación para cerciorase sobre el contenido del cuestionario actual.</p>"
                                +"<img width='719px' src='imagenes/Imagenic21.png'/><br><br>"
                                +"<p>Cuando se eligen el indicador y la Variable se cargan los ítems.</p><img widht='719' src='imagenes/Imagenic22.png'/> <br/><br/>"
                                +"<p>En caso de que haya un problema con los registros en la base de datos, el sistema notificara al usuario cualquier inconveniente.</p>"    
                                +"<img widht='719px' src='imagenes/Imagenic23.png'/>";
                break;
            case 3: resultado = "<p>El tab “Ver Historial” carga todas las empresas asignadas al capacitador, junto con el numero de contratos finalizados . Solo se encargara de buscar la Empresa a deseada, dar click a la fila y se mostrara un grafico del progreso de todos las evaluaciones realizadas por indicador.</p>"
                                +"<img width='719' src='imagenes/Imagenic31.png'/> <br/><br/>"
                                +"<p>La grafica muestra el resultado obtenido en cada evaluación por indicador, en el eje x muestra la fecha de finalización de la evaluación mientras que el eje y determina los puntos obtenidos por el usuario. Aquí se puede ver la progresión del usuario en el tiempo.</p>"
                                +"<img width='719' src='imagenes/Imagenic32.png'/> <br/><br/>";
                    break;
            case 4: resultado = "<p>En el tab “Finalizados” se cargan todos los contratos con este estado, mostrando el mas reciente. Con filtrado y filas seleccionables, hace mas fácil y dinámica la manera de buscar y mostrar el grafico de araña de la empresa deseada.</p>"
                                +"<img width='719' src='imagenes/Imagenic41.png'/> <br/><br/>"
                                +"<div sytle='float:left;'><img widht='719' src='imagenes/Imagenic42.png'/> <p>El grafico de araña muestra los valores obtenidos por indicador, después de haber analizado la evaluación de competitividad empresarial. Poniendo el mouse sobre cada vértice podrá ver con exactitud los puntos obtenidos. En caso de que los datos no puedan ser cargados un mensaje de error hará saber al usuario sobre dicho inconveniente</p></div>";
                break;
            case 5: resultado = "<p>Cuando un capacitador desee agregar a un empresa cliente en especifico, este solamente necesita digitar el correo del contacto de dicha empresa, el cual le enviara un link para ingresar a la interfaz registro del sistema sece, inmediatamente dicho contrato será asignado al capacitador en cuestión.</p>"
                                +"<img src='imagenes/Imagenic51.png'/>";
                break;
            default: resultado ="";
                break;
        }
    
    return resultado;
        
    }
    
}
