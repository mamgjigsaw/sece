/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import daoImpl.AccesoDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.encriptar;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.Acceso;
import pojo.Usuario;

/**
 *
 * @author mamg
 */
public class entrar extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email, pass;

        email = request.getParameter("txtemail");
        pass = request.getParameter("txtpass");

        String password = encriptar.md5(pass);
        
        Date fecha = new Date();        
        Timestamp momentoTimestamp = new Timestamp(fecha.getTime());

        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        Usuario usuario =usuDao.findByEmail(email);
        usuario.setEstado(1);
        usuDao.update(usuario);        

        Acceso acc = new Acceso(usuario,momentoTimestamp,momentoTimestamp,null);
        AccesoDaoImpl accDao = new AccesoDaoImpl();
        accDao.create(acc);
       
        if(password.equals(usuario.getPassword())){
            if(usuario.getTipoUsuario()==3){ //contacto
                HttpSession sesion=request.getSession();
                sesion.setAttribute("idAcc", acc.getIdAcceso().toString() );        
                response.sendRedirect("controlPanel.jsp");
            } else if (usuario.getTipoUsuario()==2){
                HttpSession sesion=request.getSession();
                sesion.setAttribute("idAcc", acc.getIdAcceso().toString() );
                response.sendRedirect("initCapacitador.jsp");
            }    
            else if(usuario.getTipoUsuario()==4){//delegado
                HttpSession sesion=request.getSession();
                sesion.setAttribute("idAcc", acc.getIdAcceso().toString());        
               // response.sendRedirect("instrument.jsp");
                response.sendRedirect("controlPanel.jsp");
            }
            else if(usuario.getTipoUsuario()==1 && usuario.getEstado() == 1){
                HttpSession sesion=request.getSession();
                sesion.setAttribute("idAcc", acc.getIdAcceso().toString());        
                response.sendRedirect("main_admin.jsp");
                
            }
            else{
                /*HttpSession sesion=request.getSession();
                 * sesion.setAttribute("usuario", usuario.getIdUsuario());*/
                response.sendRedirect("Indicador.jsp");            
            }
        }else{
            response.sendRedirect("index.jsp");
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