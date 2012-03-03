/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.ContratoDaoImpl;
import daoImpl.DelegacionIndiUsuDaoImpl;
import daoImpl.UsuarioDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Contrato;
import pojo.DelegacionIndiUsu;
import pojo.Usuario;

/**
 *
 * @author server
 */
public class InsertarVideoChat extends HttpServlet {

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
        int idcontrato = Integer.parseInt(request.getParameter("idc")); 
        String idusuario = request.getParameter("iduser");
        ContratoDaoImpl cdi = new ContratoDaoImpl();
        Contrato contra = cdi.findById(idcontrato);
        
        //para obtener el nombre del usuario publicador        
        UsuarioDaoImpl udi = new UsuarioDaoImpl();
        Usuario user = udi.findById(Integer.valueOf(idusuario));
        String nombreUsuario = user.getNombre();
        
        DelegacionIndiUsuDaoImpl doii = new DelegacionIndiUsuDaoImpl();
        List<DelegacionIndiUsu> delegados = doii.delegacionxContrato(contra);
        DelegacionIndiUsu delegado = new DelegacionIndiUsu();
        Iterator<DelegacionIndiUsu> it = delegados.iterator();
        String[] idUsuarios = new String [4];         
        int i=0;        
        PrintWriter out = response.getWriter();
        try {
            while(it.hasNext()){
                delegado = it.next();                
                idUsuarios[i] = String.valueOf(delegado.getUsuario().getIdUsuario());
                i++;
            }//fin while
            out.print("<object id='Video_Chat' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='1000' height='625'> <param name='movie' value='resources/swf/publicador.swf?idcontrato="+ request.getParameter("idc") +"&iduser="+idusuario+"&iduser2="+ idUsuarios[0]+"&iduser3="+ idUsuarios[1]+"&iduser4="+ idUsuarios[2]+"&nomUser="+ nombreUsuario+"'/> <param name='quality' value='high'/> <embed src='resources/swf/publicador.swf?idcontrato="+ request.getParameter("idc") +"&iduser="+idusuario+"&iduser2="+ idUsuarios[0]+"&iduser3="+ idUsuarios[1]+"&iduser4="+ idUsuarios[2]+"&nomUser="+ nombreUsuario+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='1000' height='625'></embed> </object>");
            //System.out.print("idUsuario: "+idusuario +" iduser2: "+idUsuarios[0]+" iduser3: "+idUsuarios[1]+" iduser4: "+idUsuarios[2] );
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
