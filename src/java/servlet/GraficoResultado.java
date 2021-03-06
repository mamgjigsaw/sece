/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.AvanceDaoImpl;
import daoImpl.ContratoDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Avance;
import pojo.Contrato;

/**
 *
 * @author mamg
 */
public class GraficoResultado extends HttpServlet {

   
    AvanceDaoImpl adi = new AvanceDaoImpl();
    Avance avance = new Avance();
    ContratoDaoImpl cdi = new ContratoDaoImpl();
    List<Avance> resultAvance = new ArrayList<Avance>();    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        response.setContentType("text/plain");
        Integer contrato;
        contrato = Integer.parseInt(request.getParameter("idcontrato"));        
        Contrato contra = cdi.findById(contrato);
        resultAvance = adi.Xcontrato(contra);
        Iterator<Avance> it = resultAvance.iterator();
        PrintWriter out = response.getWriter();
        try {     
            while (it.hasNext()){
                avance = it.next();
                out.println( avance.getIndicador().getNombre()+";"+avance.getResultado()+";100" );
                }//fin while                
        }//fin try
         finally {out.close();}
            
            
                
            
        
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
