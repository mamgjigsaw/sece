/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import daoImpl.ItemDaoImpl;
import daoImpl.VariableDaoImpl;
import java.util.Iterator;
import java.util.List;
import pojo.Item;
import pojo.Variable;
/**
 *
 * @author Dave
 */
public class BusquedaItems extends HttpServlet {

    VariableDaoImpl vdi = new VariableDaoImpl();
    
        
    ItemDaoImpl idi = new ItemDaoImpl();
    Item item = new Item();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nombreVariable = request.getParameter("descVariable");
        
        Variable var = vdi.findByName(nombreVariable);
        List<Item> items = idi.findByVariable(var);
        Iterator<Item> it = items.iterator();
        PrintWriter out = response.getWriter();
        try {
             while (it.hasNext()){            
                out.println("<tr>");            
                out.println("<td ><img src='images/step.png'/></td>");            
                out.print("<td class='nombre_item'>" + it.next().getDescripcion() + "</td>");            
                out.println("</tr>"); 
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
