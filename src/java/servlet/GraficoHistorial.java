/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.EmpresaDaoImpl;
import daoImpl.HistorialResultadoDaoImpl;
import daoImpl.IndicadorDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.Empresa;
import pojo.HistorialResultado;
import pojo.Indicador;

/**
 *
 * @author Dave
 */
public class GraficoHistorial extends HttpServlet {
    
         EmpresaDaoImpl edi = new EmpresaDaoImpl();
         Empresa empresa = new Empresa();          
         IndicadorDaoImpl idi = new IndicadorDaoImpl();
         Indicador indicador = new Indicador();
         HistorialResultadoDaoImpl hrdi = new HistorialResultadoDaoImpl();         
    
    protected void  processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        //response.setContentType("text/plain");
        Integer idEmpresa, idIndicador;
        System.out.println("IdEmpresa: " + request.getParameter("idempresa") + " Indicador: "+request.getParameter("idindicador"));
        idEmpresa = Integer.parseInt(request.getParameter("idempresa"));
        idIndicador = Integer.parseInt(request.getParameter("idindicador"));        
        empresa =edi.findByID(idEmpresa);        
        indicador = idi.findById(idIndicador);             
        List<HistorialResultado> resultados = hrdi.resultadosxEmpresaxIndicador(empresa,indicador);
        Iterator<HistorialResultado> it = resultados.iterator();
        HistorialResultado hr;         
        PrintWriter out = response.getWriter();        
        if (!(resultados.isEmpty())){
            try {                  
                while(it.hasNext()){
                hr = it.next();
                out.println(hr.getContrato().getFechaTermino()+";"+hr.getResultado());
                }//fin while                
            } finally {out.close();}
        }//fin if
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
