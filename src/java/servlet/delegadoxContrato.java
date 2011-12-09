/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.AccesoDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.DelegacionIndiUsuDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Contrato;
import pojo.DelegacionIndiUsu;

/**
 *
 * @author mamg
 */
public class delegadoxContrato extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         int idcontrato = Integer.parseInt(request.getParameter("idc"));
         
        ContratoDaoImpl cdi = new ContratoDaoImpl();
        Contrato contra = cdi.findById(idcontrato);
        
        DelegacionIndiUsuDaoImpl doii = new DelegacionIndiUsuDaoImpl();
        List<DelegacionIndiUsu> delegados = doii.delegacionxContrato(contra);
        DelegacionIndiUsu delegado = new DelegacionIndiUsu();
        Iterator<DelegacionIndiUsu> it = delegados.iterator();
        
        AccesoDaoImpl adi = new AccesoDaoImpl();
        Timestamp acces ;
        PrintWriter out = response.getWriter();      
           
        try {
             while (it.hasNext()){
             delegado = it.next();
             acces = adi.fechaUltimoAcceso(delegado.getUsuario());    
             out.println("<tr>");
             
             out.println("<td>");
             out.println(delegado.getUsuario().getNombre());
             out.println("</td>");
             out.println("<td>");
             out.println(acces);
             out.println("</td>");
             out.println("<td>");
             out.println(delegado.getUsuario().getCorreo());
             out.println("</td>");
             out.println("<td>");
             out.println("no");
             out.println("</td>");
             
             out.println("</tr>");          
             }//fin while
        } finally {            
            out.close();
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
