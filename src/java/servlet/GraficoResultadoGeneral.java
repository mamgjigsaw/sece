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
 * @author david
 */
public class GraficoResultadoGeneral extends HttpServlet {
    
    
    AvanceDaoImpl adi = new AvanceDaoImpl();
    Avance avance = new Avance();
    ContratoDaoImpl cdi = new ContratoDaoImpl();
    List<Avance> resultAvance = new ArrayList<Avance>(); 

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        Integer contrato;
        double vs = 0.0,v=0.0,vce=0.0;
        contrato = Integer.parseInt(request.getParameter("idcontrato"));
        
        Contrato contra = cdi.findById(contrato);
        resultAvance = adi.Xcontrato(contra);
        Iterator<Avance> it = resultAvance.iterator();
        PrintWriter out = response.getWriter();
        try {           
            while (it.hasNext()){
                avance = it.next();                
                vs += avance.getVs();                
                v += avance.getV();
            }//fin while
            vce = (vs/v)*100;
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
            out.println(";100;75;50;"+vce);
                    
                    
                    
                   
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the out.println( sign on the left to edit the code.">
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
