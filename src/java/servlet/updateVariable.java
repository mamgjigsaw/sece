/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import daoImpl.VariableDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Variable;

/**
 *
 * @author David
 */
public class updateVariable extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String ponderacion,s,nombre;
        PrintWriter out = response.getWriter();
       
       VariableDaoImpl vdi = new VariableDaoImpl();
       try{
       nombre = request.getParameter("txtmodnombre");
       Variable variable = vdi.findByName(nombre);
       variable.setNombre(nombre);
       ponderacion = request.getParameter("txtmodpond");
       variable.setPonderacion(Integer.parseInt(ponderacion));
       s = request.getParameter("txtmods");
       //variable.setS(Integer.parseInt(s));
       Boolean estado  = Boolean.parseBoolean(request.getParameter("modchkvar"));     
       String val= "";
      /* if(estado)
           val = estado.toString();
       else
           val = estado.toString();*/
       out.println("<html>"+ estado +"</html>");
       variable.setEstado(estado);

       vdi.update(variable);
       }catch(NullPointerException e){System.out.print(e);}
       //response.sendRedirect("Indicador.jsp");

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
