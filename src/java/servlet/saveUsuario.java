/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import daoImpl.AccesoDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.EmpresaDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.ZoneDaoImpl;
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
import pojo.Contrato;
import pojo.Empresa;
import pojo.Usuario;
import pojo.Zone;

/**
 *
 * @author mamg
 */
public class saveUsuario extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name, cargo,telefono,correo,direccion,pass,name_empresa,descripcion,telefono_empresa,ciudad,direccion_empresa;
        
        name_empresa= request.getParameter("txtname_empresa");
        descripcion = request.getParameter("txtdes");
        telefono_empresa = request.getParameter("txttel_empresa");
        ciudad = request.getParameter("txtciudad");
        direccion_empresa = request.getParameter("txtdirec_empre");
        
        name= request.getParameter("txtname");
        cargo= request.getParameter("txtcargo");
        telefono= request.getParameter("txttel");
        correo= request.getParameter("txtcorreo");
        direccion = request.getParameter("txtdir");
        pass = request.getParameter("txtpass");
  
       String password = encriptar.md5(pass);
       
       //Aqui se guarda la empresa
        ZoneDaoImpl zoneDao = new ZoneDaoImpl();
        Empresa empresa = new Empresa(zoneDao.findById_Zone(2374),name_empresa,descripcion,telefono_empresa,ciudad,direccion_empresa,null);
        EmpresaDaoImpl empresaDao = new EmpresaDaoImpl();
        empresaDao.create(empresa);
          
        //Aqui se guarda el usuario
       Usuario usuario = new Usuario(empresa,name,cargo,telefono,correo,direccion,3,password,1,null,null,null,null,null);
       UsuarioDaoImpl UsuDao= new UsuarioDaoImpl();
       UsuDao.create(usuario);
       
       //Guardar el acceso del usuario       
       Date fecha = new Date();
       Timestamp momentoTimestamp = new Timestamp(fecha.getTime());
       Acceso acc = new Acceso(usuario,momentoTimestamp,momentoTimestamp,null);
       AccesoDaoImpl accDao= new AccesoDaoImpl();
       accDao.create(acc);
       
       //Crear contrato para realizacion de la evaluacion de competitividad
       Contrato contrato = new Contrato(usuario,1,momentoTimestamp,momentoTimestamp,null,null,null);
       ContratoDaoImpl contratoDao = new ContratoDaoImpl();
       contratoDao.create(contrato);
                    
       //Crear las variables de sessiones             
       HttpSession sesion=request.getSession();
       sesion.setAttribute("idUser", usuario.getIdUsuario());
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

