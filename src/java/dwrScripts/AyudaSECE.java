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
            case 1: resultado = "<p>La primer pantalla del Sistema que vera el capacitador al ingresar es el tab de Espacio de trabajo, el cual estar&aacute; dividido en 2 secciones, la primera muestra informaci&oacute;n sobre empresas asignadas.</p>"
                                +"<img src='imagenes/image3001.jpg'></img><br><br>"
                                +"<p>Esta primer secci&oacute;n esta compuesta por una tabla que muestra informaci&oacute;n , sobre las empresas que est&aacute;n bajo la tutela de este capacitador. La tabla muestra informaci&oacute;n de la empresa por fila tales como <b>Nombre de la empresa</b>, <b>Contacto de la empresa</b>, <b>fecha</b> en la cual la empresa fue asignada al capacitador y el <b>porcentaje de avance</b> del proyecto. Cada fila es interactiva y al dar un click sobre ella esta detalla mas informaci&oacute;n.</p>"
                                +"<img width='719' src='imagenes/image3131.jpg'/><br><br>"
                                +"<p>La informaci&oacute;n detallada muestra los delegados de esa empresa, su ultimo acceso al sistema, el email de cada uno y por ultimo su estado en el sistema, es decir si esta conectado, disponible para video chat o si esta desconectado.</p>"
                                +"<img width='719' src='imagenes/image3061.jpg'/>";
                break;
            case 2: resultado = "<p>El tab “Ver Instrumento” presenta una interfaz rápida para localizar cualquier ítem de la evaluación. Busca mediante un filtro de Indicador y Variable, la lista de ítems actuales de la evaluación. Sencillo y dinámico, evitara buscar documentación para cerciorase sobre el contenido del cuestionario actual.</p>"
                                +"<img width='719px' src='imagenes/Imagenic21.png'/></br></br>"
                                +"<p>Cuando se eligen el indicador y la Variable se cargan los ítems.</p><img widht='719' src='imagenes/Imagenic22.png'/> <br/><br/>"
                                +"<p>En caso de que haya un problema con los registros en la base de datos, el sistema notificara al usuario cualquier inconveniente.</p>"    
                                +"<img widht='719px' src='imagenes/Imagenic23.png'/>";
                break;
            case 3: resultado = "<p>El tab “Ver Historial” carga todas las empresas asignadas al capacitador, junto con el numero de contratos finalizados . Solo se encargara de buscar la Empresa a deseada, dar click a la fila y se mostrara un grafico del progreso de todos las evaluaciones realizadas por indicador.</p>"
                                +"<img width='719' src='imagenes/Imagenic31.png'/> <br/><br/>"
                                +"<p>La grafica muestra el resultado obtenido en cada evaluación por indicador, en el eje “<i>x</i>“ muestra la fecha de finalización de la evaluación mientras que el eje “<i>y</i>“ determina los puntos obtenidos por el usuario. Aquí se puede ver la progresión del usuario en el tiempo.</p>"
                                +"<img width='719' src='imagenes/Imagenic32.png'/> <br/><br/>";
                    break;
            case 4: resultado = "<p>En el tab “Finalizados” se cargan todos los contratos con este estado, mostrando el mas reciente. Con filtrado y filas seleccionables, hace mas fácil y dinámica la manera de buscar y mostrar el grafico de araña de la empresa deseada.</p>"
                                +"<img width='719px' src='imagenes/Imagenic41.png'/> <br/><br/>"
                                +"<div sytle='float:left;'><img widht='719' src='imagenes/Imagenic42.png'/> <p>El grafico de araña muestra los valores obtenidos por indicador, después de haber analizado la evaluación de competitividad empresarial. Poniendo el mouse sobre cada vértice podrá ver con exactitud los puntos obtenidos. En caso de que los datos no puedan ser cargados un mensaje de error hará saber al usuario sobre dicho inconveniente</p></div>";
                break;
            case 5: resultado = "<p>Cuando un capacitador desee agregar a un empresa cliente en especifico, este solamente necesita digitar el correo del contacto de dicha empresa, el cual le enviara un link para ingresar a la interfaz registro del sistema sece, inmediatamente dicho contrato será asignado al capacitador en cuestión.</p>"
                                +"<div align='center'><img src='imagenes/Imagenic51.png'/></div>";
                break;
            case 6 : resultado = "<div sytle='float:left;'><p>Cuando el usuario elija la empresa se le desplegara la siguiente ventana, la cual le pide acceso a la cámara y micrófono. El usuario debe de permitir esta acción dando click al botón del icono verde.</p>"
                               + "<img src='imagenes/Imagenic61.jpg'></img></div><br/><br/>"
                               + "<p>Una vez permitido el acceso a los dispositivos, se le mostrara la interfaz por medio de la cual los usuarios pueden iniciar el video chat. Cuando cada usuario se conecte al video chat, irán apareciendo 1 a 1 las transmisiones en vivo de esos videos. Cada usuario podrá comunicarse a través de audio y el chat, con los demás usuarios. </p>"
                               + "<img src='imagenes/Imagenic62.png'></img>";
                break;
            default: resultado ="";
                break;
        }
    
    return resultado;
        
    }//fin funcion
    
    public String ayudaUsuarioAdministrador(int opcion){
        String resultado = "";
        
        switch (opcion){
            
                case 1 : resultado = "<p>En la p&aacute;gina de Inicio, encontraremos las siguientes pesta&ntilde;as</p>"
                               +"<div align='center'><img width='719px' src='imagenes/imgA02.jpg'/></div>"
                               + "<p>En esta pesta&ntilde;a, nos encontraremos con 3 tablas con los diferentes estados de las Empresas registradas en SECE, la superior izquierda tiene las Empresas que est&aacute;n pendientes de Activacion, la superior derecha, están las empresas que est&aacute;n actualmente activas y están llenando el instrumento y la última  posee las últimas 5 empresas que acaban de terminar el intrumento. En las primeras 2 tablas el Administrador puede cambiar al capacitador que est&aacute; a cargo de darle seguimiento a la empresa.</p>";
                break;
                    case 2: resultado = "<p>En esta pestaña, podemos agregar un nuevo capacitador, agregando los datos correspondientes en el formulario con el t&iacute;tulo: “Nuevo Capacitador”, luego esta la tabla de capacitadores, donde veremos información importante de los capacitadores y las empresas que ha atendido, en esta tabla podemos dar de baja a al capacitador que deseemos en la columna “Acciones”.</p>"
                                    + "<div align='center'><img width='719px' src='imagenes/imgA03.jpg'/></div>";
                    break;
                    case 3 : resultado = "<p>Las notas, son peque&ntilde;os tips de noticias y eventos que aparecerán en la p&aacute;gina principal o Index de SECE, puede ser, dando a promocionar un evento se CPML o de SECE, etc, el sistema por defecto ubica los 5 eventos con fechas mas cercanas. En esta pestaña el administrador puede agregar notas en el formulario “Nueva Nota” y en la tabla inferior se verán reflejadas todas las notas, dichas notas pueden ser editadas y eliminadas en la columna “Editar”. </p>"
                                       + "<div align='center'><img width='719px' src='imagenes/imgA04.jpg'/></div>";
                        break;
                    case 4 : resultado = "<p>En la pestaña Reportes, el administrador podrá generar diferentes reportes en formato PDF, que luego pueden ser descargados, dichos reportes son por ejemplo, Reporte de Capacitadores, Bitacora de los usuarios, etc.</p>"
                            + "<div align='center'><img width='719px' src='imagenes/imgA05.jpg'/></div>";  
                        break;
                    case 5 : resultado = "<div sytle='float:left;'> <img src='imagenes/imgA06.jpg'/> <p>En la pestaña Perfil, el Administrador podr&aacute; ver todos sus datos, su informaci&oacute;n y además podr&aacute; editarla, su contrase&ntilde;a también puede ser cambiada.</p></div>";                           
                        break;
                    case 6 : resultado = "<h2>Indicador</h2>"
                            + "<img width='719px' src='imagenes/imgA07.jpg'/>"
                            + "<h2>Variable</h2>"
                            + "<p>Al agregar variable, se deben agregar las Escalas en las cuales ser&aacute;n evaluadas dicha escala, estas escalas ser&aacute;n actualizadas en la tabla de la pesta&ntilde;a “Escala”.</p>"
                            + "<img width='719px' src='imagenes/imgA08.jpg'/>"
                            + "<h2>Item</h2>"
                            + "<img width='719px' src='imagenes/imgA09.jpg'/>"
                            + "<h2>Escala (En la pestaña solo Editamos la Escala)</h2>"
                            + "<img width='719px' src='imagenes/imgA10.jpg'/>"
                            + "<h2>Sugerencia</h2><p>(Es posible relacionar una sugerencia a 1 o mas ítems, seleccionando varios check de los “ítems relacionados”)</p>"
                            + "<img width='719px' src='imagenes/imgA11.jpg'/>";
                        break;
                
        }
        
         return resultado;
    }//fin funcion
    
    public String ayudaContacto(int opcion){
        String resultado = "";
        
        switch (opcion){
            
            case 1 : resultado = "<div align='center'><h3>P&aacute;gina de Inicio del Sistema</h3></div>"
                    +"<p>Esta es la pantalla que le aparece cuando entre a <a href='#'>http://www.sece.org.ni.com</a> es el index.jsp.<br/> Hay tres pestañas inicio, acerca de y contáctenos.<br/> <b>Inicio</b>, aquí se mostrara información de CPML, que es SECE y noticias o notas acerca de las actividades próximas que realizaran. </p>"
                    +"<img src='imagenes/imgC01.jpg'/>"
                    +"<p>En noticias y notas, muestra las actividades que se realizaron hace una semana y las de la próxima. El ingreso de estas notas la realizara el administrador del sistema, más adelante en subsistema el modulo del administrador se explicara y se mostrara el formulario de ingreso. Así como todas las notas hechas.</p>"
                    +"<img src='imagenes/imgC02.jpg'/>"
                    +"<p>Acerca de, muestra información sobre quienes desarrollaron el sistema, como un video explicativo de como registrarse.</p>"
                    +"<img src='imagenes/imgC03.jpg'/>"
                    +"<p>Contáctenos, hay un formulario donde usuario puede enviar sugerencia, preguntas o consulta a CPLM sobre SECE. También muestra información de CPML como ubicación geográfica, dirección, teléfonos.</p>"
                    +"<p>También en el inicio hay una opción para iniciar sesión en el sistema. Que nos direcciona a <a href='#'>http://sece.org.ni.com/logger.jsp.</a></p>";
                break;
            
            case 2 : resultado = "<p>En cual se encuentra un formulario donde el usuario ingresa su correo y contraseña previamente registrado.</p>"
                    + "<img src='imagenes/imgC05.jpg'/><br/><br/>"
                    + "<p>Donde se valida si el usuario existe, si digito mal la contraseña, que no deje ning&uacute;n campo vac&iacute;o.</p>"
                    + "<img src='imagenes/imgC06.jpg'/><img src='imagenes/imgC07.jpg'/><img src='imagenes/imgC08.jpg'/>"
                    + "<p>Importante con tres intentos de que se digite la contraseña incorrecta, automaticamente bloqueara la cuenta del usuario y tendra que abocarse al administrador del sistema o al capacitador asignado, para su posterior activacion.</p>"
                    + "<img src='imagenes/imgC09.jpg'/>"
                    + "<div style='float:left;'> <p>Este es el mensaje que se muestra cuando se digitan bien los datos del usuario, mostrando un mensaje de bienvenida.</p> <img src='imagenes/imgC10.jpg'/> </div>";                    
                break;
            case 3 : resultado = "<p>Si se da click en registrarse, se mostrara el siguiente formulario:</p>"
                    + "<img src='imagenes/imgC11.jpg'/><br/><br/>"
                    + "<p>En el formulario además hay dos botones que son de registrarse en el sistema si todavía no se ha hecho y un link para recordar contraseña.</p>"                    
                    + "<p>El formulario posee dos botones, <img src='imagenes/imgC12.jpg'/> valida que todos los campos se han los requeridos así como su formato por ejemplo en el caso del campo de correo, mostrando un mensaje en el campo que no se cumpla con la validación, para corregir. Si todos los datos han sido ingresados correctamente,"
                    + " se mostrara un mensaje de registro satisfactorio y se enviara un correo al usuario donde se explica los pasos de activación de cuenta. Y el botón <img src='imagenes/imgC13.jpg'/>, lo dirige a la página de iniciar sesión.</p>";
                break;
            case 4 : resultado = "<p><b>Recordar contraseña</b>, del formulario de iniciar sesión.</p>"
                    + "<img src='imagenes/imgC14.jpg'/><br/><br/>"
                    + "<p>Esta página posee un formulario un campo de texto donde se digita el correo y dos botones. Continuar que valida que el correo exista, es decir es un usuario del sistema.<p>"
                    + "<p><img src='imagenes/imgC15.jpg'/>Si no es usuario muestra un mensaje que se registre en el sistema, sino envía un correo con un link para cambiar la contraseña.</p>"
                    + "<p><img src='imagenes/imgC16.jpg'/>Regresa a la página de iniciar sesión.</p>";
            break;                
        }
                
        return resultado;
    }//fin finction
    
}
