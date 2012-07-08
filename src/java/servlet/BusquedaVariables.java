/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.IndicadorDaoImpl;
import daoImpl.VariableDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Indicador;
import pojo.Variable;   

/**
 *
 * @author Dave
 */
public class BusquedaVariables extends HttpServlet {

    IndicadorDaoImpl idi = new IndicadorDaoImpl();    
    VariableDaoImpl vdi = new VariableDaoImpl();
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nombreIndicador = request.getParameter("descIndicador");
        
        Indicador inid = idi.findByName(nombreIndicador);
        List<Variable> variables = vdi.findByIndicador(inid);
        PrintWriter out = response.getWriter();
        Iterator<Variable> it = variables.iterator();
        try {
            out.print("<option>Elija Variable</option>");
             while(it.hasNext()){                 
                 out.print("<option>");
                 out.print(it.next().getNombre());
                 out.print("</option>");   
             }                            
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