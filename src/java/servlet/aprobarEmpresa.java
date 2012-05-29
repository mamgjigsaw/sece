/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.ContratoDaoImpl;
import daoImpl.UsuarioDaoImpl;
import dwrScripts.validate;
import java.io.IOException;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Contrato;
import pojo.Usuario;


/**
 *
 * @author Dave
 */
public class aprobarEmpresa extends HttpServlet {

    Properties archivoConf = new Properties();
    
    ContratoDaoImpl cdi = new ContratoDaoImpl();
    UsuarioDaoImpl udi = new UsuarioDaoImpl();
    Contrato con = new Contrato();
    Contrato conb = new Contrato();
    Usuario user = new Usuario();
    
    
    
    validate correo = new validate();
    String correo_destinatario;
    String correo_remitente;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
       archivoConf.load(this.getClass().getClassLoader().getResourceAsStream("/micelanea.properties"));
       
       String urlSistema = (String) archivoConf.getProperty("seceUrl");
       int idusuario = Integer.parseInt(request.getParameter("idu"));
       int idcontrato = Integer.parseInt(request.getParameter("idc"));
       int idAccion = Integer.parseInt(request.getParameter("id"));
       int idusuarioCapacitador = Integer.parseInt(request.getParameter("iduc"));
       conb = cdi.findById(idcontrato);
       user = udi.findById(idusuario);       
       con = cdi.findByContrato_usuario(idcontrato, user);
       
       correo_destinatario = user.getCorreo();
       user = udi.findById(idusuarioCapacitador);
       correo_remitente = user.getCorreo();       
       if (idAccion == 1){
           System.out.print("Contrato: "+con.getIdContrato());
        con.setEstado(1); 
        System.out.append("Aceptando Usuario: "+idusuario);
        correo.EnviarCorreo(correo_remitente, correo_destinatario, "Bienvenido a Sece", "<p><strong>Su Cuenta ha sido activada</strong>"
                + ", de manera satisfactoria, ya puede hacer uso del sistema, ingresando <a href='"+urlSistema+"logger.jsp'>aqui</a></p>"                
                + "<p><strong>Gracias SECE TEAM.</strong></p>");
        cdi.update(con);
       }
       else if (idAccion ==2){
           cdi.delete(con);
           System.out.append("Borrando Usuario: "+idusuario);
       }
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
