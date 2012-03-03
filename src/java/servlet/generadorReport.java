/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;


import daoImpl.EmpresaDaoImpl;

import daoImpl.daoEmpresasContratosImpl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import pojo.EmpresasContratos;

/**
 *
 * @author Mendieta
 */
@WebServlet(name = "generadorReport", urlPatterns = {"/generadorReport"})
public class generadorReport extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int type = Integer.parseInt(request.getParameter("tipo"));
        String autor = request.getParameter("user");
         response.setContentType("application/pdf");
        ServletOutputStream out = response.getOutputStream();
        String titulo = "", descripcion = "";
             
        if(type==0){
            titulo = "Empresas Pendientes de Activacion de cuenta";
            descripcion = "Todas aquellas empresas en SECE que sus cuentas aun no se activan";
        }else if(type==1){
            titulo = "Empresas Contestando el Instrumento";
            descripcion = "Todas aquellas empresas en SECE que estan llenando el Instrumento";
        }else if(type==2){
            titulo = "Empresas que ya han terminado el intrumento";
            descripcion = "Todas aquellas empresas en SECE que han contestado el Instrumento 1 o mas veces";
        } else{
          response.sendRedirect("index.jsp");
        }
            
            try
        {
        daoEmpresasContratosImpl edi = new daoEmpresasContratosImpl();
        List<EmpresasContratos> empresas = new ArrayList<EmpresasContratos>();
        empresas = edi.findAllByEstado(type);
       
      JasperReport reporte = (JasperReport) JRLoader.loadObject(getServletContext().getRealPath("WEB-INF/reporteEmpresas.jasper"));
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("autor", autor);
        param.put("titulo", titulo);
        param.put("descripcion", descripcion);
       JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, param, new JRBeanCollectionDataSource(empresas)); 

      JRExporter exporter = new JRPdfExporter();
      exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
      exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
      exporter.exportReport();
        }
           catch (Exception e)
       {
        e.printStackTrace();
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
