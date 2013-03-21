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
            case 1: resultado = "<p>La primer pantalla del Sistema que vera el capacitador al ingresar es la pesta&ntilde;a  de Espacio de trabajo, el cual estar&aacute; dividido en 2 secciones, la primera muestra informaci&oacute;n sobre empresas asignadas.</p>"
                                +"<img src='imagenes/image3001.jpg'></img><br><br>"
                                +"<p>Esta primer secci&oacute;n esta compuesta por una tabla que muestra informaci&oacute;n , sobre las empresas que est&aacute;n bajo la tutela de este capacitador. La tabla muestra informaci&oacute;n de la empresa por fila tales como <b>Nombre de la empresa</b>, <b>Contacto de la empresa</b>, <b>fecha</b> en la cual la empresa fue asignada al capacitador y el <b>porcentaje de avance</b> del proyecto. Cada fila es interactiva y al dar un click sobre ella esta detalla mas informaci&oacute;n.</p>"
                                +"<img width='719' src='imagenes/image3131.jpg'/><br><br>"
                                +"<p>La informaci&oacute;n detallada muestra los delegados de esa empresa, su ultimo acceso al sistema, el email de cada uno y por ultimo su estado en el sistema, es decir si esta conectado, disponible para video chat o si esta desconectado.</p>"
                                +"<img width='719' src='imagenes/image3061.jpg'/>";
                break;
            case 2: resultado = "<p>La pesta&ntilde;a “Ver Instrumento” presenta una interfaz rápida para localizar cualquier ítem de la evaluación. Busca mediante un filtro de Indicador y Variable, la lista de ítems actuales de la evaluación. Sencillo y dinámico, evitara buscar documentación para cerciorase sobre el contenido del cuestionario actual.</p>"
                                +"<img width='719px' src='imagenes/Imagenic21.png'/></br></br>"
                                +"<p>Cuando se eligen el indicador y la Variable se cargan los ítems.</p><img widht='719' src='imagenes/Imagenic22.png'/> <br/><br/>"
                                +"<p>En caso de que haya un problema con los registros en la base de datos, el sistema notificara al usuario cualquier inconveniente.</p>"    
                                +"<img widht='719px' src='imagenes/Imagenic23.png'/>";
                break;
            case 3: resultado = "<p>El tab “Ver Historial” carga todas las empresas asignadas al capacitador, junto con el n&uacute;mero de contratos finalizados. Solo se encargara de buscar la Empresa a deseada, dar click a la fila y se mostrara un gr&aacute;fico del progreso de todos las evaluaciones realizadas por indicador.</p>"
                                +"<img width='719' src='imagenes/Imagenic31.png'/> <br/><br/>"
                                +"<p>La grafica muestra el resultado obtenido en cada evaluación por indicador, en el eje “<i>x</i>“ muestra la fecha de finalización de la evaluación mientras que el eje “<i>y</i>“ determina los puntos obtenidos por el usuario. Aquí se puede ver la progresión del usuario en el tiempo.</p>"
                                +"<img width='719' src='imagenes/Imagenic32.png'/> <br/><br/>";
                    break;
            case 4: resultado = "<p>En la pesta&ntilde;a “Finalizados” se cargan todos los contratos con este estado, mostrando el mas reciente. Con filtrado y filas seleccionables, hace mas fácil y dinámica la manera de buscar y mostrar una secci&oacute;n de graficos sobre los resultados obtenidos.</p>"
                                +"<img width='719px' src='imagenes/Imagenic41.png'/> <br/><br/>"
                                + "<p>En la secci&oacute;n de gr&aacute;ficos se divide en 3; El nivel de competitividad Relativa muestra los valores obtenidos por indicador, después de haber analizado la evaluación de competitividad empresarial, dada de manera porcentual.Poniendo el mouse sobre cada vértice podrá ver con exactitud los puntos obtenidos</p>"
                                +"<img widht='719px' src='imagenes/Imagenic42.png'/> "
                                + "<p>El segundo elemento del acordion carga los datos pero de manera puntual, es decir muestra los valores correspondientes obtenidos en la evaluaci&oacute;n; siempre la grafica azul muestra el puntaje perfecto.</p>"
                                + "<img widht='719px' src='imagenes/Imagenic45.png'/>"
                                + "<p>El siguiente gr&aacute;fico muestra en una linea punteada negra el valor de competitividad General, el cual est&aacute; entre 3 rangos, aqui se aprecia la calificaci&oacute;n del resultado</p>"
                                + "<img widht='719px' src='imagenes/Imagenic43.png'/>"
                                + "<img widht='719px' src='imagenes/Imagenic44.png'/>";
                break;
            case 5: resultado = "<p>Cuando un capacitador desee agregar a un empresa cliente en espec&iacute;fico, este solamente necesita digitar el correo del contacto de dicha empresa, el cual le enviara un link para ingresar a la interfaz registro del sistema sece, inmediatamente dicho contrato será asignado al capacitador en cuestión.</p>"
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
                               + "<p>En esta pesta&ntilde;a, nos encontraremos con 3 tablas con los diferentes estados de las Empresas registradas en SECE, la superior izquierda tiene las Empresas que est&aacute;n pendientes de Activaci&oacute;n, la superior derecha, están las empresas que est&aacute;n actualmente activas y están llenando el instrumento y la última  posee las últimas 5 empresas que acaban de terminar el instrumento. En las primeras 2 tablas el Administrador puede cambiar al capacitador que est&aacute; a cargo de darle seguimiento a la empresa.</p>";
                break;
                    case 2: resultado = "<p>En esta pestaña, podemos agregar un nuevo capacitador, agregando los datos correspondientes en el formulario con el t&iacute;tulo: “Nuevo Capacitador”, luego tenemos la tabla de capacitadores, donde veremos información importante de los capacitadores y las empresas que ha atendido, en esta tabla podemos dar de baja a al capacitador que deseemos en la columna “Acciones”.</p>"
                                    + "<div align='center'><img width='719px' src='imagenes/imgA03.jpg'/></div>";
                    break;
                    case 3 : resultado = "<p>Las notas, son peque&ntilde;os tips de noticias y eventos que aparecerán en la p&aacute;gina principal o Index de SECE, para promocionar un evento se CPML o de SECE, etc, el sistema por defecto ubica los 5 eventos con fechas mas cercanas. En esta pestaña el administrador puede agregar notas en el formulario “Nueva Nota” y en la tabla inferior se verán reflejadas todas las notas, dichas notas pueden ser editadas y eliminadas en la columna “Editar”. </p>"
                                       + "<div align='center'><img width='719px' src='imagenes/imgA04.jpg'/></div>";
                        break;
                    case 4 : resultado = "<p>En la pestaña Reportes, el administrador podrá generar diferentes reportes en formato PDF, que luego pueden ser descargados, dichos reportes son por ejemplo, Reporte de Capacitadores, Bit&aacute;cora de los usuarios, etc.</p>"
                            + "<div align='center'><img width='719px' src='imagenes/imgA05.jpg'/></div>";  
                        break;
                    case 5 : resultado = "<div sytle='float:left;'> <img src='imagenes/imgA06.jpg'/> <p>En la pestaña Perfil, el Administrador podr&aacute; ver todos sus datos, su informaci&oacute;n y además podr&aacute; editarla, su contrase&ntilde;a también puede ser cambiada.</p></div>";                           
                        break;
                    case 6 : resultado = "<p>La segunda página del módulo administrador es referido al Instrumento, en dicha página, puede agregar nuevos indicadores, nuevas variables, nuevos ítems, nuevas escalas para cada variable y puede agregar sugerencias para uno o más ítems, las formas para agregar un elemento o modificar uno, es muy parecida a la de la pestaña capacitador de la página principal, la interfaz es bastante intuitiva, por acá están las imágenes.</p>"
                            + "<h2>Indicador</h2>"
                            + "<img width='719px' src='imagenes/imgA07.jpg'/>"
                            + "<h2>Variable</h2>"
                            + "<p>Al agregar variable, se deben agregar las Escalas en las cuales ser&aacute;n evaluadas, estas escalas ser&aacute;n actualizadas en la tabla de la pesta&ntilde;a “Escala”.</p>"
                            + "<img width='719px' src='imagenes/imgA08.jpg'/>"
                            + "<h2>&Iacute;tem</h2>"
                            + "<img width='719px' src='imagenes/imgA09.jpg'/>"
                            + "<h2>Escala (En la pestaña solo Editamos la Escala)</h2>"
                            + "<img width='719px' src='imagenes/imgA10.jpg'/>"
                            + "<h2>Sugerencia</h2><p>(Es posible relacionar una sugerencia a 1 o m&aacute;s ítems, seleccionando varios check de los “ítems relacionados”)</p>"
                            + "<img width='719px' src='imagenes/imgA11.jpg'/>";
                        break;
                
        }
        
         return resultado;
    }//fin funcion
    
    public String ayudaContacto(int opcion){
        String resultado = "";
        
        switch (opcion){
            
            case 0  : resultado = "<div align='center'><h3>P&aacute;gina de Inicio del Sistema</h3></div>"
                + "<p>Esta es la pantalla que le aparece cuando entre a <a href='#'>http://www.sece.pml.org.ni</a> es el index.jsp.<br/> Hay tres pestañas inicio, acerca de y contáctenos.<br/> <b>Inicio</b>, aquí se mostrara información de CPML, que es SECE y noticias o notas acerca de las actividades próximas que realizaran. </p>"
                + "<img src='ayuda/imagenes/imgC01.jpg'/>"
                + "<p>En noticias y notas, muestra las actividades que se realizaron hace una semana y las de la próxima. El ingreso de estas notas la realizara el administrador del sistema, más adelante en subsistema el modulo del administrador se explicara y se mostrara el formulario de ingreso. Así como todas las notas hechas.</p> "
                + "<img src='ayuda/imagenes/imgC02.jpg'/>"
                + "<p>Acerca de, muestra información sobre quienes desarrollaron el sistema, como un video explicativo de como registrarse.</p>"
                + "<!--<img src='ayuda/imagenes/imgC03.jpg'/> -->"
                + "<p>Contáctenos, hay un formulario donde usuario puede enviar sugerencia, preguntas o consulta a CPLM sobre SECE. También muestra información de CPML como ubicación geográfica, dirección, teléfonos.</p>"
                + "<p>También en el inicio hay una opción para iniciar sesión en el sistema. Que nos direcciona a <a href='#'>http://sece.pml.org.ni/logger.jsp.</a></p>";
                break;
                
            case 1 : resultado = "<p><strong>Antes de iniciar, vamos a definir que es un usuario contacto y que un delegado.</strong></p>"
                    +"<p>Un usuario contacto es el representante de una empresa una vez que ha registrado dicha empresa, por ejemplo cuando una determinada empresa se interesa en aplicar la herramienta de evaluaci&oacute;n de competitividad empresarial, en conocer su situaci&oacute;n actual a trav&eacute;s de SECE es decir su nivel de competitividad empresarial.</p>"
                    +"<p>El primer usuario que se registre e ingrese a la empresa se convierte en el contacto, los demás usuarios de la misma empresa que deseen interactuar con el sistema tendr&iacute;an que abocarse al contacto, el cual los ingresara como usuarios de tipos delegados asignándoles un indicador y para su posterior llenado, m&aacute;s adelante se explicara el ingreso de un usuario tipo delegado. </p>"
                    +"<p>En otras palabras un usuario delegado, ser&iacute;a otro empleado de la empresa que se le ha sido asignado un indicador.</p>"
                    +"<p>Una vez que el usuario cliente se halla ingresa al sistema, lo primero que vera sea contacto o delegado ser&acute; un panel de control que tendr&acute; 5 pesta&ntilde;as para el caso del contacto.";
                break;
            
            case 2 : resultado = "<p>En la primera pestaña espacio de trabajo, ahí el usuario podr&aacute; mirar el avance de cada uno de los indicadores, es decir cuánto lleva del 100%, como además quien está realizando el llenado de ese indicador, también aparece una opción de delegar, </p>"
                    + "<img src='ayuda/imagenes/usucont1.png'/><br/><br/>"
                    + "<img src='ayuda/imagenes/usucont2.png'/><br/><br/>"
                    + "<p>La segunda pestaña <strong>Datos personales</strong>, aqu&iacute; el usuario puede cambiar o actualizar datos  como tel&eacute;fono, direcci&oacute;n, o cambiar contraseña, etc.</p>"
                    + "<img src='ayuda/imagenes/usucont3.png'/><br/><br/>"
                    + "<p><ul>La sección de cambiar contraseña posee una validación de que: <li>Los datos estén llenos, no vacíos.</li><li>Que la contraseña actual coincida con la digitada en el campo de contraseña actual.</li><li>Que los campos de nueva y confirmar tengan las misma contraseña.</li><ul></p>"
                    + "<img src='ayuda/imagenes/usucont4.png'/><br/><br/>"
                    + "<p>En el tercer tab Datos de la empresa, aquí se comidifica la informacion de la empresa como direccion, telefono, etc.</p>"
                    + "<img src='ayuda/imagenes/usucont5.png'/><br/><br/>"
                    + "<p>En el cuarto tab Delegado,  se ingresan los usuario delegados asignados a un indicador este formulario validad que la informaci&oacute;n se ha la adecuado, como el formato del correo, y que coincidan los campo de contraseña  y la confirmaci&oacute;n</p>"
                    + "<img src='ayuda/imagenes/usucont6.png'/><br/><br/>"
                    + "<img src='ayuda/imagenes/usucont7.png'/><br/><br/>"
                    + "<p>Esto mostraria, si se diera click a mostrar delegados.</p>"
                    + "<img src='ayuda/imagenes/usucont8.png'/><br/><br/>"
                    + "<p>El quinto tab es el Video chat, que es igual como se habla en el apartado de capacitador.</p>"
                    + "<p>En caso del delegado, tiene tres tab. Espacio de trabajo, Datos personales y video chat todos iguales con las misma funcionalidad como la del panel de control del contacto.</p>"
                    + "<img src='ayuda/imagenes/usucont9.png'/><br/><br/>"
                    + "<img src='ayuda/imagenes/usucont10.png'/><br/><br/>";
                break;
            case 3 : resultado = "<p>Intrumento,  muestra las preguntas y un campo de observacion por cada una, en la parte de arriba dos link que nos muestra en que variable nos encontramos.</p>"
                    + "<img src='ayuda/imagenes/usucont11.png'/><br/><br/>"
                    + "<img src='ayuda/imagenes/usucont12.png'/><br/><br/>"                    
                    + "<img src='ayuda/imagenes/usucont13.png'/><br/><br/>"                    
                    + "<img src='ayuda/imagenes/usucont14.png'/><br/><br/>"                    
                    + "<img src='ayuda/imagenes/usucont15.png'/><br/><br/>";
                break;
                    }
                
        return resultado;
    }//fin finction
    
}
