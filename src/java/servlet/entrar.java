/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import daoImpl.AccesoDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.encriptar;
import dwrScripts.initCapacitadores;
import dwrScripts.validate;
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
       try{
        // Set to expire far in the past.
        //response.setHeader("Expires", "0");
        // Set standard HTTP/1.1 no-cache headers.
        //response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        //response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        //response.setHeader("Pragma", "no-cache");
        
        String email, pass;
        initCapacitadores capacitador = new initCapacitadores();

        email = request.getParameter("cV5VDde7H0l");
        pass = request.getParameter("K3JR5YpwQ8");
        
        if (email==null || email==""){
            response.sendRedirect("index.jsp");
        }
        
        if (pass==null || pass==""){
            response.sendRedirect("index.jsp");
        }
        
        //validate valid = new validate();       

        String password = "";
        //password = encriptar.md5(valid.decrypt(pass));
        password = encriptar.md5(pass);
        
        //System.out.println(password + " el pass " + pass);
        Date fecha = new Date();        
        Timestamp momentoTimestamp = new Timestamp(fecha.getTime());

        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        Usuario usuario = new Usuario();
        
        usuario = usuDao.findByEmail(email);
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
                //actualizar intentos a 0
                capacitador.reiniciarConteoEmails(usuario);
            } else if (usuario.getTipoUsuario()==2){
                HttpSession sesion=request.getSession();
                sesion.setAttribute("idAcc", acc.getIdAcceso().toString() );
                response.sendRedirect("initCapacitador.jsp");
            } else if(usuario.getTipoUsuario()==4){//delegado
                HttpSession sesion=request.getSession();
                sesion.setAttribute("idAcc", acc.getIdAcceso().toString());        
                response.sendRedirect("controlPanel.jsp");
                //actualizar intentos a 0
                capacitador.reiniciarConteoEmails(usuario);
            } else if(usuario.getTipoUsuario()==1 && usuario.getEstado() == 1){
                usuario.setEstado(2);
                usuDao.update(usuario);
                HttpSession sesion=request.getSession();
                sesion.setAttribute("idAcc", acc.getIdAcceso().toString());        
                response.sendRedirect("main_admin.jsp");
            }
            
        }else{
            response.sendRedirect("index.jsp");
        } 
        
       }catch(Exception e){System.out.print("ja " + e.getMessage().getClass());
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