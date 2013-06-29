/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.AvanceDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.DelegacionIndiUsuDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.UsuarioDaoImpl;
import dwrScripts.validate;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Avance;
import pojo.Contrato;
import pojo.DelegacionIndiUsu;
import pojo.Indicador;
import pojo.Usuario;

/**
 *
 * @author Dave
 */
public class aprobarContrato extends HttpServlet {

    Properties archivoConf = new Properties();
    ContratoDaoImpl cdi = new ContratoDaoImpl();
    UsuarioDaoImpl udi = new UsuarioDaoImpl();
    Contrato con = new Contrato();
    Contrato conb = new Contrato();
    Usuario Ucapacitador = new Usuario();
    Usuario user = new Usuario();
    validate correo = new validate();
    String correo_destinatario;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        archivoConf.load(this.getClass().getClassLoader().getResourceAsStream("/micelanea.properties"));

        String urlSistema = (String) archivoConf.getProperty("seceUrl");
        int idusuario = Integer.parseInt(request.getParameter("idu"));
        int idcontrato = Integer.parseInt(request.getParameter("idc"));
        int idAccion = Integer.parseInt(request.getParameter("id"));
        int idusuarioCapacitador = Integer.parseInt(request.getParameter("iduc"));

        //ver si el usuario tiene muchos contratos
        int cantidad = cdi.cantidadContratosByUsuario(new Usuario(idusuario));   

        if (cantidad > 1) {
            user = udi.findById(idusuario);
            user.setEstado(1);
            udi.update(user);

            con = cdi.findById(idcontrato);
            con.setEstado(1);
            cdi.update(con);
            
            correo.EnviarCorreo("sece@pml.org.ni", correo_destinatario, "Informacion de Sece", "<p><strong>Su solicitud de nuevo contrato ha sido aceptada</strong>"
                    + ", de manera satisfactoria, ya puede hacer uso del sistema para evaluar su competitividad de nuevo y luego comparar por indicador sus mejoras, ingresando <a href='" + urlSistema + "logger.jsp'>aqui</a></p>"
                    + "<p><strong>Gracias SECE TEAM.</strong></p>");

        } else {
            conb = cdi.findById(idcontrato);
            Ucapacitador = udi.findById(idusuario);
            con = cdi.findByContrato_usuario(idcontrato, Ucapacitador);

            //obtener usuario_contacto por el contrato
            user = con.getUsuario();

            correo_destinatario = Ucapacitador.getCorreo();
            Ucapacitador = udi.findById(idusuarioCapacitador);
            if (idAccion == 1) {
                //System.out.print("Contrato: "+con.getIdContrato());
                //cambiando estado de contrato a 1
                con.setEstado(1);
                cdi.update(con);
                //cambiando estado de usuario a 1
                user.setEstado(1);
                udi.update(user);
                System.out.append("Aceptando Usuario: " + idusuario);
                //Crear todas la delegaciones de los indicadores como los avances de ellos
                List<Indicador> listIndi = new ArrayList<Indicador>();
                IndicadorDaoImpl daoIndicador = new IndicadorDaoImpl();
                listIndi = daoIndicador.findAllByActive();

                AvanceDaoImpl daoAvance = new AvanceDaoImpl();
                DelegacionIndiUsuDaoImpl deledao = new DelegacionIndiUsuDaoImpl();
                for (int i = 0; i < listIndi.size(); i++) {

                    DelegacionIndiUsu dele = new DelegacionIndiUsu(user, listIndi.get(i), con);
                    deledao.create(dele);

                    Avance avance = new Avance(con, listIndi.get(i), 0, 0, 0, 0);
                    daoAvance.create(avance);
                }

                correo.EnviarCorreo("sece@pml.org.ni", correo_destinatario, "Bienvenido a Sece", "<p><strong>Su Cuenta ha sido activada</strong>"
                        + ", de manera satisfactoria, ya puede hacer uso del sistema, ingresando <a href='" + urlSistema + "logger.jsp'>aqui</a></p>"
                        + "<p><strong>Gracias SECE TEAM.</strong></p>");
            } else if (idAccion == 2) {
                cdi.delete(con);
                // System.out.append("Borrando Usuario: "+idusuario);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
