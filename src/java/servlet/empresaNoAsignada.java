/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.EmpresaDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Empresa;

/**
 *
 * @author Dave
 */
public class empresaNoAsignada extends HttpServlet {

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
        int idempresa = Integer.parseInt(request.getParameter("ide"));
        EmpresaDaoImpl empi = new EmpresaDaoImpl();
        Empresa emp = empi.findByID(idempresa);
        System.out.print("entrastes a empresaNoAsignada "+emp.getDescripcion());
        PrintWriter out = response.getWriter();
        
        try {            
            out.print("<table border='0' width ='100%'>");        
            out.print("<tr><th width='505px'>Direcci&oacute;n</th><th width='259px'>Tel&eacute;fono</th><th width='184px'>Acci&oacute;n</th></tr>");
            out.println("<tr style='text-align:center;'>");
            out.println("<td>" + emp.getDireccion() + "</td>");
            out.println("<td>" + emp.getTelefono() + "</td>");
            out.println("<td> <img id='btnImgAprobar' src='images/icon_approve.png' alt='Aprobar' style='cursor:pointer;'/> <img id='btnImgEliminar' src='images/icon_delete.png' alt='Eliminar' style='cursor:pointer;'/>  </td>");
            out.println("</tr>");
            out.print("</table>");
             
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
