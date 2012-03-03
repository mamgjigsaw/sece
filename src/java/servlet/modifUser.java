/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import daoImpl.UsuarioDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public class modifUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession s = request.getSession();

        int idUser = (Integer)s.getAttribute("idUser");

        Usuario user = new Usuario();
        UsuarioDaoImpl udi = new UsuarioDaoImpl();

        user = udi.findById(idUser);

        String nombre = request.getParameter("user");
        String cargo = request.getParameter("cargo");
        String dir = request.getParameter("dir");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");

            //Usuario(nombre, cargo, tel,correo, direccion, 2 , String password, null, null)
        user.setNombre(nombre);
        user.setCargo(cargo);
        user.setDireccion(dir);
        user.setCorreo(email);
        user.setTelefono(tel);

        udi.update(user);

        response.sendRedirect("initEnterprise.jsp");



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
